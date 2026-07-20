<?php

namespace App\Jobs;

use App\Models\Lead;
use App\Services\LeadService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

/**
 * Background follow-through for a freshly captured lead: the slow channels
 * (emails, WhatsApp) and the auto AI call. Keeps the add-lead request instant —
 * only the bell + web-push run inline.
 */
class ProcessNewLeadJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public int $tries = 3;

    public function __construct(
        public int $leadId,
        public ?int $addedByUserId,
    ) {}

    public function handle(LeadService $leads): void
    {
        $lead = Lead::find($this->leadId);

        if (! $lead) {
            return; // lead deleted before the job ran
        }

        $leads->emailAndWhatsAppLeadCreated($lead);
        $leads->maybeAutoCall($lead, $this->addedByUserId);
    }
}
