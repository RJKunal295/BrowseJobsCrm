<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Forgot Password | {{ config('app.name', 'BrowseJobs') }} Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    <link rel="shortcut icon" href="{{ asset('build/assets/img/favicon.png') }}">
    <link rel="stylesheet" href="{{ asset('build/assets/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('build/assets/plugins/tabler-icons/tabler-icons.min.css') }}">
    <link rel="stylesheet" href="{{ asset('build/assets/css/style.css') }}" id="app-style">
</head>

<body class="account-page bg-white">
    <div class="main-wrapper">
        <div class="overflow-hidden p-3 acc-vh">
            <div class="row vh-100 w-100 g-0">
                <div class="col-lg-6 vh-100 overflow-y-auto overflow-x-hidden">
                    <div class="row">
                        <div class="col-md-10 mx-auto">
                            @php $otpEmail = session('otp_email') ?? old('email'); @endphp

                            @if (session('status'))
                                <div class="alert alert-success mt-4" role="alert">{{ session('status') }}</div>
                            @endif
                            @if ($errors->any())
                                <div class="alert alert-danger mt-4" role="alert">{{ $errors->first() }}</div>
                            @endif

                            <div class="vh-100 d-flex justify-content-between flex-column p-4 pb-0">
                                <div class="text-center mb-4 auth-logo">
                                    <img src="{{ asset('build/assets/img/logo-2.png') }}" class="img-fluid" alt="Logo">
                                </div>

                                @if (! session('otp_email'))
                                    <!-- Step 1: request the OTP -->
                                    <form method="POST" action="{{ route('password.forgot.send') }}">
                                        @csrf
                                        <div class="mb-3">
                                            <h3 class="mb-2">Forgot Password?</h3>
                                            <p class="mb-0">Enter your account email — we'll send a 6-digit verification code.</p>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="email">Email Address</label>
                                            <div class="input-group input-group-flat">
                                                <input type="email" id="email" name="email" class="form-control" value="{{ old('email') }}" required autofocus>
                                                <span class="input-group-text"><i class="ti ti-mail"></i></span>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <button type="submit" class="btn btn-primary w-100">Send Verification Code</button>
                                        </div>
                                        <div class="text-center">
                                            <a href="{{ route('login.show') }}" class="link-primary">← Back to Sign In</a>
                                        </div>
                                    </form>
                                @else
                                    <!-- Step 2: OTP + new password -->
                                    <form method="POST" action="{{ route('password.forgot.reset') }}">
                                        @csrf
                                        <input type="hidden" name="email" value="{{ $otpEmail }}">
                                        <div class="mb-3">
                                            <h3 class="mb-2">Enter the Code</h3>
                                            <p class="mb-0">We emailed a 6-digit code to your address. Enter it below with your new password.</p>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="otp">Verification Code</label>
                                            <input type="text" id="otp" name="otp" inputmode="numeric" maxlength="6" pattern="\d{6}"
                                                class="form-control text-center fs-4" style="letter-spacing: 10px;" placeholder="••••••" required autofocus>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="password">New Password</label>
                                            <div class="input-group input-group-flat pass-group">
                                                <input type="password" id="password" name="password" class="form-control pass-input" minlength="8" required>
                                                <span class="input-group-text toggle-password"><i class="ti ti-eye-off"></i></span>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="password_confirmation">Confirm New Password</label>
                                            <input type="password" id="password_confirmation" name="password_confirmation" class="form-control" minlength="8" required>
                                        </div>
                                        <div class="mb-3">
                                            <button type="submit" class="btn btn-primary w-100">Reset Password</button>
                                        </div>
                                    </form>
                                    <form method="POST" action="{{ route('password.forgot.send') }}" class="text-center">
                                        @csrf
                                        <input type="hidden" name="email" value="{{ $otpEmail }}">
                                        <button type="submit" class="btn btn-link p-0">Resend code</button>
                                        · <a href="{{ route('login.show') }}" class="link-primary">Back to Sign In</a>
                                    </form>
                                @endif

                                <div class="text-center pb-4">
                                    <p class="text-dark mb-0">Copyright &copy; {{ date('Y') }} - {{ config('app.name', 'BrowseJobs') }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 account-bg-01"></div>
            </div>
        </div>
    </div>
    <script src="{{ asset('build/assets/js/jquery-3.7.1.min.js') }}"></script>
    <script src="{{ asset('build/assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('build/assets/js/script.js') }}"></script>
</body>
</html>
