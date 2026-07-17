@extends('layouts.app')

@section('title', 'Compose')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Compose Email</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt;
				<a href="{{ route('emails.inbox') }}" class="text-muted">Email</a> &gt; <span>Compose</span>
			</nav>
		</div>
	</div>

	@include('emails.partials.nav')

	@if (session('error'))
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
			{{ session('error') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif

	@if ($errors->any())
		<div class="alert alert-danger">
			<ul class="mb-0">
				@foreach ($errors->all() as $err)
					<li>{{ $err }}</li>
				@endforeach
			</ul>
		</div>
	@endif

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('emails.send') }}" enctype="multipart/form-data">
				@csrf
				<div class="row g-3">
					<div class="col-md-12">
						<label class="form-label">To <span class="text-danger">*</span></label>
						<input type="text" name="to" class="form-control" value="{{ old('to') }}"
							placeholder="recipient@example.com, another@example.com" required>
						<div class="form-text">Separate multiple addresses with commas.</div>
					</div>
					<div class="col-md-6">
						<label class="form-label">Cc</label>
						<input type="text" name="cc" class="form-control" value="{{ old('cc') }}"
							placeholder="cc@example.com">
					</div>
					<div class="col-md-6">
						<label class="form-label">Bcc</label>
						<input type="text" name="bcc" class="form-control" value="{{ old('bcc') }}"
							placeholder="bcc@example.com">
					</div>
					<div class="col-md-12">
						<label class="form-label">Subject <span class="text-danger">*</span></label>
						<input type="text" name="subject" class="form-control" value="{{ old('subject') }}"
							placeholder="Subject" required>
					</div>
					<div class="col-md-12">
						<label class="form-label">Message <span class="text-danger">*</span></label>
						<textarea name="body" rows="12" class="form-control"
							placeholder="Write your message... (HTML supported)" required>{{ old('body') }}</textarea>
					</div>
					<div class="col-md-12">
						<label class="form-label">Attachments</label>
						<input type="file" name="attachments[]" class="form-control" multiple>
						<div class="form-text">Up to 10 MB per file.</div>
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">
						<i class="ti ti-send me-1"></i> Send Email
					</button>
					<a href="{{ route('emails.inbox') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection
