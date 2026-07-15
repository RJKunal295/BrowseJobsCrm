<!DOCTYPE html>
<html lang="en">

<head>

	<!-- Meta Tags -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>@yield('title', 'Dashboard') | CRMS - Advanced Bootstrap 5 Admin Template for Customer Management</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description"
		content="Streamline your business with our advanced CRM template. Easily integrate and customize to manage sales, support, and customer interactions efficiently. Perfect for any business size">
	<meta name="keywords"
		content="Advanced CRM template, customer relationship management, business CRM, sales optimization, customer support software, CRM integration, customizable CRM, business tools, enterprise CRM solutions">
	<meta name="author" content="Dreams Technologies">
	<meta name="robots" content="index, follow">
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<!-- Favicon -->
	<link rel="shortcut icon" href="{{ asset('build/assets/img/favicon.png') }}">

	<!-- Apple Icon -->
	<link rel="apple-touch-icon" href="{{ asset('build/assets/img/apple-icon.png') }}">

	<!-- Theme Config Js -->
	<script src="{{ asset('build/assets/js/theme-script.js') }}"></script>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="{{ asset('build/assets/css/bootstrap.min.css') }}">

	<!-- Tabler Icon CSS -->
	<link rel="stylesheet" href="{{ asset('build/assets/plugins/tabler-icons/tabler-icons.min.css') }}">

	<!-- Simplebar CSS -->
	<link rel="stylesheet" href="{{ asset('build/assets/plugins/simplebar/simplebar.min.css') }}">

	<!-- Datatable CSS -->
	<link rel="stylesheet" href="{{ asset('build/assets/plugins/datatables/css/dataTables.bootstrap5.min.css') }}">

	<!-- Daterangepicker CSS -->
	<link rel="stylesheet" href="{{ asset('build/assets/plugins/daterangepicker/daterangepicker.css') }}">

	<!-- Main CSS -->
	<link rel="stylesheet" href="{{ asset('build/assets/css/style.css') }}" id="app-style">

	@stack('styles')

</head>

<body>

	<!-- Begin Wrapper -->
	<div class="main-wrapper">

		@include('partials.header')

		@include('partials.sidebar')

		<!-- ========================
			Start Page Content
		========================= -->

		<div class="page-wrapper">

			<!-- Start Content -->
			<div class="content pb-0">
				@yield('content')
			</div>
			<!-- End Content -->

			@include('partials.footer')

		</div>

		<!-- ========================
			End Page Content
		========================= -->

	</div>
	<!-- End Wrapper -->


	<!-- jQuery -->
	<script src="{{ asset('build/assets/js/jquery-3.7.1.min.js') }}"></script>

	<!-- Bootstrap Core JS -->
	<script src="{{ asset('build/assets/js/bootstrap.bundle.min.js') }}"></script>

	<!-- Simplebar JS -->
	<script src="{{ asset('build/assets/plugins/simplebar/simplebar.min.js') }}"></script>

	<!-- Datatable JS -->
	<script src="{{ asset('build/assets/plugins/datatables/js/jquery.dataTables.min.js') }}"></script>
	<script src="{{ asset('build/assets/plugins/datatables/js/dataTables.bootstrap5.min.js') }}"></script>

	<!-- Daterangepicker JS -->
	<script src="{{ asset('build/assets/js/moment.min.js') }}"></script>
	<script src="{{ asset('build/assets/plugins/daterangepicker/daterangepicker.js') }}"></script>

	<!-- Apexchart JS -->
	<script src="{{ asset('build/assets/plugins/apexchart/apexcharts.min.js') }}"></script>
	<script src="{{ asset('build/assets/plugins/apexchart/chart-data.js') }}"></script>

	<!-- Custom Json Js -->
	<script src="{{ asset('build/assets/json/dashboard.js') }}"></script>

	<!-- Main JS -->
	<script src="{{ asset('build/assets/js/script.js') }}"></script>

	@stack('scripts')

</body>

</html>