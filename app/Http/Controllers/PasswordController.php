<?php

namespace App\Http\Controllers;

use App\Mail\GenericMail;
use App\Models\PasswordOtp;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\View\View;

/**
 * Forgot-password (guest) and change-password (logged in) flows, both
 * verified with a 6-digit OTP emailed to the account's address.
 */
class PasswordController extends Controller
{
    private const OTP_VALID_MINUTES = 10;

    private const MAX_ATTEMPTS = 5;

    // ---------- Forgot password (guest) ----------

    public function showForgot(): View
    {
        return view('auth.forgot-password');
    }

    public function sendForgotOtp(Request $request): RedirectResponse
    {
        $validated = $request->validate(['email' => 'required|email']);

        $user = User::where('email', $validated['email'])->where('is_active', true)->first();

        if (! $user) {
            return back()->withErrors(['email' => 'No active account found with this email address.'])->withInput();
        }

        $this->issueOtp($user->email, 'reset', $user->full_name ?? 'there');

        return back()
            ->with('otp_email', $user->email)
            ->with('status', 'A 6-digit code has been sent to '.$this->maskEmail($user->email).'. It expires in '.self::OTP_VALID_MINUTES.' minutes.');
    }

    public function resetWithOtp(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'email' => 'required|email',
            'otp' => 'required|digits:6',
            'password' => 'required|string|min:8|confirmed',
        ]);

        if (! $this->verifyOtp($validated['email'], 'reset', $validated['otp'])) {
            return back()
                ->with('otp_email', $validated['email'])
                ->withErrors(['otp' => 'That code is invalid or has expired. Request a new one if needed.']);
        }

        User::where('email', $validated['email'])->firstOrFail()
            ->update(['password' => Hash::make($validated['password'])]);

        return redirect()->route('login.show')->with('status', 'Password updated — you can sign in with your new password now.');
    }

    // ---------- Change password (logged in) ----------

    public function showChange(): View
    {
        return view('auth.change-password');
    }

    public function sendChangeOtp(Request $request): RedirectResponse
    {
        $user = $request->user();

        if (blank($user->email)) {
            return back()->withErrors(['otp' => 'Your account has no email address — ask an admin to add one first.']);
        }

        $this->issueOtp($user->email, 'change', $user->full_name ?? 'there');

        return back()->with('status', 'A 6-digit code has been sent to '.$this->maskEmail($user->email).'. It expires in '.self::OTP_VALID_MINUTES.' minutes.');
    }

    public function changeWithOtp(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'otp' => 'required|digits:6',
            'password' => 'required|string|min:8|confirmed',
        ]);

        $user = $request->user();

        if (! $this->verifyOtp($user->email, 'change', $validated['otp'])) {
            return back()->withErrors(['otp' => 'That code is invalid or has expired. Request a new one if needed.']);
        }

        $user->update(['password' => Hash::make($validated['password'])]);

        return back()->with('status', 'Password changed successfully.');
    }

    // ---------- Shared OTP helpers ----------

    private function issueOtp(string $email, string $purpose, string $name): void
    {
        $code = (string) random_int(100000, 999999);

        // One live OTP per email+purpose; a new request invalidates the old code.
        PasswordOtp::where('email', $email)->where('purpose', $purpose)->delete();

        PasswordOtp::create([
            'email' => $email,
            'purpose' => $purpose,
            'code_hash' => Hash::make($code),
            'expires_at' => now()->addMinutes(self::OTP_VALID_MINUTES),
        ]);

        $action = $purpose === 'reset' ? 'reset your password' : 'change your password';

        Mail::to($email)->send(new GenericMail(
            'Your BrowseJobs verification code: '.$code,
            "<p>Hi {$name},</p>"
            ."<p>Use this code to {$action}:</p>"
            ."<p style=\"font-size:32px;font-weight:bold;letter-spacing:8px;margin:16px 0;\">{$code}</p>"
            .'<p>The code expires in '.self::OTP_VALID_MINUTES.' minutes. If you didn\'t request this, ignore this email — your password stays unchanged.</p>'
        ));
    }

    private function verifyOtp(string $email, string $purpose, string $code): bool
    {
        $otp = PasswordOtp::where('email', $email)
            ->where('purpose', $purpose)
            ->whereNull('consumed_at')
            ->latest('id')
            ->first();

        if (! $otp || $otp->expires_at->isPast() || $otp->attempts >= self::MAX_ATTEMPTS) {
            return false;
        }

        $otp->increment('attempts');

        if (! Hash::check($code, $otp->code_hash)) {
            return false;
        }

        $otp->update(['consumed_at' => now()]);

        return true;
    }

    private function maskEmail(string $email): string
    {
        [$local, $domain] = explode('@', $email, 2);

        return substr($local, 0, 2).str_repeat('*', max(1, strlen($local) - 2)).'@'.$domain;
    }
}
