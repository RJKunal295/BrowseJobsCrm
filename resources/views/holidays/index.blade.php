@extends('layouts.app')

@section('title', 'Holidays')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Holidays — {{ $year === 'all' ? 'All Years' : $year }}</h4>
		<div class="d-flex gap-2">
			<a href="{{ route('holidays.export', ['year' => $year]) }}" class="btn btn-outline-success">
				<i class="ti ti-file-spreadsheet me-1"></i> Export to Excel
			</a>
			@if ($canManage)
				<a href="{{ route('holidays.create') }}" class="btn btn-primary">
					<i class="ti ti-plus me-1"></i> Add Holiday
				</a>
			@endif
		</div>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	<!-- Year Filter -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('holidays.index') }}" class="row g-3 align-items-end">
				<div class="col-md-3">
					<label class="form-label">Year</label>
					<select name="year" class="form-select" onchange="this.form.submit()">
						<option value="all" @selected($year === 'all')>All Years</option>
						@foreach ($availableYears as $y)
							<option value="{{ $y }}" @selected((string) $y === (string) $year)>{{ $y }}</option>
						@endforeach
					</select>
				</div>
			</form>
		</div>
	</div>
	<!-- End Year Filter -->

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>##</th>
							<th>Holiday</th>
							<th>Date</th>
							<th>Day</th>
							<th>Type</th>
							<th>Description</th>
							@if ($canManage)
								<th>Actions</th>
							@endif
						</tr>
					</thead>
					<tbody>
						@forelse ($holidays as $index => $holiday)
							<tr>
								<td>{{ $index + 1 }}</td>
								<td>{{ $holiday->title }}</td>
								<td>{{ $holiday->holiday_date->format('d M Y') }}</td>
								<td>{{ $holiday->day_name }}</td>
								<td>
									@if ($holiday->is_optional)
										<span class="badge badge-soft-warning">Optional</span>
									@else
										<span class="badge badge-soft-success">Public</span>
									@endif
								</td>
								<td class="fs-13">{{ $holiday->description ?? '—' }}</td>
								@if ($canManage)
									<td>
										<div class="d-flex gap-2">
											<a href="{{ route('holidays.edit', $holiday->id) }}"
												class="btn btn-sm btn-icon btn-outline-light">
												<i class="ti ti-edit"></i>
											</a>
											<form method="POST" action="{{ route('holidays.destroy', $holiday->id) }}"
												onsubmit="return confirm('Delete this holiday?');">
												@csrf
												@method('DELETE')
												<button type="submit" class="btn btn-sm btn-icon btn-outline-danger">
													<i class="ti ti-trash"></i>
												</button>
											</form>
										</div>
									</td>
								@endif
							</tr>
						@empty
							<tr>
								<td colspan="{{ $canManage ? 7 : 6 }}" class="text-center py-4">
									No holidays found.
								</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>
		</div>
	</div>

@endsection