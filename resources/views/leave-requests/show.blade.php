@extends('layouts.app')

@section('title', 'Leave Request Details')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Leave Request Details</h4>
		<div class="d-flex gap-2">
			@if ($canReviewThis && $leaveRequest->status === 'pending')
				<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#approveModal">
					<i class="ti ti-check me-1"></i> Approve
				</button>
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#rejectModal">
					<i class="ti ti-x me-1"></i> Reject
				</button>
			@endif
			<a href="{{ route('leave-requests.index') }}" class="btn btn-outline-light">
				<i class="ti ti-arrow-left me-1"></i> Back to List
			</a>
		</div>
	</div>

	@php
		$statusColors = [
			'pending' => 'badge-soft-warning',
			'approved' => 'badge-soft-success',
			'rejected' => 'badge-soft-danger',
			'cancelled' => 'badge-soft-secondary',
		];
	@endphp

	<div class="card">
		<div class="card-body">
			<div class="d-flex align-items-center justify-content-between mb-3">
				<h5 class="mb-0">{{ $leaveRequest->leaveType->name }}</h5>
				<span class="badge {{ $statusColors[$leaveRequest->status] }} fs-13">{{ ucfirst($leaveRequest->status) }}</span>
			</div>

			<div class="row g-3">
				<div class="col-md-4"><strong>Employee:</strong> {{ $leaveRequest->user->full_name }}</div>
				<div class="col-md-4"><strong>From:</strong> {{ $leaveRequest->from_date->format('d M Y') }}</div>
				<div class="col-md-4"><strong>To:</strong> {{ $leaveRequest->to_date->format('d M Y') }}</div>
				<div class="col-md-4"><strong>Total Days:</strong> {{ $leaveRequest->total_days }}{{ $leaveRequest->is_half_day ? ' (half day)' : '' }}</div>
				<div class="col-md-4"><strong>Applied On:</strong> {{ $leaveRequest->applied_at->format('d M Y, h:i A') }}</div>
				<div class="col-md-4">
					<strong>Reviewed By:</strong>
					{{ $leaveRequest->reviewer->full_name ?? '—' }}
					@if ($leaveRequest->reviewed_at)
						<div class="fs-12 text-muted">{{ $leaveRequest->reviewed_at->format('d M Y, h:i A') }}</div>
					@endif
					@if ($leaveRequest->status === 'pending' && $escalated && $effectiveApprovers->isNotEmpty())
						<div class="fs-12 text-warning">
							<i class="ti ti-arrow-up-circle"></i>
							@if (!$leaveRequest->user->reporting_manager_id)
								No reporting manager assigned — routed to
								{{ $effectiveApprovers->map(fn($a) => $a->full_name . ($a->role ? ' (' . $a->role->role_name . ')' : ''))->implode(' and ') }}
							@else
								Manager on leave — escalated to
								{{ $effectiveApprovers->map(fn($a) => $a->full_name . ($a->role ? ' (' . $a->role->role_name . ')' : ''))->implode(' and ') }}
							@endif
						</div>
					@elseif ($leaveRequest->status === 'pending' && $effectiveApprovers->isEmpty())
						<div class="fs-12 text-danger">
							<i class="ti ti-alert-circle"></i> No available approver — needs HR
						</div>
					@endif
				</div>
				<div class="col-md-12"><strong>Reason:</strong> {{ $leaveRequest->reason }}</div>
				@if ($leaveRequest->review_remarks)
					<div class="col-md-12">
						<strong>{{ $leaveRequest->status === 'rejected' ? 'Rejection Reason' : 'Remarks' }}:</strong>
						{{ $leaveRequest->review_remarks }}
					</div>
				@endif
			</div>
		</div>
	</div>

	@if ($canReviewThis && $leaveRequest->status === 'pending')
		<!-- Approve Modal -->
		<div class="modal fade" id="approveModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<form method="POST" action="{{ route('leave-requests.approve', $leaveRequest->id) }}">
						@csrf
						@method('PATCH')
						<div class="modal-header">
							<h5 class="modal-title">Approve Leave</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body">
							<label class="form-label">Remarks (optional)</label>
							<textarea name="remarks" class="form-control" rows="2"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-success">Approve</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Reject Modal -->
		<div class="modal fade" id="rejectModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<form method="POST" action="{{ route('leave-requests.reject', $leaveRequest->id) }}">
						@csrf
						@method('PATCH')
						<div class="modal-header">
							<h5 class="modal-title">Reject Leave</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body">
							<label class="form-label">Reason for rejection <span class="text-danger">*</span></label>
							<textarea name="remarks" class="form-control" rows="3" required></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-danger">Reject</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	@endif

@endsection