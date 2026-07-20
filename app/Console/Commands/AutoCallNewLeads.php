<?php

namespace App\Console\Commands;

use App\Models\Lead;
use App\Services\CallerDigitalService;
use App\Services\LeadService;
use Illuminate\Console\Command;

/**
 * Safety net for auto AI calling: every run, find leads still in "New" status
 * that have never had an AI call (missed job, downtime, imported leads, etc.)
 * and trigger the call. Respects CALLER_DIGITAL_AUTO_CALL and the daily cap.
 */
class AutoCallNewLeads extends Command
{
    protected $signature = 'leads:auto-call {--limit=10 : Max calls to place per run}';

    protected $description = 'Place AI calls for New-status leads that have no AI call yet.';

    public function handle(LeadService $leads, CallerDigitalService $caller): int
    {
        if (! config('services.caller_digital.auto_call')) {
            $this->info('CALLER_DIGITAL_AUTO_CALL is off — skipping.');

            return self::SUCCESS;
        }

        if (! $caller->isConfigured()) {
            $this->info('Caller.Digital is not configured — skipping.');

            return self::SUCCESS;
        }

        $pending = Lead::whereHas('status', fn ($q) => $q->where('slug', 'new'))
            ->whereDoesntHave('calls', fn ($q) => $q->where('type', 'ai'))
            ->where('created_at', '>=', now()->subDays(7))
            ->orderBy('id')
            ->limit((int) $this->option('limit'))
            ->get();

        if ($pending->isEmpty()) {
            $this->info('No New-status leads waiting for an AI call.');

            return self::SUCCESS;
        }

        foreach ($pending as $lead) {
            if ($leads->aiCallCapReached()) {
                $this->warn('Daily AI-call cap reached — remaining leads will be tried tomorrow.');
                break;
            }

            $call = $leads->triggerAiCall($lead, null);
            $this->info("Lead #{$lead->id} ({$lead->displayName()}): ".($call?->status ?? 'skipped'));
        }

        return self::SUCCESS;
    }
}
