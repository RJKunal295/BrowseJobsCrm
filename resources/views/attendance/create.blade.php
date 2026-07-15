@extends('layouts.app')

@section('title', 'Add Manual Attendance')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Add Manual Attendance</h4>
		<a href="{{ route('attendance.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to Attendance
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<p class="text-muted">
				Use this when an employee forgot to log in or log out and their attendance
				needs to be backfilled manually. A reason is required for audit purposes.
			</p>

			<form method="POST" action="{{ route('attendance.store') }}">
				@csrf

				<div class="row g-3">
					<div class="col-md-4">
						<label class="form-label">Employee <span class="text-danger">*</span></label>
						<select name="user_id" class="form-select @error('user_id') is-invalid @enderror" required>
							<option value="">Select Employee</option>
							@foreach ($users as $u)
								<option value="{{ $u->id }}" @selected(old('user_id') == $u->id)>{{ $u->full_name }}</option>
							@endforeach
						</select>
						@error('user_id') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Check-in Time <span class="text-danger">*</span></label>
						<input type="datetime-local" name="login_time"
							class="form-control @error('login_time') is-invalid @enderror"
							value="{{ old('login_time') }}" required>
						@error('login_time') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Check-out Time</label>
						<input type="datetime-local" name="logout_time"
							class="form-control @error('logout_time') is-invalid @enderror"
							value="{{ old('logout_time') }}">
						<small class="text-muted">Leave blank if the employee is still checked in.</small>
						@error('logout_time') <div class="invalid-feedback d-block">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-12">
						<label class="form-label">Reason <span class="text-danger">*</span></label>
						<textarea name="reason" rows="3" class="form-control @error('reason') is-invalid @enderror"
							placeholder="e.g. Employee forgot to log in this morning, confirmed via WhatsApp at 9:15 AM" required>{{ old('reason') }}</textarea>
						@error('reason') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Save Attendance</button>
					<a href="{{ route('attendance.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection