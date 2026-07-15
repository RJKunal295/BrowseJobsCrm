<?php

namespace App\Services;

use App\Models\SocialAccount;
use Illuminate\Support\Facades\Http;

class YouTubeInsightsService
{
    private const BASE_URL = 'https://www.googleapis.com/youtube/v3';

    /**
     * Validate the API key + resolve a channel ID or @handle into the
     * actual channel data. Accepts either a raw channel ID (starts "UC")
     * or a handle like "@browsejobs".
     */
    public function discoverChannel(string $apiKey, string $channelIdOrHandle): ?array
    {
        $params = str_starts_with($channelIdOrHandle, 'UC')
            ? ['id' => $channelIdOrHandle]
            : ['forHandle' => ltrim($channelIdOrHandle, '@')];

        $response = Http::get(self::BASE_URL . '/channels', array_merge([
            'part' => 'snippet,statistics',
            'key'  => $apiKey,
        ], $params));

        if (!$response->successful()) {
            throw new \RuntimeException('YouTube API error: ' . $response->body());
        }

        $items = $response->json('items', []);

        if (empty($items)) {
            return null;
        }

        $channel = $items[0];

        return [
            'channel_id' => $channel['id'],
            'title'      => $channel['snippet']['title'] ?? null,
            'thumbnail'  => $channel['snippet']['thumbnails']['default']['url'] ?? null,
        ];
    }

    /**
     * Today's snapshot: subscriber count, total video count, videos
     * published today, and cumulative view count (used to compute daily
     * view GROWTH the same way Instagram follower growth is computed —
     * today's total minus yesterday's total).
     */
    public function fetchTodaySnapshot(SocialAccount $account): array
    {
        $apiKey = $account->access_token;
        $channelId = $account->channel_id;

        $response = Http::get(self::BASE_URL . '/channels', [
            'part' => 'snippet,statistics,contentDetails',
            'id'   => $channelId,
            'key'  => $apiKey,
        ]);

        if (!$response->successful()) {
            throw new \RuntimeException('YouTube fetch failed: ' . $response->body());
        }

        $items = $response->json('items', []);

        if (empty($items)) {
            throw new \RuntimeException('Channel not found — check the Channel ID.');
        }

        $channel = $items[0];
        $subscriberCount = (int) ($channel['statistics']['subscriberCount'] ?? 0);
        $videoCount = (int) ($channel['statistics']['videoCount'] ?? 0);
        $totalViews = (int) ($channel['statistics']['viewCount'] ?? 0);

        $videosToday = 0;
        $uploadsPlaylistId = data_get($channel, 'contentDetails.relatedPlaylists.uploads');

        if ($uploadsPlaylistId) {
            $playlistItems = Http::get(self::BASE_URL . '/playlistItems', [
                'part'       => 'contentDetails',
                'playlistId' => $uploadsPlaylistId,
                'maxResults' => 10, // recent uploads only — enough to catch "today"
                'key'        => $apiKey,
            ]);

            if ($playlistItems->successful()) {
                $today = now()->toDateString();
                foreach ($playlistItems->json('items', []) as $item) {
                    $publishedAt = data_get($item, 'contentDetails.videoPublishedAt');
                    if ($publishedAt && str_starts_with($publishedAt, $today)) {
                        $videosToday++;
                    }
                }
            }
        }

        return [
            'profile' => [
                'username'            => $channel['snippet']['title'] ?? null,
                'profile_picture_url' => $channel['snippet']['thumbnails']['default']['url'] ?? null,
                'biography'           => $channel['snippet']['description'] ?? null,
                'following_count'     => $videoCount, // repurposed: total videos on the channel
            ],
            'stat' => [
                'followers_count' => $subscriberCount, // repurposed: subscriber count
                'posts_today'     => $videosToday,
                'reach'           => $totalViews, // repurposed: cumulative views — diff day-to-day for daily growth
            ],
        ];
    }
}