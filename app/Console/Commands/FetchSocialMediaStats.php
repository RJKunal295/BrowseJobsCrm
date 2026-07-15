<?php

namespace App\Console\Commands;

use App\Models\SocialAccount;
use App\Models\SocialMediaStat;
use App\Services\InstagramInsightsService;
use App\Services\YouTubeInsightsService;
use Illuminate\Console\Command;

class FetchSocialMediaStats extends Command
{
    protected $signature = 'social:fetch-stats';

    protected $description = 'Fetch and store today\'s profile info and stats for every connected social account (Instagram + YouTube).';

    public function handle(InstagramInsightsService $instagram, YouTubeInsightsService $youtube): void
    {
        $accounts = SocialAccount::where('is_active', true)->get();

        if ($accounts->isEmpty()) {
            $this->info('No active social accounts to fetch.');
            return;
        }

        foreach ($accounts as $account) {
            try {
                $service = $account->platform === 'youtube' ? $youtube : $instagram;
                $snapshot = $service->fetchTodaySnapshot($account);

                $account->update(array_merge($snapshot['profile'], [
                    'last_synced_at' => now(),
                    'last_error'     => null,
                ]));

                SocialMediaStat::updateOrCreate(
                    ['social_account_id' => $account->id, 'stat_date' => today()],
                    $snapshot['stat']
                );

                $this->line("✔ [{$account->platform}] {$account->label}: followers/subs={$snapshot['stat']['followers_count']}, posts_today={$snapshot['stat']['posts_today']}, reach/views={$snapshot['stat']['reach']}");
            } catch (\Throwable $e) {
                $account->update(['last_error' => $e->getMessage()]);
                $this->error("✘ [{$account->platform}] {$account->label}: {$e->getMessage()}");
            }
        }
    }
}