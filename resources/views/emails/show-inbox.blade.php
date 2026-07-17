@extends('layouts.app')

@section('title', 'Message')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Email</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt;
				<a href="{{ route('emails.inbox') }}" class="text-muted">Inbox</a> &gt; <span>Message</span>
			</nav>
		</div>
		<a href="{{ route('emails.inbox') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to inbox
		</a>
	</div>

	@if ($error)
		<div class="alert alert-warning"><i class="ti ti-alert-triangle me-1"></i> {{ $error }}</div>
	@endif

	@if ($message)
		<div class="card">
			<div class="card-body">
				<h5 class="mb-3">{{ $message['subject'] }}</h5>
				<div class="d-flex align-items-center gap-2 mb-3 pb-3 border-bottom">
					<span class="avatar avatar-rounded bg-primary-transparent">
						<i class="ti ti-user text-primary"></i>
					</span>
					<div>
						<div class="fw-medium">{{ $message['from'] }}</div>
						<div class="fs-12 text-muted">{{ $message['from_mail'] }}</div>
					</div>
					<span class="ms-auto fs-12 text-muted">
						{{ $message['date'] ? \Illuminate\Support\Carbon::instance($message['date'])->format('d M Y, h:i A') : '' }}
					</span>
				</div>

				<div class="email-body">
					{!! $message['body'] !!}
				</div>

				@if (! empty($message['attachments']))
					<div class="mt-4 pt-3 border-top">
						<h6 class="mb-2"><i class="ti ti-paperclip me-1"></i> Attachments</h6>
						<div class="d-flex flex-wrap gap-2">
							@foreach ($message['attachments'] as $attachment)
								<span class="badge badge-soft-secondary">
									<i class="ti ti-file me-1"></i>{{ $attachment['name'] }}
									({{ number_format($attachment['size'] / 1024, 1) }} KB)
								</span>
							@endforeach
						</div>
					</div>
				@endif
			</div>
		</div>
	@endif

@endsection
