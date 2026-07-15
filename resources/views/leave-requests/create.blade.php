@extends('layouts.app')

@section('title', 'Apply for Leave')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Apply for Leave</h4>
		<a href="{{ route('leave-requests.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<!-- Balance Overview -->
	<div class="row mb-3">
		@foreach ($leaveTypes as $type)
			@php $balance = $balances[$type->id]; @endphp
			<div class="col-md-3 col-sm-6 mb-2">
				<div class="card">
					<div class="card-body">
						<p class="fw-medium mb-1">{{ $type->name }}</p>
						<h5 class="mb-0">{{ $balance->remaining_days }} <span class="fs-13 fw-normal text-muted">/ {{ $balance->allocated_days }} days left</span></h5>
					</div>
				</div>
			</div>
		@endforeach
	</div>
	<!-- End Balance Overview -->

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('leave-requests.store') }}">
				@csrf

				<div class="row g-3">
					<div class="col-md-4">
						<label class="form-label">Leave Type <span class="text-danger">*</span></label>
						<select name="leave_type_id" class="form-select @error('leave_type_id') is-invalid @enderror" required>
							<option value="">Select Leave Type</option>
							@foreach ($leaveTypes as $type)
								<option value="{{ $type->id }}" @selected(old('leave_type_id') == $type->id)>
									{{ $type->name }} ({{ $balances[$type->id]->remaining_days }} remaining)
								</option>
							@endforeach
						</select>
						@error('leave_type_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">From Date <span class="text-danger">*</span></label>
						<input type="date" name="from_date" class="form-control @error('from_date') is-invalid @enderror"
							value="{{ old('from_date') }}" required>
						@error('from_date') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">To Date <span class="text-danger">*</span></label>
						<input type="date" name="to_date" class="form-control @error('to_date') is-invalid @enderror"
							value="{{ old('to_date') }}" required>
						@error('to_date') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-12">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="is_half_day" value="1" id="is_half_day"
								{{ old('is_half_day') ? 'checked' : '' }}>
							<label class="form-check-label" for="is_half_day">
								This is a half-day leave (From Date and To Date should be the same)
							</label>
						</div>
					</div>

					<div class="col-md-12">
						<label class="form-label">Reason <span class="text-danger">*</span></label>
						<textarea name="reason" rows="3" class="form-control @error('reason') is-invalid @enderror"
							placeholder="Briefly explain the reason for your leave" required>{{ old('reason') }}</textarea>
						@error('reason') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Submit Request</button>
					<a href="{{ route('leave-requests.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection