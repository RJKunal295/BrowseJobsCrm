@extends('layouts.app')

@section('title', 'Social Analytics')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Social Analytics</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Social Analytics</span>
			</nav>
		</div>
		<a href="{{ route('social-dashboard.index') }}" class="btn btn-outline-light">
			<i class="ti ti-chart-line me-1"></i> Per-account view
		</a>
	</div>

	<!-- Filters -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('social-analytics.index') }}" class="row g-3 align-items-end">
				<div class="col-md-3">
					<label class="form-label">Date range</label>
					<select name="days" class="form-select" onchange="this.form.submit()">
						<option value="7" @selected($days == 7)>Last 7 days</option>
						<option value="30" @selected($days == 30)>Last 30 days</option>
						<option value="90" @selected($days == 90)>Last 90 days</option>
						<option value="365" @selected($days == 365)>Last 12 months</option>
					</select>
				</div>
				<div class="col-md-3">
					<label class="form-label">Platform</label>
					<select name="platform" class="form-select" onchange="this.form.submit()">
						<option value="">All platforms</option>
						@foreach ($platforms as $p)
							<option value="{{ $p }}" @selected($platform === $p)>{{ ucfirst($p) }}</option>
						@endforeach
					</select>
				</div>
			</form>
		</div>
	</div>

	@unless ($hasData)
		<div class="alert alert-info">
			No follower snapshots in this range yet. Data is collected by <code>social:fetch-stats</code> — it builds up
			day by day. Try a wider date range.
		</div>
	@else
		<!-- Overview cards -->
		<div class="row mb-3">
			<div class="col-md-3 col-sm-6 mb-3">
				<div class="card h-100"><div class="card-body position-relative">
					<p class="fw-medium mb-1">Total Followers</p>
					<h4 class="mb-0">{{ number_format($totalFollowers) }}</h4>
					<span class="avatar avatar-rounded bg-primary-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-users text-primary"></i></span>
				</div></div>
			</div>
			<div class="col-md-3 col-sm-6 mb-3">
				<div class="card h-100"><div class="card-body position-relative">
					<p class="fw-medium mb-1">Net Growth ({{ $days }}d)</p>
					<h4 class="mb-0 {{ $netGrowth >= 0 ? 'text-success' : 'text-danger' }}">
						<i class="ti {{ $netGrowth >= 0 ? 'ti-trending-up' : 'ti-trending-down' }} me-1"></i>{{ $netGrowth >= 0 ? '+' : '' }}{{ number_format($netGrowth) }}
					</h4>
					<span class="avatar avatar-rounded {{ $netGrowth >= 0 ? 'bg-success-transparent' : 'bg-danger-transparent' }} position-absolute top-0 end-0 m-3">
						<i class="ti ti-chart-line {{ $netGrowth >= 0 ? 'text-success' : 'text-danger' }}"></i>
					</span>
				</div></div>
			</div>
			<div class="col-md-3 col-sm-6 mb-3">
				<div class="card h-100"><div class="card-body position-relative">
					<p class="fw-medium mb-1">Growing</p>
					<h4 class="mb-0 text-success">{{ $growing }}</h4>
					<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-arrow-up-right text-success"></i></span>
				</div></div>
			</div>
			<div class="col-md-3 col-sm-6 mb-3">
				<div class="card h-100"><div class="card-body position-relative">
					<p class="fw-medium mb-1">Declining</p>
					<h4 class="mb-0 text-danger">{{ $declining }}</h4>
					<span class="avatar avatar-rounded bg-danger-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-arrow-down-right text-danger"></i></span>
				</div></div>
			</div>
		</div>

		<!-- Follower trend -->
		<div class="card mb-3">
			<div class="card-header"><h6 class="mb-0">Follower Growth Trend</h6></div>
			<div class="card-body">
				<div id="followerTrendChart"></div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-5 mb-3">
				<div class="card h-100">
					<div class="card-header"><h6 class="mb-0">Net Change by Account</h6></div>
					<div class="card-body">
						<div id="netGrowthChart"></div>
					</div>
				</div>
			</div>

			<div class="col-lg-7 mb-3">
				<div class="card h-100">
					<div class="card-header"><h6 class="mb-0">Account Performance</h6></div>
					<div class="card-body">
						<div class="table-responsive custom-table">
							<table class="table table-bordered table-nowrap">
								<thead class="table-white">
									<tr><th>Account</th><th>Platform</th><th>Followers</th><th>Change</th><th>Reach</th></tr>
								</thead>
								<tbody>
									@foreach ($rows as $row)
										<tr>
											<td>{{ $row['label'] }}</td>
											<td class="text-capitalize">{{ $row['platform'] }}</td>
											<td>{{ number_format($row['current']) }}</td>
											<td>
												@if ($row['trend'] === 'up')
													<span class="text-success"><i class="ti ti-arrow-up-right"></i> +{{ number_format($row['change']) }} ({{ $row['change_pct'] }}%)</span>
												@elseif ($row['trend'] === 'down')
													<span class="text-danger"><i class="ti ti-arrow-down-right"></i> {{ number_format($row['change']) }} ({{ $row['change_pct'] }}%)</span>
												@else
													<span class="text-muted">— 0</span>
												@endif
											</td>
											<td>{{ number_format($row['reach']) }}</td>
										</tr>
									@endforeach
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Insights & Recommendations -->
		<div class="card mb-3">
			<div class="card-header d-flex align-items-center gap-2">
				<i class="ti ti-bulb text-warning"></i>
				<h6 class="mb-0">Why followers change & what to do</h6>
			</div>
			<div class="card-body">
				<div class="row">
					@foreach ($accountInsights as $ins)
						<div class="col-lg-6 mb-3">
							<div class="border rounded p-3 h-100">
								<div class="d-flex align-items-center justify-content-between mb-2">
									<h6 class="mb-0">{{ $ins['label'] }}
										<span class="badge badge-soft-secondary text-capitalize ms-1">{{ $ins['platform'] }}</span>
									</h6>
									@if ($ins['status'] === 'up')
										<span class="badge badge-soft-success"><i class="ti ti-trending-up"></i> +{{ number_format($ins['follower_change']) }} ({{ $ins['follower_pct'] }}%)</span>
									@elseif ($ins['status'] === 'down')
										<span class="badge badge-soft-danger"><i class="ti ti-trending-down"></i> {{ number_format($ins['follower_change']) }} ({{ $ins['follower_pct'] }}%)</span>
									@else
										<span class="badge badge-soft-secondary">No change</span>
									@endif
								</div>

								<div class="fs-12 text-muted mb-2">
									Posts: <strong>{{ $ins['posts_in_window'] }}</strong> (~{{ $ins['per_week'] }}/wk) ·
									Reach trend: <strong class="{{ $ins['reach_pct'] >= 0 ? 'text-success' : 'text-danger' }}">{{ $ins['reach_pct'] >= 0 ? '+' : '' }}{{ $ins['reach_pct'] }}%</strong> ·
									Avg reach: <strong>{{ number_format($ins['avg_reach']) }}</strong>
								</div>

								<div class="mb-2">
									<div class="fw-medium fs-13 mb-1"><i class="ti ti-alert-triangle text-danger me-1"></i>Likely reasons</div>
									@foreach ($ins['reasons'] as $reason)
										@php $rc = ['high' => 'danger', 'medium' => 'warning', 'low' => 'secondary', 'success' => 'success'][$reason['severity']] ?? 'secondary'; @endphp
										<div class="fs-13 mb-1"><span class="badge badge-soft-{{ $rc }} me-1">•</span>{{ $reason['text'] }}</div>
									@endforeach
								</div>

								<div>
									<div class="fw-medium fs-13 mb-1"><i class="ti ti-checklist text-primary me-1"></i>What to create / do</div>
									<ul class="fs-13 mb-0 ps-3">
										@foreach ($ins['recommendations'] as $rec)
											<li>{{ $rec }}</li>
										@endforeach
									</ul>
								</div>

								@if (! empty($ins['content_performance']))
									<div class="mt-2 pt-2 border-top">
										<div class="fw-medium fs-13 mb-1"><i class="ti ti-photo text-info me-1"></i>Your content performance</div>
										<table class="table table-sm fs-12 mb-0">
											<thead><tr><th>Type</th><th>Posts</th><th>Avg likes</th><th>Avg comments</th><th>Avg views</th></tr></thead>
											<tbody>
												@foreach ($ins['content_performance'] as $cp)
													<tr><td>{{ $cp['type'] }}</td><td>{{ $cp['count'] }}</td><td>{{ number_format($cp['avg_likes']) }}</td><td>{{ number_format($cp['avg_comments']) }}</td><td>{{ number_format($cp['avg_views']) }}</td></tr>
												@endforeach
											</tbody>
										</table>
									</div>
								@endif
							</div>
						</div>
					@endforeach
				</div>
			</div>
		</div>

		<!-- Reach playbook -->
		<div class="card mb-3">
			<div class="card-header d-flex align-items-center gap-2">
				<i class="ti ti-rocket text-primary"></i>
				<h6 class="mb-0">What matters most to increase your reach</h6>
			</div>
			<div class="card-body">
				<div class="row">
					@foreach ($reachFactors as $i => $factor)
						<div class="col-md-6 mb-3">
							<div class="d-flex gap-2">
								<span class="avatar avatar-sm avatar-rounded bg-primary-transparent flex-shrink-0">{{ $i + 1 }}</span>
								<div>
									<div class="fw-medium">{{ $factor['title'] }}</div>
									<div class="fs-13 text-muted">{{ $factor['detail'] }}</div>
								</div>
							</div>
						</div>
					@endforeach
				</div>
			</div>
		</div>
	@endunless

@endsection

@push('scripts')
	<script>
		document.addEventListener('DOMContentLoaded', function () {
			const trendEl = document.getElementById('followerTrendChart');
			if (!trendEl || typeof ApexCharts === 'undefined') return;

			// ---- Follower growth trend (multi-account line) ----
			new ApexCharts(trendEl, {
				chart: { type: 'line', height: 340, toolbar: { show: false }, animations: { enabled: true } },
				series: @json($series),
				colors: @json(collect($series)->pluck('color')),
				stroke: { curve: 'smooth', width: 3 },
				markers: { size: 4, hover: { size: 6 } },
				xaxis: { type: 'datetime', labels: { datetimeUTC: false } },
				yaxis: { labels: { formatter: v => Math.round(v).toLocaleString() } },
				tooltip: { x: { format: 'dd MMM yyyy' }, shared: true },
				legend: { position: 'top' },
				grid: { borderColor: '#eef0f3' },
			}).render();

			// ---- Net change by account (bar, green up / red down) ----
			const bars = @json($growthBars);
			const netEl = document.getElementById('netGrowthChart');
			if (netEl) {
				new ApexCharts(netEl, {
					chart: { type: 'bar', height: 340, toolbar: { show: false } },
					series: [{ name: 'Net change', data: bars.map(b => b.change) }],
					plotOptions: { bar: { horizontal: true, distributed: true, borderRadius: 4 } },
					colors: bars.map(b => b.change >= 0 ? '#198754' : '#dc3545'),
					xaxis: { categories: bars.map(b => b.label) },
					dataLabels: { enabled: true, formatter: v => (v >= 0 ? '+' : '') + Math.round(v).toLocaleString() },
					legend: { show: false },
					grid: { borderColor: '#eef0f3' },
				}).render();
			}
		});
	</script>
@endpush
