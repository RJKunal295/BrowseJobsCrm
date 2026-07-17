<?php

namespace App\Http\Controllers;

use App\Models\LoginReminder;
use App\Services\LoginReminderService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Artisan;
use Illuminate\View\View;

class LoginReminderController extends Controller
{
    public function __construct(private LoginReminderService $service) {}

    public function index(Request $request): View
    {
        $date = $request->filled('date')
            ? Carbon::parse($request->input('date'))
            : now()->timezone(config('app.timezone'));

        // Everyone missing a login on this date (live).
        $missing = $this->service->usersMissingLoginOn($date);

        // Reminder rows already recorded for this date, keyed by user.
        $reminders = LoginReminder::with('user')
            ->whereDate('reminder_date', $date)
            ->get()
            ->keyBy('user_id');

        // Build report rows: union of reminded users + currently-missing users.
        $rows = collect();

        foreach ($reminders as $reminder) {
            $rows->put($reminder->user_id, [
                'user' => $reminder->user,
                'email_count' => $reminder->email_count,
                'wa_count' => $reminder->whatsapp_count,
                'last' => $reminder->last_reminded_at,
                'escalated' => $reminder->escalated,
                'logged_in' => $this->service->hasLoggedInOn($reminder->user_id, $date),
            ]);
        }

        foreach ($missing as $user) {
            if (! $rows->has($user->id)) {
                $rows->put($user->id, [
                    'user' => $user,
                    'email_count' => 0,
                    'wa_count' => 0,
                    'last' => null,
                    'escalated' => false,
                    'logged_in' => false,
                ]);
            }
        }

        $rows = $rows->sortBy(fn ($r) => $r['user']->full_name)->values();

        $stats = [
            'missing' => $missing->count(),
            'emails' => $reminders->sum('email_count'),
            'whatsapps' => $reminders->sum('whatsapp_count'),
            'escalated' => $reminders->where('escalated', true)->count(),
        ];

        return view('login-reminders.index', [
            'rows' => $rows,
            'stats' => $stats,
            'date' => $date,
        ]);
    }

    public function runReminders(): RedirectResponse
    {
        Artisan::call('logins:remind', ['--force' => true]);

        return back()->with('success', 'Login reminders sent to users who have not logged in today.');
    }

    public function runEscalation(): RedirectResponse
    {
        Artisan::call('logins:escalate');

        return back()->with('success', 'Escalation report sent to admins.');
    }
}
