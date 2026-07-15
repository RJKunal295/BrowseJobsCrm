@extends('layouts.app')

@section('title', 'New Leave Type')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">New Leave Type</h4>
		<a href="{{ route('leave-types.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('leave-types.store') }}">
				@csrf

				<div class="row g-3">
					<div class="col-md-4">
						<label class="form-label">Name <span class="text-danger">*</span></label>
						<input type="text" name="name" class="form-control @error('name') is-invalid @enderror"
							value="{{ old('name') }}" placeholder="e.g. Bereavement Leave" required>
						@error('name') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Code <span class="text-danger">*</span></label>
						<input type="text" name="code" class="form-control @error('code') is-invalid @enderror"
							value="{{ old('code') }}" placeholder="e.g. bereavement" required>
						<small class="text-muted">Lowercase, numbers, underscores only.</small>
						@error('code') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Default Days / Year <span class="text-danger">*</span></label>
						<input type="number" name="default_days_per_year" min="0"
							class="form-control @error('default_days_per_year') is-invalid @enderror"
							value="{{ old('default_days_per_year', 0) }}" required>
						@error('default_days_per_year') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4 d-flex align-items-end">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox" name="is_active" value="1" id="is_active"
								{{ old('is_active', true) ? 'checked' : '' }}>
							<label class="form-check-label" for="is_active">Active</label>
						</div>
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Save Leave Type</button>
					<a href="{{ route('leave-types.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection