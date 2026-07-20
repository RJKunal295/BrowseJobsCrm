<?php

namespace App\Services;

use App\Jobs\ProcessNewLeadJob;
use App\Mail\GenericMail;
use App\Mail\LeadCreatedMail;
use App\Models\Lead;
use App\Models\LeadCall;
use App\Models\LeadStatus;
use App\Models\LeadStatusHistory;
use App\Models\User;
use App\Notifications\LeadAssignedNotification;
use App\Notifications\LeadCreatedNotification;
use App\Notifications\LeadEventNotification;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class LeadService
{
    /**
     * Roles notified whenever a new lead is generated.
     */
    private const NOTIFY_ROLE_CODES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'HR_MANAGER'];

    /**
     * Roles notified when an AI-called lead is "good" and needs a human caller assigned.
     */
    private const HR_ROUTE_ROLE_CODES = ['HR_MANAGER', 'HEAD_OF_OPERATIONS'];

    public function __construct(
        private WhatsAppService $whatsApp,
        private CallerDigitalService $caller,
    ) {}

    /**
     * Create a lead, set its initial status, and notify the team. Only the
     * instant channels (bell + web-push) run inline so the add is fast; the
     * slow work (emails, WhatsApp, auto AI call) is queued to the background.
     *
     * @param  array{mobile: string, name?: ?string, email?: ?string, campaign_name?: ?string}  $data
     */
    public function create(array $data, string $source, ?int $addedByUserId): Lead
    {
        $lead = Lead::create([
            'mobile' => $data['mobile'],
            'name' => $data['name'] ?? null,
            'email' => $data['email'] ?? null,
            'source' => $source,
            'campaign_name' => $data['campaign_name'] ?? null,
            'added_by_user_id' => $addedByUserId,
            'current_status_id' => $this->initialStatusId(),
        ]);

        $this->pushLeadCreated($lead);

        ProcessNewLeadJob::dispatch($lead->id, $addedByUserId);

        return $lead;
    }

    /**
     * Instant channels for a new lead: in-app bell + web-push banner.
     */
    public function pushLeadCreated(Lead $lead): void
    {
        foreach ($this->leadCreatedRecipients() as $user) {
            $user->notify(new LeadCreatedNotification($lead));
        }
    }

    /**
     * Slow channels for a new lead: email + WhatsApp, recorded per recipient.
     * Runs from the queued ProcessNewLeadJob, not during the web request.
     */
    public function emailAndWhatsAppLeadCreated(Lead $lead): void
    {
        foreach ($this->leadCreatedRecipients() as $user) {
            if (filled($user->email)) {
                try {
                    Mail::to($user->email)->send(new LeadCreatedMail($lead));
                    $this->recordNotification($lead->id, $user->id, 'email');
                } catch (\Throwable $e) {
                    // don't let a mail failure break lead capture
                }
            }

            $number = $user->whatsapp_number ?: $user->phone;
            if (filled($number)) {
                $sent = $this->whatsApp->sendText($number, $this->whatsAppMessage($lead));
                if ($sent) {
                    $this->recordNotification($lead->id, $user->id, 'whatsapp');
                }
            }
        }
    }

    /**
     * Auto-dial the AI agent for a new lead (unless disabled or the daily cap is hit).
     * Skips leads that already have an AI call — the queued job and the
     * leads:auto-call safety net must never double-dial the same person.
     */
    public function maybeAutoCall(Lead $lead, ?int $addedByUserId): void
    {
        if ($lead->calls()->where('type', 'ai')->exists()) {
            return;
        }

        if (config('services.caller_digital.auto_call') && $this->caller->isConfigured() && ! $this->aiCallCapReached()) {
            $this->triggerAiCall($lead, $addedByUserId);
        }
    }

    /**
     * @return Collection<int, User>
     */
    private function leadCreatedRecipients()
    {
        return User::query()
            ->withRoleCode(self::NOTIFY_ROLE_CODES)
            ->where('is_active', true)
            ->get();
    }

    /**
     * Has today's AI-call cap been reached? (0 = unlimited.)
     */
    public function aiCallCapReached(): bool
    {
        $cap = (int) config('services.caller_digital.daily_cap', 0);

        if ($cap <= 0) {
            return false;
        }

        return LeadCall::where('type', 'ai')->whereDate('started_at', today())->count() >= $cap;
    }

    /**
     * Place an outbound AI voice call for a lead via Caller.Digital. Returns the LeadCall
     * record (status 'ringing' on success, 'failed' on error), or null if not configured/capped.
     */
    public function triggerAiCall(Lead $lead, ?int $initiatedByUserId = null): ?LeadCall
    {
        if (! $this->caller->isConfigured() || $this->aiCallCapReached()) {
            return null;
        }

        $call = LeadCall::create([
            'lead_id' => $lead->id,
            'type' => 'ai',
            'provider' => 'caller_digital',
            'status' => 'queued',
            'to_number' => $lead->mobile,
            'from_number' => config('services.caller_digital.from_number'),
            'agent_id' => config('services.caller_digital.agent_id'),
            'language' => config('services.caller_digital.default_language'),
            'initiated_by_user_id' => $initiatedByUserId,
            'started_at' => now(),
        ]);

        try {
            $result = $this->caller->triggerLeadCall(
                $lead->mobile,
                'Lead #'.$lead->id.' — '.$lead->displayName(),
                array_filter([
                    'lead_id' => (string) $lead->id,
                    'customer_name' => (string) $lead->name,
                ]),
            );

            $call->update([
                'external_campaign_id' => $result['campaign_id'],
                'status' => 'ringing',
            ]);
        } catch (\Throwable $e) {
            $call->update(['status' => 'failed', 'meta' => ['error' => $e->getMessage()]]);
        }

        return $call;
    }

    /**
     * Notify the HR user a lead was assigned to — email + WhatsApp + web-push (with sound).
     */
    public function notifyLeadAssigned(Lead $lead, User $assignee, ?User $assignedBy): void
    {
        $url = route('leads.show', $lead->id);
        $by = $assignedBy?->full_name ?? 'HR Manager';
        $title = 'New lead assigned to you';
        $message = $lead->displayName().' ('.$lead->mobile.') assigned by '.$by.'. Please follow up.';

        $assignee->notify(new LeadAssignedNotification($lead, $assignedBy));

        if (filled($assignee->email)) {
            try {
                Mail::to($assignee->email)->send(new GenericMail(
                    $title,
                    "<p>{$message}</p><p><a href=\"{$url}\">Open the lead &amp; follow up</a></p>"
                ));
            } catch (\Throwable $e) {
                // best-effort
            }
        }

        $number = $assignee->whatsapp_number ?: $assignee->phone;
        if (filled($number)) {
            $this->whatsApp->sendText($number, "*{$title}*\n{$message}\n{$url}");
        }
    }

    /**
     * Apply the outcome of a completed AI call: move the lead to the matching status and,
     * for good/interested leads, alert HR_MANAGER so it can be assigned to a human caller.
     */
    public function handleAiCallOutcome(LeadCall $call): void
    {
        $lead = $call->lead;
        if (! $lead) {
            return;
        }

        $disposition = strtolower((string) $call->disposition);
        $sentiment = strtolower((string) $call->sentiment);

        $notInterested = str_contains($disposition, 'not interest')
            || in_array($disposition, ['declined', 'rejected', 'not_interested'], true)
            || $sentiment === 'negative';

        $interested = ! $notInterested && (
            str_contains($disposition, 'interest')
            || in_array($disposition, ['confirmed', 'hot', 'positive'], true)
            || $sentiment === 'positive'
        );

        $needsHuman = ! $notInterested && ! $interested && (
            str_contains($disposition, 'manual') || str_contains($disposition, 'review')
            || str_contains($disposition, 'callback') || str_contains($disposition, 'call back')
        );

        if ($interested) {
            $this->setStatusBySlug($lead, 'interested', 'AI call: lead sounded interested — route to a human caller.');
            $this->notifyHrToAssign($lead, 'interested');
        } elseif ($needsHuman) {
            $this->setStatusBySlug($lead, 'follow_up', 'AI call: needs a human follow-up call.');
            $this->notifyHrToAssign($lead, 'follow-up');
        } elseif ($notInterested) {
            $this->setStatusBySlug($lead, 'not_interested', 'AI call: lead not interested.');
        }
    }

    private function setStatusBySlug(Lead $lead, string $slug, string $remark): void
    {
        $status = LeadStatus::where('slug', $slug)->first();

        if (! $status || (int) $lead->current_status_id === (int) $status->id) {
            return;
        }

        $lead->update(['current_status_id' => $status->id]);

        LeadStatusHistory::create([
            'lead_id' => $lead->id,
            'status_id' => $status->id,
            'changed_by_user_id' => null, // system (AI-driven)
            'remarks' => $remark,
        ]);
    }

    /**
     * Email + WhatsApp HR managers that a hot lead is ready to be assigned to a caller.
     */
    private function notifyHrToAssign(Lead $lead, string $reason): void
    {
        $recipients = User::query()
            ->withRoleCode(self::HR_ROUTE_ROLE_CODES)
            ->where('is_active', true)
            ->get();

        $url = route('leads.show', $lead->id);
        $label = $reason === 'interested' ? 'Interested lead' : 'Lead needs a human call';

        foreach ($recipients as $user) {
            if (filled($user->email)) {
                try {
                    Mail::to($user->email)->send(new GenericMail(
                        "{$label}: ".$lead->displayName(),
                        "<p>The AI call marked this lead as <strong>{$reason}</strong>. Please assign it to an HR caller.</p>"
                        .'<p>Name: <strong>'.($lead->name ?: '—')."</strong><br>Mobile: <strong>{$lead->mobile}</strong></p>"
                        ."<p><a href=\"{$url}\">Open lead &amp; assign</a></p>"
                    ));
                } catch (\Throwable $e) {
                    // best-effort
                }
            }

            $number = $user->whatsapp_number ?: $user->phone;
            if (filled($number)) {
                $this->whatsApp->sendText(
                    $number,
                    "*{$label}* — assign a caller\nName: ".($lead->name ?: '—')."\nMobile: {$lead->mobile}\n{$url}"
                );
            }

            $user->notify(new LeadEventNotification(
                $label.' — assign a caller',
                ($lead->name ?: $lead->mobile).' is '.$reason.'. Assign it to an HR caller.',
                $url,
                'ti ti-flame',
            ));
        }
    }

    private function recordNotification(int $leadId, int $userId, string $channel): void
    {
        DB::table('lead_notifications')->insert([
            'lead_id' => $leadId,
            'notify_user_id' => $userId,
            'type' => 'lead_created',
            'channel' => $channel,
            'is_read' => false,
            'sent_at' => now(),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    private function whatsAppMessage(Lead $lead): string
    {
        return "*New lead generated*\n"
            .'Name: '.($lead->name ?: '—')."\n"
            ."Mobile: {$lead->mobile}\n"
            .($lead->email ? "Email: {$lead->email}\n" : '')
            .'Source: '.($lead->source ?: 'manual');
    }

    private function initialStatusId(): ?int
    {
        return LeadStatus::where('slug', 'new')->value('id')
            ?? LeadStatus::orderBy('sort_order')->value('id');
    }
}
