@extends('layouts.app')

@section('title', 'Payroll')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Payroll</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt;
				<a href="{{ route('finance.dashboard') }}" class="text-muted">Office Finance</a> &gt; <span>Payroll</span>
			</nav>
		</div>
		<div class="d-flex gap-2">
			<a href="{{ route('incentives.index') }}" class="btn btn-outline-primary"><i class="ti ti-trophy me-1"></i> Incentives &amp; Bonuses</a>
			<a href="{{ route('finance.dashboard') }}" class="btn btn-outline-light"><i class="ti ti-arrow-left me-1"></i> Back</a>
		</div>
	</div>

	<div class="alert alert-info fs-13">
		<i class="ti ti-info-circle me-1"></i> Salary is a fixed monthly amount edited here. <strong>Incentives and bonuses are earned per performance</strong> — add them in
		<a href="{{ route('incentives.index') }}">Incentives &amp; Bonuses</a>; the totals below are pulled from those records.
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif

	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('finance.payroll') }}" class="d-flex gap-2">
				<input type="text" name="search" class="form-control" placeholder="Search name or employee ID..." value="{{ request('search') }}">
				<button type="submit" class="btn btn-primary"><i class="ti ti-search"></i></button>
			</form>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Employee</th><th>Role</th><th>Salary</th><th>Incentive</th><th>Bonus</th><th>Total</th><th>Action</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($users as $user)
							@php
								$incentive = (float) ($incentiveByUser[$user->id] ?? 0);
								$bonus = (float) ($bonusByUser[$user->id] ?? 0);
								$total = (float) $user->salary + $incentive + $bonus;
								$payload = ['id' => $user->id, 'name' => $user->full_name, 'salary' => (float) $user->salary];
							@endphp
							<tr>
								<td>{{ $user->full_name }}<div class="fs-12 text-muted">{{ $user->employee_id }}</div></td>
								<td>{{ $user->role->role_name ?? '—' }}</td>
								<td>₹{{ number_format((float) $user->salary) }}</td>
								<td class="text-success">₹{{ number_format($incentive) }}</td>
								<td class="text-info">₹{{ number_format($bonus) }}</td>
								<td><strong>₹{{ number_format($total) }}</strong></td>
								<td>
									<button type="button" class="btn btn-sm btn-icon btn-outline-light" title="Edit salary"
										onclick='openPayrollModal(@json($payload))'>
										<i class="ti ti-edit"></i>
									</button>
								</td>
							</tr>
						@empty
							<tr><td colspan="7" class="text-center py-4">No employees found.</td></tr>
						@endforelse
					</tbody>
				</table>
			</div>
			<div class="mt-3">{{ $users->links() }}</div>
		</div>
	</div>

	<!-- Edit Payroll Modal -->
	<div class="modal fade" id="payrollModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" id="payrollForm">
					@csrf
					@method('PATCH')
					<div class="modal-header">
						<h5 class="modal-title">Edit Salary — <span id="payrollName"></span></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<div class="mb-2">
							<label class="form-label">Monthly Salary (₹) <span class="text-danger">*</span></label>
							<input type="number" step="0.01" min="0" name="salary" id="pf_salary" class="form-control" required>
						</div>
						<p class="fs-12 text-muted mb-0">Incentives &amp; bonuses are performance-based — add them in
							<a href="{{ route('incentives.index') }}">Incentives &amp; Bonuses</a>.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary"><i class="ti ti-device-floppy me-1"></i> Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>

@endsection

@push('scripts')
	<script>
		function openPayrollModal(u) {
			const form = document.getElementById('payrollForm');
			form.action = `/office-finance/payroll/${u.id}`;
			document.getElementById('payrollName').textContent = u.name;
			document.getElementById('pf_salary').value = u.salary || 0;
			new bootstrap.Modal(document.getElementById('payrollModal')).show();
		}
	</script>
@endpush
