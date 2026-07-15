@extends('layouts.app')

@section('title', 'Leave Types')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Leave Types</h4>
		<a href="{{ route('leave-types.create') }}" class="btn btn-primary">
			<i class="ti ti-plus me-1"></i> New Leave Type
		</a>
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

	<div class="card">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Name</th>
							<th>Code</th>
							<th>Default Days / Year</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($leaveTypes as $type)
							<tr>
								<td>{{ $type->name }}</td>
								<td><code>{{ $type->code }}</code></td>
								<td>{{ $type->default_days_per_year }}</td>
								<td>
									@if ($type->is_active)
										<span class="badge badge-soft-success">Active</span>
									@else
										<span class="badge badge-soft-danger">Inactive</span>
									@endif
								</td>
								<td>
									<form method="POST" action="{{ route('leave-types.destroy', $type->id) }}"
										onsubmit="return confirm('Delete this leave type?');">
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
								<td colspan="5" class="text-center py-4">No leave types yet.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $leaveTypes->links() }}
			</div>
		</div>
	</div>

@endsection