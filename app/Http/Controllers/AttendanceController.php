<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserLoginLog;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\View\View;

class AttendanceController extends Controller
{
    /**
     * Attendance Summary — total hours worked per employee for a given month.
     * This is the main Attendance page.
     */
    public function index(Request $request): View
    {
        $month = $request->input('month', now()->format('Y-m'));
        [$year, $monthNum] = explode('-', $month);

        $summary = DB::table('user_login_logs')
            ->join('users', 'users.id', '=', 'user_login_logs.user_id')
            ->whereYear('login_time', $year)
            ->whereMonth('login_time', $monthNum)
            ->select(
                'user_login_logs.user_id',
                'users.full_name',
                DB::raw('COUNT(DISTINCT DATE(login_time)) as days_present'),
                DB::raw('COUNT(*) as total_sessions'),
                DB::raw('SUM(TIMESTAMPDIFF(MINUTE, login_time, COALESCE(logout_time, NOW()))) as total_minutes'),
                DB::raw('SUM(CASE WHEN is_active_session = 1 THEN 1 ELSE 0 END) as active_sessions')
            )
            ->groupBy('user_login_logs.user_id', 'users.full_name')
            ->orderBy('users.full_name')
            ->get();

        // Grand totals across all employees, for a footer row.
        $grandTotalMinutes = $summary->sum('total_minutes');
        $grandTotalDays = $summary->sum('days_present');

        $users = User::orderBy('full_name')->get(['id', 'full_name']);

        return view('attendance.index', compact('summary', 'month', 'grandTotalMinutes', 'grandTotalDays', 'users'));
    }

    /**
     * Detailed session-by-session log — drill-down from the summary,
     * or reached directly with filters (e.g. one employee's whole month).
     */
    public function log(Request $request): View
    {
        $query = UserLoginLog::with(['user', 'logoutBy', 'createdBy']);

        if ($request->filled('user_id')) {
            $query->where('user_id', $request->input('user_id'));
        }

        if ($request->filled('from')) {
            $query->whereDate('login_time', '>=', $request->input('from'));
        }

        if ($request->filled('to')) {
            $query->whereDate('login_time', '<=', $request->input('to'));
        }

        if ($request->filled('status')) {
            if ($request->input('status') === 'active') {
                $query->where('is_active_session', true);
            } elseif ($request->input('status') === 'completed') {
                $query->where('is_active_session', false);
            } elseif ($request->input('status') === 'manual') {
                $query->where('is_manual_entry', true);
            }
        }

        $logs = $query->orderByDesc('login_time')
            ->paginate(20)
            ->withQueryString();

        $users = User::orderBy('full_name')->get(['id', 'full_name']);

        return view('attendance.log', compact('logs', 'users'));
    }

    /**
     * Show the manual attendance entry form — for when someone forgot
     * to log in/out and HR needs to backfill the record.
     */
    public function create(): View
    {
        $users = User::orderBy('full_name')->get(['id', 'full_name']);

        return view('attendance.create', compact('users'));
    }

    /**
     * Store a manually-created attendance record.
     */
    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'user_id'     => 'required|exists:users,id',
            'login_time'  => 'required|date',
            'logout_time' => 'nullable|date|after:login_time',
            'reason'      => 'required|string|max:500',
        ]);

        UserLoginLog::create([
            'user_id'           => $validated['user_id'],
            'session_token'     => 'MANUAL-' . Str::uuid(),
            'login_time'        => $validated['login_time'],
            'logout_time'       => $validated['logout_time'] ?? null,
            'is_active_session' => empty($validated['logout_time']),
            'logout_reason'     => $validated['logout_time'] ? 'manual_entry' : null,
            'logout_by_user_id' => $validated['logout_time'] ? Auth::id() : null,
            'created_by_user_id' => Auth::id(),
            'is_manual_entry'    => true,
            'manual_reason'      => $validated['reason'],
        ]);

        return redirect()->route('attendance.log')->with('success', 'Attendance record added successfully.');
    }

    /**
     * Force-close a session that was never properly logged out
     * (e.g. employee forgot to log out, or left without closing the app).
     */
    public function forceLogout(Request $request, UserLoginLog $log): RedirectResponse
    {
        if (!$log->is_active_session) {
            return redirect()->back()->with('error', 'This session is already closed.');
        }

        $validated = $request->validate([
            'reason' => 'required|string|max:500',
        ]);

        $log->update([
            'logout_time'       => now(),
            'logout_reason'     => 'admin_force_logout',
            'logout_by_user_id' => Auth::id(),
            'manual_reason'     => $validated['reason'],
            'is_active_session' => false,
        ]);

        return redirect()->back()->with('success', 'Session closed successfully.');
    }
}