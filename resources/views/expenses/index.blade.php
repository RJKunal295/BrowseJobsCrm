@extends('layouts.app')

@section('title', 'Office Expenses')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Office Expenses</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Payments / Expenses</span>
			</nav>
		</div>
		<button type="button" class="btn btn-primary" onclick="openExpenseModal()">
			<i class="ti ti-plus me-1"></i> Add Expense
		</button>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	<!-- Stat Cards -->
	<div class="row mb-3">
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Total Spend</p>
					<h4 class="mb-0">₹{{ number_format($totalSpend, 2) }}</h4>
					<span class="avatar avatar-rounded bg-danger-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-report-money text-danger"></i>
					</span>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">This Month</p>
					<h4 class="mb-0">₹{{ number_format($thisMonth, 2) }}</h4>
					<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-calendar text-success"></i>
					</span>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Pending</p>
					<h4 class="mb-0">₹{{ number_format($pending, 2) }}</h4>
					<span class="avatar avatar-rounded bg-warning-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-clock text-warning"></i>
					</span>
				</div>
			</div>
		</div>
		<div class="col-md-3 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Categories</p>
					<h4 class="mb-0">{{ $categoryCount }}</h4>
					<span class="avatar avatar-rounded bg-danger-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-category text-danger"></i>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- End Stat Cards -->

	<!-- Filters -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('expenses.index') }}" class="row g-3 align-items-end">
				<div class="col-md-5">
					<label class="form-label">Search</label>
					<input type="text" name="search" class="form-control" placeholder="Search expense, vendor, notes..."
						value="{{ request('search') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Category</label>
					<select name="category" class="form-select">
						<option value="">All categories</option>
						@foreach ($categories as $cat)
							<option value="{{ $cat }}" @selected(request('category') === $cat)>{{ $cat }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-2">
					<label class="form-label">Status</label>
					<select name="status" class="form-select">
						<option value="">All status</option>
						<option value="paid" @selected(request('status') === 'paid')>Paid</option>
						<option value="pending" @selected(request('status') === 'pending')>Pending</option>
						<option value="cancelled" @selected(request('status') === 'cancelled')>Cancelled</option>
					</select>
				</div>
				<div class="col-md-2 d-flex gap-2">
					<button type="submit" class="btn btn-primary"><i class="ti ti-filter me-1"></i> Filter</button>
					<a href="{{ route('expenses.index') }}" class="btn btn-outline-light">Reset</a>
				</div>
			</form>
		</div>
	</div>
	<!-- End Filters -->

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Expense</th>
							<th>Category</th>
							<th>Amount</th>
							<th>Date</th>
							<th>Payment</th>
							<th>Status</th>
							<th>Added By</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($expenses as $expense)
							@php
								$statusColors = ['paid' => 'badge-soft-success', 'pending' => 'badge-soft-warning', 'cancelled' => 'badge-soft-secondary'];
							@endphp
							<tr>
								<td>
									{{ $expense->title }}
									@if ($expense->vendor)
										<div class="fs-12 text-muted">{{ $expense->vendor }}</div>
									@endif
								</td>
								<td><span class="badge badge-soft-info">{{ $expense->category }}</span></td>
								<td>₹{{ number_format($expense->amount, 2) }}</td>
								<td>{{ $expense->expense_date->format('d M Y') }}</td>
								<td class="text-capitalize">{{ str_replace('_', ' ', $expense->payment_method) }}</td>
								<td><span class="badge {{ $statusColors[$expense->status] }}">{{ ucfirst($expense->status) }}</span></td>
								<td>{{ $expense->creator->full_name ?? '—' }}</td>
								<td>
									<div class="d-flex gap-2">
										<button type="button" class="btn btn-sm btn-icon btn-outline-light"
											onclick='openExpenseModal(@json($expense))'>
											<i class="ti ti-edit"></i>
										</button>
										<form method="POST" action="{{ route('expenses.destroy', $expense->id) }}"
											onsubmit="return confirm('Delete this expense?');">
											@csrf
											@method('DELETE')
											<button type="submit" class="btn btn-sm btn-icon btn-outline-danger">
												<i class="ti ti-trash"></i>
											</button>
										</form>
									</div>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="8" class="text-center py-4">No expenses recorded yet.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $expenses->links() }}
			</div>
		</div>
	</div>

	<!-- Add/Edit Expense Modal -->
	<div class="modal fade" id="expenseModal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form method="POST" id="expenseForm" action="{{ route('expenses.store') }}">
					@csrf
					<div id="methodField"></div>

					<div class="modal-header">
						<h5 class="modal-title" id="expenseModalTitle">Add Expense</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
						<div class="row g-3">
							<div class="col-md-6">
								<label class="form-label">Expense title <span class="text-danger">*</span></label>
								<input type="text" name="title" id="field_title" class="form-control"
									placeholder="e.g. Meta ads, ChatGPT, Office rent" required>
							</div>
							<div class="col-md-6">
								<label class="form-label">Category <span class="text-danger">*</span></label>
								<input type="text" name="category" id="field_category" class="form-control"
									placeholder="Ads, AI Tools, Rent, Anything..." list="categoryList" required>
								<datalist id="categoryList">
									@foreach ($categories as $cat)
										<option value="{{ $cat }}">
									@endforeach
								</datalist>
							</div>

							<div class="col-md-4">
								<label class="form-label">Amount <span class="text-danger">*</span></label>
								<input type="number" step="0.01" min="0" name="amount" id="field_amount"
									class="form-control" placeholder="0.00" required>
							</div>
							<div class="col-md-4">
								<label class="form-label">Expense date <span class="text-danger">*</span></label>
								<input type="date" name="expense_date" id="field_expense_date" class="form-control" required>
							</div>
							<div class="col-md-4">
								<label class="form-label">Payment method</label>
								<select name="payment_method" id="field_payment_method" class="form-select">
									<option value="cash">Cash</option>
									<option value="card">Card</option>
									<option value="upi">UPI</option>
									<option value="bank_transfer">Bank Transfer</option>
									<option value="cheque">Cheque</option>
									<option value="other">Other</option>
								</select>
							</div>

							<div class="col-md-6">
								<label class="form-label">Vendor / Paid to</label>
								<input type="text" name="vendor" id="field_vendor" class="form-control"
									placeholder="e.g. Google, OpenAI, landlord, shop name">
							</div>
							<div class="col-md-6">
								<label class="form-label">Status</label>
								<select name="status" id="field_status" class="form-select">
									<option value="paid">Paid</option>
									<option value="pending">Pending</option>
									<option value="cancelled">Cancelled</option>
								</select>
							</div>

							<div class="col-md-12">
								<label class="form-label">Notes</label>
								<textarea name="notes" id="field_notes" rows="3" class="form-control"
									placeholder="Why this expense was made / invoice details / remarks..."></textarea>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="expenseSubmitBtn">
							<i class="ti ti-device-floppy me-1"></i> Save Expense
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End Modal -->

@endsection

@push('scripts')
	<script>
		function openExpenseModal(expense) {
			const form = document.getElementById('expenseForm');
			const title = document.getElementById('expenseModalTitle');
			const methodField = document.getElementById('methodField');
			const submitBtn = document.getElementById('expenseSubmitBtn');

			if (expense) {
				title.textContent = 'Edit Expense';
				form.action = `/expenses/${expense.id}`;
				methodField.innerHTML = '@method('PATCH')';
				submitBtn.innerHTML = '<i class="ti ti-device-floppy me-1"></i> Update Expense';

				document.getElementById('field_title').value = expense.title || '';
				document.getElementById('field_category').value = expense.category || '';
				document.getElementById('field_amount').value = expense.amount || '';
				document.getElementById('field_expense_date').value = expense.expense_date ? expense.expense_date.substring(0, 10) : '';
				document.getElementById('field_payment_method').value = expense.payment_method || 'cash';
				document.getElementById('field_vendor').value = expense.vendor || '';
				document.getElementById('field_status').value = expense.status || 'paid';
				document.getElementById('field_notes').value = expense.notes || '';
			} else {
				title.textContent = 'Add Expense';
				form.action = "{{ route('expenses.store') }}";
				methodField.innerHTML = '';
				submitBtn.innerHTML = '<i class="ti ti-device-floppy me-1"></i> Save Expense';
				form.reset();
				document.getElementById('field_expense_date').value = new Date().toISOString().substring(0, 10);
			}

			new bootstrap.Modal(document.getElementById('expenseModal')).show();
		}
	</script>
@endpush