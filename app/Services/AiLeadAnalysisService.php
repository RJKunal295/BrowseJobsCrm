<?php

namespace App\Services;

use App\Models\Lead;
use App\Models\LeadAiAnalysis;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Str;

/**
 * Analyzes a lead's full journey (calls, transcripts, status history) with a
 * configurable AI provider (Claude / ChatGPT / Kimi) and explains why the lead
 * did or didn't convert, with concrete coaching feedback for the caller.
 *
 * Follows the app's graceful no-op pattern: providers without an API key in
 * .env simply aren't offered.
 */
class AiLeadAnalysisService
{
    private const SYSTEM_PROMPT = <<<'PROMPT'
You are an expert sales-call coach for BrowseJobs, an HR/recruitment company whose
callers (human and AI) contact leads about upskilling programs and job placement.
You are given one lead's complete history: details, every call with transcript,
dispositions, sentiments, and the status timeline.

Analyze it and reply in EXACTLY these five markdown sections:

## Conversion Status
One short paragraph: where this lead stands and how winnable it still is (score 1-10).

## What Went Well
Bullet points quoting concrete moments from the transcripts that helped.

## What Went Wrong / Approach Issues
The heart of your feedback. Bullet points on caller mistakes: weak opening, talking
past objections, no needs discovery, poor language matching, pushing too early,
failing to book a concrete next step, long gaps between follow-ups, etc.
Quote the transcript where possible. If the lead simply never answered, say so.

## Why Not Converted (Root Cause)
1-3 numbered root causes, most important first. Be direct.

## Next Best Actions
Concrete, ordered steps the assigned HR should take now, including what to SAY
differently on the next call. If the lead is dead, say so and explain what to
change for similar leads next time.

Base everything strictly on the data provided — never invent calls or quotes.
Write plainly; the reader is a busy HR caller, not a data scientist.
PROMPT;

    /**
     * Providers that have an API key configured, as [key => label].
     *
     * @return array<string, string>
     */
    public function configuredProviders(): array
    {
        return collect(config('services.ai_analysis'))
            ->filter(fn (array $p) => filled($p['api_key']))
            ->map(fn (array $p) => $p['label'])
            ->all();
    }

    /**
     * Generic completion against the first configured provider (Claude
     * preferred). Used by other AI features (e.g. meeting analysis).
     *
     * @return array{provider: string, model: string, text: string}
     */
    public function generate(string $systemPrompt, string $userContent): array
    {
        $providers = array_keys($this->configuredProviders());

        if ($providers === []) {
            throw new \RuntimeException('No AI provider configured. Add an API key (e.g. ANTHROPIC_API_KEY) to .env.');
        }

        $provider = in_array('anthropic', $providers, true) ? 'anthropic' : $providers[0];
        $config = config("services.ai_analysis.{$provider}");

        $text = $provider === 'anthropic'
            ? $this->callAnthropicWith($config, $systemPrompt, $userContent)
            : $this->callOpenAiCompatibleWith($config, $systemPrompt, $userContent);

        return ['provider' => $provider, 'model' => $config['model'], 'text' => $text];
    }

    /**
     * Run the analysis and persist it. Throws \RuntimeException with a
     * user-presentable message on failure.
     */
    public function analyze(Lead $lead, string $provider, ?int $requestedByUserId): LeadAiAnalysis
    {
        $config = config("services.ai_analysis.{$provider}");

        if (! $config || blank($config['api_key'])) {
            throw new \RuntimeException('This AI provider is not configured. Add its API key in .env first.');
        }

        $context = $this->buildLeadContext($lead);

        $userContent = "Analyze this lead:\n\n".$context;
        $analysis = $provider === 'anthropic'
            ? $this->callAnthropicWith($config, self::SYSTEM_PROMPT, $userContent)
            : $this->callOpenAiCompatibleWith($config, self::SYSTEM_PROMPT, $userContent);

        return LeadAiAnalysis::create([
            'lead_id' => $lead->id,
            'provider' => $provider,
            'model' => $config['model'],
            'analysis' => $analysis,
            'requested_by_user_id' => $requestedByUserId,
        ]);
    }

    /**
     * Flatten the lead's whole journey into a text block for the model.
     */
    private function buildLeadContext(Lead $lead): string
    {
        $lead->loadMissing(['status', 'assignee', 'creator', 'calls.initiatedBy', 'statusHistory.status', 'statusHistory.changedBy']);

        $lines = [
            '=== LEAD ===',
            'Name: '.($lead->name ?: 'Unknown'),
            'Mobile: '.$lead->mobile,
            'Email: '.($lead->email ?: '—'),
            'Source: '.($lead->source ?: 'manual').($lead->campaign_name ? " (campaign: {$lead->campaign_name})" : ''),
            'Current status: '.($lead->status->name ?? '—'),
            'Assigned to: '.($lead->assignee->full_name ?? 'Unassigned'),
            'Created: '.$lead->created_at->format('d M Y H:i'),
            'Assigned at: '.($lead->assigned_at?->format('d M Y H:i') ?? '—'),
        ];

        $lines[] = '';
        $lines[] = '=== CALLS (oldest first) ===';
        $calls = $lead->calls->sortBy('started_at')->values();
        if ($calls->isEmpty()) {
            $lines[] = 'No calls have been made to this lead.';
        }
        foreach ($calls as $i => $call) {
            $lines[] = sprintf(
                '--- Call %d: %s | status: %s | disposition: %s | sentiment: %s | duration: %ss | at %s by %s ---',
                $i + 1,
                $call->type === 'ai' ? 'AI voice call' : 'Manual call',
                $call->status,
                $call->disposition ?: '—',
                $call->sentiment ?: '—',
                $call->duration_seconds ?? '?',
                $call->started_at?->format('d M Y H:i') ?? '?',
                $call->initiatedBy->full_name ?? 'System',
            );
            if (filled($call->transcript)) {
                // Cap each transcript so a very long call can't blow the request up.
                $lines[] = 'Transcript:';
                $lines[] = Str::limit($call->transcript, 8000, "\n[... transcript truncated ...]");
            } else {
                $lines[] = '(no transcript recorded)';
            }
        }

        $lines[] = '';
        $lines[] = '=== STATUS TIMELINE (oldest first) ===';
        $history = $lead->statusHistory->sortBy('created_at')->values();
        if ($history->isEmpty()) {
            $lines[] = 'No status changes recorded.';
        }
        foreach ($history as $h) {
            $lines[] = sprintf(
                '%s -> %s by %s%s',
                $h->created_at->format('d M Y H:i'),
                $h->status->name ?? '—',
                $h->changedBy->full_name ?? 'System',
                filled($h->remarks) ? " | remarks: {$h->remarks}" : '',
            );
        }

        return implode("\n", $lines);
    }

    /**
     * Anthropic Messages API (Claude).
     *
     * @param  array{api_key: string, model: string, base_url: string}  $config
     */
    private function callAnthropicWith(array $config, string $systemPrompt, string $userContent): string
    {
        $response = Http::timeout(180)
            ->withHeaders([
                'x-api-key' => $config['api_key'],
                'anthropic-version' => '2023-06-01',
            ])
            ->post(rtrim($config['base_url'], '/').'/v1/messages', [
                'model' => $config['model'],
                'max_tokens' => 8192,
                'system' => $systemPrompt,
                'messages' => [
                    ['role' => 'user', 'content' => $userContent],
                ],
            ]);

        if ($response->failed()) {
            throw new \RuntimeException('Claude API error: '.($response->json('error.message') ?? 'HTTP '.$response->status()));
        }

        if ($response->json('stop_reason') === 'refusal') {
            throw new \RuntimeException('Claude declined to analyze this content. Try another provider.');
        }

        $text = collect($response->json('content', []))
            ->where('type', 'text')
            ->pluck('text')
            ->implode("\n");

        if (blank($text)) {
            throw new \RuntimeException('Claude returned an empty response. Please try again.');
        }

        return $text;
    }

    /**
     * OpenAI-compatible chat completions API — used by both ChatGPT and Kimi
     * (Moonshot exposes the same request/response shape).
     *
     * @param  array{api_key: string, model: string, base_url: string}  $config
     */
    private function callOpenAiCompatibleWith(array $config, string $systemPrompt, string $userContent): string
    {
        $response = Http::timeout(180)
            ->withToken($config['api_key'])
            ->post(rtrim($config['base_url'], '/').'/chat/completions', [
                'model' => $config['model'],
                'messages' => [
                    ['role' => 'system', 'content' => $systemPrompt],
                    ['role' => 'user', 'content' => $userContent],
                ],
            ]);

        if ($response->failed()) {
            throw new \RuntimeException('AI API error: '.($response->json('error.message') ?? 'HTTP '.$response->status()));
        }

        $text = $response->json('choices.0.message.content');

        if (blank($text)) {
            throw new \RuntimeException('The AI returned an empty response. Please try again.');
        }

        return $text;
    }
}
