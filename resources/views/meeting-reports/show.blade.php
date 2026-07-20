@extends('layouts.app')

@section('title', 'Meeting Report — '.$report->title)

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">{{ $report->title }}</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt;
				<a href="{{ route('meeting-reports.index') }}" class="text-muted">Meeting Reports</a> &gt;
				<span>{{ $report->meeting_date->format('d M Y') }}</span>
			</nav>
		</div>
		<div class="d-flex gap-2">
			@if ($report->transcript_link)
				<a href="{{ $report->transcript_link }}" target="_blank" rel="noopener" class="btn btn-outline-light">
					<i class="ti ti-file-text me-1"></i> Open transcript
				</a>
			@endif
			<a href="{{ route('meeting-reports.index') }}" class="btn btn-outline-light"><i class="ti ti-arrow-left me-1"></i> Back</a>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-4">
			<div class="card mb-3">
				<div class="card-header"><h6 class="mb-0"><i class="ti ti-users me-1 text-success"></i>Attended ({{ count($report->attendees ?? []) }})</h6></div>
				<div class="card-body">
					@forelse ($report->attendees ?? [] as $name)
						<span class="badge badge-soft-success mb-1 me-1">{{ $name }}</span>
					@empty
						<span class="text-muted fs-13">None detected.</span>
					@endforelse
				</div>
			</div>
			<div class="card mb-3">
				<div class="card-header"><h6 class="mb-0"><i class="ti ti-user-off me-1 text-danger"></i>Absent ({{ count($report->absentees ?? []) }})</h6></div>
				<div class="card-body">
					@forelse ($report->absentees ?? [] as $name)
						<span class="badge badge-soft-danger mb-1 me-1">{{ $name }}</span>
					@empty
						<span class="text-muted fs-13">Nobody — full attendance 🎉</span>
					@endforelse
				</div>
			</div>
			<div class="card mb-3">
				<div class="card-body fs-13 text-muted">
					Analyzed by {{ config("services.ai_analysis.{$report->provider}.label", $report->provider) }}
					({{ $report->model }})<br>
					{{ $report->created_at->format('d M Y, h:i A') }}
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="card">
				<div class="card-header"><h6 class="mb-0"><i class="ti ti-sparkles me-1 text-primary"></i>AI Analysis</h6></div>
				<div class="card-body">
					<div id="report-analysis" class="fs-14" data-raw="{{ $report->analysis }}"></div>
				</div>
			</div>
		</div>
	</div>

@endsection

@push('scripts')
	<script>
		// Minimal markdown rendering for the AI report (same rules as the lead analysis).
		(function () {
			const el = document.getElementById('report-analysis');
			if (!el) return;

			function esc(s) { const d = document.createElement('div'); d.textContent = s; return d.innerHTML; }

			el.innerHTML = esc(el.dataset.raw)
				.replace(/^## (.*)$/gm, '<h6 class="mt-3 mb-2 text-primary">$1</h6>')
				.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
				.replace(/^\s*[-•] (.*)$/gm, '<div class="d-flex gap-2 mb-1"><span>•</span><span>$1</span></div>')
				.replace(/^\s*(\d+)\. (.*)$/gm, '<div class="d-flex gap-2 mb-1"><span>$1.</span><span>$2</span></div>')
				.replace(/\n{2,}/g, '<br>');
		})();
	</script>
@endpush
