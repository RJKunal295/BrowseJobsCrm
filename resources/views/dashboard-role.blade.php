@extends('layouts.app')

@section('title', 'Dashboard')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Hi {{ $user->first_name ?: $user->full_name }} 👋</h4>
			<nav class="fs-13 text-muted">
				<span class="badge badge-soft-primary">{{ $roleName }}</span>
				<span class="ms-2">
					@if ($loggedInToday)
						<i class="ti ti-circle-check text-success"></i> Marked present today
					@else
						<i class="ti ti-alert-circle text-danger"></i> You haven't logged in today
					@endif
				</span>
			</nav>
		</div>
	</div>

	<!-- Stat cards -->
	<div class="row mb-3">
		@foreach ($cards as $card)
			<div class="col-md-3 col-sm-6 mb-3">
				<a href="{{ $card['url'] }}" class="text-decoration-none">
					<div class="card h-100">
						<div class="card-body position-relative">
							<p class="fw-medium mb-1 text-body">{{ $card['label'] }}</p>
							<h4 class="mb-0 text-{{ $card['color'] }}">
								{{ is_numeric($card['value']) ? number_format($card['value']) : $card['value'] }}
							</h4>
							<span class="avatar avatar-rounded bg-{{ $card['color'] }}-transparent position-absolute top-0 end-0 m-3">
								<i class="ti {{ $card['icon'] }} text-{{ $card['color'] }}"></i>
							</span>
						</div>
					</div>
				</a>
			</div>
		@endforeach
	</div>

	<div class="row">
		<!-- My leads -->
		<div class="col-lg-8 mb-3">
			<div class="card h-100">
				<div class="card-header d-flex align-items-center justify-content-between">
					<h6 class="mb-0">My Assigned Leads</h6>
					<a href="{{ route('leads.index', ['assignment' => 'mine']) }}" class="btn btn-sm btn-outline-light">View all</a>
				</div>
				<div class="card-body">
					<div class="table-responsive custom-table">
						<table class="table table-bordered table-nowrap">
							<thead class="table-white">
								<tr><th>Lead</th><th>Mobile</th><th>Status</th><th>Action</th></tr>
							</thead>
							<tbody>
								@forelse ($myLeads as $lead)
									<tr>
										<td>{{ $lead->name ?: '(no name)' }}</td>
										<td>{{ $lead->mobile }}</td>
										<td>
											@if ($lead->status)
												<span class="badge" style="background: {{ $lead->status->color ?: '#6c757d' }};color:#fff;">{{ $lead->status->name }}</span>
											@else — @endif
										</td>
										<td><a href="{{ route('leads.show', $lead) }}" class="btn btn-sm btn-icon btn-outline-light"><i class="ti ti-eye"></i></a></td>
									</tr>
								@empty
									<tr><td colspan="4" class="text-center py-4 text-muted">No leads assigned to you yet.</td></tr>
								@endforelse
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<!-- Quick links -->
		<div class="col-lg-4 mb-3">
			<div class="card h-100">
				<div class="card-header"><h6 class="mb-0">Quick links</h6></div>
				<div class="card-body">
					<div class="d-grid gap-2">
						<a href="{{ route('todos.index') }}" class="btn btn-outline-primary btn-sm"><i class="ti ti-checklist me-1"></i> My To-Do</a>
						<a href="{{ route('notes.index') }}" class="btn btn-outline-primary btn-sm"><i class="ti ti-notes me-1"></i> Notes</a>
						<a href="{{ route('emails.inbox') }}" class="btn btn-outline-primary btn-sm"><i class="ti ti-mail me-1"></i> Email</a>
						<a href="{{ route('attendance.index') }}" class="btn btn-outline-primary btn-sm"><i class="ti ti-clock me-1"></i> Attendance</a>
						<a href="{{ route('leave-requests.index') }}" class="btn btn-outline-primary btn-sm"><i class="ti ti-calendar me-1"></i> Leave Requests</a>
					</div>
				</div>
			</div>
		</div>
	</div>

@endsection
