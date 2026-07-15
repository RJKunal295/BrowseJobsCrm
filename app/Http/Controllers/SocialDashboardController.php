<?php

namespace App\Http\Controllers;

use App\Models\SocialAccount;
use App\Models\SocialMediaStat;
use Illuminate\Http\Request;
use Illuminate\View\View;

class SocialDashboardController extends Controller
{
    public function index(Request $request): View
    {
        $accounts = SocialAccount::where('is_active', true)->orderBy('label')->get();

        $selectedAccountId = $request->input('account_id', $accounts->first()?->id);
        $days = (int) $request->input('days', 30);

        $stats = collect();
        if ($selectedAccountId) {
            $stats = SocialMediaStat::where('social_account_id', $selectedAccountId)
                ->where('stat_date', '>=', now()->subDays($days))
                ->orderBy('stat_date')
                ->get();
        }

        // Follower growth = difference from the previous day's snapshot.
        $chartData = [
            'labels'         => $stats->pluck('stat_date')->map(fn ($d) => $d->format('d M'))->values(),
            'followers'      => $stats->pluck('followers_count')->values(),
            'reach'          => $stats->pluck('reach')->values(),
            'posts'          => $stats->pluck('posts_today')->values(),
            'follower_delta' => $stats->values()->map(function ($stat, $index) use ($stats) {
                if ($index === 0 || $stat->followers_count === null) {
                    return 0;
                }
                $prev = $stats->values()[$index - 1]->followers_count;
                return $prev !== null ? $stat->followers_count - $prev : 0;
            }),
        ];

        $latest = $stats->last();

        return view('social-dashboard.index', compact('accounts', 'selectedAccountId', 'days', 'chartData', 'latest'));
    }
}