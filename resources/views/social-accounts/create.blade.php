@extends('layouts.app')

@section('title', 'Connect Social Account')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Connect Instagram Account</h4>
		<a href="{{ route('social-accounts.instagram.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<div class="alert alert-warning">
		<i class="ti ti-shield-lock me-1"></i>
		Paste a fresh long-lived access token generated directly from
		<a href="https://developers.facebook.com/apps" target="_blank">Meta for Developers</a>.
		It will be encrypted before being stored — never share this token anywhere else, including chat, email, or screenshots.
	</div>

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('social-accounts.instagram.store') }}">
				@csrf

				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label">Label <span class="text-danger">*</span></label>
						<input type="text" name="label" class="form-control @error('label') is-invalid @enderror"
							value="{{ old('label') }}" placeholder="e.g. Browsejobs Instagram" required>
						@error('label') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-12">
						<label class="form-label">Long-Lived Access Token <span class="text-danger">*</span></label>
						<textarea name="access_token" rows="3"
							class="form-control @error('access_token') is-invalid @enderror"
							placeholder="Paste token here" required>{{ old('access_token') }}</textarea>
						<small class="text-muted">
							The system will automatically detect which Instagram Business Account this token has access to.
						</small>
						@error('access_token') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Connect Account</button>
					<a href="{{ route('social-accounts.instagram.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection