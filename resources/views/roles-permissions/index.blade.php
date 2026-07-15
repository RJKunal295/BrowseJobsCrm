@extends('layouts.app')

@section('title', 'Roles & Permissions')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Roles & Permissions</h4>
		<a href="{{ route('permissions.create') }}" class="btn btn-outline-primary">
			<i class="ti ti-plus me-1"></i> New Permission
		</a>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	<form method="POST" action="{{ route('roles-permissions.update') }}">
		@csrf

		<div class="card">
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered">
						<thead class="table-white">
							<tr>
								<th style="min-width:200px;">Permission</th>
								@foreach ($roles as $role)
									<th class="text-center">{{ $role->role_name }}</th>
								@endforeach
							</tr>
						</thead>
						<tbody>
							@php $currentModule = null; @endphp
							@foreach ($permissions as $permission)
								@if ($permission->module !== $currentModule)
									@php $currentModule = $permission->module; @endphp
									<tr class="table-light">
										<td colspan="{{ $roles->count() + 1 }}" class="fw-bold">
											{{ $currentModule ?? 'General' }}
										</td>
									</tr>
								@endif
								<tr>
									<td>{{ $permission->name }}
										<div class="fs-12 text-muted">{{ $permission->slug }}</div>
									</td>
									@foreach ($roles as $role)
										<td class="text-center">
											<input type="checkbox"
												class="form-check-input"
												name="permissions[{{ $role->id }}][]"
												value="{{ $permission->id }}"
												@checked(in_array($permission->id, $assigned[$role->id] ?? []))>
										</td>
									@endforeach
								</tr>
							@endforeach
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="mt-3">
			<button type="submit" class="btn btn-primary">
				<i class="ti ti-device-floppy me-1"></i> Save Permissions
			</button>
		</div>
	</form>

@endsection