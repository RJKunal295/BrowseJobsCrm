@extends('layouts.app')

@section('title', 'Permissions')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Permissions</h4>
		<div class="d-flex gap-2">
			<a href="{{ route('roles-permissions.index') }}" class="btn btn-outline-light">
				<i class="ti ti-arrow-left me-1"></i> Back to Roles & Permissions
			</a>
			<a href="{{ route('permissions.create') }}" class="btn btn-primary">
				<i class="ti ti-plus me-1"></i> New Permission
			</a>
		</div>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Name</th>
							<th>Slug</th>
							<th>Module</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($permissions as $permission)
							<tr>
								<td>{{ $permission->name }}</td>
								<td><code>{{ $permission->slug }}</code></td>
								<td>{{ $permission->module ?? '—' }}</td>
								<td>
									<form method="POST" action="{{ route('permissions.destroy', $permission->id) }}"
										onsubmit="return confirm('Delete this permission? Any menu items or role assignments using it will lose that link.');">
										@csrf
										@method('DELETE')
										<button type="submit" class="btn btn-sm btn-outline-danger">
											<i class="ti ti-trash"></i>
										</button>
									</form>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="4" class="text-center py-4">No permissions yet.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $permissions->links() }}
			</div>
		</div>
	</div>

@endsection