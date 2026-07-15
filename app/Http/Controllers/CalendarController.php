<?php

namespace App\Http\Controllers;

use App\Models\Holiday;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;

class CalendarController extends Controller
{
    public function index(): View
    {
        return view('calendar.index');
    }

    public function events(Request $request): JsonResponse
    {
        // Plain Y-m-d strings — avoids any timezone/time-of-day edge cases
        // that full Carbon datetime comparisons can introduce.
        $start = Carbon::parse($request->input('start'))->toDateString();
        $end = Carbon::parse($request->input('end'))->toDateString();

        $events = collect();

        // ---- Holidays ----
        $holidays = Holiday::whereBetween('holiday_date', [$start, $end])->get();

        foreach ($holidays as $holiday) {
            $events->push([
                'title'  => '🎉 ' . $holiday->title,
                'start'  => $holiday->holiday_date->format('Y-m-d'),
                'allDay' => true,
                'color'  => $holiday->is_optional ? '#f6c23e' : '#1cc88a',
            ]);
        }

        // ---- Employee Birthdays (recurring every year) ----
        $usersWithDob = User::whereNotNull('date_of_birth')->get(['id', 'full_name', 'date_of_birth']);

        $startYear = (int) substr($start, 0, 4);
        $endYear = (int) substr($end, 0, 4);

        foreach (range($startYear, $endYear) as $year) {
            foreach ($usersWithDob as $user) {
                $month = $user->date_of_birth->month;
                $day = $user->date_of_birth->day;

                $occurrence = Carbon::create($year, $month, $day);

                if ($occurrence->month !== $month) {
                    // Feb 29 birthday rolled forward in a non-leap year — use Feb 28 instead.
                    $occurrence = Carbon::create($year, 2, 28);
                }

                $occurrenceStr = $occurrence->toDateString();

                if ($occurrenceStr >= $start && $occurrenceStr <= $end) {
                    $events->push([
                        'title'  => '🎂 ' . $user->full_name . "'s Birthday",
                        'start'  => $occurrenceStr,
                        'allDay' => true,
                        'color'  => '#e83e8c',
                    ]);
                }
            }
        }

        return response()->json($events->values());
    }
}