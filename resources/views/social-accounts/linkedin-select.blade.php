@extends('layouts.app')

@section('title', 'Choose LinkedIn Page')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0"><i class="ti ti-brand-linkedin me-1"></i> Choose a LinkedIn Page</h4>
		<a href="{{ route('social-accounts.linkedin.index') }}" class="btn btn-outline-light"><i class="ti ti-arrow-left me-1"></i> Cancel</a>
	</div>

	@if ($orgError)
		<div class="alert alert-warning">
			<i class="ti ti-alert-triangle me-1"></i>
			Could not list the Pages you administer: {{ $orgError }}
			<hr>
			This usually means the <strong>Community Management API</strong> product is not yet approved on the app, or
			you are not an admin of any Page. You can still connect a Page manually if you know its Organisation URN.
		</div>
	@endif

	<div class="card">
		<div class="card-body">
			@if (! empty($organizations))
				<p class="text-muted">You are an administrator of these Pages. Pick the one to connect:</p>
				<div class="list-group mb-3">
					@foreach ($organizations as $org)
						<form method="POST" action="{{ route('social-accounts.linkedin.store') }}"
							class="list-group-item d-flex align-items-center justify-content-between gap-2">
							@csrf
							<input type="hidden" name="organization_urn" value="{{ $org['urn'] }}">
							<div>
								<div class="fw-medium">{{ $org['name'] }}</div>
								<div class="fs-12 text-muted">{{ $org['urn'] }}</div>
							</div>
							<div class="d-flex align-items-center gap-2">
								<input type="text" name="label" class="form-control form-control-sm" style="width:180px;"
									value="{{ $org['name'] }}" placeholder="Label" required>
								<button type="submit" class="btn btn-sm btn-primary">Connect</button>
							</div>
						</form>
					@endforeach
				</div>
			@endif

			<hr>
			<h6 class="mb-2">Connect manually</h6>
			<p class="fs-13 text-muted">If your Page is not listed, enter its Organisation URN (e.g. <code>urn:li:organization:12345</code>).</p>
			<form method="POST" action="{{ route('social-accounts.linkedin.store') }}" class="row g-2 align-items-end">
				@csrf
				<div class="col-md-4">
					<label class="form-label">Label</label>
					<input type="text" name="label" class="form-control" value="BrowseJobs" required>
				</div>
				<div class="col-md-5">
					<label class="form-label">Organisation URN</label>
					<input type="text" name="organization_urn" class="form-control" placeholder="urn:li:organization:12345" required>
				</div>
				<div class="col-md-3">
					<button type="submit" class="btn btn-primary w-100">Connect Page</button>
				</div>
			</form>
		</div>
	</div>

@endsection
