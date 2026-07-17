<?php

namespace App\Http\Controllers;

use App\Models\SocialAccount;
use App\Models\SocialMediaStat;
use App\Services\SocialInsightsService;
use Illuminate\Http\Request;
use Illuminate\View\View;

class SocialAnalyticsController extends Controller
{
    public function __construct(private SocialInsightsService $insights) {}

    /**
     * Distinct line colours per account (cycled if there are more accounts).
     */
    private const COLORS = ['#0d6efd', '#dc3545', '#198754', '#fd7e14', '#6f42c1', '#20c997', '#d63384'];

    public function index(Request $request): View
    {
        $days = (int) $request->input('days', 30);
        $platform = $request->input('platform');

        $accounts = SocialAccount::query()
            ->when($platform, fn ($q) => $q->where('platform', $platform))
            ->orderBy('label')
            ->get();

        $since = now()->subDays($days)->startOfDay();

        $series = [];       // follower line, one per account
        $growthBars = [];   // net change per account
        $rows = [];         // summary table
        $colorIndex = 0;

        foreach ($accounts as $account) {
            $stats = SocialMediaStat::where('social_account_id', $account->id)
                ->where('stat_date', '>=', $since)
                ->orderBy('stat_date')
                ->get();

            if ($stats->isEmpty()) {
                continue;
            }

            $color = self::COLORS[$colorIndex % count(self::COLORS)];
            $colorIndex++;

            $series[] = [
                'name' => $account->label,
                'color' => $color,
                'data' => $stats->map(fn ($s) => [
                    $s->stat_date->timestamp * 1000,
                    (int) $s->followers_count,
                ])->values(),
            ];

            $first = (int) $stats->first()->followers_count;
            $last = (int) $stats->last()->followers_count;
            $change = $last - $first;
            $changePct = $first > 0 ? round(($change / $first) * 100, 2) : 0.0;

            $growthBars[] = ['label' => $account->label, 'change' => $change, 'color' => $color];

            $rows[] = [
                'label' => $account->label,
                'platform' => $account->platform,
                'current' => $last,
                'start' => $first,
                'change' => $change,
                'change_pct' => $changePct,
                'reach' => (int) $stats->last()->reach,
                'posts_window' => (int) $stats->sum('posts_today'),
                'trend' => $change > 0 ? 'up' : ($change < 0 ? 'down' : 'flat'),
            ];
        }

        // Overview across all accounts.
        $totalFollowers = collect($rows)->sum('current');
        $netGrowth = collect($rows)->sum('change');
        $growing = collect($rows)->where('trend', 'up')->count();
        $declining = collect($rows)->where('trend', 'down')->count();

        $platforms = SocialAccount::select('platform')->distinct()->pluck('platform');

        // AI-style, data-grounded insights: decline reasons + content/reach recommendations.
        $accountInsights = $this->insights->forAccounts($accounts, $days);
        $reachFactors = $this->insights->reachFactors($accountInsights);

        return view('social-analytics.index', [
            'series' => $series,
            'growthBars' => $growthBars,
            'rows' => collect($rows)->sortByDesc('change')->values(),
            'days' => $days,
            'platform' => $platform,
            'platforms' => $platforms,
            'totalFollowers' => $totalFollowers,
            'netGrowth' => $netGrowth,
            'growing' => $growing,
            'declining' => $declining,
            'hasData' => ! empty($series),
            'accountInsights' => $accountInsights,
            'reachFactors' => $reachFactors,
        ]);
    }
}
