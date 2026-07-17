@extends('layouts.app')

@section('title', 'Incentives & Bonuses')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Incentives &amp; Bonuses</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt;
				<a href="{{ route('finance.dashboard') }}" class="text-muted">Office Finance</a> &gt; <span>Incentives &amp; Bonuses</span>
			</nav>
		</div>
		<button type="button" class="btn btn-primary" onclick="openIncentiveModal()"><i class="ti ti-plus me-1"></i> Award Incentive / Bonus</button>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif

	<!-- Stat cards -->
	<div class="row mb-3">
		<div class="col-md-3 col-sm-6 mb-3"><div class="card h-100"><div class="card-body position-relative">
			<p class="fw-medium mb-1">Total Incentives</p><h4 class="mb-0 text-success">₹{{ number_format($totalIncentive) }}</h4>
			<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-trophy text-success"></i></span>
		</div></div></div>
		<div class="col-md-3 col-sm-6 mb-3"><div class="card h-100"><div class="card-body position-relative">
			<p class="fw-medium mb-1">Total Bonuses</p><h4 class="mb-0 text-info">₹{{ number_format($totalBonus) }}</h4>
			<span class="avatar avatar-rounded bg-info-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-gift text-info"></i></span>
		</div></div></div>
		<div class="col-md-3 col-sm-6 mb-3"><div class="card h-100"><div class="card-body position-relative">
			<p class="fw-medium mb-1">Pending Approval</p><h4 class="mb-0 text-warning">₹{{ number_format($pendingAmount) }}</h4>
			<span class="avatar avatar-rounded bg-warning-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-clock text-warning"></i></span>
		</div></div></div>
		<div class="col-md-3 col-sm-6 mb-3"><div class="card h-100"><div class="card-body position-relative">
			<p class="fw-medium mb-1">This Month</p><h4 class="mb-0">₹{{ number_format($thisMonth) }}</h4>
			<span class="avatar avatar-rounded bg-primary-transparent position-absolute top-0 end-0 m-3"><i class="ti ti-calendar text-primary"></i></span>
		</div></div></div>
	</div>

	<!-- Filters -->
	<div class="card mb-3"><div class="card-body">
		<form method="GET" action="{{ route('incentives.index') }}" class="row g-2 align-items-end">
			<div class="col-md-3">
				<label class="form-label">Employee</label>
				<select name="user_id" class="form-select form-select-sm">
					<option value="">All</option>
					@foreach ($users as $u)<option value="{{ $u->id }}" @selected((string) request('user_id') === (string) $u->id)>{{ $u->full_name }}</option>@endforeach
				</select>
			</div>
			<div class="col-md-2">
				<label class="form-label">Type</label>
				<select name="type" class="form-select form-select-sm">
					<option value="">All</option>
					<option value="incentive" @selected(request('type') === 'incentive')>Incentive</option>
					<option value="bonus" @selected(request('type') === 'bonus')>Bonus</option>
				</select>
			</div>
			<div class="col-md-2">
				<label class="form-label">Status</label>
				<select name="status" class="form-select form-select-sm">
					<option value="">All</option>
					<option value="pending" @selected(request('status') === 'pending')>Pending</option>
					<option value="approved" @selected(request('status') === 'approved')>Approved</option>
					<option value="paid" @selected(request('status') === 'paid')>Paid</option>
				</select>
			</div>
			<div class="col-md-2">
				<label class="form-label">Month</label>
				<select name="month" class="form-select form-select-sm">
					<option value="">All</option>
					@foreach (range(1, 12) as $m)<option value="{{ $m }}" @selected((string) request('month') === (string) $m)>{{ \Illuminate\Support\Carbon::create(null, $m, 1)->format('M') }}</option>@endforeach
				</select>
			</div>
			<div class="col-md-3 d-flex gap-2">
				<button type="submit" class="btn btn-sm btn-primary"><i class="ti ti-filter"></i></button>
				<a href="{{ route('incentives.index') }}" class="btn btn-sm btn-outline-light">Reset</a>
			</div>
		</form>
	</div></div>

	<div class="card"><div class="card-body">
		<div class="table-responsive custom-table">
			<table class="table table-bordered table-nowrap">
				<thead class="table-white">
					<tr><th>Employee</th><th>Type</th><th>Basis</th><th>Qty × Rate</th><th>Amount</th><th>Period</th><th>Status</th><th>Action</th></tr>
				</thead>
				<tbody>
					@php $statusColors = ['pending' => 'badge-soft-warning', 'approved' => 'badge-soft-info', 'paid' => 'badge-soft-success']; @endphp
					@forelse ($records as $r)
						@php $payload = ['id' => $r->id, 'user_id' => $r->user_id, 'type' => $r->type, 'basis' => $r->basis, 'quantity' => $r->quantity, 'rate' => $r->rate, 'amount' => $r->amount, 'period_month' => $r->period_month, 'period_year' => $r->period_year, 'status' => $r->status, 'notes' => $r->notes]; @endphp
						<tr>
							<td>{{ $r->user->full_name ?? '—' }}</td>
							<td><span class="badge {{ $r->type === 'bonus' ? 'badge-soft-info' : 'badge-soft-success' }}">{{ ucfirst($r->type) }}</span></td>
							<td class="fs-13">{{ $r->basis ?: '—' }}</td>
							<td class="fs-13">{{ $r->quantity && $r->rate ? rtrim(rtrim($r->quantity, '0'), '.').' × ₹'.number_format($r->rate) : '—' }}</td>
							<td><strong>₹{{ number_format($r->amount) }}</strong></td>
							<td class="fs-13">{{ $r->periodLabel() }}</td>
							<td>
								<div class="dropdown">
									<span class="badge {{ $statusColors[$r->status] }}" data-bs-toggle="dropdown" style="cursor:pointer;">{{ ucfirst($r->status) }} <i class="ti ti-chevron-down"></i></span>
									<ul class="dropdown-menu">
										@foreach (['pending', 'approved', 'paid'] as $st)
											<li><form method="POST" action="{{ route('incentives.status', $r) }}">@csrf @method('PATCH')<input type="hidden" name="status" value="{{ $st }}"><button class="dropdown-item">{{ ucfirst($st) }}</button></form></li>
										@endforeach
									</ul>
								</div>
							</td>
							<td>
								<div class="d-flex gap-2">
									<button type="button" class="btn btn-sm btn-icon btn-outline-light" onclick='openIncentiveModal(@json($payload))'><i class="ti ti-edit"></i></button>
									<form method="POST" action="{{ route('incentives.destroy', $r) }}" onsubmit="return confirm('Delete this record?');">@csrf @method('DELETE')<button class="btn btn-sm btn-icon btn-outline-danger"><i class="ti ti-trash"></i></button></form>
								</div>
							</td>
						</tr>
					@empty
						<tr><td colspan="8" class="text-center py-4">No incentive/bonus records yet.</td></tr>
					@endforelse
				</tbody>
			</table>
		</div>
		<div class="mt-3">{{ $records->links() }}</div>
	</div></div>

	<!-- Add/Edit Modal -->
	<div class="modal fade" id="incentiveModal" tabindex="-1"><div class="modal-dialog modal-lg"><div class="modal-content">
		<form method="POST" id="incentiveForm" action="{{ route('incentives.store') }}">
			@csrf
			<div id="incentiveMethod"></div>
			<div class="modal-header"><h5 class="modal-title" id="incentiveTitle">Award Incentive / Bonus</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
			<div class="modal-body">
				<div class="row g-3">
					<div class="col-md-6">
						<label class="form-label">Employee <span class="text-danger">*</span></label>
						<select name="user_id" id="in_user" class="form-select" required>
							<option value="">Select...</option>
							@foreach ($users as $u)<option value="{{ $u->id }}">{{ $u->full_name }}</option>@endforeach
						</select>
					</div>
					<div class="col-md-3">
						<label class="form-label">Type</label>
						<select name="type" id="in_type" class="form-select">
							<option value="incentive">Incentive</option>
							<option value="bonus">Bonus</option>
						</select>
					</div>
					<div class="col-md-3">
						<label class="form-label">Basis</label>
						<input type="text" name="basis" id="in_basis" class="form-control" list="basisList" placeholder="e.g. per lead">
						<datalist id="basisList">
							<option value="per_lead"><option value="per_call"><option value="target_achieved">
							<option value="referral"><option value="festival_bonus"><option value="manual">
						</datalist>
					</div>
					<div class="col-md-3">
						<label class="form-label">Quantity</label>
						<input type="number" step="0.01" min="0" name="quantity" id="in_qty" class="form-control" placeholder="e.g. 12 leads" oninput="calcAmount()">
					</div>
					<div class="col-md-3">
						<label class="form-label">Rate (₹)</label>
						<input type="number" step="0.01" min="0" name="rate" id="in_rate" class="form-control" placeholder="per unit" oninput="calcAmount()">
					</div>
					<div class="col-md-3">
						<label class="form-label">Amount (₹) <span class="text-danger">*</span></label>
						<input type="number" step="0.01" min="0" name="amount" id="in_amount" class="form-control" required>
						<div class="form-text">Auto-fills from Qty × Rate; you can override.</div>
					</div>
					<div class="col-md-3">
						<label class="form-label">Status</label>
						<select name="status" id="in_status" class="form-select">
							<option value="pending">Pending</option>
							<option value="approved">Approved</option>
							<option value="paid">Paid</option>
						</select>
					</div>
					<div class="col-md-3">
						<label class="form-label">Month</label>
						<select name="period_month" id="in_month" class="form-select">
							@foreach (range(1, 12) as $m)<option value="{{ $m }}" @selected($m === now()->month)>{{ \Illuminate\Support\Carbon::create(null, $m, 1)->format('F') }}</option>@endforeach
						</select>
					</div>
					<div class="col-md-3">
						<label class="form-label">Year</label>
						<input type="number" name="period_year" id="in_year" class="form-control" value="{{ now()->year }}" min="2000" max="2100">
					</div>
					<div class="col-md-12">
						<label class="form-label">Notes</label>
						<textarea name="notes" id="in_notes" rows="2" class="form-control" placeholder="Reason / reference..."></textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
				<button type="submit" class="btn btn-primary"><i class="ti ti-device-floppy me-1"></i> Save</button>
			</div>
		</form>
	</div></div></div>

@endsection

@push('scripts')
	<script>
		function calcAmount() {
			const q = parseFloat(document.getElementById('in_qty').value) || 0;
			const r = parseFloat(document.getElementById('in_rate').value) || 0;
			if (q > 0 && r > 0) document.getElementById('in_amount').value = (q * r).toFixed(2);
		}

		function openIncentiveModal(rec) {
			const form = document.getElementById('incentiveForm');
			const method = document.getElementById('incentiveMethod');
			const title = document.getElementById('incentiveTitle');

			if (rec) {
				title.textContent = 'Edit Record';
				form.action = `/incentives/${rec.id}`;
				method.innerHTML = '@method('PATCH')';
				document.getElementById('in_user').value = rec.user_id || '';
				document.getElementById('in_type').value = rec.type || 'incentive';
				document.getElementById('in_basis').value = rec.basis || '';
				document.getElementById('in_qty').value = rec.quantity || '';
				document.getElementById('in_rate').value = rec.rate || '';
				document.getElementById('in_amount').value = rec.amount || '';
				document.getElementById('in_status').value = rec.status || 'pending';
				document.getElementById('in_month').value = rec.period_month || {{ now()->month }};
				document.getElementById('in_year').value = rec.period_year || {{ now()->year }};
				document.getElementById('in_notes').value = rec.notes || '';
			} else {
				title.textContent = 'Award Incentive / Bonus';
				form.action = "{{ route('incentives.store') }}";
				method.innerHTML = '';
				form.reset();
			}
			new bootstrap.Modal(document.getElementById('incentiveModal')).show();
		}
	</script>
@endpush
