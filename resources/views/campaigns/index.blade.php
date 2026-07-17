@extends('layouts.app')

@section('title', 'Campaigns')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Campaigns</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Marketing / Campaigns</span>
			</nav>
		</div>
		<a href="{{ route('campaigns.create') }}" class="btn btn-primary">
			<i class="ti ti-plus me-1"></i> New Campaign
		</a>
	</div>

	@foreach (['success' => 'success', 'error' => 'danger'] as $key => $type)
		@if (session($key))
			<div class="alert alert-{{ $type }} alert-dismissible fade show" role="alert">
				{{ session($key) }}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		@endif
	@endforeach

	<div class="row mb-3">
		<div class="col-md-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Total Students</p>
				<h4 class="mb-0">{{ number_format($studentCount) }}</h4>
				<span class="avatar avatar-rounded bg-primary-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-users text-primary"></i></span>
			</div></div>
		</div>
		<div class="col-md-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Active Students</p>
				<h4 class="mb-0">{{ number_format($activeStudentCount) }}</h4>
				<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-user-check text-success"></i></span>
			</div></div>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Campaign</th>
							<th>Channel</th>
							<th>Audience</th>
							<th>Status</th>
							<th>Sent</th>
							<th>Failed</th>
							<th>Created</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						@php
							$statusColors = ['draft' => 'badge-soft-secondary', 'sending' => 'badge-soft-warning', 'sent' => 'badge-soft-success', 'failed' => 'badge-soft-danger'];
							$channelIcons = ['email' => 'ti-mail', 'whatsapp' => 'ti-brand-whatsapp', 'both' => 'ti-send'];
						@endphp
						@forelse ($campaigns as $campaign)
							<tr>
								<td><a href="{{ route('campaigns.show', $campaign) }}">{{ $campaign->name }}</a></td>
								<td><i class="ti {{ $channelIcons[$campaign->channel] }} me-1"></i>{{ ucfirst($campaign->channel) }}</td>
								<td class="text-capitalize">{{ $campaign->audience }}</td>
								<td><span class="badge {{ $statusColors[$campaign->status] }}">{{ ucfirst($campaign->status) }}</span></td>
								<td>{{ $campaign->sent_email + $campaign->sent_whatsapp }}</td>
								<td>{{ $campaign->failed_count }}</td>
								<td>{{ $campaign->created_at->format('d M Y') }}</td>
								<td>
									<div class="d-flex gap-2">
										<a href="{{ route('campaigns.show', $campaign) }}" class="btn btn-sm btn-icon btn-outline-light"><i class="ti ti-eye"></i></a>
										<form method="POST" action="{{ route('campaigns.destroy', $campaign) }}" onsubmit="return confirm('Delete this campaign?');">
											@csrf @method('DELETE')
											<button type="submit" class="btn btn-sm btn-icon btn-outline-danger"><i class="ti ti-trash"></i></button>
										</form>
									</div>
								</td>
							</tr>
						@empty
							<tr><td colspan="8" class="text-center py-4">No campaigns yet.</td></tr>
						@endforelse
					</tbody>
				</table>
			</div>
			<div class="mt-3">{{ $campaigns->links() }}</div>
		</div>
	</div>

@endsection
