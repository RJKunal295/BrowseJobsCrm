<?php

namespace App\Http\Controllers;

use App\Models\SocialAccount;
use App\Models\SocialMediaStat;
use App\Services\InstagramInsightsService;
use App\Services\YouTubeInsightsService;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class SocialAccountController extends Controller
{
    // ---- Instagram ----

    public function indexInstagram(): View
    {
        $accounts = SocialAccount::where('platform', 'instagram')->orderBy('label')->get();

        return view('social-accounts.instagram-index', compact('accounts'));
    }

    public function create(): View
    {
        return view('social-accounts.create');
    }

    public function store(Request $request, InstagramInsightsService $service): RedirectResponse
    {
        $validated = $request->validate([
            'label'        => 'required|string|max:100',
            'access_token' => 'required|string',
        ]);

        $cleanToken = preg_replace('/\s+/', '', $validated['access_token']);

        try {
            $discovered = $service->discoverInstagramUserId($cleanToken);
        } catch (\Throwable $e) {
            return back()->withInput()->withErrors(['access_token' => 'Could not validate this token: ' . $e->getMessage()]);
        }

        if (!$discovered) {
            return back()->withInput()->withErrors([
                'access_token' => 'This token did not return a valid Instagram account. Double-check it was copied in full.',
            ]);
        }

        $account = SocialAccount::create([
            'platform'     => 'instagram',
            'label'        => $validated['label'],
            'ig_user_id'   => $discovered['ig_user_id'],
            'username'     => $discovered['username'],
            'account_type' => $discovered['account_type'],
            'access_token' => $cleanToken,
            'is_active'    => true,
            'created_by'   => Auth::id(),
        ]);

        $this->performSync($account);

        return redirect()->route('social-accounts.instagram.index')->with('success', "Connected successfully to \"{$discovered['page_name']}\".");
    }

    // ---- YouTube ----

    public function indexYoutube(): View
    {
        $accounts = SocialAccount::where('platform', 'youtube')->orderBy('label')->get();

        return view('social-accounts.youtube-index', compact('accounts'));
    }

    public function createYoutube(): View
    {
        return view('social-accounts.create-youtube');
    }

    public function storeYoutube(Request $request, YouTubeInsightsService $service): RedirectResponse
    {
        $validated = $request->validate([
            'label'                => 'required|string|max:100',
            'channel_id_or_handle' => 'required|string|max:255',
            'api_key'              => 'required|string',
        ]);

        $cleanKey = preg_replace('/\s+/', '', $validated['api_key']);
        $channelIdOrHandle = trim($validated['channel_id_or_handle']);

        try {
            $discovered = $service->discoverChannel($cleanKey, $channelIdOrHandle);
        } catch (\Throwable $e) {
            return back()->withInput()->withErrors(['api_key' => 'Could not validate: ' . $e->getMessage()]);
        }

        if (!$discovered) {
            return back()->withInput()->withErrors([
                'channel_id_or_handle' => 'Channel not found. Check the Channel ID or @handle and try again.',
            ]);
        }

        $account = SocialAccount::create([
            'platform'     => 'youtube',
            'label'        => $validated['label'],
            'channel_id'   => $discovered['channel_id'],
            'username'     => $discovered['title'],
            'access_token' => $cleanKey,
            'is_active'    => true,
            'created_by'   => Auth::id(),
        ]);

        $this->performSync($account);

        return redirect()->route('social-accounts.youtube.index')->with('success', "Connected to YouTube channel \"{$discovered['title']}\".");
    }

    // ---- Shared actions ----

    public function sync(SocialAccount $socialAccount): RedirectResponse
    {
        try {
            $this->performSync($socialAccount);
            return back()->with('success', 'Synced successfully.');
        } catch (\Throwable $e) {
            $socialAccount->update(['last_error' => $e->getMessage()]);
            return back()->with('error', 'Sync failed: ' . $e->getMessage());
        }
    }

    public function refreshToken(SocialAccount $socialAccount, InstagramInsightsService $service): RedirectResponse
    {
        if ($socialAccount->platform !== 'instagram') {
            return back()->with('error', 'Token refresh only applies to Instagram accounts.');
        }

        try {
            $result = $service->refreshLongLivedToken($socialAccount->access_token);

            $socialAccount->update([
                'access_token'     => $result['access_token'],
                'token_expires_at' => $result['expires_at'],
                'last_error'       => null,
            ]);

            return back()->with('success', 'Token refreshed — valid until ' . $result['expires_at']->format('d M Y') . '.');
        } catch (\Throwable $e) {
            $socialAccount->update(['last_error' => $e->getMessage()]);
            return back()->with('error', 'Token refresh failed: ' . $e->getMessage());
        }
    }

    public function destroy(SocialAccount $socialAccount): RedirectResponse
    {
        $platform = $socialAccount->platform;
        $socialAccount->delete();

        return redirect()->route("social-accounts.{$platform}.index")->with('success', 'Account disconnected.');
    }

    public function toggleActive(SocialAccount $socialAccount): RedirectResponse
    {
        $socialAccount->update(['is_active' => !$socialAccount->is_active]);

        return back()->with('success', 'Status updated.');
    }

    private function performSync(SocialAccount $account): void
    {
        $service = $this->resolveService($account);
        $snapshot = $service->fetchTodaySnapshot($account);

        $account->update(array_merge($snapshot['profile'], [
            'last_synced_at' => now(),
            'last_error'     => null,
        ]));

        SocialMediaStat::updateOrCreate(
            ['social_account_id' => $account->id, 'stat_date' => today()],
            $snapshot['stat']
        );
    }

    private function resolveService(SocialAccount $account): InstagramInsightsService|YouTubeInsightsService
    {
        return $account->platform === 'youtube'
            ? app(YouTubeInsightsService::class)
            : app(InstagramInsightsService::class);
    }
}