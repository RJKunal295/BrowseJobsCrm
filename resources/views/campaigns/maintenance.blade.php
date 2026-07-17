@extends('layouts.app')

@section('title', $channel.' Campaigns')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">{{ $channel }} Campaigns</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Marketing / {{ $channel }} Campaigns</span>
			</nav>
		</div>
	</div>

	<div class="card">
		<div class="card-body text-center py-5">
			<i class="ti ti-tools fs-1 text-warning d-block mb-3"></i>
			<h5>Under Maintenance</h5>
			<p class="text-muted mb-0">
				{{ $channel }} campaigns are coming soon. In the meantime, you can run
				<a href="{{ route('campaigns.index') }}">Email &amp; WhatsApp campaigns</a>.
			</p>
		</div>
	</div>

@endsection
