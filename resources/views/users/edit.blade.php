@extends('layouts.app')

@section('title', 'Edit User')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Edit User</h4>
		<a href="{{ route('users.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<form method="POST" action="{{ route('users.update', $user->id) }}" enctype="multipart/form-data">
		@csrf
		@method('PUT')

		<!-- ============ Basic Information ============ -->
		<div class="card mb-3">
			<div class="card-header">
				<h5 class="mb-0 fs-16 fw-bold">Basic Information</h5>
			</div>
			<div class="card-body">
				<div class="row g-3">
					<div class="col-md-4">
						<label class="form-label">Employee ID</label>
						<input type="text" name="employee_id" class="form-control @error('employee_id') is-invalid @enderror"
							value="{{ old('employee_id', $user->employee_id) }}">
						@error('employee_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">First Name <span class="text-danger">*</span></label>
						<input type="text" name="first_name" class="form-control @error('first_name') is-invalid @enderror"
							value="{{ old('first_name', $user->first_name) }}" required>
						@error('first_name') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Last Name</label>
						<input type="text" name="last_name" class="form-control @error('last_name') is-invalid @enderror"
							value="{{ old('last_name', $user->last_name) }}">
						@error('last_name') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Gender</label>
						<select name="gender" class="form-select @error('gender') is-invalid @enderror">
							<option value="">Select Gender</option>
							<option value="male" @selected(old('gender', $user->gender) === 'male')>Male</option>
							<option value="female" @selected(old('gender', $user->gender) === 'female')>Female</option>
							<option value="other" @selected(old('gender', $user->gender) === 'other')>Other</option>
						</select>
						@error('gender') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Date of Birth</label>
						<input type="date" name="date_of_birth"
							class="form-control @error('date_of_birth') is-invalid @enderror"
							value="{{ old('date_of_birth', optional($user->date_of_birth)->format('Y-m-d')) }}">
						@error('date_of_birth') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Profile Photo</label>
						@if ($user->profile_photo)
							<div class="mb-2">
								<img src="{{ Storage::url($user->profile_photo) }}" alt="Profile Photo"
									class="rounded" width="60" height="60" style="object-fit:cover;">
							</div>
						@endif
						<input type="file" name="profile_photo" accept="image/*"
							class="form-control @error('profile_photo') is-invalid @enderror">
						<small class="text-muted">Leave blank to keep current photo.</small>
						@error('profile_photo') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Email <span class="text-danger">*</span></label>
						<input type="email" name="email" class="form-control @error('email') is-invalid @enderror"
							value="{{ old('email', $user->email) }}" required>
						@error('email') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Mobile / Phone</label>
						<input type="text" name="phone" class="form-control @error('phone') is-invalid @enderror"
							value="{{ old('phone', $user->phone) }}">
						@error('phone') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">WhatsApp Number</label>
						<input type="text" name="whatsapp_number"
							class="form-control @error('whatsapp_number') is-invalid @enderror"
							value="{{ old('whatsapp_number', $user->whatsapp_number) }}">
						@error('whatsapp_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Alternate Phone</label>
						<input type="text" name="alternate_phone"
							class="form-control @error('alternate_phone') is-invalid @enderror"
							value="{{ old('alternate_phone', $user->alternate_phone) }}">
						@error('alternate_phone') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<!-- Password with eye toggle (optional on edit) -->
					<div class="col-md-4">
						<label class="form-label">New Password</label>
						<div class="input-group">
							<input type="password" name="password" id="password"
								class="form-control @error('password') is-invalid @enderror"
								placeholder="Leave blank to keep current password">
							<span class="input-group-text toggle-password-icon" data-target="password"
								style="cursor:pointer;">
								<i class="ti ti-eye"></i>
							</span>
						</div>
						@error('password') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Confirm New Password</label>
						<div class="input-group">
							<input type="password" name="password_confirmation" id="password_confirmation"
								class="form-control" placeholder="Leave blank to keep current password">
							<span class="input-group-text toggle-password-icon" data-target="password_confirmation"
								style="cursor:pointer;">
								<i class="ti ti-eye"></i>
							</span>
						</div>
					</div>
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
					<div class="col-md-4">
						<label class="form-label">Role <span class="text-danger">*</span></label>
						<select name="role_id" class="form-select @error('role_id') is-invalid @enderror" required>
							<option value="">Select Role</option>
							@foreach ($roles as $role)
								<option value="{{ $role->id }}" @selected(old('role_id', $user->role_id) == $role->id)>
									{{ $role->role_name }}
								</option>
							@endforeach
						</select>
						@error('role_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Designation</label>
						<input type="text" name="designation"
							class="form-control @error('designation') is-invalid @enderror"
							value="{{ old('designation', $user->designation) }}">
						@error('designation') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Department</label>
						<input type="text" name="department"
							class="form-control @error('department') is-invalid @enderror"
							value="{{ old('department', $user->department) }}">
						@error('department') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Reporting Manager</label>
						<select name="reporting_manager_id"
							class="form-select @error('reporting_manager_id') is-invalid @enderror">
							<option value="">None</option>
							@foreach ($managers as $manager)
								<option value="{{ $manager->id }}"
									@selected(old('reporting_manager_id', $user->reporting_manager_id) == $manager->id)>
									{{ $manager->full_name }}
								</option>
							@endforeach
						</select>
						@error('reporting_manager_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Employee Type</label>
						<select name="employee_type" class="form-select @error('employee_type') is-invalid @enderror">
							<option value="">Select Type</option>
							@foreach (['Permanent', 'Contract', 'Intern', 'Part-time'] as $type)
								<option value="{{ $type }}" @selected(old('employee_type', $user->employee_type) === $type)>
									{{ $type }}
								</option>
							@endforeach
						</select>
						@error('employee_type') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Employment Status</label>
						<select name="employment_status" class="form-select @error('employment_status') is-invalid @enderror">
							<option value="">Select Status</option>
							@foreach (['Active', 'On Notice', 'Resigned', 'Terminated'] as $status)
								<option value="{{ $status }}"
									@selected(old('employment_status', $user->employment_status) === $status)>
									{{ $status }}
								</option>
							@endforeach
						</select>
						@error('employment_status') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Joining Date</label>
						<input type="date" name="joining_date"
							class="form-control @error('joining_date') is-invalid @enderror"
							value="{{ old('joining_date', optional($user->joining_date)->format('Y-m-d')) }}">
						@error('joining_date') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Resignation Date</label>
						<input type="date" name="resignation_date"
							class="form-control @error('resignation_date') is-invalid @enderror"
							value="{{ old('resignation_date', optional($user->resignation_date)->format('Y-m-d')) }}">
						@error('resignation_date') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Last Working Day</label>
						<input type="date" name="last_working_day"
							class="form-control @error('last_working_day') is-invalid @enderror"
							value="{{ old('last_working_day', optional($user->last_working_day)->format('Y-m-d')) }}">
						@error('last_working_day') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>
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
					<div class="col-md-4">
						<label class="form-label">Salary</label>
						<input type="number" step="0.01" name="salary"
							class="form-control @error('salary') is-invalid @enderror"
							value="{{ old('salary', $user->salary) }}">
						@error('salary') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Salary Type</label>
						<select name="salary_type" class="form-select @error('salary_type') is-invalid @enderror">
							<option value="">Select Type</option>
							<option value="Monthly" @selected(old('salary_type', $user->salary_type) === 'Monthly')>Monthly</option>
							<option value="Annual" @selected(old('salary_type', $user->salary_type) === 'Annual')>Annual</option>
						</select>
						@error('salary_type') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Incentive</label>
						<input type="number" step="0.01" name="incentive"
							class="form-control @error('incentive') is-invalid @enderror"
							value="{{ old('incentive', $user->incentive) }}">
						@error('incentive') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Bonus</label>
						<input type="number" step="0.01" name="bonus"
							class="form-control @error('bonus') is-invalid @enderror"
							value="{{ old('bonus', $user->bonus) }}">
						@error('bonus') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">PAN Number</label>
						<input type="text" name="pan_number"
							class="form-control @error('pan_number') is-invalid @enderror"
							value="{{ old('pan_number', $user->pan_number) }}">
						@error('pan_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Aadhaar Number</label>
						<input type="text" name="aadhaar_number"
							class="form-control @error('aadhaar_number') is-invalid @enderror"
							value="{{ old('aadhaar_number', $user->aadhaar_number) }}">
						@error('aadhaar_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">PF Number</label>
						<input type="text" name="pf_number" class="form-control @error('pf_number') is-invalid @enderror"
							value="{{ old('pf_number', $user->pf_number) }}">
						@error('pf_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">ESI Number</label>
						<input type="text" name="esi_number" class="form-control @error('esi_number') is-invalid @enderror"
							value="{{ old('esi_number', $user->esi_number) }}">
						@error('esi_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">UAN Number</label>
						<input type="text" name="uan_number" class="form-control @error('uan_number') is-invalid @enderror"
							value="{{ old('uan_number', $user->uan_number) }}">
						@error('uan_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
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
					<div class="col-md-4">
						<label class="form-label">Bank Name</label>
						<input type="text" name="bank_name" class="form-control @error('bank_name') is-invalid @enderror"
							value="{{ old('bank_name', $user->bank_name) }}">
						@error('bank_name') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Account Holder Name</label>
						<input type="text" name="account_holder_name"
							class="form-control @error('account_holder_name') is-invalid @enderror"
							value="{{ old('account_holder_name', $user->account_holder_name) }}">
						@error('account_holder_name') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Account Number</label>
						<input type="text" name="account_number"
							class="form-control @error('account_number') is-invalid @enderror"
							value="{{ old('account_number', $user->account_number) }}">
						@error('account_number') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">IFSC Code</label>
						<input type="text" name="ifsc_code" class="form-control @error('ifsc_code') is-invalid @enderror"
							value="{{ old('ifsc_code', $user->ifsc_code) }}">
						@error('ifsc_code') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Branch Name</label>
						<input type="text" name="branch_name"
							class="form-control @error('branch_name') is-invalid @enderror"
							value="{{ old('branch_name', $user->branch_name) }}">
						@error('branch_name') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">UPI ID</label>
						<input type="text" name="upi_id" class="form-control @error('upi_id') is-invalid @enderror"
							value="{{ old('upi_id', $user->upi_id) }}">
						@error('upi_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>
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
					<div class="col-md-12">
						<label class="form-label">Address</label>
						<textarea name="address" rows="2" class="form-control @error('address') is-invalid @enderror">{{ old('address', $user->address) }}</textarea>
						@error('address') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-3">
						<label class="form-label">City</label>
						<input type="text" name="city" class="form-control @error('city') is-invalid @enderror"
							value="{{ old('city', $user->city) }}">
						@error('city') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-3">
						<label class="form-label">State</label>
						<input type="text" name="state" class="form-control @error('state') is-invalid @enderror"
							value="{{ old('state', $user->state) }}">
						@error('state') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-3">
						<label class="form-label">Country</label>
						<input type="text" name="country" class="form-control @error('country') is-invalid @enderror"
							value="{{ old('country', $user->country) }}">
						@error('country') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-3">
						<label class="form-label">Pincode</label>
						<input type="text" name="pincode" class="form-control @error('pincode') is-invalid @enderror"
							value="{{ old('pincode', $user->pincode) }}">
						@error('pincode') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>
				</div>
			</div>
		</div>

		<!-- ============ Documents ============ -->
		<div class="card mb-3">
			<div class="card-header">
				<h5 class="mb-0 fs-16 fw-bold">Documents</h5>
			</div>
			<div class="card-body">
				<div class="row g-3">
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

					@foreach ($documentFields as $field => $label)
						<div class="col-md-4">
							<label class="form-label">{{ $label }}</label>
							@if ($user->$field)
								<div class="mb-1">
									<a href="{{ Storage::url($user->$field) }}" target="_blank"
										class="fs-13 text-decoration-underline">
										<i class="ti ti-file-check me-1"></i> View current file
									</a>
								</div>
							@endif
							<input type="file" name="{{ $field }}"
								class="form-control @error($field) is-invalid @enderror">
							<small class="text-muted">Leave blank to keep current file.</small>
							@error($field) <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
						</div>
					@endforeach
				</div>
			</div>
		</div>

		<!-- ============ Status ============ -->
		<div class="card mb-3">
			<div class="card-body">
				<div class="form-check form-switch">
					<input class="form-check-input" type="checkbox" name="is_active" value="1" id="is_active"
						{{ old('is_active', $user->is_active) ? 'checked' : '' }}>
					<label class="form-check-label" for="is_active">Active</label>
				</div>
			</div>
		</div>

		<div class="mb-4 d-flex gap-2">
			<button type="submit" class="btn btn-primary">Update User</button>
			<a href="{{ route('users.index') }}" class="btn btn-outline-light">Cancel</a>
		</div>
	</form>

@endsection

@push('scripts')
	<script>
		document.querySelectorAll('.toggle-password-icon').forEach(function (icon) {
			icon.addEventListener('click', function () {
				const targetId = this.getAttribute('data-target');
				const input = document.getElementById(targetId);
				const iconTag = this.querySelector('i');

				if (input.type === 'password') {
					input.type = 'text';
					iconTag.classList.remove('ti-eye');
					iconTag.classList.add('ti-eye-off');
				} else {
					input.type = 'password';
					iconTag.classList.remove('ti-eye-off');
					iconTag.classList.add('ti-eye');
				}
			});
		});
	</script>
@endpush