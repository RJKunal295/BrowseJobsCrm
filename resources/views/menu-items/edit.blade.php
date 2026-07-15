@extends('layouts.app')

@section('title', 'Edit Menu Item')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Edit Menu Item</h4>
		<a href="{{ route('menu-items.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('menu-items.update', $menuItem->id) }}">
				@csrf
				@method('PUT')

				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label">Title <span class="text-danger">*</span></label>
						<input type="text" name="title" class="form-control @error('title') is-invalid @enderror"
							value="{{ old('title', $menuItem->title) }}" required>
						@error('title') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<label class="form-label">Icon (Tabler icon class)</label>
						<input type="text" name="icon" class="form-control @error('icon') is-invalid @enderror"
							value="{{ old('icon', $menuItem->icon) }}">
						@error('icon') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<label class="form-label">URL</label>
						<input type="text" name="url" class="form-control @error('url') is-invalid @enderror"
							value="{{ old('url', $menuItem->url) }}">
						@error('url') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<label class="form-label">Section / Group Header</label>
						<input type="text" name="menu_group" class="form-control @error('menu_group') is-invalid @enderror"
							value="{{ old('menu_group', $menuItem->menu_group) }}">
						@error('menu_group') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<label class="form-label">Parent Menu Item</label>
						<select name="parent_id" class="form-select @error('parent_id') is-invalid @enderror">
							<option value="">None (top-level item)</option>
							@foreach ($parents as $parent)
								<option value="{{ $parent->id }}" @selected(old('parent_id', $menuItem->parent_id) == $parent->id)>
									{{ $parent->title }}
								</option>
							@endforeach
						</select>
						@error('parent_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<label class="form-label">Required Permission</label>
						<select name="permission_id" class="form-select @error('permission_id') is-invalid @enderror">
							<option value="">None (visible to any logged-in user)</option>
							@foreach ($permissions as $permission)
								<option value="{{ $permission->id }}"
									@selected(old('permission_id', $menuItem->permission_id) == $permission->id)>
									{{ $permission->name }} ({{ $permission->slug }})
								</option>
							@endforeach
						</select>
						@error('permission_id') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<label class="form-label">Sort Order</label>
						<input type="number" name="sort_order"
							class="form-control @error('sort_order') is-invalid @enderror"
							value="{{ old('sort_order', $menuItem->sort_order) }}" min="0">
						@error('sort_order') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6 d-flex align-items-end">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox" name="is_active" value="1" id="is_active"
								{{ old('is_active', $menuItem->is_active) ? 'checked' : '' }}>
							<label class="form-check-label" for="is_active">Active (visible in sidebar)</label>
						</div>
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Update Menu Item</button>
					<a href="{{ route('menu-items.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection