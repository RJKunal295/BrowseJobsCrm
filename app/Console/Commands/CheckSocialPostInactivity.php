<?php

namespace App\Console\Commands;

use App\Mail\PostInactivityMail;
use App\Models\SocialAccount;
use App\Models\SocialAlertSetting;
use App\Models\SocialMediaPost;
use App\Models\SocialPostReminder;
use App\Models\User;
use App\Services\WhatsAppService;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Mail;

class CheckSocialPostInactivity extends Command
{
    protected $signature = 'social:check-inactivity {--hours=24 : Inactivity window in hours}';

    protected $description = 'Alert admins (email + WhatsApp) when a connected account has not posted in the last 24h; repeats daily until a new post appears.';

    private const ADMIN_ROLE_CODES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'SOCIAL_MEDIA_MANAGER'];

    /**
     * Minimum gap between reminders for the same account (hours). The check itself runs
     * every 4 hours, but we only notify once per day so recipients are not spammed.
     */
    private const REMIND_EVERY_HOURS = 24;

    public function handle(WhatsAppService $whatsApp): int
    {
        $hours = (int) $this->option('hours');
        $threshold = now()->subHours($hours);

        $accounts = SocialAccount::where('is_active', true)->get();

        foreach ($accounts as $account) {
            $lastPostAt = SocialMediaPost::where('social_account_id', $account->id)->max('published_at');

            $reminder = SocialPostReminder::firstOrNew(['social_account_id' => $account->id]);
            $reminder->platform = $account->platform;
            $reminder->last_post_at = $lastPostAt;

            // Skip accounts we have no post data for at all — we can't tell if they went quiet.
            if (blank($lastPostAt)) {
                $reminder->resolved = true;
                $reminder->reminder_count = 0;
                $reminder->save();
                $this->line("[{$account->platform}] {$account->label}: no post data — skipped.");

                continue;
            }

            $isActive = Carbon::parse($lastPostAt)->greaterThanOrEqualTo($threshold);

            if ($isActive) {
                // Fresh post found — clear any running reminder streak.
                $reminder->resolved = true;
                $reminder->reminder_count = 0;
                $reminder->save();
                $this->line("[{$account->platform}] {$account->label}: active (posted recently).");

                continue;
            }

            // Inactive. Mark it, but only actually notify once per REMIND_EVERY_HOURS
            // (the job runs every 4h; we don't want 6 emails a day).
            $reminder->resolved = false;

            $recentlyReminded = $reminder->last_reminded_at
                && $reminder->last_reminded_at->greaterThan(now()->subHours(self::REMIND_EVERY_HOURS));

            if ($recentlyReminded) {
                $reminder->save();
                $this->line("[{$account->platform}] {$account->label}: inactive (already reminded within {$this->reminderWindowLabel()}).");

                continue;
            }

            $admins = $this->enabledAdmins($account->platform);
            $lastPostLabel = Carbon::parse($lastPostAt)->format('d M Y, h:i A');

            foreach ($admins as $admin) {
                if (filled($admin->email)) {
                    try {
                        Mail::to($admin->email)->send(new PostInactivityMail($account, $lastPostLabel, $reminder->reminder_count + 1));
                    } catch (\Throwable $e) {
                        $this->error("Email failed for {$admin->email}: {$e->getMessage()}");
                    }
                }

                $number = $admin->whatsapp_number ?: $admin->phone;
                if (filled($number)) {
                    $whatsApp->sendText($number, $this->whatsAppMessage($account, $lastPostLabel));
                }
            }

            $reminder->reminder_count = (int) $reminder->reminder_count + 1;
            $reminder->last_reminded_at = now();
            $reminder->save();

            $this->warn("[{$account->platform}] {$account->label}: INACTIVE — reminder #{$reminder->reminder_count} sent to {$admins->count()} admin(s).");
        }

        return self::SUCCESS;
    }

    /**
     * Admins with alerts enabled for this platform (missing setting defaults to ON).
     *
     * @return Collection<int, User>
     */
    private function enabledAdmins(string $platform)
    {
        $admins = User::query()->withRoleCode(self::ADMIN_ROLE_CODES)->where('is_active', true)->get();
        $settings = SocialAlertSetting::where('platform', $platform)->pluck('enabled', 'user_id');

        return $admins->filter(fn (User $admin) => $settings->has($admin->id) ? (bool) $settings[$admin->id] : true);
    }

    private function reminderWindowLabel(): string
    {
        return self::REMIND_EVERY_HOURS.'h';
    }

    private function whatsAppMessage(SocialAccount $account, string $lastPostLabel): string
    {
        return "*Posting reminder — {$account->label}*\n"
            .'No new '.ucfirst($account->platform)." post in the last 24 hours.\n"
            ."Last post: {$lastPostLabel}.\nPlease publish a new post.";
    }
}
