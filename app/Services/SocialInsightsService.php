<?php

namespace App\Services;

use App\Models\SocialAccount;
use App\Models\SocialMediaPost;
use App\Models\SocialMediaStat;
use Illuminate\Support\Collection;

/**
 * Turns raw follower/reach/post data into plain-language reasons for follower decline
 * and concrete, data-grounded recommendations on content + reach.
 */
class SocialInsightsService
{
    /**
     * @param  Collection<int, SocialAccount>  $accounts
     * @return array<int, array<string, mixed>>
     */
    public function forAccounts(Collection $accounts, int $days): array
    {
        $insights = [];

        foreach ($accounts as $account) {
            $stats = SocialMediaStat::where('social_account_id', $account->id)
                ->where('stat_date', '>=', now()->subDays($days)->startOfDay())
                ->orderBy('stat_date')
                ->get();

            if ($stats->isEmpty()) {
                continue;
            }

            $insights[] = $this->analyseAccount($account, $stats, $days);
        }

        return $insights;
    }

    private function analyseAccount(SocialAccount $account, Collection $stats, int $days): array
    {
        $firstFollowers = (int) $stats->first()->followers_count;
        $lastFollowers = (int) $stats->last()->followers_count;
        $followerChange = $lastFollowers - $firstFollowers;
        $followerPct = $firstFollowers > 0 ? round(($followerChange / $firstFollowers) * 100, 2) : 0.0;

        $postsInWindow = (int) $stats->sum('posts_today');
        $perWeek = $days > 0 ? round($postsInWindow / $days * 7, 1) : 0;

        $firstReach = (int) $stats->first()->reach;
        $lastReach = (int) $stats->last()->reach;
        $reachPct = $firstReach > 0 ? round(($lastReach - $firstReach) / $firstReach * 100, 1) : 0.0;
        $avgReach = (int) round((float) $stats->avg('reach'));

        $status = $followerChange > 0 ? 'up' : ($followerChange < 0 ? 'down' : 'flat');

        return [
            'label' => $account->label,
            'platform' => $account->platform,
            'status' => $status,
            'follower_change' => $followerChange,
            'follower_pct' => $followerPct,
            'posts_in_window' => $postsInWindow,
            'per_week' => $perWeek,
            'reach_pct' => $reachPct,
            'avg_reach' => $avgReach,
            'reasons' => $this->reasons($status, $postsInWindow, $perWeek, $reachPct, $days),
            'recommendations' => $this->recommendations($account->platform, $perWeek, $reachPct),
            'content_performance' => $this->contentPerformance($account),
        ];
    }

    /**
     * Reasons a follower count fell / stalled — grounded in the account's own numbers.
     *
     * @return array<int, array{severity: string, text: string}>
     */
    private function reasons(string $status, int $posts, float $perWeek, float $reachPct, int $days): array
    {
        $reasons = [];

        if ($status === 'up') {
            $reasons[] = ['severity' => 'success', 'text' => 'This account is growing — keep the current posting rhythm and double down on what is working.'];

            return $reasons;
        }

        if ($posts === 0) {
            $reasons[] = ['severity' => 'high', 'text' => "No new posts in the last {$days} days. Inactivity is the #1 cause of follower loss — the algorithm stops showing dormant accounts, so reach and follows dry up."];
        } elseif ($perWeek < 3) {
            $reasons[] = ['severity' => 'high', 'text' => "Low posting frequency (~{$perWeek}/week). Below ~3–4 posts/week the algorithm deprioritises your account, shrinking reach and new follows."];
        }

        if ($reachPct < 0) {
            $reasons[] = ['severity' => 'medium', 'text' => 'Reach fell '.abs($reachPct).'% over this period — fewer non-followers are seeing your content, so new follows can\'t offset natural unfollows.'];
        }

        if ($status === 'down' && $reachPct >= 0 && $posts > 0) {
            $reasons[] = ['severity' => 'medium', 'text' => 'Reach held but followers still dropped — this points to content that isn\'t resonating (low saves/shares) or audience fatigue. Vary formats and hooks.'];
        }

        if (empty($reasons)) {
            $reasons[] = ['severity' => 'low', 'text' => 'Minor dip within normal fluctuation. Stay consistent and monitor over a longer window.'];
        }

        return $reasons;
    }

    /**
     * Platform-tailored recommendations, prioritised by the account's weak spots.
     *
     * @return array<int, string>
     */
    private function recommendations(string $platform, float $perWeek, float $reachPct): array
    {
        $recs = [];

        if ($perWeek < 4) {
            $recs[] = 'Post more consistently — aim for 4–7 posts/week. Consistency is the strongest lever for reach.';
        }

        $recs = array_merge($recs, match ($platform) {
            'youtube' => [
                'Publish YouTube Shorts (vertical, <60s) — Shorts get far more reach and pull new subscribers.',
                'Invest in click-worthy thumbnails + titles; the first 3 seconds decide retention.',
                'Keep a fixed upload schedule so the algorithm and audience learn when to expect you.',
            ],
            'linkedin' => [
                'Lead with a strong first line (the "hook") — LinkedIn shows only ~2 lines before "see more".',
                'Post document carousels and short native videos; they earn the most dwell time.',
                'Reply to every comment in the first hour to boost distribution.',
            ],
            default => [ // instagram
                'Prioritise Reels — video reaches far more non-followers than photos on Instagram.',
                'Use carousels for "saves" and Stories daily to keep existing followers engaged.',
                'Put a hook in the first 1–2 seconds and add 3–5 relevant hashtags + a clear caption CTA.',
            ],
        });

        $recs[] = 'Reply to comments/DMs within the first hour — early engagement velocity is what expands reach.';

        if ($reachPct < 0) {
            $recs[] = 'Test 2–3 new content angles this week (education, behind-the-scenes, trends) and keep what beats your average reach.';
        }

        return $recs;
    }

    /**
     * Average engagement by content type from stored posts — data-driven "what to make more of".
     * Returns [] when there is no post-level data yet.
     *
     * @return array<int, array{type: string, count: int, avg_likes: int, avg_comments: int, avg_views: int}>
     */
    private function contentPerformance(SocialAccount $account): array
    {
        $rows = SocialMediaPost::where('social_account_id', $account->id)
            ->whereNotNull('media_type')
            ->selectRaw('media_type, COUNT(*) c, AVG(likes) al, AVG(comments) ac, AVG(views) av')
            ->groupBy('media_type')
            ->get();

        return $rows->map(fn ($r) => [
            'type' => $r->media_type,
            'count' => (int) $r->c,
            'avg_likes' => (int) round((float) $r->al),
            'avg_comments' => (int) round((float) $r->ac),
            'avg_views' => (int) round((float) $r->av),
        ])->all();
    }

    /**
     * Ranked, universal reach drivers with the "why". Top item adapts to the biggest gap.
     *
     * @param  array<int, array<string, mixed>>  $insights
     * @return array<int, array{title: string, detail: string}>
     */
    public function reachFactors(array $insights): array
    {
        $lowPosting = collect($insights)->contains(fn ($i) => $i['per_week'] < 4);

        $factors = [
            ['title' => 'Consistency', 'detail' => 'A steady posting cadence (4–7×/week) trains the algorithm to distribute you. This is the single biggest driver of reach.'],
            ['title' => 'Video / Reels / Shorts', 'detail' => 'Short vertical video reaches the most non-followers on every platform. Make it your primary format.'],
            ['title' => 'The first 3 seconds (hook)', 'detail' => 'Watch-through in the opening seconds decides whether the platform pushes your content wider.'],
            ['title' => 'Early engagement velocity', 'detail' => 'Likes/comments/saves in the first 30–60 minutes signal quality. Reply fast and post when your audience is online.'],
            ['title' => 'Saves & shares over likes', 'detail' => 'Saveable/shareable content (tips, lists, relatable takes) travels far beyond your followers.'],
            ['title' => 'Discovery signals', 'detail' => 'Relevant hashtags, keywords, captions and thumbnails/titles help new people find you.'],
            ['title' => 'Collaborations', 'detail' => 'Collabs and cross-posting expose you to another creator\'s audience — fast follower + reach gains.'],
        ];

        if ($lowPosting) {
            // Emphasise consistency first when posting is the weak point.
            $factors[0]['detail'] .= ' ⚠ Your accounts are currently posting below this rate — fixing this alone should recover reach.';
        }

        return $factors;
    }
}
