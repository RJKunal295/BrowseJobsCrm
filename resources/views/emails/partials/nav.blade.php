{{-- Email sub-navigation --}}
<ul class="nav nav-pills mb-3">
	<li class="nav-item">
		<a class="nav-link {{ request()->routeIs('emails.inbox*') ? 'active' : '' }}" href="{{ route('emails.inbox') }}">
			<i class="ti ti-inbox me-1"></i> Inbox
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link {{ request()->routeIs('emails.sent*') ? 'active' : '' }}" href="{{ route('emails.sent') }}">
			<i class="ti ti-send me-1"></i> Sent
		</a>
	</li>
	<li class="nav-item">
		<a class="nav-link {{ request()->routeIs('emails.compose') ? 'active' : '' }}" href="{{ route('emails.compose') }}">
			<i class="ti ti-pencil me-1"></i> Compose
		</a>
	</li>
</ul>
