<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Login | {{ config('app.name', 'BrowseJobs') }} Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="BrowseJobs Admin Panel Login">
    <meta name="robots" content="noindex, nofollow">
    <link rel="shortcut icon" href="{{ asset('build/assets/img/favicon.png') }}">
    <link rel="apple-touch-icon" href="{{ asset('build/assets/img/apple-icon.png') }}">
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
                            @if (session('status'))
                                <div class="alert alert-success mt-4" role="alert">
                                    {{ session('status') }}
                                </div>
                            @endif
                            @if ($errors->any())
                                <div class="alert alert-danger mt-4" role="alert">
                                    {{ $errors->first() }}
                                </div>
                            @endif
                            <form method="POST" action="{{ route('login') }}" class="vh-100 d-flex justify-content-between flex-column p-4 pb-0">
                                @csrf
                                <div class="text-center mb-4 auth-logo">
                                    <img src="{{ asset('build/assets/img/logo-2.png') }}" class="img-fluid" alt="Logo">
                                </div>
                                <div>
                                    <div class="mb-3">
                                        <h3 class="mb-2">Sign In</h3>
                                        <p class="mb-0">Access the admin panel using your email and passcode.</p>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="email">Email Address</label>
                                        <div class="input-group input-group-flat">
                                            <input type="email" id="email" name="email" class="form-control @error('email') is-invalid @enderror" value="{{ old('email') }}" required autofocus>
                                            <span class="input-group-text">
                                                <i class="ti ti-mail"></i>
                                            </span>
                                        </div>
                                        @error('email')
                                            <div class="invalid-feedback d-block">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label" for="password">Password</label>
                                        <div class="input-group input-group-flat pass-group">
                                            <input type="password" id="password" name="password" class="form-control pass-input @error('password') is-invalid @enderror" required>
                                            <span class="input-group-text toggle-password">
                                                <i class="ti ti-eye-off"></i>
                                            </span>
                                        </div>
                                        @error('password')
                                            <div class="invalid-feedback d-block">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-3">
                                        <div class="form-check form-check-md d-flex align-items-center">
                                            <input class="form-check-input mt-0" type="checkbox" name="remember" value="1" id="checkebox-md" checked>
                                            <label class="form-check-label text-dark ms-1" for="checkebox-md">
                                                Remember Me
                                            </label>
                                        </div>
                                        <div class="text-end">
                                            <a href="{{ route('password.forgot') }}" class="link-danger fw-medium link-hover">Forgot Password?</a>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <button type="submit" class="btn btn-primary w-100">Sign In</button>
                                    </div>
                                </div>
                                <div class="text-center pb-4">
                                    <p class="text-dark mb-0">Copyright &copy; {{ date('Y') }} - {{ config('app.name', 'BrowseJobs') }}</p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 account-bg-01"></div> <!-- end col -->
            </div>
        </div>
    </div>
    <script src="{{ asset('build/assets/js/jquery-3.7.1.min.js') }}"></script>
    <script src="{{ asset('build/assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('build/assets/js/script.js') }}"></script>
</body>
</html>