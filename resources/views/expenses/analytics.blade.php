@extends('layouts.app')

@section('title', 'Expense Analytics')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Expense Analytics</h4>
		<a href="{{ route('expenses.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to Expenses
		</a>
	</div>

	<!-- Range Filter -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('expenses.analytics') }}" class="d-flex align-items-end gap-3">
				<div>
					<label class="form-label">Date Range</label>
					<select name="range" class="form-select" onchange="this.form.submit()">
						<option value="30" @selected($range === '30')>Last 30 Days</option>
						<option value="180" @selected($range === '180')>Last 6 Months</option>
						<option value="365" @selected($range === '365')>Last 12 Months</option>
						<option value="all" @selected($range === 'all')>All Time</option>
					</select>
				</div>
				<div class="ms-auto text-end">
					<p class="mb-0 fs-13 text-muted">Total Spend (selected range)</p>
					<h4 class="mb-0">₹{{ number_format($totalInRange, 2) }}</h4>
				</div>
			</form>
		</div>
	</div>
	<!-- End Range Filter -->

	<div class="row">
		<!-- Recent Expenses -->
		<div class="col-xl-6 mb-3">
			<div class="card h-100">
				<div class="card-header">
					<h5 class="mb-0 fs-16 fw-bold">Recent Expenses</h5>
				</div>
				<div class="card-body p-0">
					<div class="table-responsive">
						<table class="table table-borderless mb-0">
							<thead class="table-white">
								<tr>
									<th>Expense</th>
									<th>Category</th>
									<th>Date</th>
									<th class="text-end">Amount</th>
								</tr>
							</thead>
							<tbody>
								@forelse ($recentExpenses as $expense)
									<tr>
										<td>
											<p class="mb-0 fw-medium">{{ $expense->title }}</p>
											@if ($expense->vendor)
												<p class="mb-0 fs-12 text-muted">{{ $expense->vendor }}</p>
											@endif
										</td>
										<td><span class="badge badge-soft-info">{{ $expense->category }}</span></td>
										<td class="fs-13 text-muted">{{ $expense->expense_date->format('d M Y') }}</td>
										<td class="text-end fw-medium">₹{{ number_format($expense->amount, 2) }}</td>
									</tr>
								@empty
									<tr>
										<td colspan="4" class="text-center py-4 text-muted">No expenses in this range.</td>
									</tr>
								@endforelse
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- End Recent Expenses -->

		<!-- Spend By Category -->
		<div class="col-xl-6 mb-3">
			<div class="card h-100">
				<div class="card-header">
					<h5 class="mb-0 fs-16 fw-bold">Spend By Category</h5>
				</div>
				<div class="card-body">
					<canvas id="categoryChart" height="220"></canvas>
				</div>
			</div>
		</div>
		<!-- End Spend By Category -->
	</div>

	<div class="row">
		<!-- Top Vendors -->
		<div class="col-xl-6 mb-3">
			<div class="card h-100">
				<div class="card-header">
					<h5 class="mb-0 fs-16 fw-bold">Top Vendors By Spend</h5>
				</div>
				<div class="card-body">
					<canvas id="vendorChart" height="220"></canvas>
				</div>
			</div>
		</div>
		<!-- End Top Vendors -->

		<!-- Monthly Trend -->
		<div class="col-xl-6 mb-3">
			<div class="card h-100">
				<div class="card-header">
					<h5 class="mb-0 fs-16 fw-bold">6-Month Spend Trend</h5>
				</div>
				<div class="card-body">
					<canvas id="trendChart" height="220"></canvas>
				</div>
			</div>
		</div>
		<!-- End Monthly Trend -->
	</div>

@endsection

@push('scripts')
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
	<script>
		new Chart(document.getElementById('categoryChart'), {
			type: 'bar',
			data: {
				labels: @json($spendByCategory->pluck('category')),
				datasets: [{
					label: 'Spend',
					data: @json($spendByCategory->pluck('total')),
					backgroundColor: '#2dd4bf',
					borderRadius: 4,
				}],
			},
			options: {
				responsive: true,
				plugins: { legend: { display: false } },
				scales: { y: { beginAtZero: true } },
			},
		});

		new Chart(document.getElementById('vendorChart'), {
			type: 'bar',
			data: {
				labels: @json($topVendors->pluck('vendor')),
				datasets: [{
					label: 'Spend',
					data: @json($topVendors->pluck('total')),
					backgroundColor: '#4ade80',
					borderRadius: 4,
				}],
			},
			options: {
				indexAxis: 'y',
				responsive: true,
				plugins: { legend: { display: false } },
				scales: { x: { beginAtZero: true } },
			},
		});

		new Chart(document.getElementById('trendChart'), {
			type: 'line',
			data: {
				labels: @json($trendLabels),
				datasets: [{
					label: 'Total Spend',
					data: @json($trendData),
					borderColor: '#e63946',
					backgroundColor: 'rgba(230,57,70,0.08)',
					fill: true,
					tension: 0.35,
					pointRadius: 3,
				}],
			},
			options: {
				responsive: true,
				plugins: { legend: { display: false } },
				scales: { y: { beginAtZero: true } },
			},
		});
	</script>
@endpush