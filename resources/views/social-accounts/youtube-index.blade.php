@extends('layouts.app')

@section('title', 'YouTube Channels')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0"><i class="ti ti-brand-youtube me-1"></i> YouTube Channels</h4>
		<a href="{{ route('social-accounts.youtube.create') }}" class="btn btn-danger">
			<i class="ti ti-plus me-1"></i> Connect YouTube
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
								<span class="rounded-circle bg-secondary text-white d-inline-flex align-items-center justify-content-center" style="width:80px;height:80px;font-size:28px;">
									{{ strtoupper(substr($account->label, 0, 1)) }}
								</span>
							@endif
							<span class="position-absolute bottom-0 end-0 rounded-circle d-flex align-items-center justify-content-center bg-danger text-white"
								style="width:24px;height:24px;font-size:12px;">
								<i class="ti ti-brand-youtube"></i>
							</span>
						</div>

						<h5 class="mb-0">{{ $account->label }}</h5>
						@if ($account->username)
							<p class="mb-1 text-muted">{{ $account->username }}</p>
						@endif

						@if ($account->biography)
							<p class="fs-13 text-muted">{{ \Illuminate\Support\Str::limit($account->biography, 100) }}</p>
						@endif

						<div class="row border-top border-bottom py-2 my-2">
							<div class="col-4 border-end">
								<h6 class="mb-0">{{ $latestStat->posts_today ?? '—' }}</h6>
								<span class="fs-12 text-muted">Videos Today</span>
							</div>
							<div class="col-4 border-end">
								<h6 class="mb-0">{{ $latestStat?->followers_count ? number_format($latestStat->followers_count) : '—' }}</h6>
								<span class="fs-12 text-muted">Subscribers</span>
							</div>
							<div class="col-4">
								<h6 class="mb-0">{{ $account->following_count ? number_format($account->following_count) : '—' }}</h6>
								<span class="fs-12 text-muted">Total Videos</span>
							</div>
						</div>

						@if ($latestStat?->reach !== null)
							<p class="fs-12 text-muted mb-2">Total channel views: <strong>{{ number_format($latestStat->reach) }}</strong></p>
						@endif

						@if ($account->last_error)
							<div class="alert alert-danger fs-12 text-start p-2 mb-2">
								<i class="ti ti-alert-triangle me-1"></i>{{ Str::limit($account->last_error, 100) }}
							</div>
						@endif

						<form method="POST" action="{{ route('social-accounts.sync', $account->id) }}">
							@csrf
							<button type="submit" class="btn btn-danger w-100 mb-2">
								<i class="ti ti-refresh me-1"></i> Sync Now
							</button>
						</form>

						<div class="d-flex justify-content-between fs-12 text-muted">
							<span>
								<i class="ti ti-clock"></i>
								{{ $account->last_synced_at ? $account->last_synced_at->diffForHumans() : 'Never synced' }}
							</span>
							<form method="POST" action="{{ route('social-accounts.destroy', $account->id) }}"
								onsubmit="return confirm('Disconnect this account?');">
								@csrf
								@method('DELETE')
								<button type="submit" class="btn btn-link btn-sm p-0 fs-12 text-danger">Disconnect</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		@empty
			<div class="col-12">
				<div class="alert alert-info">No YouTube channels connected yet.</div>
			</div>
		@endforelse
	</div>

@endsection