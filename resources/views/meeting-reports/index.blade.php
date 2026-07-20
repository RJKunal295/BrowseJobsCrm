@extends('layouts.app')

@section('title', 'Meeting Reports')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Meeting Reports</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Meeting Reports</span>
			</nav>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Date</th>
							<th>Meeting</th>
							<th>Attended</th>
							<th>Absent</th>
							<th>Analyzed by</th>
							<th>Report</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($reports as $report)
							<tr>
								<td>{{ $report->meeting_date->format('d M Y') }}</td>
								<td>{{ $report->title }}</td>
								<td><span class="badge bg-success">{{ count($report->attendees ?? []) }}</span></td>
								<td>
									@if (count($report->absentees ?? []))
										<span class="badge bg-danger" title="{{ implode(', ', $report->absentees) }}">{{ count($report->absentees) }}</span>
									@else
										<span class="badge bg-success">0</span>
									@endif
								</td>
								<td class="fs-13 text-muted">{{ $report->model }}</td>
								<td>
									<a href="{{ route('meeting-reports.show', $report) }}" class="btn btn-sm btn-icon btn-outline-light"><i class="ti ti-eye"></i></a>
								</td>
							</tr>
						@empty
							<tr><td colspan="6" class="text-center py-4">
								No meeting reports yet. Reports appear automatically after a recorded + transcribed
								Google Meet, once <code>MEET_TRANSCRIPTS_FOLDER_ID</code> is configured.
							</td></tr>
						@endforelse
					</tbody>
				</table>
			</div>
			<div class="mt-3">{{ $reports->links() }}</div>
		</div>
	</div>

@endsection
