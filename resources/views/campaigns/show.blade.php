@extends('layouts.app')

@section('title', 'Campaign')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">{{ $campaign->name }}</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt;
				<a href="{{ route('campaigns.index') }}" class="text-muted">Campaigns</a> &gt; <span>Details</span>
			</nav>
		</div>
		<div class="d-flex gap-2">
			@if (in_array($campaign->status, ['draft', 'failed']))
				<form method="POST" action="{{ route('campaigns.send', $campaign) }}"
					onsubmit="return confirm('Send this campaign now to all selected students?');">
					@csrf
					<button type="submit" class="btn btn-primary"><i class="ti ti-send me-1"></i> Send now</button>
				</form>
			@endif
			<a href="{{ route('campaigns.index') }}" class="btn btn-outline-light">Back</a>
		</div>
	</div>

	@foreach (['success' => 'success', 'error' => 'danger'] as $key => $type)
		@if (session($key))
			<div class="alert alert-{{ $type }} alert-dismissible fade show" role="alert">
				{{ session($key) }}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		@endif
	@endforeach

	@php
		$statusColors = ['draft' => 'badge-soft-secondary', 'sending' => 'badge-soft-warning', 'sent' => 'badge-soft-success', 'failed' => 'badge-soft-danger'];
	@endphp

	<div class="row mb-3">
		<div class="col-md-3 col-6 mb-3"><div class="card h-100"><div class="card-body"><p class="fw-medium mb-1">Recipients</p><h4 class="mb-0">{{ $campaign->total_recipients }}</h4></div></div></div>
		<div class="col-md-3 col-6 mb-3"><div class="card h-100"><div class="card-body"><p class="fw-medium mb-1">Emails Sent</p><h4 class="mb-0 text-primary">{{ $campaign->sent_email }}</h4></div></div></div>
		<div class="col-md-3 col-6 mb-3"><div class="card h-100"><div class="card-body"><p class="fw-medium mb-1">WhatsApp Sent</p><h4 class="mb-0 text-success">{{ $campaign->sent_whatsapp }}</h4></div></div></div>
		<div class="col-md-3 col-6 mb-3"><div class="card h-100"><div class="card-body"><p class="fw-medium mb-1">Failed</p><h4 class="mb-0 text-danger">{{ $campaign->failed_count }}</h4></div></div></div>
	</div>

	<div class="card mb-3">
		<div class="card-body">
			<div class="row fs-14">
				<div class="col-md-3"><span class="text-muted">Channel:</span> {{ ucfirst($campaign->channel) }}</div>
				<div class="col-md-3"><span class="text-muted">Audience:</span> {{ ucfirst($campaign->audience) }}</div>
				<div class="col-md-3"><span class="text-muted">Status:</span> <span class="badge {{ $statusColors[$campaign->status] }}">{{ ucfirst($campaign->status) }}</span></div>
				<div class="col-md-3"><span class="text-muted">Sent at:</span> {{ optional($campaign->sent_at)->format('d M Y, h:i A') ?? '—' }}</div>
			</div>
			@if ($campaign->subject)
				<hr><div><span class="text-muted">Subject:</span> {{ $campaign->subject }}</div>
			@endif
			<hr>
			<div class="email-body">{!! $campaign->body !!}</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header"><h6 class="mb-0">Recipients</h6></div>
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr><th>Name</th><th>Email</th><th>Phone</th><th>Email</th><th>WhatsApp</th><th>Error</th></tr>
					</thead>
					<tbody>
						@php
							$rStatus = ['skipped' => 'badge-soft-secondary', 'pending' => 'badge-soft-warning', 'sent' => 'badge-soft-success', 'failed' => 'badge-soft-danger'];
						@endphp
						@forelse ($recipients as $r)
							<tr>
								<td>{{ $r->name }}</td>
								<td>{{ $r->email ?? '—' }}</td>
								<td>{{ $r->phone ?? '—' }}</td>
								<td><span class="badge {{ $rStatus[$r->email_status] }}">{{ ucfirst($r->email_status) }}</span></td>
								<td><span class="badge {{ $rStatus[$r->whatsapp_status] }}">{{ ucfirst($r->whatsapp_status) }}</span></td>
								<td class="fs-12 text-danger">{{ \Illuminate\Support\Str::limit($r->error, 60) }}</td>
							</tr>
						@empty
							<tr><td colspan="6" class="text-center py-4">No recipients yet — send the campaign to populate this list.</td></tr>
						@endforelse
					</tbody>
				</table>
			</div>
			<div class="mt-3">{{ $recipients->links() }}</div>
		</div>
	</div>

@endsection
