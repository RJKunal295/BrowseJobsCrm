@extends('layouts.app')

@section('title', 'Change Password')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Change Password</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Change Password</span>
			</nav>
		</div>
	</div>

	@if (session('status'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('status') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif
	@if ($errors->any())
		<div class="alert alert-danger alert-dismissible fade show" role="alert">
			{{ $errors->first() }}
			<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
		</div>
	@endif

	<div class="row">
		<div class="col-lg-6 col-md-8">
			<div class="card">
				<div class="card-header"><h6 class="mb-0"><i class="ti ti-lock me-1"></i>Change your password</h6></div>
				<div class="card-body">
					<p class="fs-13 text-muted">
						For your security we verify it's really you: click the button to receive a 6-digit code
						on <strong>{{ auth()->user()->email ?: 'your email (none on file!)' }}</strong>, then enter it with your new password.
					</p>

					<form method="POST" action="{{ route('password.change.send') }}" class="mb-4">
						@csrf
						<button type="submit" class="btn btn-outline-primary">
							<i class="ti ti-mail-forward me-1"></i> Send verification code to my email
						</button>
					</form>

					<form method="POST" action="{{ route('password.change.update') }}">
						@csrf
						<div class="mb-3">
							<label class="form-label" for="otp">Verification code</label>
							<input type="text" id="otp" name="otp" inputmode="numeric" maxlength="6" pattern="\d{6}"
								class="form-control text-center fs-4" style="letter-spacing: 10px; max-width: 260px;" placeholder="••••••" required>
						</div>
						<div class="mb-3">
							<label class="form-label" for="password">New password</label>
							<input type="password" id="password" name="password" class="form-control" minlength="8" required>
							<div class="fs-12 text-muted mt-1">Minimum 8 characters.</div>
						</div>
						<div class="mb-3">
							<label class="form-label" for="password_confirmation">Confirm new password</label>
							<input type="password" id="password_confirmation" name="password_confirmation" class="form-control" minlength="8" required>
						</div>
						<button type="submit" class="btn btn-primary">
							<i class="ti ti-check me-1"></i> Change password
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

@endsection
