@extends('layouts.app')

@section('title', 'Calendar')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-3 flex-wrap">
		<h4 class="mb-0">Calendar</h4>
		<div class="d-flex gap-3 fs-13">
			<span><span class="d-inline-block rounded-circle me-1" style="width:10px;height:10px;background:#1cc88a;"></span> Public Holiday</span>
			<span><span class="d-inline-block rounded-circle me-1" style="width:10px;height:10px;background:#f6c23e;"></span> Optional Holiday</span>
			<span><span class="d-inline-block rounded-circle me-1" style="width:10px;height:10px;background:#e83e8c;"></span> Birthday</span>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div id="calendar"></div>
		</div>
	</div>

@endsection

@push('scripts')
	<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.11/index.global.min.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/6.1.11/index.global.min.js"></script>

	<script>
		document.addEventListener('DOMContentLoaded', function () {
			const calendarEl = document.getElementById('calendar');
			const eventsUrl = "{{ route('calendar.events') }}";

			const calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar: {
					left: 'today prev,next',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay',
				},
				buttonText: {
					today: 'today',
					month: 'month',
					week: 'week',
					day: 'day',
				},
				initialView: 'dayGridMonth',
				height: 'auto',
				events: function (info, successCallback, failureCallback) {
					// IMPORTANT: build the query string with URLSearchParams,
					// NOT a plain template literal — info.startStr/endStr
					// include a "+05:30" timezone offset, and a raw "+" in a
					// query string gets silently read as a space by the
					// server, corrupting the date. URLSearchParams encodes
					// it correctly as %2B.
					const params = new URLSearchParams({
						start: info.startStr,
						end: info.endStr,
					});

					fetch(`${eventsUrl}?${params.toString()}`)
						.then(res => res.json())
						.then(data => successCallback(data))
						.catch(err => failureCallback(err));
				},
			});

			calendar.render();
		});
	</script>
@endpush