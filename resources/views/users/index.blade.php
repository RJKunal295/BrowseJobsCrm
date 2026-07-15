@extends('layouts.app')

@section('title', 'Manage Users')

@section('content')

	<!-- Page Header -->
	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Manage Users</h4>
		</div>
		<a href="{{ route('users.create') }}" class="btn btn-primary d-inline-flex align-items-center">
			<i class="ti ti-plus me-1"></i> Add New User
		</a>
	</div>
	<!-- End Page Header -->

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	<!-- Filters -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('users.index') }}" class="row g-3 align-items-end">
				<div class="col-md-3">
					<label class="form-label">Mobile Number</label>
					<input type="text" name="mobile" class="form-control" placeholder="Search by mobile"
						value="{{ request('mobile') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Email</label>
					<input type="text" name="email" class="form-control" placeholder="Search by email"
						value="{{ request('email') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Name</label>
					<input type="text" name="name" class="form-control" placeholder="Search by name"
						value="{{ request('name') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Role</label>
					<select name="role_id" class="form-select">
						<option value="">All Roles</option>
						@foreach ($roles as $role)
							<option value="{{ $role->id }}" @selected(request('role_id') == $role->id)>
								{{ $role->role_name }}
							</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-3">
					<label class="form-label">Status</label>
					<select name="status" class="form-select">
						<option value="">All Status</option>
						<option value="active" @selected(request('status') === 'active')>Active</option>
						<option value="inactive" @selected(request('status') === 'inactive')>Inactive</option>
					</select>
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary">
						<i class="ti ti-filter me-1"></i> Filter
					</button>
					<a href="{{ route('users.index') }}" class="btn btn-outline-light">Reset</a>
				</div>
			</form>
		</div>
	</div>
	<!-- End Filters -->

	<!-- Users Table -->
	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Employee ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Mobile</th>
							<th>Role</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($users as $user)
							<tr>
								<td>{{ $user->employee_id ?? '—' }}</td>
								<td>{{ $user->full_name ?? trim($user->first_name . ' ' . $user->last_name) }}</td>
								<td>{{ $user->email }}</td>
								<td>{{ $user->phone ?? '—' }}</td>
								<td>
									@php
										$role = $roles->firstWhere('id', $user->role_id);
									@endphp
									{{ $role->role_name ?? '—' }}
								</td>
								<td>
									@if ($user->is_active)
										<span class="badge badge-soft-success">Active</span>
									@else
										<span class="badge badge-soft-danger">Inactive</span>
									@endif
								</td>
								<td>
									<div class="d-flex align-items-center gap-2">
										<a href="{{ route('users.show', $user->id) }}"
											class="btn btn-sm btn-icon btn-outline-light" data-bs-toggle="tooltip"
											title="View">
											<i class="ti ti-eye"></i>
										</a>

										<a href="{{ route('users.edit', $user->id) }}"
											class="btn btn-sm btn-icon btn-outline-light" data-bs-toggle="tooltip"
											title="Edit">
											<i class="ti ti-edit"></i>
										</a>

										<form method="POST" action="{{ route('users.toggle-status', $user->id) }}">
											@csrf
											@method('PATCH')
											<button type="submit"
												class="btn btn-sm {{ $user->is_active ? 'btn-outline-danger' : 'btn-outline-success' }}"
												data-bs-toggle="tooltip"
												title="{{ $user->is_active ? 'Deactivate' : 'Activate' }}">
												<i class="ti {{ $user->is_active ? 'ti-lock' : 'ti-lock-open' }}"></i>
												{{ $user->is_active ? 'Deactivate' : 'Activate' }}
											</button>
										</form>
									</div>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="7" class="text-center py-4">No users found.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $users->links() }}
			</div>
		</div>
	</div>
	<!-- End Users Table -->

@endsection