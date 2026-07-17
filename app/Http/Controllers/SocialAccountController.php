<?php

namespace App\Http\Controllers;

use App\Models\SocialAccount;
use App\Models\SocialMediaStat;
use App\Services\InstagramInsightsService;
use App\Services\LinkedInInsightsService;
use App\Services\YouTubeInsightsService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
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
            'label' => 'required|string|max:100',
            'access_token' => 'required|string',
        ]);

        $cleanToken = preg_replace('/\s+/', '', $validated['access_token']);

        try {
            $discovered = $service->discoverInstagramUserId($cleanToken);
        } catch (\Throwable $e) {
            return back()->withInput()->withErrors(['access_token' => 'Could not validate this token: '.$e->getMessage()]);
        }

        if (! $discovered) {
            return back()->withInput()->withErrors([
                'access_token' => 'This token did not return a valid Instagram account. Double-check it was copied in full.',
            ]);
        }

        $account = SocialAccount::create([
            'platform' => 'instagram',
            'label' => $validated['label'],
            'ig_user_id' => $discovered['ig_user_id'],
            'username' => $discovered['username'],
            'account_type' => $discovered['account_type'],
            'access_token' => $cleanToken,
            'is_active' => true,
            'created_by' => Auth::id(),
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
            'label' => 'required|string|max:100',
            'channel_id_or_handle' => 'required|string|max:255',
            'api_key' => 'required|string',
        ]);

        $cleanKey = preg_replace('/\s+/', '', $validated['api_key']);
        $channelIdOrHandle = trim($validated['channel_id_or_handle']);

        try {
            $discovered = $service->discoverChannel($cleanKey, $channelIdOrHandle);
        } catch (\Throwable $e) {
            return back()->withInput()->withErrors(['api_key' => 'Could not validate: '.$e->getMessage()]);
        }

        if (! $discovered) {
            return back()->withInput()->withErrors([
                'channel_id_or_handle' => 'Channel not found. Check the Channel ID or @handle and try again.',
            ]);
        }

        $account = SocialAccount::create([
            'platform' => 'youtube',
            'label' => $validated['label'],
            'channel_id' => $discovered['channel_id'],
            'username' => $discovered['title'],
            'access_token' => $cleanKey,
            'is_active' => true,
            'created_by' => Auth::id(),
        ]);

        $this->performSync($account);

        return redirect()->route('social-accounts.youtube.index')->with('success', "Connected to YouTube channel \"{$discovered['title']}\".");
    }

    // ---- LinkedIn (OAuth) ----

    public function indexLinkedIn(): View
    {
        $accounts = SocialAccount::where('platform', 'linkedin')->orderBy('label')->get();
        $configured = filled(config('services.linkedin.client_id')) && filled(config('services.linkedin.client_secret'));

        return view('social-accounts.linkedin-index', compact('accounts', 'configured'));
    }

    /**
     * Kick off the LinkedIn OAuth flow.
     */
    public function connectLinkedIn(Request $request, LinkedInInsightsService $service): RedirectResponse
    {
        if (blank(config('services.linkedin.client_id'))) {
            return back()->with('error', 'LinkedIn is not configured. Set LINKEDIN_CLIENT_ID / LINKEDIN_CLIENT_SECRET in .env.');
        }

        $state = Str::random(40);
        $request->session()->put('linkedin_oauth_state', $state);

        return redirect()->away($service->authorizationUrl($state));
    }

    /**
     * OAuth callback: exchange the code, list admin organisations, show the picker.
     */
    public function linkedInCallback(Request $request, LinkedInInsightsService $service): RedirectResponse|View
    {
        if ($request->filled('error')) {
            return redirect()->route('social-accounts.linkedin.index')
                ->with('error', 'LinkedIn authorization was denied: '.$request->input('error_description', $request->input('error')));
        }

        if (! $request->filled('code') || $request->input('state') !== $request->session()->pull('linkedin_oauth_state')) {
            return redirect()->route('social-accounts.linkedin.index')->with('error', 'Invalid or expired LinkedIn authorization. Please try again.');
        }

        try {
            $token = $service->exchangeCodeForToken($request->input('code'));
        } catch (\Throwable $e) {
            return redirect()->route('social-accounts.linkedin.index')->with('error', $e->getMessage());
        }

        // Stash the token so the store step can use it after the user picks a Page.
        $request->session()->put('linkedin_token', $token);

        $organizations = [];
        $orgError = null;

        try {
            $organizations = $service->getAdminOrganizations($token['access_token']);
        } catch (\Throwable $e) {
            $orgError = $e->getMessage();
        }

        return view('social-accounts.linkedin-select', compact('organizations', 'orgError'));
    }

    /**
     * Persist the chosen LinkedIn Page as a connected account.
     */
    public function storeLinkedIn(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'label' => 'required|string|max:100',
            'organization_urn' => 'required|string|max:255',
        ]);

        $token = $request->session()->get('linkedin_token');

        if (! $token) {
            return redirect()->route('social-accounts.linkedin.index')->with('error', 'LinkedIn session expired. Please reconnect.');
        }

        $orgId = str_replace('urn:li:organization:', '', $validated['organization_urn']);

        $account = SocialAccount::create([
            'platform' => 'linkedin',
            'label' => $validated['label'],
            'channel_id' => $validated['organization_urn'],
            'ig_user_id' => $orgId,
            'username' => $validated['label'],
            'access_token' => $token['access_token'],
            'refresh_token' => $token['refresh_token'] ?? null,
            'token_expires_at' => now()->addSeconds($token['expires_in'] ?? 5184000),
            'is_active' => true,
            'created_by' => Auth::id(),
        ]);

        $request->session()->forget('linkedin_token');

        try {
            $account->update(['last_synced_at' => now(), 'last_error' => null]);
        } catch (\Throwable $e) {
            $account->update(['last_error' => $e->getMessage()]);
        }

        return redirect()->route('social-accounts.linkedin.index')->with('success', "Connected LinkedIn Page \"{$validated['label']}\".");
    }

    // ---- Shared actions ----

    public function sync(SocialAccount $socialAccount): RedirectResponse
    {
        try {
            $this->performSync($socialAccount);

            return back()->with('success', 'Synced successfully.');
        } catch (\Throwable $e) {
            $socialAccount->update(['last_error' => $e->getMessage()]);

            return back()->with('error', 'Sync failed: '.$e->getMessage());
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
                'access_token' => $result['access_token'],
                'token_expires_at' => $result['expires_at'],
                'last_error' => null,
            ]);

            return back()->with('success', 'Token refreshed — valid until '.$result['expires_at']->format('d M Y').'.');
        } catch (\Throwable $e) {
            $socialAccount->update(['last_error' => $e->getMessage()]);

            return back()->with('error', 'Token refresh failed: '.$e->getMessage());
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
        $socialAccount->update(['is_active' => ! $socialAccount->is_active]);

        return back()->with('success', 'Status updated.');
    }

    private function performSync(SocialAccount $account): void
    {
        $service = $this->resolveService($account);
        $snapshot = $service->fetchTodaySnapshot($account);

        $account->update(array_merge($snapshot['profile'], [
            'last_synced_at' => now(),
            'last_error' => null,
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
