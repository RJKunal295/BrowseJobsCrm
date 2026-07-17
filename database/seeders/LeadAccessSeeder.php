<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LeadAccessSeeder extends Seeder
{
    public function run(): void
    {
        $permissionId = DB::table('permissions')->where('slug', 'view_leads')->value('id');

        if (! $permissionId) {
            $permissionId = DB::table('permissions')->insertGetId([
                'name' => 'View Leads',
                'slug' => 'view_leads',
                'module' => 'CRM',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

        $roleCodes = [
            'SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'HR_MANAGER',
            'HR', 'HR_TEAM_LEAD', 'HR_ADMIN', 'MEDIA_STRATEGIST',
            'SALES_MANAGER', 'SALES_EXECUTIVE',
        ];

        $roleIds = DB::table('roles')->whereIn('role_code', $roleCodes)->pluck('id');

        foreach ($roleIds as $roleId) {
            DB::table('role_permissions')->updateOrInsert([
                'role_id' => $roleId,
                'permission_id' => $permissionId,
            ]);
        }
    }
}
