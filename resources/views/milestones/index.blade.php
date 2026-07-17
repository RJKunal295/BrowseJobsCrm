@extends('layouts.app')

@section('title', 'Milestones')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Milestones</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Milestones</span>
			</nav>
		</div>
		<button type="button" class="btn btn-primary" onclick="openMilestoneModal()">
			<i class="ti ti-plus me-1"></i> New Milestone
		</button>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif

	<!-- Stat Cards -->
	<div class="row mb-3">
		<div class="col-md-4 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Total Milestones</p>
				<h4 class="mb-0">{{ $milestones->count() }}</h4>
				<span class="avatar avatar-rounded bg-primary-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-target text-primary"></i></span>
			</div></div>
		</div>
		<div class="col-md-4 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Achieved</p>
				<h4 class="mb-0">{{ $achieved }}</h4>
				<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-circle-check text-success"></i></span>
			</div></div>
		</div>
		<div class="col-md-4 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">In Progress</p>
				<h4 class="mb-0">{{ $inProgress }}</h4>
				<span class="avatar avatar-rounded bg-warning-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-progress text-warning"></i></span>
			</div></div>
		</div>
	</div>

	<!-- Filters -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('milestones.index') }}" class="row g-3 align-items-end">
				<div class="col-md-3">
					<label class="form-label">Period</label>
					<select name="period_type" class="form-select">
						<option value="">All periods</option>
						<option value="monthly" @selected(request('period_type') === 'monthly')>Monthly</option>
						<option value="quarterly" @selected(request('period_type') === 'quarterly')>Quarterly</option>
						<option value="yearly" @selected(request('period_type') === 'yearly')>Yearly</option>
					</select>
				</div>
				<div class="col-md-3">
					<label class="form-label">Year</label>
					<select name="year" class="form-select">
						<option value="">All years</option>
						@foreach ($years as $y)
							<option value="{{ $y }}" @selected((string) request('year') === (string) $y)>{{ $y }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary"><i class="ti ti-filter me-1"></i> Filter</button>
					<a href="{{ route('milestones.index') }}" class="btn btn-outline-light">Reset</a>
				</div>
			</form>
		</div>
	</div>

	<div class="row">
		@forelse ($milestones as $milestone)
			@php
				$pct = $milestone->progressPercent();
				$achievedVal = $milestone->achievedValue();
				$done = $milestone->isAchieved();
				$expired = $milestone->isExpired();
				$barColor = $done ? 'bg-success' : ($expired ? 'bg-danger' : 'bg-primary');
			@endphp
			<div class="col-lg-4 col-md-6 mb-3">
				<div class="card h-100">
					<div class="card-body">
						<div class="d-flex align-items-start justify-content-between gap-2 mb-2">
							<div>
								<h6 class="mb-0">{{ $milestone->title }}</h6>
								<span class="badge badge-soft-info text-capitalize">{{ $milestone->metric }}</span>
								<span class="badge badge-soft-secondary">{{ $milestone->periodLabel() }}</span>
							</div>
							<div class="dropdown">
								<button class="btn btn-sm btn-icon btn-outline-light border-0" data-bs-toggle="dropdown"><i class="ti ti-dots-vertical"></i></button>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><button type="button" class="dropdown-item" onclick='openMilestoneModal(@json($milestone))'><i class="ti ti-edit me-1"></i> Edit</button></li>
									<li><hr class="dropdown-divider"></li>
									<li>
										<form method="POST" action="{{ route('milestones.destroy', $milestone->id) }}" onsubmit="return confirm('Delete this milestone?');">
											@csrf @method('DELETE')
											<button type="submit" class="dropdown-item text-danger"><i class="ti ti-trash me-1"></i> Delete</button>
										</form>
									</li>
								</ul>
							</div>
						</div>

						@if ($milestone->description)
							<p class="fs-13 text-muted mb-2">{{ $milestone->description }}</p>
						@endif

						<div class="d-flex justify-content-between fs-13 mb-1">
							<span>{{ number_format($achievedVal) }} / {{ number_format($milestone->target_value) }}</span>
							<span class="fw-medium">{{ $pct }}%</span>
						</div>
						<div class="progress" style="height: 8px;">
							<div class="progress-bar {{ $barColor }}" role="progressbar" style="width: {{ $pct }}%"></div>
						</div>

						<div class="mt-2">
							@if ($done)
								<span class="badge badge-soft-success"><i class="ti ti-circle-check me-1"></i>Achieved</span>
							@elseif ($expired)
								<span class="badge badge-soft-danger"><i class="ti ti-clock-off me-1"></i>Missed</span>
							@else
								<span class="badge badge-soft-warning"><i class="ti ti-progress me-1"></i>In progress</span>
							@endif
						</div>
					</div>
				</div>
			</div>
		@empty
			<div class="col-12">
				<div class="card"><div class="card-body text-center py-5">
					<i class="ti ti-target fs-1 text-muted d-block mb-2"></i>
					No milestones yet. Set your first lead-generation target.
				</div></div>
			</div>
		@endforelse
	</div>

	<!-- Add/Edit Modal -->
	<div class="modal fade" id="milestoneModal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form method="POST" id="milestoneForm" action="{{ route('milestones.store') }}">
					@csrf
					<div id="milestoneMethodField"></div>
					<div class="modal-header">
						<h5 class="modal-title" id="milestoneModalTitle">New Milestone</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<div class="row g-3">
							<div class="col-md-8">
								<label class="form-label">Title <span class="text-danger">*</span></label>
								<input type="text" name="title" id="ms_title" class="form-control" placeholder="e.g. Generate 500 leads in July" required>
							</div>
							<div class="col-md-4">
								<label class="form-label">Metric</label>
								<select name="metric" id="ms_metric" class="form-select" onchange="toggleCurrentValue()">
									<option value="leads">Leads (auto from CRM)</option>
									<option value="custom">Custom (manual)</option>
								</select>
							</div>
							<div class="col-md-4">
								<label class="form-label">Period type</label>
								<select name="period_type" id="ms_period_type" class="form-select" onchange="togglePeriodFields()">
									<option value="monthly">Monthly</option>
									<option value="quarterly">Quarterly</option>
									<option value="yearly">Yearly</option>
								</select>
							</div>
							<div class="col-md-4">
								<label class="form-label">Year</label>
								<input type="number" name="period_year" id="ms_period_year" class="form-control" value="{{ now()->year }}" min="2000" max="2100" required>
							</div>
							<div class="col-md-4" id="ms_month_wrap">
								<label class="form-label">Month</label>
								<select name="period_month" id="ms_period_month" class="form-select">
									@foreach (range(1, 12) as $m)
										<option value="{{ $m }}" @selected($m === now()->month)>{{ \Illuminate\Support\Carbon::create(null, $m, 1)->format('F') }}</option>
									@endforeach
								</select>
							</div>
							<div class="col-md-4 d-none" id="ms_quarter_wrap">
								<label class="form-label">Quarter</label>
								<select name="period_quarter" id="ms_period_quarter" class="form-select">
									@foreach (range(1, 4) as $q)
										<option value="{{ $q }}">Q{{ $q }}</option>
									@endforeach
								</select>
							</div>
							<div class="col-md-6">
								<label class="form-label">Target value <span class="text-danger">*</span></label>
								<input type="number" step="0.01" min="0" name="target_value" id="ms_target_value" class="form-control" placeholder="e.g. 500" required>
							</div>
							<div class="col-md-6 d-none" id="ms_current_wrap">
								<label class="form-label">Current value</label>
								<input type="number" step="0.01" min="0" name="current_value" id="ms_current_value" class="form-control" value="0">
								<div class="form-text">For custom metrics — update as you progress.</div>
							</div>
							<div class="col-md-12">
								<label class="form-label">Description</label>
								<textarea name="description" id="ms_description" rows="2" class="form-control" placeholder="Optional notes..."></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="msSubmitBtn"><i class="ti ti-device-floppy me-1"></i> Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>

@endsection

@push('scripts')
	<script>
		function togglePeriodFields() {
			const type = document.getElementById('ms_period_type').value;
			document.getElementById('ms_month_wrap').classList.toggle('d-none', type !== 'monthly');
			document.getElementById('ms_quarter_wrap').classList.toggle('d-none', type !== 'quarterly');
		}

		function toggleCurrentValue() {
			const metric = document.getElementById('ms_metric').value;
			document.getElementById('ms_current_wrap').classList.toggle('d-none', metric !== 'custom');
		}

		function openMilestoneModal(ms) {
			const form = document.getElementById('milestoneForm');
			const title = document.getElementById('milestoneModalTitle');
			const methodField = document.getElementById('milestoneMethodField');

			if (ms) {
				title.textContent = 'Edit Milestone';
				form.action = `/milestones/${ms.id}`;
				methodField.innerHTML = '@method('PATCH')';
				document.getElementById('ms_title').value = ms.title || '';
				document.getElementById('ms_metric').value = ms.metric || 'leads';
				document.getElementById('ms_period_type').value = ms.period_type || 'monthly';
				document.getElementById('ms_period_year').value = ms.period_year || {{ now()->year }};
				document.getElementById('ms_period_month').value = ms.period_month || {{ now()->month }};
				document.getElementById('ms_period_quarter').value = ms.period_quarter || 1;
				document.getElementById('ms_target_value').value = ms.target_value || '';
				document.getElementById('ms_current_value').value = ms.current_value || 0;
				document.getElementById('ms_description').value = ms.description || '';
			} else {
				title.textContent = 'New Milestone';
				form.action = "{{ route('milestones.store') }}";
				methodField.innerHTML = '';
				form.reset();
			}

			togglePeriodFields();
			toggleCurrentValue();
			new bootstrap.Modal(document.getElementById('milestoneModal')).show();
		}
	</script>
@endpush
