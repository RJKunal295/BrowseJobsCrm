<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MenuPermissionSeeder extends Seeder
{
    public function run(): void
    {
        // ---- 1. Define permissions (slug = what you check in code) ----
        $permissions = [
            ['name' => 'View Dashboard',     'slug' => 'view_dashboard',     'module' => 'Dashboard'],
            ['name' => 'View Leads',         'slug' => 'view_leads',         'module' => 'CRM'],
            ['name' => 'Manage Users',       'slug' => 'manage_users',       'module' => 'User Management'],
            ['name' => 'Manage Roles',       'slug' => 'manage_roles',       'module' => 'User Management'],
            ['name' => 'View Login History', 'slug' => 'view_login_history', 'module' => 'User Management'],
            ['name' => 'View Reports',       'slug' => 'view_reports',       'module' => 'Reports'],
        ];

        foreach ($permissions as $permission) {
            DB::table('permissions')->updateOrInsert(
                ['slug' => $permission['slug']],
                array_merge($permission, ['created_at' => now(), 'updated_at' => now()])
            );
        }

        $permissionIds = DB::table('permissions')->pluck('id', 'slug');

        // ---- 2. Define menu items (this is your "add a new menu" template) ----
        // parent = null for top-level; menu_group = the section header text.
        $menuItems = [
            ['title' => 'Dashboard',    'icon' => 'ti ti-dashboard',   'url' => '/',             'menu_group' => 'Main Menu', 'permission' => 'view_dashboard', 'sort_order' => 1],
            ['title' => 'Leads',        'icon' => 'ti ti-chart-arcs',  'url' => 'leads',         'menu_group' => 'CRM',       'permission' => 'view_leads',      'sort_order' => 10],
            ['title' => 'Manage Users', 'icon' => 'ti ti-users',       'url' => 'manage-users',  'menu_group' => 'User Management', 'permission' => 'manage_users', 'sort_order' => 20],
            ['title' => 'Roles & Permissions', 'icon' => 'ti ti-user-shield', 'url' => 'roles-permissions', 'menu_group' => 'User Management', 'permission' => 'manage_roles', 'sort_order' => 21],
            ['title' => 'Login History', 'icon' => 'ti ti-lock-star',  'url' => 'login-history', 'menu_group' => 'User Management', 'permission' => 'view_login_history', 'sort_order' => 22],
            ['title' => 'Revenue Report', 'icon' => 'ti ti-file-dollar', 'url' => 'revenue-report', 'menu_group' => 'Reports', 'permission' => 'view_reports', 'sort_order' => 30],
        ];

        foreach ($menuItems as $item) {
            DB::table('menu_items')->updateOrInsert(
                ['title' => $item['title'], 'url' => $item['url']],
                [
                    'parent_id'     => null,
                    'icon'          => $item['icon'],
                    'menu_group'    => $item['menu_group'],
                    'permission_id' => $permissionIds[$item['permission']] ?? null,
                    'sort_order'    => $item['sort_order'],
                    'is_active'     => true,
                    'created_at'    => now(),
                    'updated_at'    => now(),
                ]
            );
        }

        // ---- 3. Grant permissions to roles ----
        // Example: Super Admin (role_code SUPER_ADMIN) gets everything.
        $superAdminRoleId = DB::table('roles')->where('role_code', 'SUPER_ADMIN')->value('id');

        if ($superAdminRoleId) {
            foreach ($permissionIds as $permissionId) {
                DB::table('role_permissions')->updateOrInsert([
                    'role_id'       => $superAdminRoleId,
                    'permission_id' => $permissionId,
                ]);
            }
        }

        // Example: HR Manager only gets user-management-related permissions.
        $hrManagerRoleId = DB::table('roles')->where('role_code', 'HR_MANAGER')->value('id');

        if ($hrManagerRoleId) {
            foreach (['view_dashboard', 'manage_users', 'view_login_history'] as $slug) {
                if (isset($permissionIds[$slug])) {
                    DB::table('role_permissions')->updateOrInsert([
                        'role_id'       => $hrManagerRoleId,
                        'permission_id' => $permissionIds[$slug],
                    ]);
                }
            }
        }
    }
}