<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolePermissionRealignSeeder extends Seeder
{
    /**
     * Only these roles may see the User Management menu group.
     */
    private const USER_MANAGEMENT_ROLES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS'];

    public function run(): void
    {
        $this->lockUserManagement();
        $this->makeWorkspaceCommon();
    }

    /**
     * Grant every User Management permission to ONLY the three allowed roles, and revoke from all others.
     */
    private function lockUserManagement(): void
    {
        $permissionIds = DB::table('menu_items')
            ->where('menu_group', 'User Management')
            ->whereNotNull('permission_id')
            ->pluck('permission_id')
            ->unique();

        if ($permissionIds->isEmpty()) {
            return;
        }

        $keepRoleIds = DB::table('roles')
            ->whereIn('role_code', self::USER_MANAGEMENT_ROLES)
            ->pluck('id');

        foreach ($permissionIds as $permissionId) {
            // Revoke from every role that shouldn't have it.
            DB::table('role_permissions')
                ->where('permission_id', $permissionId)
                ->whereNotIn('role_id', $keepRoleIds)
                ->delete();

            // Ensure the three allowed roles have it.
            foreach ($keepRoleIds as $roleId) {
                DB::table('role_permissions')->updateOrInsert([
                    'role_id' => $roleId,
                    'permission_id' => $permissionId,
                ]);
            }
        }
    }

    /**
     * Make Workspace menu items visible to everyone (permission_id = null) and remove their
     * permissions entirely so they no longer appear on the Roles & Permissions screen.
     */
    private function makeWorkspaceCommon(): void
    {
        $workspacePermissionIds = DB::table('menu_items')
            ->where('menu_group', 'Workspace')
            ->whereNotNull('permission_id')
            ->pluck('permission_id')
            ->unique();

        // Common = no permission required.
        DB::table('menu_items')
            ->where('menu_group', 'Workspace')
            ->update(['permission_id' => null, 'updated_at' => now()]);

        if ($workspacePermissionIds->isNotEmpty()) {
            DB::table('role_permissions')->whereIn('permission_id', $workspacePermissionIds)->delete();
            DB::table('permissions')->whereIn('id', $workspacePermissionIds)->delete();
        }
    }
}
