@extends('layouts.app')

@section('title', 'LinkedIn Pages')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0"><i class="ti ti-brand-linkedin me-1"></i> LinkedIn Pages</h4>
		@if ($configured)
			<a href="{{ route('social-accounts.linkedin.connect') }}" class="btn btn-primary">
				<i class="ti ti-plug-connected me-1"></i> Connect LinkedIn Page
			</a>
		@endif
	</div>

	@foreach (['success' => 'success', 'error' => 'danger'] as $key => $type)
		@if (session($key))
			<div class="alert alert-{{ $type }} alert-dismissible fade show" role="alert">
				{{ session($key) }}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		@endif
	@endforeach

	@unless ($configured)
		<div class="alert alert-warning">
			<i class="ti ti-alert-triangle me-1"></i>
			LinkedIn is not configured. Set <code>LINKEDIN_CLIENT_ID</code> and <code>LINKEDIN_CLIENT_SECRET</code> in
			<code>.env</code>, and register the redirect URL
			<code>{{ config('services.linkedin.redirect') }}</code> in your LinkedIn app.
		</div>
	@endunless

	<div class="alert alert-info fs-13">
		<i class="ti ti-info-circle me-1"></i>
		Reading Page posts, followers and engagement needs the <strong>Community Management API</strong> product
		approved on your LinkedIn app, and you must be an <strong>admin</strong> of the Page. The connect flow works
		with basic scopes; data fetching activates once those scopes are granted.
	</div>

	<div class="row">
		@forelse ($accounts as $account)
			@php $latestStat = $account->latestStat(); @endphp
			<div class="col-md-6 col-lg-4 mb-3">
				<div class="card h-100">
					<div class="card-body text-center">
						<div class="position-relative d-inline-block mb-2">
							@if ($account->profile_picture_url)
								<img src="{{ $account->profile_picture_url }}" class="rounded-circle" width="80" height="80" style="object-fit:cover;" alt="{{ $account->username }}">
							@else
								<span class="rounded-circle bg-primary text-white d-inline-flex align-items-center justify-content-center" style="width:80px;height:80px;font-size:28px;">
									{{ strtoupper(substr($account->label, 0, 1)) }}
								</span>
							@endif
							<span class="position-absolute bottom-0 end-0 rounded-circle d-flex align-items-center justify-content-center text-white"
								style="width:24px;height:24px;font-size:12px;background:#0a66c2;">
								<i class="ti ti-brand-linkedin"></i>
							</span>
						</div>

						<h5 class="mb-0">{{ $account->label }}</h5>
						<p class="mb-1 text-muted fs-12">{{ $account->channel_id }}</p>

						<div class="row border-top border-bottom py-2 my-2">
							<div class="col-6 border-end">
								<h6 class="mb-0">{{ $account->followers_count ? number_format($account->followers_count) : '—' }}</h6>
								<span class="fs-12 text-muted">Followers</span>
							</div>
							<div class="col-6">
								<h6 class="mb-0">{{ $latestStat->posts_today ?? '—' }}</h6>
								<span class="fs-12 text-muted">Posts Today</span>
							</div>
						</div>

						@if ($account->last_error)
							<div class="alert alert-danger fs-12 text-start p-2 mb-2">
								<i class="ti ti-alert-triangle me-1"></i>{{ \Illuminate\Support\Str::limit($account->last_error, 120) }}
							</div>
						@endif

						<form method="POST" action="{{ route('social-accounts.sync', $account->id) }}">
							@csrf
							<button type="submit" class="btn btn-primary w-100 mb-2"><i class="ti ti-refresh me-1"></i> Sync Now</button>
						</form>

						<div class="d-flex justify-content-between fs-12 text-muted">
							<span><i class="ti ti-clock"></i> {{ $account->last_synced_at ? $account->last_synced_at->diffForHumans() : 'Never synced' }}</span>
							<form method="POST" action="{{ route('social-accounts.destroy', $account->id) }}" onsubmit="return confirm('Disconnect this Page?');">
								@csrf @method('DELETE')
								<button type="submit" class="btn btn-link btn-sm p-0 fs-12 text-danger">Disconnect</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		@empty
			<div class="col-12">
				<div class="alert alert-info">No LinkedIn Pages connected yet.</div>
			</div>
		@endforelse
	</div>

@endsection
