@extends('layouts.app')

@section('title', 'Attendance')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Attendance Summary</h4>
		<div class="d-flex gap-2">
			<a href="{{ route('attendance.log') }}" class="btn btn-outline-light">
				<i class="ti ti-list-details me-1"></i> Detailed Log
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

	<!-- Month Filter -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('attendance.index') }}" class="row g-3 align-items-end">
				<div class="col-md-3">
					<label class="form-label">Month</label>
					<input type="month" name="month" class="form-control" value="{{ $month }}">
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary">
						<i class="ti ti-filter me-1"></i> View
					</button>
					<a href="{{ route('attendance.index') }}" class="btn btn-outline-light">This Month</a>
				</div>
			</form>
		</div>
	</div>
	<!-- End Month Filter -->

	@php
		$monthLabel = \Illuminate\Support\Carbon::createFromFormat('Y-m', $month)->format('F Y');
	@endphp

	<!-- Overview Cards -->
	<div class="row mb-3">
		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
					<p class="fw-medium mb-1">Total Employees Tracked</p>
					<h4 class="mb-0">{{ $summary->count() }}</h4>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
					<p class="fw-medium mb-1">Total Hours Worked ({{ $monthLabel }})</p>
					<h4 class="mb-0">{{ intdiv($grandTotalMinutes, 60) }}h {{ $grandTotalMinutes % 60 }}m</h4>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
					<p class="fw-medium mb-1">Total Employee-Days Present</p>
					<h4 class="mb-0">{{ $grandTotalDays }}</h4>
				</div>
			</div>
		</div>
	</div>
	<!-- End Overview Cards -->

	<div class="card">
		<div class="card-header">
			<h5 class="mb-0 fs-16 fw-bold">Employee-wise Totals — {{ $monthLabel }}</h5>
		</div>
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>##</th>
							<th>Employee</th>
							<th>Days Present</th>
							<th>Total Sessions</th>
							<th>Total Hours Worked</th>
							<th>Avg Hours / Day</th>
							<th>Currently Active</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($summary as $index => $row)
							@php
								$hours = intdiv((int) $row->total_minutes, 60);
								$mins = (int) $row->total_minutes % 60;
								$avgMinutes = $row->days_present > 0 ? $row->total_minutes / $row->days_present : 0;
								$avgHours = intdiv((int) $avgMinutes, 60);
								$avgMins = (int) $avgMinutes % 60;

								[$y, $m] = explode('-', $month);
								$monthStart = \Illuminate\Support\Carbon::create($y, $m, 1)->startOfMonth()->format('Y-m-d');
								$monthEnd = \Illuminate\Support\Carbon::create($y, $m, 1)->endOfMonth()->format('Y-m-d');
							@endphp
							<tr>
								<td>{{ $index + 1 }}</td>
								<td>{{ $row->full_name }}</td>
								<td>{{ $row->days_present }}</td>
								<td>{{ $row->total_sessions }}</td>
								<td><strong>{{ $hours }}h {{ $mins }}m</strong></td>
								<td>{{ $avgHours }}h {{ $avgMins }}m</td>
								<td>
									@if ($row->active_sessions > 0)
										<span class="badge badge-soft-success">{{ $row->active_sessions }} active</span>
									@else
										<span class="text-muted">—</span>
									@endif
								</td>
								<td>
									<a href="{{ route('attendance.log', ['user_id' => $row->user_id, 'from' => $monthStart, 'to' => $monthEnd]) }}"
										class="btn btn-sm btn-outline-light">
										<i class="ti ti-list-details"></i> View Sessions
									</a>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="8" class="text-center py-4">No attendance data for this month.</td>
							</tr>
						@endforelse
					</tbody>
					@if ($summary->isNotEmpty())
						<tfoot>
							<tr class="fw-bold table-light">
								<td colspan="2">Total</td>
								<td>{{ $grandTotalDays }}</td>
								<td>{{ $summary->sum('total_sessions') }}</td>
								<td>{{ intdiv($grandTotalMinutes, 60) }}h {{ $grandTotalMinutes % 60 }}m</td>
								<td colspan="3"></td>
							</tr>
						</tfoot>
					@endif
				</table>
			</div>
		</div>
	</div>

@endsection