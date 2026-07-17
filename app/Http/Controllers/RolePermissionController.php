<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Models\Role;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class RolePermissionController extends Controller
{
    /**
     * Modules that are locked to fixed roles and must NOT be editable on this screen.
     * Their permissions still exist (they gate menus) but are hidden here and preserved on save.
     */
    private const HIDDEN_MODULES = ['User Management'];

    /**
     * Show the roles × permissions matrix.
     */
    public function index(): View
    {
        $roles = Role::orderBy('role_name')->get();
        $permissions = Permission::whereNotIn('module', self::HIDDEN_MODULES)
            ->orderBy('module')
            ->orderBy('name')
            ->get();

        // Map: role_id => [permission_id, permission_id, ...] currently granted
        $assigned = DB::table('role_permissions')
            ->get()
            ->groupBy('role_id')
            ->map(fn ($rows) => $rows->pluck('permission_id')->toArray());

        return view('roles-permissions.index', compact('roles', 'permissions', 'assigned'));
    }

    /**
     * Save the whole matrix in one submit.
     * Expects: permissions[{role_id}][] = permission_id (checkbox array per role)
     */
    public function update(Request $request): RedirectResponse
    {
        $submitted = $request->input('permissions', []); // [role_id => [permission_id, ...]]

        // Locked permissions are not on this screen — never delete or re-touch them.
        $lockedPermissionIds = Permission::whereIn('module', self::HIDDEN_MODULES)->pluck('id')->all();

        DB::transaction(function () use ($submitted, $lockedPermissionIds) {
            // Wipe only the editable (non-locked) grants, then re-insert what was submitted.
            DB::table('role_permissions')->whereNotIn('permission_id', $lockedPermissionIds)->delete();

            $rows = [];
            foreach ($submitted as $roleId => $permissionIds) {
                foreach ($permissionIds as $permissionId) {
                    if (in_array((int) $permissionId, $lockedPermissionIds, true)) {
                        continue; // ignore any locked permission that slipped through
                    }
                    $rows[] = [
                        'role_id' => $roleId,
                        'permission_id' => $permissionId,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];
                }
            }

            if (! empty($rows)) {
                DB::table('role_permissions')->insert($rows);
            }
        });

        return redirect()->route('roles-permissions.index')->with('success', 'Permissions updated successfully.');
    }
}
