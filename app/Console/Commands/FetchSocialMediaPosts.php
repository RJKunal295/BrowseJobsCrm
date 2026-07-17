<?php

namespace App\Console\Commands;

use App\Models\SocialAccount;
use App\Models\SocialMediaPost;
use App\Services\InstagramInsightsService;
use App\Services\LinkedInInsightsService;
use App\Services\YouTubeInsightsService;
use Illuminate\Console\Command;

class FetchSocialMediaPosts extends Command
{
    protected $signature = 'social:fetch-posts';

    protected $description = 'Fetch latest posts/videos + engagement for every connected account and store them for reporting (Instagram, YouTube, LinkedIn).';

    public function handle(
        InstagramInsightsService $instagram,
        YouTubeInsightsService $youtube,
        LinkedInInsightsService $linkedin,
    ): int {
        $accounts = SocialAccount::where('is_active', true)->get();

        if ($accounts->isEmpty()) {
            $this->info('No active social accounts.');

            return self::SUCCESS;
        }

        foreach ($accounts as $account) {
            try {
                $items = match ($account->platform) {
                    'youtube' => $youtube->fetchLatestVideos($account),
                    'linkedin' => $linkedin->fetchLatestPosts($account),
                    default => $instagram->fetchLatestMedia($account),
                };

                $stored = 0;

                foreach ($items as $item) {
                    SocialMediaPost::updateOrCreate(
                        [
                            'social_account_id' => $account->id,
                            'external_post_id' => $item['external_post_id'],
                        ],
                        [
                            'platform' => $account->platform,
                            'caption' => $item['caption'] ?? null,
                            'media_type' => $item['media_type'] ?? null,
                            'permalink' => $item['permalink'] ?? null,
                            'thumbnail_url' => $item['thumbnail_url'] ?? null,
                            'published_at' => $item['published_at'] ?? null,
                            'likes' => $item['likes'] ?? null,
                            'comments' => $item['comments'] ?? null,
                            'shares' => $item['shares'] ?? null,
                            'views' => $item['views'] ?? null,
                            'raw_payload' => $item['raw'] ?? null,
                            'metrics_synced_at' => now(),
                        ]
                    );
                    $stored++;
                }

                // Followers: LinkedIn resolves live; IG/YT reuse today's stat snapshot.
                $followers = $account->platform === 'linkedin'
                    ? $linkedin->fetchFollowerCount($account)
                    : optional($account->latestStat())->followers_count;

                $account->update([
                    'followers_count' => $followers,
                    'last_error' => null,
                ]);

                $this->line("[{$account->platform}] {$account->label}: {$stored} post(s) stored.");
            } catch (\Throwable $e) {
                $account->update(['last_error' => $e->getMessage()]);
                $this->error("[{$account->platform}] {$account->label}: {$e->getMessage()}");
            }
        }

        return self::SUCCESS;
    }
}
