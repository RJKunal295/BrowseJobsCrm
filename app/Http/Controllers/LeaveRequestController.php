<?php

namespace App\Http\Controllers;

use App\Models\LeaveBalance;
use App\Models\LeaveRequest;
use App\Models\LeaveType;
use App\Models\User;
use App\Notifications\LeaveRequestReviewed;
use App\Notifications\LeaveRequestSubmitted;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;
use Illuminate\View\View;

class LeaveRequestController extends Controller
{
    public function index(Request $request): View
    {
        $user = Auth::user();
        $isHrOverride = $user->hasPermission('manage_leave_requests');
        $directReportIds = User::where('reporting_manager_id', $user->id)->pluck('id');

        $filters = function ($query) use ($request) {
            if ($request->filled('status')) {
                $query->where('status', $request->input('status'));
            }
            if ($request->filled('leave_type_id')) {
                $query->where('leave_type_id', $request->input('leave_type_id'));
            }
            if ($request->filled('from')) {
                $query->whereDate('from_date', '>=', $request->input('from'));
            }
            if ($request->filled('to')) {
                $query->whereDate('to_date', '<=', $request->input('to'));
            }
        };

        if ($isHrOverride) {
            $query = LeaveRequest::with(['user', 'leaveType', 'reviewer']);
            $filters($query);

            if ($request->filled('user_id')) {
                $query->where('user_id', $request->input('user_id'));
            }

            $leaveRequests = $query->orderByDesc('applied_at')->paginate(20)->withQueryString();
        } else {
            $candidatesQuery = LeaveRequest::with(['user', 'leaveType', 'reviewer']);
            $filters($candidatesQuery);
            $candidates = $candidatesQuery->orderByDesc('applied_at')->get();

            $visible = $candidates->filter(function (LeaveRequest $leave) use ($user, $directReportIds) {
                return $leave->user_id === $user->id
                    || $directReportIds->contains($leave->user_id)
                    || $this->canReview($leave);
            })->values();

            $perPage = 20;
            $page = LengthAwarePaginator::resolveCurrentPage();
            $items = $visible->slice(($page - 1) * $perPage, $perPage)->values();

            $leaveRequests = new LengthAwarePaginator($items, $visible->count(), $perPage, $page, [
                'path'  => $request->url(),
                'query' => $request->query(),
            ]);
        }

        $leaveRequests->getCollection()->transform(function (LeaveRequest $leave) {
            $approvers = $this->getEffectiveApprovers($leave->user);

            $isFallback = !(
                $approvers->count() === 1
                && $approvers->first()->id === $leave->user->reporting_manager_id
            );

            $leave->setAttribute('can_review_this', $this->canReview($leave));
            $leave->setAttribute('effective_approvers', $approvers);
            $leave->setAttribute('escalated', $isFallback && $approvers->isNotEmpty());
            return $leave;
        });

        $users = $isHrOverride ? User::orderBy('full_name')->get(['id', 'full_name']) : collect();
        $leaveTypes = LeaveType::where('is_active', true)->orderBy('name')->get();

        $canReview = $isHrOverride
            || $directReportIds->isNotEmpty()
            || $leaveRequests->getCollection()->contains(fn ($l) => $l->user_id !== $user->id);

        return view('leave-requests.index', compact(
            'leaveRequests', 'users', 'leaveTypes', 'isHrOverride', 'canReview'
        ));
    }

    public function create(): View
    {
        $leaveTypes = LeaveType::where('is_active', true)->orderBy('name')->get();
        $year = now()->year;

        $balances = $leaveTypes->mapWithKeys(function (LeaveType $type) use ($year) {
            $balance = LeaveBalance::findOrCreateFor(Auth::id(), $type->id, $year);
            return [$type->id => $balance];
        });

        return view('leave-requests.create', compact('leaveTypes', 'balances'));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'leave_type_id' => 'required|exists:leave_types,id',
            'from_date'     => 'required|date',
            'to_date'       => 'required|date|after_or_equal:from_date',
            'is_half_day'   => 'nullable|boolean',
            'reason'        => 'required|string|max:1000',
        ]);

        $isHalfDay = $request->boolean('is_half_day');
        $fromDate = \Carbon\Carbon::parse($validated['from_date']);
        $toDate = \Carbon\Carbon::parse($validated['to_date']);
        $totalDays = $isHalfDay ? 0.5 : $fromDate->diffInDays($toDate) + 1;

        $leaveType = LeaveType::find($validated['leave_type_id']);
        if ($leaveType->code !== 'unpaid') {
            $balance = LeaveBalance::findOrCreateFor(Auth::id(), $leaveType->id, $fromDate->year);
            if ($totalDays > $balance->remaining_days) {
                return back()->withInput()->withErrors([
                    'leave_type_id' => "Insufficient balance: you have {$balance->remaining_days} day(s) of {$leaveType->name} remaining, but requested {$totalDays}.",
                ]);
            }
        }

        $leaveRequest = LeaveRequest::create([
            'user_id'       => Auth::id(),
            'leave_type_id' => $validated['leave_type_id'],
            'from_date'     => $fromDate,
            'to_date'       => $toDate,
            'is_half_day'   => $isHalfDay,
            'total_days'    => $totalDays,
            'reason'        => $validated['reason'],
        ]);

        // Notify a broader group than "who can approve": always the direct
        // reporting manager (even if they're on leave) + Head Of Operations,
        // in addition to whoever the effective approver currently is.
        $recipients = $this->getNotificationRecipients($leaveRequest->user);
        if ($recipients->isNotEmpty()) {
            Notification::send($recipients, new LeaveRequestSubmitted($leaveRequest));
        }

        return redirect()->route('leave-requests.index')->with('success', 'Leave request submitted successfully.');
    }

    public function show(LeaveRequest $leaveRequest): View
    {
        $this->authorizeView($leaveRequest);

        $leaveRequest->load(['user', 'leaveType', 'reviewer']);
        $canReviewThis = $this->canReview($leaveRequest);
        $effectiveApprovers = $this->getEffectiveApprovers($leaveRequest->user);
        $escalated = !(
            $effectiveApprovers->count() === 1
            && $effectiveApprovers->first()->id === $leaveRequest->user->reporting_manager_id
        ) && $effectiveApprovers->isNotEmpty();

        return view('leave-requests.show', compact('leaveRequest', 'canReviewThis', 'effectiveApprovers', 'escalated'));
    }

    public function approve(Request $request, LeaveRequest $leaveRequest): RedirectResponse
    {
        if (!$this->canReview($leaveRequest)) {
            abort(403, 'Only this employee\'s current approver or HR can approve this request.');
        }

        if (!$leaveRequest->isPending()) {
            return back()->with('error', 'This request has already been reviewed.');
        }

        DB::transaction(function () use ($leaveRequest, $request) {
            $leaveRequest->update([
                'status'         => 'approved',
                'reviewed_by'    => Auth::id(),
                'reviewed_at'    => now(),
                'review_remarks' => $request->input('remarks'),
            ]);

            if ($leaveRequest->leaveType->code !== 'unpaid') {
                $balance = LeaveBalance::findOrCreateFor(
                    $leaveRequest->user_id,
                    $leaveRequest->leave_type_id,
                    $leaveRequest->from_date->year
                );
                $balance->increment('used_days', $leaveRequest->total_days);
            }
        });

        $leaveRequest->user->notify(new LeaveRequestReviewed($leaveRequest));

        return back()->with('success', 'Leave request approved.');
    }

    public function reject(Request $request, LeaveRequest $leaveRequest): RedirectResponse
    {
        if (!$this->canReview($leaveRequest)) {
            abort(403, 'Only this employee\'s current approver or HR can reject this request.');
        }

        if (!$leaveRequest->isPending()) {
            return back()->with('error', 'This request has already been reviewed.');
        }

        $validated = $request->validate([
            'remarks' => 'required|string|max:1000',
        ]);

        $leaveRequest->update([
            'status'         => 'rejected',
            'reviewed_by'    => Auth::id(),
            'reviewed_at'    => now(),
            'review_remarks' => $validated['remarks'],
        ]);

        $leaveRequest->user->notify(new LeaveRequestReviewed($leaveRequest));

        return back()->with('success', 'Leave request rejected.');
    }

    public function cancel(LeaveRequest $leaveRequest): RedirectResponse
    {
        $isOwner = $leaveRequest->user_id === Auth::id();

        if (!$isOwner && !$this->canReview($leaveRequest)) {
            abort(403);
        }

        if (!$leaveRequest->isPending()) {
            return back()->with('error', 'Only pending requests can be cancelled.');
        }

        $leaveRequest->update(['status' => 'cancelled']);

        return back()->with('success', 'Leave request cancelled.');
    }

    /**
     * Can the current user approve/reject THIS specific request? True if
     * HR override, or if they appear anywhere in the effective approvers list.
     * (Authorization — kept narrow and unchanged.)
     */
    private function canReview(LeaveRequest $leaveRequest): bool
    {
        $user = Auth::user();

        if ($user->hasPermission('manage_leave_requests')) {
            return true;
        }

        return $this->getEffectiveApprovers($leaveRequest->user)
            ->contains(fn (User $approver) => $approver->id === $user->id);
    }

    /**
     * Who is notified when this employee submits a leave request?
     * Broader than "who can approve" — always includes:
     *  1. The direct reporting manager, if one exists (even if currently on
     *     leave themselves — they still get an FYI notification).
     *  2. Whoever the current effective approver is (may be the same person
     *     as #1, or an escalation, or the Super Admin/Head Of Ops fallback).
     *  3. Head Of Operations, always, as a standing CC — regardless of
     *     whether escalation actually triggered.
     * Deduplicated so nobody gets notified twice.
     */
    private function getNotificationRecipients(User $employee): Collection
    {
        $recipients = collect();

        if ($employee->reportingManager) {
            $recipients->push($employee->reportingManager);
        }

        $recipients = $recipients->merge($this->getEffectiveApprovers($employee));

        $headOfOps = User::whereHas('role', fn ($q) => $q->where('role_code', 'HEAD_OF_OPERATIONS'))
            ->where('id', '!=', $employee->id)
            ->first();
        if ($headOfOps) {
            $recipients->push($headOfOps);
        }

        return $recipients->unique('id')->values();
    }

    /**
     * Who is the current effective approver for an employee's leave requests?
     * Used for AUTHORIZATION (canReview) — kept narrow on purpose:
     *  1. Direct reporting manager, unless on approved leave today — then
     *     escalate to THEIR manager, and so on up the chain (single person
     *     per level, since that's a real hierarchy).
     *  2. If the employee has no manager at all, or the chain runs out,
     *     fall back to a fixed tier: Super Admin (CEO/Founder) AND
     *     Head Of Operations — both listed together, regardless of either
     *     one's own leave status. Either one approving is sufficient.
     */
    private function getEffectiveApprovers(User $employee): Collection
    {
        return $this->resolveApprovers($employee, $employee, 0);
    }

    private function resolveApprovers(User $originalEmployee, User $current, int $depth): Collection
    {
        if ($depth > 6) {
            return $this->getTopLevelFallbackApprovers($originalEmployee);
        }

        $manager = $current->reportingManager;

        if (!$manager) {
            return $this->getTopLevelFallbackApprovers($originalEmployee);
        }

        if ($this->isOnApprovedLeaveToday($manager)) {
            return $this->resolveApprovers($originalEmployee, $manager, $depth + 1);
        }

        return collect([$manager]);
    }

    /**
     * Fixed fallback tier: Super Admin + Head Of Operations, together.
     * Leave status is intentionally NOT checked here — this tier is meant
     * to always be reachable. Excludes the employee themselves so nobody
     * ends up approving their own leave.
     */
    private function getTopLevelFallbackApprovers(User $excludeEmployee): Collection
    {
        $approvers = collect();

        $superAdmin = User::whereHas('role', fn ($q) => $q->where('role_code', 'SUPER_ADMIN'))
            ->where('id', '!=', $excludeEmployee->id)
            ->first();
        if ($superAdmin) {
            $approvers->push($superAdmin);
        }

        $headOfOps = User::whereHas('role', fn ($q) => $q->where('role_code', 'HEAD_OF_OPERATIONS'))
            ->where('id', '!=', $excludeEmployee->id)
            ->first();
        if ($headOfOps) {
            $approvers->push($headOfOps);
        }

        return $approvers;
    }

    private function isOnApprovedLeaveToday(User $user): bool
    {
        return LeaveRequest::where('user_id', $user->id)
            ->where('status', 'approved')
            ->whereDate('from_date', '<=', now()->toDateString())
            ->whereDate('to_date', '>=', now()->toDateString())
            ->exists();
    }

    private function authorizeView(LeaveRequest $leaveRequest): void
    {
        $user = Auth::user();
        $isOwner = $leaveRequest->user_id === $user->id;

        if (!$isOwner && !$this->canReview($leaveRequest)) {
            abort(403);
        }
    }
}