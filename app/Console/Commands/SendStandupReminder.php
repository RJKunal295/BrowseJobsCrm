<?php

namespace App\Console\Commands;

use App\Models\User;
use App\Notifications\LeadEventNotification;
use App\Services\WhatsAppService;
use Illuminate\Console\Command;

/**
 * Sends the daily standup meeting link to every active team member a few
 * minutes before the call — WhatsApp (once configured) + web-push + bell.
 * The link is static (recurring meetings keep the same URL), so no calendar
 * API is needed; set STANDUP_MEET_LINK in .env.
 */
class SendStandupReminder extends Command
{
    protected $signature = 'standup:remind';

    protected $description = 'WhatsApp + web-push the standup meeting link to all active team members.';

    public function handle(WhatsAppService $whatsApp): int
    {
        $link = config('services.standup.meet_link');
        $time = config('services.standup.time', '9:30 AM');

        if (blank($link)) {
            $this->info('STANDUP_MEET_LINK is not set — skipping standup reminders.');

            return self::SUCCESS;
        }

        $team = User::where('is_active', true)->get();

        foreach ($team as $user) {
            // Instant channel: web-push banner + in-app bell.
            $user->notify(new LeadEventNotification(
                "Standup at {$time}",
                'Daily standup starts in 5 minutes. Tap to join.',
                $link,
                'ti ti-video',
            ));

            // WhatsApp — no-ops gracefully until the Cloud API keys are in .env.
            $number = $user->whatsapp_number ?: $user->phone;
            if (filled($number)) {
                $firstName = strtok($user->full_name ?? '', ' ') ?: 'there';
                $whatsApp->sendText(
                    $number,
                    "Good morning {$firstName}! 🌅\nDaily standup at *{$time}*.\nJoin: {$link}"
                );
            }
        }

        $this->info('Standup reminder sent to '.$team->count().' team members.');

        return self::SUCCESS;
    }
}
