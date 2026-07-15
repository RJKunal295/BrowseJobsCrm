@extends('layouts.app')

@section('title', 'Students')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Students</h4>
	</div>

	<!-- Stat Cards -->
	<div class="row mb-3">
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Total Students</p>
					<h4 class="mb-0">{{ number_format($totalStudents) }}</h4>
					<span class="avatar avatar-rounded bg-info-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-users text-info"></i>
					</span>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Active Students</p>
					<h4 class="mb-0">{{ number_format($activeStudents) }}</h4>
					<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-user-check text-success"></i>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- End Stat Cards -->

	<!-- Filters -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('students.index') }}" class="row g-3 align-items-end">
				<div class="col-md-5">
					<label class="form-label">Search</label>
					<input type="text" name="search" class="form-control" placeholder="Search by name, email, or phone..."
						value="{{ request('search') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Status</label>
					<select name="status" class="form-select">
						<option value="">All status</option>
						@foreach ($statuses as $s)
							<option value="{{ $s }}" @selected(request('status') === $s)>{{ ucfirst($s) }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary"><i class="ti ti-filter me-1"></i> Filter</button>
					<a href="{{ route('students.index') }}" class="btn btn-outline-light">Reset</a>
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
							<th>Name</th>
							<th>Email</th>
							<th>Phone</th>
							<th>Status</th>
							<th>Joined</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($students as $student)
							@php
								$statusColors = [
									'active' => 'badge-soft-success',
									'inactive' => 'badge-soft-secondary',
									'pending' => 'badge-soft-warning',
								];
							@endphp
							<tr>
								<td>
									<div class="d-flex align-items-center gap-2">
										<span class="avatar avatar-rounded bg-light text-dark">
											{{ strtoupper(substr($student->full_name ?? $student->first_name ?? '?', 0, 1)) }}
										</span>
										{{ $student->full_name ?? trim(($student->first_name ?? '') . ' ' . ($student->last_name ?? '')) }}
									</div>
								</td>
								<td>{{ $student->email ?? '—' }}</td>
								<td>{{ $student->phone_number ?? '—' }}</td>
								<td>
									<span class="badge {{ $statusColors[$student->status] ?? 'badge-soft-secondary' }}">
										{{ ucfirst($student->status ?? 'unknown') }}
									</span>
								</td>
								<td>{{ $student->created_at?->format('d M Y') ?? '—' }}</td>
								<td>
									<a href="{{ route('students.show', $student->id) }}" class="btn btn-sm btn-outline-light">
										<i class="ti ti-eye"></i> View
									</a>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="6" class="text-center py-4">
									No students found. Run <code>php artisan students:sync-taurus</code> to pull data in.
								</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $students->links() }}
			</div>
		</div>
	</div>

@endsection