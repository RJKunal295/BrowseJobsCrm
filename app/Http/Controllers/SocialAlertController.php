<?php

namespace App\Http\Controllers;

use App\Models\SocialAlertSetting;
use App\Models\SocialMediaPost;
use App\Models\SocialPostReminder;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class SocialAlertController extends Controller
{
    private const PLATFORMS = ['instagram', 'youtube', 'linkedin'];

    public function index(): View
    {
        $userId = Auth::id();

        $settings = SocialAlertSetting::where('user_id', $userId)
            ->pluck('enabled', 'platform');

        // Default ON when there's no explicit row yet.
        $toggles = collect(self::PLATFORMS)->mapWithKeys(fn ($platform) => [
            $platform => $settings->has($platform) ? (bool) $settings[$platform] : true,
        ]);

        $recentPosts = SocialMediaPost::with('account')
            ->latest('published_at')
            ->limit(20)
            ->get();

        // Posting-inactivity status per connected account.
        $reminders = SocialPostReminder::with('account')
            ->get()
            ->filter(fn ($r) => $r->account !== null);

        return view('social-alerts.index', [
            'toggles' => $toggles,
            'platforms' => self::PLATFORMS,
            'recentPosts' => $recentPosts,
            'reminders' => $reminders,
        ]);
    }

    public function update(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'platform' => 'required|in:instagram,youtube,linkedin',
            'enabled' => 'required|boolean',
        ]);

        SocialAlertSetting::updateOrCreate(
            ['user_id' => Auth::id(), 'platform' => $validated['platform']],
            ['enabled' => $validated['enabled']],
        );

        $state = $validated['enabled'] ? 'enabled' : 'disabled';

        return back()->with('success', ucfirst($validated['platform'])." alerts {$state}.");
    }
}
