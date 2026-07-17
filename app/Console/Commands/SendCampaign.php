<?php

namespace App\Console\Commands;

use App\Jobs\SendCampaignJob;
use App\Models\Campaign;
use Illuminate\Console\Command;

class SendCampaign extends Command
{
    protected $signature = 'campaigns:send {campaign : The campaign ID}';

    protected $description = 'Send a campaign synchronously (fallback when no queue worker is running).';

    public function handle(): int
    {
        $campaign = Campaign::find($this->argument('campaign'));

        if (! $campaign) {
            $this->error('Campaign not found.');

            return self::FAILURE;
        }

        $this->info("Sending campaign: {$campaign->name} ...");
        SendCampaignJob::dispatchSync($campaign);

        $campaign->refresh();
        $this->info("Done. Emails: {$campaign->sent_email}, WhatsApp: {$campaign->sent_whatsapp}, Failed: {$campaign->failed_count}, Recipients: {$campaign->total_recipients}");

        return self::SUCCESS;
    }
}
