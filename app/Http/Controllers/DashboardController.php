<?php

namespace App\Http\Controllers;

use App\Models\LeaveRequest;
use App\Models\Task;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\View\View;

class DashboardController extends Controller
{
    private const BIRTHDAY_QUOTES = [
        "Another year older, another year wiser, another year more fabulous.",
        "Count your life by smiles, not tears. Count your age by friends, not years.",
        "Today you are you, that is truer than true. There is no one alive who is you-er than you!",
        "May your day be filled with sunshine, laughter, and just the right amount of cake.",
        "Growing old is mandatory. Growing wise is optional — but clearly, you're nailing both.",
        "Here's to another trip around the sun, and all the adventures still to come.",
    ];

    public function index(): View
    {
        $today = Carbon::today();

        // ---- On Leave Today ----
        $onLeaveToday = LeaveRequest::with(['user', 'leaveType'])
            ->where('status', 'approved')
            ->whereDate('from_date', '<=', $today)
            ->whereDate('to_date', '>=', $today)
            ->get();

        // ---- Birthdays — today + next 7 days ----
        $usersWithDob = User::whereNotNull('date_of_birth')
            ->where('employment_status', 'Active')
            ->get(['id', 'full_name', 'date_of_birth', 'profile_photo']);

        $birthdaysUpcoming = $usersWithDob->map(function (User $user) use ($today) {
            $occurrence = Carbon::create($today->year, $user->date_of_birth->month, $user->date_of_birth->day);

            if ($occurrence->month !== $user->date_of_birth->month) {
                $occurrence = Carbon::create($today->year, 2, 28);
            }

            if ($occurrence->lt($today->copy()->startOfDay())) {
                $occurrence = $occurrence->addYear();
            }

            $user->next_birthday = $occurrence;
            $user->days_until_birthday = $today->diffInDays($occurrence, false);

            return $user;
        })
            ->filter(fn (User $u) => $u->days_until_birthday >= 0 && $u->days_until_birthday <= 7)
            ->sortBy('days_until_birthday')
            ->values();

        // Extracted separately for the celebration banner — no extra query needed.
        $birthdaysToday = $birthdaysUpcoming->where('days_until_birthday', 0)->values();
        $birthdayQuote = self::BIRTHDAY_QUOTES[array_rand(self::BIRTHDAY_QUOTES)];

        // ---- Incomplete / Overdue Tasks ----
        $overdueTasks = Task::with(['assignees' => function ($q) {
                $q->wherePivot('is_completed', false);
            }, 'creator'])
            ->where('status', '!=', 'completed')
            ->whereDate('due_date', '<', $today)
            ->get()
            ->filter(fn (Task $t) => $t->assignees->isNotEmpty())
            ->map(function (Task $task) use ($today) {
                $task->days_overdue = (int) floor(Carbon::parse($task->due_date)->diffInDays($today));
                return $task;
            });

        $dueTodayTasks = Task::with(['assignees' => function ($q) {
                $q->wherePivot('is_completed', false);
            }])
            ->where('status', '!=', 'completed')
            ->whereDate('due_date', '=', $today)
            ->get()
            ->filter(fn (Task $t) => $t->assignees->isNotEmpty());

        // ---- Summary stat cards ----
        $totalEmployees = User::where('employment_status', 'Active')->count();
        $pendingLeaveRequests = LeaveRequest::where('status', 'pending')->count();
        $overdueTaskCount = $overdueTasks->count();

        // ---- DEMO placeholder chart data ----
        $attendanceTrend = [
            'labels' => ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Today'],
            'data'   => [24, 25, 22, 26, 23, 10, $totalEmployees - $onLeaveToday->count()],
        ];

        $leaveTypeBreakdown = [
            'labels' => ['Casual', 'Sick', 'Earned', 'Maternity', 'Unpaid'],
            'data'   => [45, 20, 18, 5, 12],
        ];

        return view('dashboard', [
            'onLeaveToday'          => $onLeaveToday,
            'birthdaysUpcoming'     => $birthdaysUpcoming,
            'birthdaysToday'        => $birthdaysToday,
            'birthdayQuote'         => $birthdayQuote,
            'overdueTasks'          => $overdueTasks,
            'dueTodayTasks'         => $dueTodayTasks,
            'totalEmployees'        => $totalEmployees,
            'pendingLeaveRequests'  => $pendingLeaveRequests,
            'overdueTaskCount'      => $overdueTaskCount,
            'onLeaveTodayCount'     => $onLeaveToday->count(),
            'attendanceTrend'       => $attendanceTrend,
            'leaveTypeBreakdown'    => $leaveTypeBreakdown,
        ]);
    }
}