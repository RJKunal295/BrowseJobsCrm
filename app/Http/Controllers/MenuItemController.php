<?php

namespace App\Http\Controllers;

use App\Models\MenuItem;
use App\Models\Permission;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class MenuItemController extends Controller
{
    public function index(): View
    {
        $menuItems = MenuItem::with(['parent', 'permission'])
            ->orderBy('menu_group')
            ->orderBy('sort_order')
            ->paginate(20);

        return view('menu-items.index', compact('menuItems'));
    }

    public function create(): View
    {
        $parents = MenuItem::topLevel()->orderBy('title')->get();
        $permissions = Permission::orderBy('name')->get();

        return view('menu-items.create', compact('parents', 'permissions'));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'parent_id'     => 'nullable|exists:menu_items,id',
            'title'         => 'required|string|max:100',
            'icon'          => 'nullable|string|max:100',
            'url'           => 'nullable|string|max:255',
            'menu_group'    => 'nullable|string|max:100',
            'permission_id' => 'nullable|exists:permissions,id',
            'sort_order'    => 'nullable|integer|min:0',
            'is_active'     => 'nullable|boolean',
        ]);

        $validated['is_active'] = $request->boolean('is_active', true);
        $validated['sort_order'] = $validated['sort_order'] ?? 0;

        MenuItem::create($validated);

        return redirect()->route('menu-items.index')->with('success', 'Menu item created successfully.');
    }

    public function edit(MenuItem $menuItem): View
    {
        $parents = MenuItem::topLevel()->where('id', '!=', $menuItem->id)->orderBy('title')->get();
        $permissions = Permission::orderBy('name')->get();

        return view('menu-items.edit', compact('menuItem', 'parents', 'permissions'));
    }

    public function update(Request $request, MenuItem $menuItem): RedirectResponse
    {
        $validated = $request->validate([
            'parent_id'     => 'nullable|exists:menu_items,id|different:id',
            'title'         => 'required|string|max:100',
            'icon'          => 'nullable|string|max:100',
            'url'           => 'nullable|string|max:255',
            'menu_group'    => 'nullable|string|max:100',
            'permission_id' => 'nullable|exists:permissions,id',
            'sort_order'    => 'nullable|integer|min:0',
            'is_active'     => 'nullable|boolean',
        ]);

        $validated['is_active'] = $request->boolean('is_active', true);
        $validated['sort_order'] = $validated['sort_order'] ?? 0;

        $menuItem->update($validated);

        return redirect()->route('menu-items.index')->with('success', 'Menu item updated successfully.');
    }

    public function destroy(MenuItem $menuItem): RedirectResponse
    {
        $menuItem->delete();

        return redirect()->route('menu-items.index')->with('success', 'Menu item deleted successfully.');
    }
}