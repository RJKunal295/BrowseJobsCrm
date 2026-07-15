@extends('layouts.app')

@section('title', 'Connect YouTube Channel')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Connect YouTube Channel</h4>
		<a href="{{ route('social-accounts.youtube.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<div class="alert alert-warning">
		<i class="ti ti-shield-lock me-1"></i>
		Generate an API key from
		<a href="https://console.cloud.google.com/apis/credentials" target="_blank">Google Cloud Console</a>
		(enable the "YouTube Data API v3" first). It will be encrypted before being stored — never share it anywhere else.
	</div>

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('social-accounts.youtube.store') }}">
				@csrf

				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label">Label <span class="text-danger">*</span></label>
						<input type="text" name="label" class="form-control @error('label') is-invalid @enderror"
							value="{{ old('label') }}" placeholder="e.g. Browsejobs YouTube" required>
						@error('label') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-6">
						<label class="form-label">Channel ID or @Handle <span class="text-danger">*</span></label>
						<input type="text" name="channel_id_or_handle"
							class="form-control @error('channel_id_or_handle') is-invalid @enderror"
							value="{{ old('channel_id_or_handle') }}" placeholder="e.g. @browsejobs or UCxxxxxxxx" required>
						<small class="text-muted">Find this in your channel's "About" page, or use the @handle shown in the URL.</small>
						@error('channel_id_or_handle') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-12">
						<label class="form-label">API Key <span class="text-danger">*</span></label>
						<textarea name="api_key" rows="2"
							class="form-control @error('api_key') is-invalid @enderror"
							placeholder="AIza..." required>{{ old('api_key') }}</textarea>
						@error('api_key') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Connect Channel</button>
					<a href="{{ route('social-accounts.youtube.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection