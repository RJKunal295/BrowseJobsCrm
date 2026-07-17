@extends('layouts.app')

@section('title', 'Sent Message')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Email</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt;
				<a href="{{ route('emails.sent') }}" class="text-muted">Sent</a> &gt; <span>Message</span>
			</nav>
		</div>
		<a href="{{ route('emails.sent') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to sent
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<h5 class="mb-3">{{ $email->subject }}</h5>

			<div class="mb-3 pb-3 border-bottom fs-13">
				<div><span class="text-muted">From:</span> {{ $email->from_email }}</div>
				<div><span class="text-muted">To:</span> {{ implode(', ', $email->to) }}</div>
				@if (! empty($email->cc))
					<div><span class="text-muted">Cc:</span> {{ implode(', ', $email->cc) }}</div>
				@endif
				@if (! empty($email->bcc))
					<div><span class="text-muted">Bcc:</span> {{ implode(', ', $email->bcc) }}</div>
				@endif
				<div class="mt-1">
					<span class="badge {{ $email->status === 'sent' ? 'badge-soft-success' : 'badge-soft-danger' }}">
						{{ ucfirst($email->status) }}
					</span>
					<span class="text-muted ms-2">{{ optional($email->sent_at)->format('d M Y, h:i A') }}</span>
				</div>
			</div>

			@if ($email->status === 'failed' && $email->error)
				<div class="alert alert-danger fs-13"><strong>Error:</strong> {{ $email->error }}</div>
			@endif

			<div class="email-body">
				{!! $email->body !!}
			</div>

			@if ($email->attachments->isNotEmpty())
				<div class="mt-4 pt-3 border-top">
					<h6 class="mb-2"><i class="ti ti-paperclip me-1"></i> Attachments</h6>
					<div class="d-flex flex-wrap gap-2">
						@foreach ($email->attachments as $attachment)
							<a href="{{ route('emails.attachment', $attachment->id) }}"
								class="badge badge-soft-secondary text-decoration-none">
								<i class="ti ti-download me-1"></i>{{ $attachment->filename }}
								({{ number_format($attachment->size / 1024, 1) }} KB)
							</a>
						@endforeach
					</div>
				</div>
			@endif
		</div>
	</div>

@endsection
