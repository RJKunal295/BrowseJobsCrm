@extends('layouts.app')

@section('title', 'Office Finance')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Office Finance</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Finance Overview</span>
			</nav>
		</div>
		<div class="d-flex gap-2">
			<a href="{{ route('finance.payroll') }}" class="btn btn-outline-primary"><i class="ti ti-cash me-1"></i> Manage Payroll</a>
			<a href="{{ route('expenses.index') }}" class="btn btn-primary"><i class="ti ti-report-money me-1"></i> Office Expenses</a>
		</div>
	</div>

	<!-- Top stat cards -->
	<div class="row mb-3">
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Total Outflow</p>
				<h4 class="mb-0">₹{{ number_format($totalOutflow) }}</h4>
				<span class="fs-12 text-muted">Payroll + Expenses</span>
				<span class="avatar avatar-rounded bg-danger-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-arrow-bar-to-down text-danger"></i></span>
			</div></div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Total Payroll</p>
				<h4 class="mb-0">₹{{ number_format($totalPayroll) }}</h4>
				<span class="fs-12 text-muted">Salary + Incentive + Bonus</span>
				<span class="avatar avatar-rounded bg-primary-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-users text-primary"></i></span>
			</div></div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">Office Expenses</p>
				<h4 class="mb-0">₹{{ number_format($totalExpenses) }}</h4>
				<span class="fs-12 text-muted">₹{{ number_format($pendingExpenses) }} pending</span>
				<span class="avatar avatar-rounded bg-warning-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-receipt text-warning"></i></span>
			</div></div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100"><div class="card-body position-relative">
				<p class="fw-medium mb-1">This Month Spend</p>
				<h4 class="mb-0">₹{{ number_format($thisMonthExpenses) }}</h4>
				<span class="fs-12 text-muted">{{ now()->format('F Y') }}</span>
				<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-calendar text-success"></i></span>
			</div></div>
		</div>
	</div>

	<!-- Money flow -->
	@php
		$payrollPct = $totalOutflow > 0 ? round($totalPayroll / $totalOutflow * 100, 1) : 0;
		$expensePct = $totalOutflow > 0 ? round($totalExpenses / $totalOutflow * 100, 1) : 0;
	@endphp
	<div class="card mb-3">
		<div class="card-header"><h6 class="mb-0"><i class="ti ti-git-fork me-1 text-primary"></i> Money Flow</h6></div>
		<div class="card-body">
			<div class="row align-items-stretch g-3">
				<div class="col-lg-3">
					<div class="rounded p-3 text-white h-100 d-flex flex-column justify-content-center" style="background:linear-gradient(135deg,#dc3545,#b02a37);">
						<div class="fs-13 opacity-75">Total Outflow</div>
						<div class="h3 mb-0">₹{{ number_format($totalOutflow) }}</div>
					</div>
				</div>
				<div class="col-lg-1 d-none d-lg-flex align-items-center justify-content-center">
					<i class="ti ti-arrow-right fs-2 text-muted"></i>
				</div>
				<div class="col-lg-8">
					<div class="mb-3">
						<div class="d-flex justify-content-between fs-13 mb-1">
							<span><i class="ti ti-users text-primary me-1"></i><strong>Payroll</strong></span>
							<span>₹{{ number_format($totalPayroll) }} · {{ $payrollPct }}%</span>
						</div>
						<div class="progress mb-1" style="height:10px;"><div class="progress-bar bg-primary" style="width:{{ $payrollPct }}%"></div></div>
						<div class="fs-12 text-muted">Salaries ₹{{ number_format($totalSalary) }} · Incentives ₹{{ number_format($totalIncentive) }} · Bonus ₹{{ number_format($totalBonus) }}</div>
					</div>
					<div>
						<div class="d-flex justify-content-between fs-13 mb-1">
							<span><i class="ti ti-receipt text-warning me-1"></i><strong>Office Expenses</strong></span>
							<span>₹{{ number_format($totalExpenses) }} · {{ $expensePct }}%</span>
						</div>
						<div class="progress mb-1" style="height:10px;"><div class="progress-bar bg-warning" style="width:{{ $expensePct }}%"></div></div>
						<div class="fs-12 text-muted">Paid ₹{{ number_format($paidExpenses) }} · Pending ₹{{ number_format($pendingExpenses) }}</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Charts -->
	<div class="row">
		<div class="col-lg-5 mb-3">
			<div class="card h-100">
				<div class="card-header"><h6 class="mb-0">Outflow Composition</h6></div>
				<div class="card-body"><div id="outflowChart"></div></div>
			</div>
		</div>
		<div class="col-lg-4 mb-3">
			<div class="card h-100">
				<div class="card-header"><h6 class="mb-0">Expenses by Category</h6></div>
				<div class="card-body"><div id="categoryChart"></div></div>
			</div>
		</div>
		<div class="col-lg-3 mb-3">
			<div class="card h-100">
				<div class="card-header"><h6 class="mb-0">Payroll Split</h6></div>
				<div class="card-body">
					<div class="mb-2 d-flex justify-content-between"><span class="fs-13">Salaries</span><strong>₹{{ number_format($totalSalary) }}</strong></div>
					<div class="mb-2 d-flex justify-content-between"><span class="fs-13">Incentives</span><strong class="text-success">₹{{ number_format($totalIncentive) }}</strong></div>
					<div class="mb-2 d-flex justify-content-between"><span class="fs-13">Bonus</span><strong class="text-info">₹{{ number_format($totalBonus) }}</strong></div>
					<hr>
					<div class="d-flex justify-content-between"><span class="fw-medium">Total</span><strong>₹{{ number_format($totalPayroll) }}</strong></div>
				</div>
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-header"><h6 class="mb-0">Expense Trend — last 6 months</h6></div>
		<div class="card-body"><div id="trendChart"></div></div>
	</div>

@endsection

@push('scripts')
	<script>
		document.addEventListener('DOMContentLoaded', function () {
			if (typeof ApexCharts === 'undefined') return;
			const inr = v => '₹' + Math.round(v).toLocaleString('en-IN');

			new ApexCharts(document.getElementById('outflowChart'), {
				chart: { type: 'donut', height: 300 },
				series: @json($outflowComposition['data']),
				labels: @json($outflowComposition['labels']),
				colors: ['#0d6efd', '#198754', '#0dcaf0', '#ffc107'],
				legend: { position: 'bottom' },
				dataLabels: { formatter: (val) => val.toFixed(1) + '%' },
				tooltip: { y: { formatter: inr } },
				plotOptions: { pie: { donut: { labels: { show: true, total: { show: true, label: 'Outflow', formatter: () => inr({{ (int) $totalOutflow }}) } } } } },
			}).render();

			new ApexCharts(document.getElementById('categoryChart'), {
				chart: { type: 'pie', height: 300 },
				series: @json($expensesByCategory['data']),
				labels: @json($expensesByCategory['labels']),
				legend: { position: 'bottom' },
				tooltip: { y: { formatter: inr } },
			}).render();

			new ApexCharts(document.getElementById('trendChart'), {
				chart: { type: 'bar', height: 300, toolbar: { show: false } },
				series: [{ name: 'Expenses', data: @json($trendData) }],
				xaxis: { categories: @json($trendLabels) },
				colors: ['#dc3545'],
				plotOptions: { bar: { borderRadius: 4, columnWidth: '45%' } },
				dataLabels: { enabled: false },
				yaxis: { labels: { formatter: inr } },
				tooltip: { y: { formatter: inr } },
				grid: { borderColor: '#eef0f3' },
			}).render();
		});
	</script>
@endpush
