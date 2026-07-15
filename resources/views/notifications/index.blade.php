@extends('layouts.app')

@section('title', 'Notifications')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Notifications</h4>
		<form method="POST" action="{{ route('notifications.read-all') }}">
			@csrf
			<button type="submit" class="btn btn-outline-light">Mark all as read</button>
		</form>
	</div>

	<div class="card">
		<div class="card-body">
			@forelse ($notifications as $n)
				<a href="{{ route('notifications.read', $n->id) }}"
					class="d-flex align-items-start gap-3 py-3 border-bottom text-decoration-none {{ $n->read_at ? '' : 'bg-light' }}">
					<i class="{{ $n->data['icon'] ?? 'ti ti-bell' }} fs-24 text-primary"></i>
					<div class="flex-grow-1">
						<p class="mb-1 fw-medium text-dark">{{ $n->data['title'] ?? 'Notification' }}</p>
						<p class="mb-1 text-muted">{{ $n->data['message'] ?? '' }}</p>
						<span class="fs-12 text-muted">{{ $n->created_at->diffForHumans() }}</span>
					</div>
					@if (!$n->read_at)
						<span class="badge badge-soft-primary">New</span>
					@endif
				</a>
			@empty
				<p class="text-center text-muted py-4">No notifications yet.</p>
			@endforelse

			<div class="mt-3">
				{{ $notifications->links() }}
			</div>
		</div>
	</div>

@endsection