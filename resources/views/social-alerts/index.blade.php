@extends('layouts.app')

@section('title', 'Social Alerts')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Social Alerts</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Social Alerts</span>
			</nav>
		</div>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif

	<div class="alert alert-info fs-13">
		<i class="ti ti-info-circle me-1"></i>
		When a platform is <strong>ON</strong>, you receive an email + WhatsApp reminder whenever a connected account
		has <strong>not posted in the last 24 hours</strong> — repeated daily until a new post is published. Turn it
		<strong>OFF</strong> to stop those messages.
	</div>

	<div class="row">
		@php
			$meta = [
				'instagram' => ['icon' => 'ti-brand-instagram', 'color' => 'danger', 'label' => 'Instagram'],
				'youtube'   => ['icon' => 'ti-brand-youtube', 'color' => 'danger', 'label' => 'YouTube'],
				'linkedin'  => ['icon' => 'ti-brand-linkedin', 'color' => 'primary', 'label' => 'LinkedIn'],
			];
		@endphp
		@foreach ($platforms as $platform)
			<div class="col-md-4 mb-3">
				<div class="card h-100">
					<div class="card-body d-flex align-items-center justify-content-between">
						<div class="d-flex align-items-center gap-2">
							<span class="avatar avatar-rounded bg-{{ $meta[$platform]['color'] }}-transparent">
								<i class="ti {{ $meta[$platform]['icon'] }} text-{{ $meta[$platform]['color'] }}"></i>
							</span>
							<div>
								<h6 class="mb-0">{{ $meta[$platform]['label'] }}</h6>
								<span class="fs-12 {{ $toggles[$platform] ? 'text-success' : 'text-muted' }}">
									{{ $toggles[$platform] ? 'Alerts ON' : 'Alerts OFF' }}
								</span>
							</div>
						</div>
						<form method="POST" action="{{ route('social-alerts.update') }}">
							@csrf
							@method('PATCH')
							<input type="hidden" name="platform" value="{{ $platform }}">
							<input type="hidden" name="enabled" value="{{ $toggles[$platform] ? 0 : 1 }}">
							<div class="form-check form-switch m-0">
								<input class="form-check-input" type="checkbox" role="switch"
									{{ $toggles[$platform] ? 'checked' : '' }} onchange="this.form.submit()"
									style="cursor:pointer;">
							</div>
						</form>
					</div>
					@if ($platform === 'linkedin')
						<div class="card-footer fs-12 text-muted">
							LinkedIn post fetching needs Marketing API partner access; it stays inactive until approved.
						</div>
					@endif
				</div>
			</div>
		@endforeach
	</div>

	<div class="card mb-3">
		<div class="card-header"><h6 class="mb-0">Posting activity status</h6></div>
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr><th>Platform</th><th>Account</th><th>Last post</th><th>Status</th><th>Reminders sent</th></tr>
					</thead>
					<tbody>
						@forelse ($reminders as $r)
							<tr>
								<td class="text-capitalize">{{ $r->platform }}</td>
								<td>{{ $r->account->label ?? '—' }}</td>
								<td>{{ optional($r->last_post_at)->format('d M Y, h:i A') ?? '—' }}</td>
								<td>
									@if ($r->resolved)
										<span class="badge badge-soft-success">Active</span>
									@else
										<span class="badge badge-soft-danger">No post 24h+</span>
									@endif
								</td>
								<td>{{ $r->reminder_count }}</td>
							</tr>
						@empty
							<tr><td colspan="5" class="text-center py-4">No activity tracked yet — runs after the daily check.</td></tr>
						@endforelse
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header"><h6 class="mb-0">Recent posts &amp; engagement</h6></div>
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Platform</th><th>Account</th><th>Caption / Title</th><th>Published</th>
							<th><i class="ti ti-heart"></i></th><th><i class="ti ti-message-circle"></i></th>
							<th><i class="ti ti-share"></i></th><th><i class="ti ti-eye"></i></th><th>Link</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($recentPosts as $post)
							<tr>
								<td class="text-capitalize">{{ $post->platform }}</td>
								<td>{{ $post->account->label ?? '—' }}</td>
								<td>{{ \Illuminate\Support\Str::limit($post->caption, 50) ?: '—' }}</td>
								<td>{{ optional($post->published_at)->format('d M Y, h:i A') ?? '—' }}</td>
								<td>{{ $post->likes !== null ? number_format($post->likes) : '—' }}</td>
								<td>{{ $post->comments !== null ? number_format($post->comments) : '—' }}</td>
								<td>{{ $post->shares !== null ? number_format($post->shares) : '—' }}</td>
								<td>{{ $post->views !== null ? number_format($post->views) : '—' }}</td>
								<td>
									@if ($post->permalink)
										<a href="{{ $post->permalink }}" target="_blank" rel="noopener" class="btn btn-sm btn-icon btn-outline-light"><i class="ti ti-external-link"></i></a>
									@else — @endif
								</td>
							</tr>
						@empty
							<tr><td colspan="9" class="text-center py-4">No posts detected yet. They appear after the fetch runs.</td></tr>
						@endforelse
					</tbody>
				</table>
			</div>
		</div>
	</div>

@endsection
