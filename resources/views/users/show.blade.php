@extends('layouts.app')

@section('title', 'User Details')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">User Details</h4>
		<div class="d-flex gap-2">
			<a href="{{ route('users.edit', $user->id) }}" class="btn btn-primary">
				<i class="ti ti-edit me-1"></i> Edit
			</a>
			<a href="{{ route('users.index') }}" class="btn btn-outline-light">
				<i class="ti ti-arrow-left me-1"></i> Back to List
			</a>
		</div>
	</div>

	<!-- ============ Profile Summary ============ -->
	<div class="card mb-3">
		<div class="card-body d-flex align-items-center gap-3 flex-wrap">
			@if ($user->profile_photo)
				<img src="{{ Storage::url($user->profile_photo) }}" alt="{{ $user->full_name }}"
					class="rounded-circle" width="80" height="80" style="object-fit:cover;">
			@else
				<div class="avatar avatar-xl rounded-circle bg-light d-flex align-items-center justify-content-center">
					<i class="ti ti-user fs-32"></i>
				</div>
			@endif

			<div>
				<h5 class="mb-1">{{ $user->full_name }}</h5>
				<p class="mb-1 text-muted">{{ $user->designation ?? '—' }} @if ($user->department) · {{ $user->department }} @endif</p>
				<span class="badge {{ $user->is_active ? 'badge-soft-success' : 'badge-soft-danger' }}">
					{{ $user->is_active ? 'Active' : 'Inactive' }}
				</span>
			</div>
		</div>
	</div>

	<!-- ============ Basic Information ============ -->
	<div class="card mb-3">
		<div class="card-header">
			<h5 class="mb-0 fs-16 fw-bold">Basic Information</h5>
		</div>
		<div class="card-body">
			<div class="row g-3">
				<div class="col-md-4"><strong>Employee ID:</strong> {{ $user->employee_id ?? '—' }}</div>
				<div class="col-md-4"><strong>Gender:</strong> {{ ucfirst($user->gender ?? '—') }}</div>
				<div class="col-md-4"><strong>Date of Birth:</strong> {{ optional($user->date_of_birth)->format('d M Y') ?? '—' }}</div>
				<div class="col-md-4"><strong>Email:</strong> {{ $user->email }}</div>
				<div class="col-md-4"><strong>Phone:</strong> {{ $user->phone ?? '—' }}</div>
				<div class="col-md-4"><strong>WhatsApp:</strong> {{ $user->whatsapp_number ?? '—' }}</div>
				<div class="col-md-4"><strong>Alternate Phone:</strong> {{ $user->alternate_phone ?? '—' }}</div>
			</div>
		</div>
	</div>

	<!-- ============ Employment Details ============ -->
	<div class="card mb-3">
		<div class="card-header">
			<h5 class="mb-0 fs-16 fw-bold">Employment Details</h5>
		</div>
		<div class="card-body">
			<div class="row g-3">
				<div class="col-md-4"><strong>Role:</strong> {{ $role->role_name ?? '—' }}</div>
				<div class="col-md-4"><strong>Designation:</strong> {{ $user->designation ?? '—' }}</div>
				<div class="col-md-4"><strong>Department:</strong> {{ $user->department ?? '—' }}</div>
				<div class="col-md-4"><strong>Reporting Manager:</strong> {{ $manager->full_name ?? '—' }}</div>
				<div class="col-md-4"><strong>Employee Type:</strong> {{ $user->employee_type ?? '—' }}</div>
				<div class="col-md-4"><strong>Employment Status:</strong> {{ $user->employment_status ?? '—' }}</div>
				<div class="col-md-4"><strong>Joining Date:</strong> {{ optional($user->joining_date)->format('d M Y') ?? '—' }}</div>
				<div class="col-md-4"><strong>Resignation Date:</strong> {{ optional($user->resignation_date)->format('d M Y') ?? '—' }}</div>
				<div class="col-md-4"><strong>Last Working Day:</strong> {{ optional($user->last_working_day)->format('d M Y') ?? '—' }}</div>
			</div>
		</div>
	</div>

	<!-- ============ Salary Details ============ -->
	<div class="card mb-3">
		<div class="card-header">
			<h5 class="mb-0 fs-16 fw-bold">Salary Details</h5>
		</div>
		<div class="card-body">
			<div class="row g-3">
				<div class="col-md-4"><strong>Salary:</strong> {{ $user->salary ?? '—' }}</div>
				<div class="col-md-4"><strong>Salary Type:</strong> {{ $user->salary_type ?? '—' }}</div>
				<div class="col-md-4"><strong>Incentive:</strong> {{ $user->incentive ?? '—' }}</div>
				<div class="col-md-4"><strong>Bonus:</strong> {{ $user->bonus ?? '—' }}</div>
				<div class="col-md-4"><strong>PF Number:</strong> {{ $user->pf_number ?? '—' }}</div>
				<div class="col-md-4"><strong>ESI Number:</strong> {{ $user->esi_number ?? '—' }}</div>
				<div class="col-md-4"><strong>UAN Number:</strong> {{ $user->uan_number ?? '—' }}</div>
				<div class="col-md-4">
					<strong>PAN Number:</strong>
					{{ $user->pan_number ? str_repeat('*', max(strlen($user->pan_number) - 4, 0)) . substr($user->pan_number, -4) : '—' }}
				</div>
				<div class="col-md-4">
					<strong>Aadhaar Number:</strong>
					{{ $user->aadhaar_number ? str_repeat('*', max(strlen($user->aadhaar_number) - 4, 0)) . substr($user->aadhaar_number, -4) : '—' }}
				</div>
			</div>
		</div>
	</div>

	<!-- ============ Bank Details ============ -->
	<div class="card mb-3">
		<div class="card-header">
			<h5 class="mb-0 fs-16 fw-bold">Bank Details</h5>
		</div>
		<div class="card-body">
			<div class="row g-3">
				<div class="col-md-4"><strong>Bank Name:</strong> {{ $user->bank_name ?? '—' }}</div>
				<div class="col-md-4"><strong>Account Holder:</strong> {{ $user->account_holder_name ?? '—' }}</div>
				<div class="col-md-4">
					<strong>Account Number:</strong>
					{{ $user->account_number ? str_repeat('*', max(strlen($user->account_number) - 4, 0)) . substr($user->account_number, -4) : '—' }}
				</div>
				<div class="col-md-4"><strong>IFSC Code:</strong> {{ $user->ifsc_code ?? '—' }}</div>
				<div class="col-md-4"><strong>Branch Name:</strong> {{ $user->branch_name ?? '—' }}</div>
				<div class="col-md-4"><strong>UPI ID:</strong> {{ $user->upi_id ?? '—' }}</div>
			</div>
		</div>
	</div>

	<!-- ============ Address ============ -->
	<div class="card mb-3">
		<div class="card-header">
			<h5 class="mb-0 fs-16 fw-bold">Address</h5>
		</div>
		<div class="card-body">
			<div class="row g-3">
				<div class="col-md-12"><strong>Address:</strong> {{ $user->address ?? '—' }}</div>
				<div class="col-md-3"><strong>City:</strong> {{ $user->city ?? '—' }}</div>
				<div class="col-md-3"><strong>State:</strong> {{ $user->state ?? '—' }}</div>
				<div class="col-md-3"><strong>Country:</strong> {{ $user->country ?? '—' }}</div>
				<div class="col-md-3"><strong>Pincode:</strong> {{ $user->pincode ?? '—' }}</div>
			</div>
		</div>
	</div>

	<!-- ============ Documents ============ -->
	<div class="card mb-3">
		<div class="card-header">
			<h5 class="mb-0 fs-16 fw-bold">Documents</h5>
		</div>
		<div class="card-body">
			@php
				$documentFields = [
					'aadhaar_file'      => 'Aadhaar File',
					'pan_file'          => 'PAN File',
					'resume'            => 'Resume',
					'offer_letter'      => 'Offer Letter',
					'experience_letter' => 'Experience Letter',
					'salary_slip'       => 'Salary Slip',
					'cancelled_cheque'  => 'Cancelled Cheque',
				];
			@endphp

			<div class="row g-3">
				@foreach ($documentFields as $field => $label)
					<div class="col-md-4">
						<strong>{{ $label }}:</strong>
						@if ($user->$field)
							<a href="{{ Storage::url($user->$field) }}" target="_blank"
								class="text-decoration-underline ms-1">
								<i class="ti ti-file-check"></i> View
							</a>
						@else
							<span class="text-muted">Not uploaded</span>
						@endif
					</div>
				@endforeach
			</div>
		</div>
	</div>

@endsection