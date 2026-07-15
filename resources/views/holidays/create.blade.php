@extends('layouts.app')

@section('title', 'Add Holiday')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Add Holiday</h4>
		<a href="{{ route('holidays.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('holidays.store') }}">
				@csrf

				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label">Holiday Name <span class="text-danger">*</span></label>
						<input type="text" name="title" class="form-control @error('title') is-invalid @enderror"
							value="{{ old('title') }}" placeholder="e.g. Independence Day" required>
						@error('title') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<label class="form-label">Date <span class="text-danger">*</span></label>
						<input type="date" name="holiday_date"
							class="form-control @error('holiday_date') is-invalid @enderror"
							value="{{ old('holiday_date') }}" required>
						@error('holiday_date') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<div class="form-check form-switch mt-4">
							<input class="form-check-input" type="checkbox" name="is_optional" value="1" id="is_optional"
								{{ old('is_optional') ? 'checked' : '' }}>
							<label class="form-check-label" for="is_optional">
								Optional / Floating Holiday
							</label>
						</div>
					</div>

					<div class="col-md-12">
						<label class="form-label">Description</label>
						<textarea name="description" rows="3"
							class="form-control @error('description') is-invalid @enderror">{{ old('description') }}</textarea>
						@error('description') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Save Holiday</button>
					<a href="{{ route('holidays.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection