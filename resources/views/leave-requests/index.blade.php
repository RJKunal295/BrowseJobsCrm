@extends('layouts.app')

@section('title', 'Leave Requests')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Leave Requests</h4>
		<a href="{{ route('leave-requests.create') }}" class="btn btn-primary">
			<i class="ti ti-plus me-1"></i> Apply for Leave
		</a>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	@if (session('error'))
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
			{{ session('error') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	<!-- Filters -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('leave-requests.index') }}" class="row g-3 align-items-end">
				@if ($isHrOverride)
					<div class="col-md-3">
						<label class="form-label">Employee</label>
						<select name="user_id" class="form-select">
							<option value="">All Employees</option>
							@foreach ($users as $u)
								<option value="{{ $u->id }}" @selected(request('user_id') == $u->id)>{{ $u->full_name }}</option>
							@endforeach
						</select>
					</div>
				@endif
				<div class="col-md-3">
					<label class="form-label">Leave Type</label>
					<select name="leave_type_id" class="form-select">
						<option value="">All Types</option>
						@foreach ($leaveTypes as $type)
							<option value="{{ $type->id }}" @selected(request('leave_type_id') == $type->id)>{{ $type->name }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-3">
					<label class="form-label">Status</label>
					<select name="status" class="form-select">
						<option value="">All Status</option>
						<option value="pending" @selected(request('status') === 'pending')>Pending</option>
						<option value="approved" @selected(request('status') === 'approved')>Approved</option>
						<option value="rejected" @selected(request('status') === 'rejected')>Rejected</option>
						<option value="cancelled" @selected(request('status') === 'cancelled')>Cancelled</option>
					</select>
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary">
						<i class="ti ti-filter me-1"></i> Filter
					</button>
					<a href="{{ route('leave-requests.index') }}" class="btn btn-outline-light">Reset</a>
				</div>
			</form>
		</div>
	</div>
	<!-- End Filters -->

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>##</th>
							@if ($canReview)
								<th>Employee</th>
							@endif
							<th>Leave Type</th>
							<th>From</th>
							<th>To</th>
							<th>Days</th>
							<th>Reason</th>
							<th>Status</th>
							<th>Reviewed By</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($leaveRequests as $index=> $leave)
							@php
								// Computed in the controller — accounts for escalation when
								// the direct manager is on approved leave today.
								$canReviewThisRow = $leave->can_review_this;
								$isOwnRequest = $leave->user_id === auth()->id();
							@endphp
							<tr>
								<td>{{ $index + 1 }} </td>
								@if ($canReview)
									<td>{{ $leave->user->full_name ?? '—' }}</td>
								@endif
								<td>{{ $leave->leaveType->name ?? '—' }}</td>
								<td>{{ $leave->from_date->format('d M Y') }}</td>
								<td>{{ $leave->to_date->format('d M Y') }}</td>
								<td>{{ $leave->total_days }}{{ $leave->is_half_day ? ' (half)' : '' }}</td>
								<td class="fs-13" style="max-width:200px;">{{ \Illuminate\Support\Str::limit($leave->reason, 60) }}</td>
								<td>
									@php
										$statusColors = [
											'pending' => 'badge-soft-warning',
											'approved' => 'badge-soft-success',
											'rejected' => 'badge-soft-danger',
											'cancelled' => 'badge-soft-secondary',
										];
									@endphp
									<span class="badge {{ $statusColors[$leave->status] }}">{{ ucfirst($leave->status) }}</span>
								</td>
								<td>
									{{ $leave->reviewer->full_name ?? '—' }}
									@if ($leave->review_remarks)
										<div class="fs-12 text-muted">{{ \Illuminate\Support\Str::limit($leave->review_remarks, 40) }}</div>
									@endif
									@if ($leave->status === 'pending' && $leave->escalated && $leave->effective_approvers->isNotEmpty())
										<div class="fs-12 text-warning">
											<i class="ti ti-arrow-up-circle"></i>
											@if (!$leave->user->reporting_manager_id)
												No reporting manager assigned — routed to
												{{ $leave->effective_approvers->map(fn($a) => $a->full_name . ($a->role ? ' (' . $a->role->role_name . ')' : ''))->implode(' and ') }}
											@else
												Manager on leave — escalated to
												{{ $leave->effective_approvers->map(fn($a) => $a->full_name . ($a->role ? ' (' . $a->role->role_name . ')' : ''))->implode(' and ') }}
											@endif
										</div>
									@elseif ($leave->status === 'pending' && $leave->effective_approvers->isEmpty())
										<div class="fs-12 text-danger">
											<i class="ti ti-alert-circle"></i> No available approver — needs HR
										</div>
									@endif
								</td>
								<td>
									<div class="d-flex gap-2 flex-wrap">
										<a href="{{ route('leave-requests.show', $leave->id) }}" class="btn btn-sm btn-outline-light">
											<i class="ti ti-eye"></i>
										</a>

										@if ($leave->status === 'pending')
											@if ($canReviewThisRow && !$isOwnRequest)
												<button type="button" class="btn btn-sm btn-outline-success"
													data-bs-toggle="modal" data-bs-target="#approveModal{{ $leave->id }}">
													<i class="ti ti-check"></i> Approve
												</button>
												<button type="button" class="btn btn-sm btn-outline-danger"
													data-bs-toggle="modal" data-bs-target="#rejectModal{{ $leave->id }}">
													<i class="ti ti-x"></i> Reject
												</button>
											@endif

											@if ($isOwnRequest || $canReviewThisRow)
												<form method="POST" action="{{ route('leave-requests.cancel', $leave->id) }}"
													onsubmit="return confirm('Cancel this leave request?');">
													@csrf
													@method('PATCH')
													<button type="submit" class="btn btn-sm btn-outline-secondary">Cancel</button>
												</form>
											@endif
										@endif
									</div>

									@if ($canReviewThisRow && !$isOwnRequest && $leave->status === 'pending')
										<!-- Approve Modal -->
										<div class="modal fade" id="approveModal{{ $leave->id }}" tabindex="-1">
											<div class="modal-dialog">
												<div class="modal-content">
													<form method="POST" action="{{ route('leave-requests.approve', $leave->id) }}">
														@csrf
														@method('PATCH')
														<div class="modal-header">
															<h5 class="modal-title">Approve Leave — {{ $leave->user->full_name }}</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
														</div>
														<div class="modal-body">
															<p>{{ $leave->leaveType->name }} · {{ $leave->from_date->format('d M Y') }} to {{ $leave->to_date->format('d M Y') }} ({{ $leave->total_days }} day(s))</p>
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
										<div class="modal fade" id="rejectModal{{ $leave->id }}" tabindex="-1">
											<div class="modal-dialog">
												<div class="modal-content">
													<form method="POST" action="{{ route('leave-requests.reject', $leave->id) }}">
														@csrf
														@method('PATCH')
														<div class="modal-header">
															<h5 class="modal-title">Reject Leave — {{ $leave->user->full_name }}</h5>
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
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="{{ $canReview ? 9 : 8 }}" class="text-center py-4">No leave requests found.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $leaveRequests->links() }}
			</div>
		</div>
	</div>

@endsection