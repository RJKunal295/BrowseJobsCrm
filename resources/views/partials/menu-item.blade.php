{{-- resources/views/partials/menu-item.blade.php --}}
{{-- Renders one menu item; recurses into itself for children of any depth. --}}

@php
	$hasChildren = $item->childrenTree->isNotEmpty();
	$href = $item->url ? url($item->url) : 'javascript:void(0);';
	$isActive = $item->url && request()->is(trim($item->url, '/') . '*');
@endphp

<li class="{{ $hasChildren ? 'submenu' . ($depth > 0 ? ' submenu-two' : '') : '' }}">
	<a href="{{ $href }}" class="{{ $isActive ? 'active' . ($hasChildren ? ' subdrop' : '') : '' }}">
		@if ($item->icon)
			<i class="{{ $item->icon }}"></i>
		@endif
		<span>{{ $item->title }}</span>
		@if ($hasChildren)
			<span class="menu-arrow{{ $depth > 0 ? ' inside-submenu' : '' }}"></span>
		@endif
	</a>

	@if ($hasChildren)
		<ul>
			@foreach ($item->childrenTree as $child)
				@include('partials.menu-item', ['item' => $child, 'depth' => $depth + 1])
			@endforeach
		</ul>
	@endif
</li>