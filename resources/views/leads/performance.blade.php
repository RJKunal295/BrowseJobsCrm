@extends('layouts.app')

@section('title', 'HR Performance')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">HR Performance</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <a href="{{ route('leads.index') }}" class="text-muted">Leads</a> &gt; <span>HR Performance</span>
			</nav>
		</div>
		<a href="{{ route('leads.index') }}" class="btn btn-outline-light"><i class="ti ti-arrow-left me-1"></i> Back to Leads</a>
	</div>

	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('leads.performance') }}" class="row g-3 align-items-end">
				<div class="col-md-3">
					<label class="form-label">Assigned from</label>
					<input type="date" name="from" class="form-control" value="{{ $from }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Assigned to</label>
					<input type="date" name="to" class="form-control" value="{{ $to }}">
				</div>
				<div class="col-md-2 d-flex gap-2">
					<button type="submit" class="btn btn-primary"><i class="ti ti-filter"></i></button>
					<a href="{{ route('leads.performance') }}" class="btn btn-outline-light">Reset</a>
				</div>
			</form>
		</div>
	</div>

	@php
		$totalAssigned = $rows->sum('assigned');
		$totalFollowedUp = $rows->sum('followed_up');
		$totalOverdue = $rows->sum('overdue');
		$totalJoined = $rows->sum('joined');
	@endphp

	<div class="row g-3 mb-3">
		<div class="col-6 col-lg-3">
			<div class="card mb-0"><div class="card-body">
				<p class="text-muted mb-1 fs-13">Leads assigned</p>
				<h4 class="mb-0">{{ $totalAssigned }}</h4>
			</div></div>
		</div>
		<div class="col-6 col-lg-3">
			<div class="card mb-0"><div class="card-body">
				<p class="text-muted mb-1 fs-13">Followed up</p>
				<h4 class="mb-0">{{ $totalFollowedUp }}
					<span class="fs-13 text-muted">({{ $totalAssigned ? round($totalFollowedUp / $totalAssigned * 100) : 0 }}%)</span>
				</h4>
			</div></div>
		</div>
		<div class="col-6 col-lg-3">
			<div class="card mb-0"><div class="card-body">
				<p class="text-muted mb-1 fs-13">Overdue (&gt;24h, untouched)</p>
				<h4 class="mb-0 {{ $totalOverdue > 0 ? 'text-danger' : '' }}">{{ $totalOverdue }}</h4>
			</div></div>
		</div>
		<div class="col-6 col-lg-3">
			<div class="card mb-0"><div class="card-body">
				<p class="text-muted mb-1 fs-13">Joined (conversions)</p>
				<h4 class="mb-0 text-success">{{ $totalJoined }}</h4>
			</div></div>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>HR</th>
							<th>Assigned</th>
							<th>Followed up</th>
							<th>Pending</th>
							<th>Overdue &gt;24h</th>
							<th>Calls logged</th>
							<th>Interested / Follow-up</th>
							<th>Joined</th>
							<th>Avg first response</th>
							<th>Last activity</th>
							<th>Leads</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($rows as $row)
							<tr>
								<td>
									<span class="fw-medium">{{ $row->user->full_name }}</span>
									<div class="fs-12 text-muted">{{ $row->user->role->role_name ?? '' }}</div>
								</td>
								<td>{{ $row->assigned }}</td>
								<td>
									{{ $row->followed_up }}
									@if ($row->assigned > 0)
										@php $pct = round($row->followed_up / $row->assigned * 100); @endphp
										<span class="badge {{ $pct >= 80 ? 'bg-success' : ($pct >= 50 ? 'bg-warning' : 'bg-danger') }}">{{ $pct }}%</span>
									@endif
								</td>
								<td>{{ $row->pending }}</td>
								<td>
									@if ($row->overdue > 0)
										<span class="badge bg-danger">{{ $row->overdue }}</span>
									@else
										<span class="badge bg-success">0</span>
									@endif
								</td>
								<td>{{ $row->calls }}</td>
								<td>{{ $row->interested }}</td>
								<td>{{ $row->joined }}</td>
								<td>
									@if ($row->avg_response_minutes !== null)
										@if ($row->avg_response_minutes < 60)
											{{ $row->avg_response_minutes }} min
										@else
											{{ round($row->avg_response_minutes / 60, 1) }} h
										@endif
									@else
										—
									@endif
								</td>
								<td>{{ $row->last_activity?->diffForHumans() ?? 'No activity yet' }}</td>
								<td>
									<a href="{{ route('leads.index', ['assigned_user_id' => $row->user->id]) }}" class="btn btn-sm btn-icon btn-outline-light" title="View this HR's leads">
										<i class="ti ti-eye"></i>
									</a>
								</td>
							</tr>
						@empty
							<tr><td colspan="11" class="text-center py-4">No active HR users found.</td></tr>
						@endforelse
					</tbody>
				</table>
			</div>
			<p class="fs-12 text-muted mt-2 mb-0">
				<i class="ti ti-info-circle me-1"></i>A lead counts as <strong>followed up</strong> when the assigned HR logged a call on it or changed its status after the assignment.
				<strong>Overdue</strong> = assigned more than 24 hours ago, still open, and no action by the HR yet.
			</p>
		</div>
	</div>

@endsection
