<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\UserLoginLog;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

class LoginController extends Controller
{
    public function loginForm()
    {
        return view('auth.login');
    }

    /**
     * User Login
     */
    public function login(Request $request): RedirectResponse
    {
        $request->validate([
            'email'            => 'required|email',
            'password'         => 'required|string|min:6',
            // Optional — sent by web/mobile client if available
            'device_id'        => 'nullable|string',
            'device_name'      => 'nullable|string',
            'device_type'      => 'nullable|string',
            'latitude'         => 'nullable|numeric',
            'longitude'        => 'nullable|numeric',
            'location'         => 'nullable|string',
        ]);

        if (!Auth::attempt($request->only('email', 'password'), $request->boolean('remember'))) {
            return back()
                ->withErrors(['email' => 'Invalid email or password.'])
                ->onlyInput('email');
        }

        $user = Auth::user();

        // Regenerate session to prevent fixation, then grab the new session id as our token
        $request->session()->regenerate();
        $sessionToken = $request->session()->getId();

        $agentInfo = $this->parseUserAgent($request->userAgent());

        UserLoginLog::create([
            'user_id'           => $user->id,
            'session_token'     => $sessionToken,
            'login_time'        => Carbon::now('Asia/Kolkata'),
            'login_ip'          => $request->ip(),
            'login_device_id'   => $request->input('device_id'),
            'login_device_name' => $request->input('device_name'),
            'login_device_type' => $request->input('device_type', $agentInfo['device_type']),
            'login_browser'     => $agentInfo['browser'],
            'login_os'          => $agentInfo['os'],
            'login_user_agent'  => $request->userAgent(),
            'login_latitude'    => $request->input('latitude'),
            'login_longitude'   => $request->input('longitude'),
            'login_location'    => $request->input('location'),
            'is_active_session' => true,
        ]);

        // Mirror onto the user record too
        $user->forceFill(['last_login_at' => Carbon::now('Asia/Kolkata')])->save();

        // Send the user to the intended page if they were redirected to login,
        // otherwise fall back to the dashboard.
        return redirect()->intended(route('dashboard'));
    }

    /**
     * User Logout
     */
    public function logout(Request $request): RedirectResponse
    {
        $user = Auth::user();

        // Close the log for THIS session, matched by user_id + the current
        // session id — not by a custom key stashed in session data, which
        // can silently go missing (wrong HTTP method, session driver issue,
        // cookie not sent back, etc.) and leave the row stuck as active.
        if ($user) {
            UserLoginLog::where('user_id', $user->id)
                ->where('session_token', $request->session()->getId())
                ->where('is_active_session', true)
                ->update([
                    'logout_time'       => Carbon::now('Asia/Kolkata'),
                    'logout_ip'         => $request->ip(),
                    'logout_device_id'  => $request->input('device_id'),
                    'logout_reason'     => $request->input('logout_reason', 'user_logout'),
                    'logout_by_user_id' => $user->id,
                    'is_active_session' => false,
                ]);
        }

        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login');
    }

    /**
     * Very lightweight user-agent parser — no external package required.
     * Swap this out for jenssegers/agent if you want more accurate parsing.
     */
    private function parseUserAgent(?string $userAgent): array
    {
        $userAgent = $userAgent ?? '';

        // Browser
        $browser = match (true) {
            str_contains($userAgent, 'Edg/')      => 'Edge',
            str_contains($userAgent, 'OPR/')       => 'Opera',
            str_contains($userAgent, 'Chrome/')    => 'Chrome',
            str_contains($userAgent, 'Firefox/')   => 'Firefox',
            str_contains($userAgent, 'Safari/')
                && !str_contains($userAgent, 'Chrome/') => 'Safari',
            default => 'Unknown',
        };

        // OS
        $os = match (true) {
            str_contains($userAgent, 'Windows')    => 'Windows',
            str_contains($userAgent, 'Mac OS X')   => 'macOS',
            str_contains($userAgent, 'Android')    => 'Android',
            str_contains($userAgent, 'iPhone'), str_contains($userAgent, 'iPad') => 'iOS',
            str_contains($userAgent, 'Linux')      => 'Linux',
            default => 'Unknown',
        };

        // Device type
        $deviceType = match (true) {
            str_contains($userAgent, 'Mobile')     => 'mobile',
            str_contains($userAgent, 'Tablet'), str_contains($userAgent, 'iPad') => 'tablet',
            default => 'desktop',
        };

        return compact('browser', 'os', 'deviceType') + ['device_type' => $deviceType];
    }
}