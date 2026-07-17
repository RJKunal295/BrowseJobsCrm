@extends('layouts.app')

@section('title', 'Sent')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Email</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Sent</span>
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

	<div class="card">
		<div class="card-header">
			<form method="GET" action="{{ route('emails.sent') }}" class="d-flex gap-2">
				<input type="text" name="search" class="form-control form-control-sm" placeholder="Search sent..."
					value="{{ request('search') }}">
				<button type="submit" class="btn btn-sm btn-primary"><i class="ti ti-search"></i></button>
			</form>
		</div>
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>To</th>
							<th>Subject</th>
							<th>Status</th>
							<th>Sent</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($emails as $email)
							<tr>
								<td>{{ implode(', ', $email->to) }}</td>
								<td>
									<a href="{{ route('emails.sent.show', $email->id) }}">{{ $email->subject }}</a>
									@if ($email->attachments->isNotEmpty())
										<i class="ti ti-paperclip text-muted ms-1"></i>
									@endif
								</td>
								<td>
									<span class="badge {{ $email->status === 'sent' ? 'badge-soft-success' : 'badge-soft-danger' }}">
										{{ ucfirst($email->status) }}
									</span>
								</td>
								<td>{{ optional($email->sent_at)->format('d M Y, h:i A') }}</td>
								<td>
									<div class="d-flex gap-2">
										<a href="{{ route('emails.sent.show', $email->id) }}"
											class="btn btn-sm btn-icon btn-outline-light">
											<i class="ti ti-eye"></i>
										</a>
										<form method="POST" action="{{ route('emails.destroy', $email->id) }}"
											onsubmit="return confirm('Delete this email?');">
											@csrf
											@method('DELETE')
											<button type="submit" class="btn btn-sm btn-icon btn-outline-danger">
												<i class="ti ti-trash"></i>
											</button>
										</form>
									</div>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="5" class="text-center py-4">No sent emails yet.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $emails->links() }}
			</div>
		</div>
	</div>

@endsection
