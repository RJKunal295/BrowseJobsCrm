<?php

namespace App\Services;

use App\Models\SocialAccount;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;

class InstagramInsightsService
{
    private const GRAPH_VERSION = 'v21.0';

    private const BASE_URL = 'https://graph.instagram.com/'.self::GRAPH_VERSION;

    public function discoverInstagramUserId(string $accessToken): ?array
    {
        $response = Http::get(self::BASE_URL.'/me', [
            'fields' => 'id,username,account_type',
            'access_token' => $accessToken,
        ]);

        if (! $response->successful()) {
            throw new \RuntimeException('Failed to validate token: '.$response->body());
        }

        $data = $response->json();

        if (! isset($data['id'])) {
            return null;
        }

        if (($data['account_type'] ?? null) === 'PERSONAL') {
            throw new \RuntimeException(
                'This is a personal Instagram account. Insights (reach, follower count) require a Business or Creator account.'
            );
        }

        return [
            'ig_user_id' => $data['id'],
            'page_name' => $data['username'] ?? 'Instagram Account',
            'username' => $data['username'] ?? null,
            'account_type' => $data['account_type'] ?? null,
        ];
    }

    /**
     * Full profile snapshot: everything needed for the profile card
     * (avatar, bio, follower/following counts) PLUS today's stat row.
     */
    public function fetchTodaySnapshot(SocialAccount $account): array
    {
        $token = $account->access_token;
        $igUserId = $account->ig_user_id;

        $profile = Http::get(self::BASE_URL."/{$igUserId}", [
            'fields' => 'username,account_type,profile_picture_url,biography,followers_count,follows_count,media_count',
            'access_token' => $token,
        ]);

        if (! $profile->successful()) {
            throw new \RuntimeException('Profile fetch failed: '.$profile->body());
        }

        $profileData = $profile->json();

        $reach = null;
        $insights = Http::get(self::BASE_URL."/{$igUserId}/insights", [
            'metric' => 'reach',
            'period' => 'day',
            'access_token' => $token,
        ]);

        if ($insights->successful()) {
            $values = data_get($insights->json(), 'data.0.values', []);
            $reach = end($values)['value'] ?? null;
        }

        $todayStart = Carbon::today()->timestamp;
        $media = Http::get(self::BASE_URL."/{$igUserId}/media", [
            'fields' => 'id,timestamp',
            'since' => $todayStart,
            'access_token' => $token,
        ]);

        $postsToday = $media->successful() ? count($media->json('data', [])) : 0;

        return [
            'profile' => [
                'username' => $profileData['username'] ?? null,
                'account_type' => $profileData['account_type'] ?? null,
                'profile_picture_url' => $profileData['profile_picture_url'] ?? null,
                'biography' => $profileData['biography'] ?? null,
                'following_count' => $profileData['follows_count'] ?? null,
            ],
            'stat' => [
                'followers_count' => $profileData['followers_count'] ?? null,
                'posts_today' => $postsToday,
                'reach' => $reach,
            ],
        ];
    }

    /**
     * Fetch the most recent media items — used to detect newly uploaded posts/reels.
     *
     * @return array<int, array{external_post_id: string, caption: ?string, media_type: ?string, permalink: ?string, thumbnail_url: ?string, published_at: ?Carbon}>
     */
    public function fetchLatestMedia(SocialAccount $account, int $limit = 10): array
    {
        $response = Http::get(self::BASE_URL."/{$account->ig_user_id}/media", [
            'fields' => 'id,caption,media_type,permalink,thumbnail_url,media_url,timestamp,like_count,comments_count',
            'limit' => $limit,
            'access_token' => $account->access_token,
        ]);

        if (! $response->successful()) {
            throw new \RuntimeException('Instagram media fetch failed: '.$response->body());
        }

        return collect($response->json('data', []))->map(fn (array $m) => [
            'external_post_id' => $m['id'],
            'caption' => $m['caption'] ?? null,
            'media_type' => $m['media_type'] ?? null,
            'permalink' => $m['permalink'] ?? null,
            'thumbnail_url' => $m['thumbnail_url'] ?? ($m['media_url'] ?? null),
            'published_at' => isset($m['timestamp']) ? Carbon::parse($m['timestamp']) : null,
            'likes' => $m['like_count'] ?? null,
            'comments' => $m['comments_count'] ?? null,
            'shares' => null, // not exposed by the Instagram Graph API
            'views' => null,
            'raw' => $m,
        ])->all();
    }

    /**
     * Extend a long-lived Instagram token before it expires (valid window:
     * the token must be at least 24 hours old and not yet expired).
     * Returns the new token + new expiry.
     */
    public function refreshLongLivedToken(string $currentToken): array
    {
        $response = Http::get('https://graph.instagram.com/refresh_access_token', [
            'grant_type' => 'ig_refresh_token',
            'access_token' => $currentToken,
        ]);

        if (! $response->successful()) {
            throw new \RuntimeException('Token refresh failed: '.$response->body());
        }

        $data = $response->json();

        return [
            'access_token' => $data['access_token'],
            'expires_at' => now()->addSeconds($data['expires_in'] ?? 5184000), // ~60 days default
        ];
    }
}
