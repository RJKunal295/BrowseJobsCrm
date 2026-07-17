<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MessagingMenuSeeder extends Seeder
{
    public function run(): void
    {
        // ---- 1. New permissions (login reminders + social alerts) ----
        $permissions = [
            ['name' => 'View Login Reminders', 'slug' => 'view_login_reminders', 'module' => 'Reports'],
            ['name' => 'Manage Social Alerts',  'slug' => 'view_social_alerts',    'module' => 'Social'],
        ];

        foreach ($permissions as $permission) {
            DB::table('permissions')->updateOrInsert(
                ['slug' => $permission['slug']],
                array_merge($permission, ['created_at' => now(), 'updated_at' => now()])
            );
        }

        $permissionIds = DB::table('permissions')->pluck('id', 'slug');

        // ---- 2. New menu items ----
        $menuItems = [
            ['title' => 'Login Reminders', 'icon' => 'ti ti-bell-exclamation', 'url' => 'login-reminders', 'menu_group' => 'Reports',   'permission' => 'view_login_reminders', 'sort_order' => 31],
            ['title' => 'Social Alerts',   'icon' => 'ti ti-bell-ringing',      'url' => 'social-alerts',   'menu_group' => 'Main Menu', 'permission' => 'view_social_alerts',    'sort_order' => 6],
        ];

        foreach ($menuItems as $item) {
            DB::table('menu_items')->updateOrInsert(
                ['title' => $item['title'], 'url' => $item['url']],
                [
                    'parent_id' => null,
                    'icon' => $item['icon'],
                    'menu_group' => $item['menu_group'],
                    'permission_id' => $permissionIds[$item['permission']] ?? null,
                    'sort_order' => $item['sort_order'],
                    'is_active' => true,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );
        }

        // ---- 3. Grant permissions to the two admin roles ----
        $grantSlugs = [
            'view_login_reminders', 'view_social_alerts',
            // Ensure these roles can also reach Milestones + Campaigns.
            'view_milestones', 'view_campaign', 'view_email_campaign',
            'view_whatsapp_campaign', 'view_sms_campaign', 'view_social_campaign',
        ];

        $roleIds = DB::table('roles')
            ->whereIn('role_code', ['SUPER_ADMIN', 'HEAD_OF_OPERATIONS'])
            ->pluck('id');

        foreach ($roleIds as $roleId) {
            foreach ($grantSlugs as $slug) {
                if (isset($permissionIds[$slug])) {
                    DB::table('role_permissions')->updateOrInsert([
                        'role_id' => $roleId,
                        'permission_id' => $permissionIds[$slug],
                    ]);
                }
            }
        }

        // Social Media Manager also manages / receives social alerts.
        $socialManagerRoleId = DB::table('roles')->where('role_code', 'SOCIAL_MEDIA_MANAGER')->value('id');

        if ($socialManagerRoleId && isset($permissionIds['view_social_alerts'])) {
            DB::table('role_permissions')->updateOrInsert([
                'role_id' => $socialManagerRoleId,
                'permission_id' => $permissionIds['view_social_alerts'],
            ]);
        }
    }
}
