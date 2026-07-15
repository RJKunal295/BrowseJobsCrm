{{-- resources/views/partials/sidebar.blade.php --}}
{{-- Fully dynamic: reads from menu_items + permissions, no hardcoded links. --}}

<!-- Sidenav Menu Start -->
<div class="sidebar" id="sidebar">

	<!-- Start Logo -->
	<div class="sidebar-logo">
		<div>
			<a href="{{ url('/') }}" class="logo logo-normal">
				<img src="{{ asset('build/assets/img/logo.svg') }}" alt="Logo">
			</a>
			<a href="{{ url('/') }}" class="logo-small">
				<img src="{{ asset('build/assets/img/logo-small.svg') }}" alt="Logo">
			</a>
			<a href="{{ url('/') }}" class="dark-logo">
				<img src="{{ asset('build/assets/img/logo-white.svg') }}" alt="Logo">
			</a>
		</div>
		<button class="sidenav-toggle-btn btn border-0 p-0 active" id="toggle_btn">
			<i class="ti ti-arrow-bar-to-left"></i>
		</button>
		<button class="sidebar-close">
			<i class="ti ti-x align-middle"></i>
		</button>
	</div>
	<!-- End Logo -->

	<!-- Sidenav Menu -->
	<div class="sidebar-inner" data-simplebar>
		<div id="sidebar-menu" class="sidebar-menu">
			<ul>
				@php
					// $menuTree is provided by a View Composer (see MenuComposer below) —
					// already filtered to only what the logged-in user is allowed to see.
					$groupedByHeader = $menuTree->groupBy('menu_group');
				@endphp

				@foreach ($groupedByHeader as $groupName => $itemsInGroup)
					<li class="menu-title"><span>{{ $groupName ?? 'Menu' }}</span></li>
					<li>
						<ul>
							@foreach ($itemsInGroup as $item)
								@include('partials.menu-item', ['item' => $item, 'depth' => 0])
							@endforeach
						</ul>
					</li>
				@endforeach
			</ul>
		</div>
	</div>

</div>
<!-- Sidenav Menu End -->