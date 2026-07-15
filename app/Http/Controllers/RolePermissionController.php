<?php

namespace App\Http\Controllers;

use App\Models\Permission;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class RolePermissionController extends Controller
{
    /**
     * Show the roles × permissions matrix.
     */
    public function index(): View
    {
        $roles = Role::orderBy('role_name')->get();
        $permissions = Permission::orderBy('module')->orderBy('name')->get();

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

        DB::transaction(function () use ($submitted) {
            DB::table('role_permissions')->delete();

            $rows = [];
            foreach ($submitted as $roleId => $permissionIds) {
                foreach ($permissionIds as $permissionId) {
                    $rows[] = [
                        'role_id'       => $roleId,
                        'permission_id' => $permissionId,
                        'created_at'    => now(),
                        'updated_at'    => now(),
                    ];
                }
            }

            if (!empty($rows)) {
                DB::table('role_permissions')->insert($rows);
            }
        });

        return redirect()->route('roles-permissions.index')->with('success', 'Permissions updated successfully.');
    }
}