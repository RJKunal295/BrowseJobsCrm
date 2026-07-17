@extends('layouts.app')

@section('title', $title)

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">{{ $title }}</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>{{ $title }}</span>
			</nav>
		</div>
	</div>

	<div class="card">
		<div class="card-body text-center py-5">
			<span class="avatar avatar-xl avatar-rounded bg-warning-transparent mb-3">
				<i class="ti ti-tools fs-1 text-warning"></i>
			</span>
			<h5 class="mb-2">{{ $title }} is under maintenance</h5>
			<p class="text-muted mb-4" style="max-width: 480px; margin-inline: auto;">
				This section is being built and will be available soon. Thank you for your patience.
			</p>
			<a href="{{ url()->previous() }}" class="btn btn-outline-light me-2"><i class="ti ti-arrow-left me-1"></i> Go back</a>
			<a href="{{ route('dashboard') }}" class="btn btn-primary"><i class="ti ti-home me-1"></i> Dashboard</a>
		</div>
	</div>

@endsection
