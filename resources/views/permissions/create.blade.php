@extends('layouts.app')

@section('title', 'New Permission')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">New Permission</h4>
		<a href="{{ route('permissions.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('permissions.store') }}">
				@csrf

				<div class="row g-3">
					<div class="col-md-4">
						<label class="form-label">Name <span class="text-danger">*</span></label>
						<input type="text" name="name" class="form-control @error('name') is-invalid @enderror"
							value="{{ old('name') }}" placeholder="e.g. View Invoices" required>
						@error('name') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Slug <span class="text-danger">*</span></label>
						<input type="text" name="slug" class="form-control @error('slug') is-invalid @enderror"
							value="{{ old('slug') }}" placeholder="e.g. view_invoices" required>
						<small class="text-muted">Lowercase, numbers, underscores only — this is what you check in code.</small>
						@error('slug') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Module</label>
						<input type="text" name="module" class="form-control @error('module') is-invalid @enderror"
							value="{{ old('module') }}" placeholder="e.g. Billing">
						<small class="text-muted">Used to group permissions in the matrix view.</small>
						@error('module') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Save Permission</button>
					<a href="{{ route('permissions.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection