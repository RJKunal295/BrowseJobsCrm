@extends('layouts.app')

@section('title', 'Menu Items')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Menu Items</h4>
		<a href="{{ route('menu-items.create') }}" class="btn btn-primary">
			<i class="ti ti-plus me-1"></i> New Menu Item
		</a>
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
							<th>Title</th>
							<th>Group</th>
							<th>Parent</th>
							<th>URL</th>
							<th>Required Permission</th>
							<th>Order</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($menuItems as $item)
							<tr>
								<td>
									@if ($item->icon)<i class="{{ $item->icon }} me-1"></i>@endif
									{{ $item->title }}
								</td>
								<td>{{ $item->menu_group ?? '—' }}</td>
								<td>{{ $item->parent->title ?? '—' }}</td>
								<td>{{ $item->url ?? '—' }}</td>
								<td>
									@if ($item->permission)
										<code>{{ $item->permission->slug }}</code>
									@else
										<span class="text-muted">Public (no permission)</span>
									@endif
								</td>
								<td>{{ $item->sort_order }}</td>
								<td>
									@if ($item->is_active)
										<span class="badge badge-soft-success">Active</span>
									@else
										<span class="badge badge-soft-danger">Inactive</span>
									@endif
								</td>
								<td>
									<div class="d-flex gap-2">
										<a href="{{ route('menu-items.edit', $item->id) }}"
											class="btn btn-sm btn-icon btn-outline-light">
											<i class="ti ti-edit"></i>
										</a>
										<form method="POST" action="{{ route('menu-items.destroy', $item->id) }}"
											onsubmit="return confirm('Delete this menu item? Its children (if any) will also be removed.');">
											@csrf
											@method('DELETE')
											<button type="submit" class="btn btn-sm btn-icon btn-outline-danger">
												<i class="ti ti-trash"></i>
											</button>
										</form>
									</div>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="8" class="text-center py-4">No menu items yet.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $menuItems->links() }}
			</div>
		</div>
	</div>

@endsection