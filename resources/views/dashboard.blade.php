@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')

	<!-- Page Header -->
	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Dashboard</h4>
			<p class="mb-0 text-muted fs-13">{{ now()->format('l, d M Y') }}</p>
		</div>
	</div>
	<!-- End Page Header -->

	<!-- Birthday Celebration Banner -->
	@if ($birthdaysToday->isNotEmpty())
		<div class="card mb-4 border-0 overflow-hidden position-relative"
			style="background: linear-gradient(120deg,#ff9a9e 0%,#fecfef 50%,#fecfef 100%);">
			<div class="card-body py-4 px-4 position-relative" style="z-index:2;">
				<div class="d-flex align-items-center flex-wrap gap-4">
					<div class="d-flex" style="margin-right: -12px;">
						@foreach ($birthdaysToday as $person)
							<div style="margin-right:-12px;">
								@if ($person->profile_photo)
									<img src="{{ Storage::url($person->profile_photo) }}"
										class="rounded-circle border border-3 border-white"
										width="64" height="64" style="object-fit:cover;">
								@else
									<span class="avatar avatar-xl rounded-circle border border-3 border-white d-inline-flex align-items-center justify-content-center text-white fw-bold fs-24"
										style="width:64px;height:64px;background: linear-gradient(135deg,#ee0979,#ff6a00);">
										{{ strtoupper(substr($person->full_name ?? '?', 0, 1)) }}
									</span>
								@endif
							</div>
						@endforeach
					</div>

					<div class="flex-grow-1">
						<h4 class="mb-1 text-dark">
							🎉🎂 Happy Birthday, {{ $birthdaysToday->pluck('full_name')->implode(' & ') }}!
						</h4>
						<p class="mb-0 fst-italic text-dark opacity-75">
							"{{ $birthdayQuote }}"
						</p>
					</div>

					<div class="d-none d-md-block fs-48">
						🎈
					</div>
				</div>
			</div>

			<!-- decorative confetti dots -->
			<div class="position-absolute top-0 start-0 w-100 h-100" style="z-index:1; opacity:0.5; pointer-events:none;">
				<span class="position-absolute" style="top:10px; left:5%; font-size:20px;">🎊</span>
				<span class="position-absolute" style="top:60%; left:15%; font-size:16px;">✨</span>
				<span class="position-absolute" style="top:20%; right:10%; font-size:22px;">🎊</span>
				<span class="position-absolute" style="bottom:10px; right:20%; font-size:18px;">✨</span>
			</div>
		</div>
	@endif
	<!-- End Birthday Celebration Banner -->

	<!-- Summary Cards -->
	<div class="row mb-3">
		<div class="col-xl-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Active Employees</p>
					<h3 class="mb-0">{{ $totalEmployees }}</h3>
					<div class="position-absolute top-0 end-0 m-3">
						<span class="avatar avatar-rounded" style="background: linear-gradient(135deg,#4facfe,#00f2fe);">
							<i class="ti ti-users text-white fs-20"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">On Leave Today</p>
					<h3 class="mb-0">{{ $onLeaveTodayCount }}</h3>
					<div class="position-absolute top-0 end-0 m-3">
						<span class="avatar avatar-rounded" style="background: linear-gradient(135deg,#f6d365,#fda085);">
							<i class="ti ti-beach text-white fs-20"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Pending Leave Requests</p>
					<h3 class="mb-0">{{ $pendingLeaveRequests }}</h3>
					<a href="{{ route('leave-requests.index') }}" class="fs-12">View all →</a>
					<div class="position-absolute top-0 end-0 m-3">
						<span class="avatar avatar-rounded" style="background: linear-gradient(135deg,#a18cd1,#fbc2eb);">
							<i class="ti ti-calendar-event text-white fs-20"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Overdue Tasks</p>
					<h3 class="mb-0">{{ $overdueTaskCount }}</h3>
					<a href="{{ route('tasks.index') }}" class="fs-12">View all →</a>
					<div class="position-absolute top-0 end-0 m-3">
						<span class="avatar avatar-rounded" style="background: linear-gradient(135deg,#ff9a9e,#fecfef);">
							<i class="ti ti-alert-triangle text-white fs-20"></i>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Summary Cards -->

	<!-- Charts Row -->
	<div class="row mb-3">
		<div class="col-xl-8 mb-3">
			<div class="card h-100">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<h5 class="mb-0 fs-16 fw-bold d-inline-flex align-items-center">
							<span class="line-title d-inline-block me-2" style="width:4px;height:16px;background:#e63946;border-radius:2px;"></span>
							Attendance Trend
						</h5>
						<span class="badge badge-soft-secondary">Demo data — connect attendance later</span>
					</div>
					<canvas id="attendanceChart" height="90"></canvas>
				</div>
			</div>
		</div>
		<div class="col-xl-4 mb-3">
			<div class="card h-100">
				<div class="card-body">
					<div class="d-flex align-items-center justify-content-between mb-3">
						<h5 class="mb-0 fs-16 fw-bold d-inline-flex align-items-center">
							<span class="line-title d-inline-block me-2" style="width:4px;height:16px;background:#e63946;border-radius:2px;"></span>
							Leave Types
						</h5>
					</div>
					<canvas id="leaveTypeChart" height="180"></canvas>
				</div>
			</div>
		</div>
	</div>
	<!-- End Charts Row -->

	<div class="row">

		<!-- On Leave Today -->
		<div class="col-xl-4 mb-3">
			<div class="card h-100">
				<div class="card-header">
					<h5 class="mb-0 fs-16 fw-bold d-inline-flex align-items-center">
						<span class="line-title d-inline-block me-2" style="width:4px;height:16px;background:#f6c23e;border-radius:2px;"></span>
						On Leave Today
					</h5>
				</div>
				<div class="card-body">
					@forelse ($onLeaveToday as $leave)
						<div class="d-flex align-items-center gap-2 mb-3 pb-3 border-bottom">
							@if ($leave->user->profile_photo)
								<img src="{{ Storage::url($leave->user->profile_photo) }}" class="rounded-circle" width="40" height="40" style="object-fit:cover;">
							@else
								<span class="avatar avatar-rounded" style="background: linear-gradient(135deg,#f6d365,#fda085);">
									{{ strtoupper(substr($leave->user->full_name ?? '?', 0, 1)) }}
								</span>
							@endif
							<div>
								<p class="mb-0 fw-medium">{{ $leave->user->full_name }}</p>
								<p class="mb-0 fs-12 text-muted">
									{{ $leave->leaveType->name }} · back {{ \Carbon\Carbon::parse($leave->to_date)->addDay()->format('d M') }}
								</p>
							</div>
						</div>
					@empty
						<p class="text-center text-muted py-3 mb-0">Everyone's in today 🎉</p>
					@endforelse
				</div>
			</div>
		</div>
		<!-- End On Leave Today -->

		<!-- Birthdays -->
		<div class="col-xl-4 mb-3">
			<div class="card h-100">
				<div class="card-header">
					<h5 class="mb-0 fs-16 fw-bold d-inline-flex align-items-center">
						<span class="line-title d-inline-block me-2" style="width:4px;height:16px;background:#e83e8c;border-radius:2px;"></span>
						Upcoming Birthdays
					</h5>
				</div>
				<div class="card-body">
					@forelse ($birthdaysUpcoming as $user)
						<div class="d-flex align-items-center gap-2 mb-3 pb-3 border-bottom">
							@if ($user->profile_photo)
								<img src="{{ Storage::url($user->profile_photo) }}" class="rounded-circle" width="40" height="40" style="object-fit:cover;">
							@else
								<span class="avatar avatar-rounded" style="background: linear-gradient(135deg,#ff6a88,#ff99ac);">
									{{ strtoupper(substr($user->full_name ?? '?', 0, 1)) }}
								</span>
							@endif
							<div>
								<p class="mb-0 fw-medium">{{ $user->full_name }}</p>
								<p class="mb-0 fs-12 text-muted">
									@if ($user->days_until_birthday == 0)
										🎉 Today!
									@elseif ($user->days_until_birthday == 1)
										Tomorrow
									@else
										{{ $user->next_birthday->format('d M') }} ({{ $user->days_until_birthday }} days)
									@endif
								</p>
							</div>
						</div>
					@empty
						<p class="text-center text-muted py-3 mb-0">No birthdays in the next 7 days.</p>
					@endforelse
				</div>
			</div>
		</div>
		<!-- End Birthdays -->

		<!-- Overdue / Due Today Tasks -->
		<div class="col-xl-4 mb-3">
			<div class="card h-100">
				<div class="card-header">
					<h5 class="mb-0 fs-16 fw-bold d-inline-flex align-items-center">
						<span class="line-title d-inline-block me-2" style="width:4px;height:16px;background:#dc3545;border-radius:2px;"></span>
						Overdue Tasks
					</h5>
				</div>
				<div class="card-body">
					@forelse ($overdueTasks as $task)
						<div class="mb-3 pb-3 border-bottom">
							<div class="d-flex justify-content-between align-items-start">
								<p class="mb-1 fw-medium">{{ $task->title }}</p>
								<span class="badge badge-soft-danger fs-11">
									{{ $task->days_overdue }}d overdue
								</span>
							</div>
							<p class="mb-0 fs-12 text-muted">
								Waiting on: {{ $task->assignees->pluck('full_name')->implode(', ') }}
							</p>
						</div>
					@empty
						<p class="text-center text-muted py-3 mb-0">No overdue tasks 👍</p>
					@endforelse

					@if ($dueTodayTasks->isNotEmpty())
						<p class="fw-medium fs-13 text-muted mt-2 mb-2">Due Today</p>
						@foreach ($dueTodayTasks as $task)
							<div class="mb-2">
								<p class="mb-0 fw-medium fs-14">{{ $task->title }}</p>
								<p class="mb-0 fs-12 text-muted">{{ $task->assignees->pluck('full_name')->implode(', ') }}</p>
							</div>
						@endforeach
					@endif
				</div>
			</div>
		</div>
		<!-- End Overdue Tasks -->

	</div>

@endsection

@push('scripts')
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
	<script>
		new Chart(document.getElementById('attendanceChart'), {
			type: 'line',
			data: {
				labels: @json($attendanceTrend['labels']),
				datasets: [{
					label: 'Present',
					data: @json($attendanceTrend['data']),
					borderColor: '#e63946',
					backgroundColor: 'rgba(230,57,70,0.08)',
					fill: true,
					tension: 0.35,
					pointRadius: 3,
				}],
			},
			options: {
				responsive: true,
				plugins: { legend: { display: false } },
				scales: { y: { beginAtZero: true } },
			},
		});

		new Chart(document.getElementById('leaveTypeChart'), {
			type: 'doughnut',
			data: {
				labels: @json($leaveTypeBreakdown['labels']),
				datasets: [{
					data: @json($leaveTypeBreakdown['data']),
					backgroundColor: ['#4facfe', '#f6d365', '#a18cd1', '#ff9a9e', '#84fab0'],
					borderWidth: 0,
				}],
			},
			options: {
				responsive: true,
				plugins: { legend: { position: 'bottom', labels: { boxWidth: 10, font: { size: 11 } } } },
			},
		});
	</script>
@endpush