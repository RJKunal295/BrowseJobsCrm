<?php

namespace App\Services;

use App\Models\LeaveRequest;
use App\Models\User;
use App\Models\UserLoginLog;
use Carbon\CarbonInterface;
use Illuminate\Support\Collection;

class LoginReminderService
{
    /**
     * Active users who have NOT logged in on the given date and are not on approved leave.
     *
     * @return \Illuminate\Database\Eloquent\Collection<int, User>
     */
    public function usersMissingLoginOn(CarbonInterface $date)
    {
        $loggedInUserIds = UserLoginLog::whereDate('login_time', $date)
            ->distinct()
            ->pluck('user_id');

        $onLeaveUserIds = LeaveRequest::where('status', 'approved')
            ->whereDate('from_date', '<=', $date)
            ->whereDate('to_date', '>=', $date)
            ->pluck('user_id');

        return User::where('is_active', true)
            ->whereNotIn('id', $loggedInUserIds)
            ->whereNotIn('id', $onLeaveUserIds)
            ->orderBy('full_name')
            ->get();
    }

    /**
     * Did the user log in at all on the given date?
     */
    public function hasLoggedInOn(int $userId, CarbonInterface $date): bool
    {
        return UserLoginLog::where('user_id', $userId)
            ->whereDate('login_time', $date)
            ->exists();
    }

    /**
     * Ordered list of ['id','name','email','mobile'] for a set of users — used in escalation reports.
     *
     * @param  Collection<int, User>  $users
     * @return array<int, array{name: string, email: string, mobile: string}>
     */
    public function contactRows(Collection $users): array
    {
        return $users->map(fn (User $user) => [
            'name' => $user->full_name ?? trim($user->first_name.' '.$user->last_name),
            'email' => $user->email ?? '—',
            'mobile' => $user->whatsapp_number ?: ($user->phone ?: '—'),
        ])->values()->all();
    }
}
