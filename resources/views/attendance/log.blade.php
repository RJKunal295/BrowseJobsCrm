@extends('layouts.app')

@section('title', 'Attendance Log')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Attendance Log</h4>
		<div class="d-flex gap-2">
			<a href="{{ route('attendance.index') }}" class="btn btn-outline-light">
				<i class="ti ti-arrow-left me-1"></i> Back to Summary
			</a>
			<a href="{{ route('attendance.create') }}" class="btn btn-primary">
				<i class="ti ti-plus me-1"></i> Add Manual Attendance
			</a>
		</div>
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
			<form method="GET" action="{{ route('attendance.log') }}" class="row g-3 align-items-end">
				<div class="col-md-3">
					<label class="form-label">Employee</label>
					<select name="user_id" class="form-select">
						<option value="">All Employees</option>
						@foreach ($users as $u)
							<option value="{{ $u->id }}" @selected(request('user_id') == $u->id)>{{ $u->full_name }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-3">
					<label class="form-label">From</label>
					<input type="date" name="from" class="form-control" value="{{ request('from') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">To</label>
					<input type="date" name="to" class="form-control" value="{{ request('to') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Status</label>
					<select name="status" class="form-select">
						<option value="">All</option>
						<option value="active" @selected(request('status') === 'active')>Currently Active</option>
						<option value="completed" @selected(request('status') === 'completed')>Completed</option>
						<option value="manual" @selected(request('status') === 'manual')>Manual Entries Only</option>
					</select>
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary">
						<i class="ti ti-filter me-1"></i> Filter
					</button>
					<a href="{{ route('attendance.log') }}" class="btn btn-outline-light">Reset</a>
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
							<th>Employee</th>
							<th>Check-in</th>
							<th>Check-out</th>
							<th>Duration</th>
							<th>Logged Out By</th>
							<th>Reason</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($logs as $index => $log)
							<tr>
								<td>{{ $logs->firstItem() + $index }}</td>
								<td>
									{{ $log->user->full_name ?? '—' }}
									@if ($log->is_manual_entry)
										<span class="badge badge-soft-info ms-1">Manual</span>
									@endif
								</td>
								<td>{{ $log->login_time->format('d M Y, h:i A') }}</td>
								<td>{{ $log->logout_time?->format('d M Y, h:i A') ?? '—' }}</td>
								<td>
									@if ($log->duration_minutes !== null)
										{{ intdiv($log->duration_minutes, 60) }}h {{ $log->duration_minutes % 60 }}m
									@else
										<span class="text-muted">In progress</span>
									@endif
								</td>
								<td>
									@if (!$log->logout_time)
										—
									@elseif ($log->was_force_logged_out)
										<span class="text-danger">
											<i class="ti ti-shield-lock"></i> {{ $log->logoutBy->full_name ?? 'Admin' }} (forced)
										</span>
									@else
										<span class="text-success">
											<i class="ti ti-user-check"></i> Self
										</span>
									@endif
								</td>
								<td>
									@if ($log->manual_reason)
										<span class="fs-13">{{ $log->manual_reason }}</span>
									@elseif ($log->logout_reason)
										<span class="text-muted fs-13">{{ $log->logout_reason }}</span>
									@else
										—
									@endif
								</td>
								<td>
									@if ($log->is_active_session)
										<span class="badge badge-soft-success">Active</span>
									@else
										<span class="badge badge-soft-secondary">Completed</span>
									@endif
								</td>
								<td>
									@if ($log->is_active_session)
										<button type="button" class="btn btn-sm btn-outline-danger"
											data-bs-toggle="modal" data-bs-target="#forceLogoutModal{{ $log->id }}">
											<i class="ti ti-lock"></i> Force Logout
										</button>

										<!-- Force Logout Modal -->
										<div class="modal fade" id="forceLogoutModal{{ $log->id }}" tabindex="-1">
											<div class="modal-dialog">
												<div class="modal-content">
													<form method="POST" action="{{ route('attendance.force-logout', $log->id) }}">
														@csrf
														@method('PATCH')
														<div class="modal-header">
															<h5 class="modal-title">Force Logout — {{ $log->user->full_name }}</h5>
															<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
														</div>
														<div class="modal-body">
															<label class="form-label">Reason <span class="text-danger">*</span></label>
															<textarea name="reason" class="form-control" rows="3"
																placeholder="e.g. Forgot to log out, left for the day" required></textarea>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
															<button type="submit" class="btn btn-danger">Close Session</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									@else
										—
									@endif
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="9" class="text-center py-4">No attendance records found.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $logs->links() }}
			</div>
		</div>
	</div>

@endsection