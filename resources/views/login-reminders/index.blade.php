@extends('layouts.app')

@section('title', 'Login Reminder Report')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Login Reminder Report</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Login Reminders</span>
			</nav>
		</div>
		<div class="d-flex gap-2">
			<form method="POST" action="{{ route('login-reminders.run') }}"
				onsubmit="return confirm('Send login reminders now to everyone who has not logged in today?');">
				@csrf
				<button type="submit" class="btn btn-outline-primary">
					<i class="ti ti-bell me-1"></i> Run reminders now
				</button>
			</form>
			<form method="POST" action="{{ route('login-reminders.escalate') }}"
				onsubmit="return confirm('Send the escalation report to admins now?');">
				@csrf
				<button type="submit" class="btn btn-primary">
					<i class="ti ti-alert-triangle me-1"></i> Escalate to admins
				</button>
			</form>
		</div>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif

	<!-- Stat Cards -->
	<div class="row mb-3">
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Not Logged In</p>
				<h4 class="mb-0">{{ $stats['missing'] }}</h4>
				<span class="avatar avatar-rounded bg-danger-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-user-off text-danger"></i></span>
			</div></div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Email Reminders</p>
				<h4 class="mb-0">{{ $stats['emails'] }}</h4>
				<span class="avatar avatar-rounded bg-primary-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-mail text-primary"></i></span>
			</div></div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">WhatsApp Sent</p>
				<h4 class="mb-0">{{ $stats['whatsapps'] }}</h4>
				<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-brand-whatsapp text-success"></i></span>
			</div></div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Escalated</p>
				<h4 class="mb-0">{{ $stats['escalated'] }}</h4>
				<span class="avatar avatar-rounded bg-warning-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-alert-triangle text-warning"></i></span>
			</div></div>
		</div>
	</div>

	<!-- Date filter -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('login-reminders.index') }}" class="row g-3 align-items-end">
				<div class="col-md-4">
					<label class="form-label">Report date</label>
					<input type="date" name="date" class="form-control" value="{{ $date->toDateString() }}"
						max="{{ now()->timezone(config('app.timezone'))->toDateString() }}">
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary"><i class="ti ti-filter me-1"></i> View</button>
					<a href="{{ route('login-reminders.index') }}" class="btn btn-outline-light">Today</a>
				</div>
			</form>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Employee</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Email Reminders</th>
							<th>WhatsApp</th>
							<th>Last Reminded</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($rows as $row)
							<tr>
								<td>{{ $row['user']->full_name ?? ($row['user']->first_name.' '.$row['user']->last_name) }}</td>
								<td>{{ $row['user']->email }}</td>
								<td>{{ $row['user']->whatsapp_number ?: ($row['user']->phone ?: '—') }}</td>
								<td><span class="badge badge-soft-primary">{{ $row['email_count'] }}</span></td>
								<td><span class="badge badge-soft-success">{{ $row['wa_count'] }}</span></td>
								<td>{{ $row['last'] ? \Illuminate\Support\Carbon::parse($row['last'])->format('d M, h:i A') : '—' }}</td>
								<td>
									@if ($row['logged_in'])
										<span class="badge badge-soft-success">Logged in later</span>
									@elseif ($row['escalated'])
										<span class="badge badge-soft-danger">Escalated</span>
									@else
										<span class="badge badge-soft-warning">Not logged in</span>
									@endif
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="7" class="text-center py-4">Everyone logged in on {{ $date->format('d M Y') }}. 🎉</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>
		</div>
	</div>

@endsection
