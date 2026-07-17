@extends('layouts.app')

@section('title', 'Inbox')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Email</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Inbox</span>
			</nav>
		</div>
		<a href="{{ route('emails.compose') }}" class="btn btn-primary">
			<i class="ti ti-pencil me-1"></i> Compose
		</a>
	</div>

	@include('emails.partials.nav')

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif

	@if ($error)
		<div class="alert alert-warning" role="alert">
			<i class="ti ti-alert-triangle me-1"></i> {{ $error }}
		</div>
	@endif

	<div class="card">
		<div class="card-header">
			<form method="GET" action="{{ route('emails.inbox') }}" class="d-flex gap-2">
				<input type="text" name="search" class="form-control form-control-sm" placeholder="Search inbox..."
					value="{{ request('search') }}">
				<button type="submit" class="btn btn-sm btn-primary"><i class="ti ti-search"></i></button>
			</form>
		</div>
		<div class="card-body p-0">
			<div class="list-group list-group-flush">
				@forelse ($messages as $message)
					<a href="{{ route('emails.inbox.show', $message['uid']) }}"
						class="list-group-item list-group-item-action d-flex align-items-center gap-3 {{ $message['seen'] ? '' : 'fw-bold' }}">
						<i class="ti {{ $message['seen'] ? 'ti-mail-opened text-muted' : 'ti-mail text-primary' }} fs-5"></i>
						<div class="flex-grow-1 min-w-0">
							<div class="text-truncate">{{ $message['from'] }}</div>
							<div class="text-truncate fs-13">{{ $message['subject'] }}</div>
						</div>
						@if ($message['has_attachment'])
							<i class="ti ti-paperclip text-muted"></i>
						@endif
						<span class="fs-12 text-muted text-nowrap">
							{{ $message['date'] ? \Illuminate\Support\Carbon::instance($message['date'])->diffForHumans() : '' }}
						</span>
					</a>
				@empty
					<div class="text-center py-5 text-muted">
						<i class="ti ti-inbox fs-1 d-block mb-2"></i>
						@if (! $error)
							No messages in your inbox.
						@endif
					</div>
				@endforelse
			</div>
		</div>
	</div>

@endsection
