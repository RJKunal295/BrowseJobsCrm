<?php

namespace App\Http\Controllers;

use App\Models\MeetingReport;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

/**
 * AI meeting reports (standup attendance + analysis), visible to management roles.
 */
class MeetingReportController extends Controller
{
    private const VIEW_ROLES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'HR_MANAGER'];

    public function index(): View
    {
        $this->authorizeRole();

        return view('meeting-reports.index', [
            'reports' => MeetingReport::orderByDesc('meeting_date')->orderByDesc('id')->paginate(20),
        ]);
    }

    public function show(MeetingReport $meetingReport): View
    {
        $this->authorizeRole();

        return view('meeting-reports.show', ['report' => $meetingReport]);
    }

    private function authorizeRole(): void
    {
        abort_unless(
            in_array(Auth::user()?->role?->role_code, self::VIEW_ROLES, true),
            403
        );
    }
}
