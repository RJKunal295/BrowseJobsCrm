<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OfficeFinanceMenuSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('permissions')->updateOrInsert(
            ['slug' => 'view_office_finance'],
            ['name' => 'View Office Finance', 'module' => 'Finance', 'created_at' => now(), 'updated_at' => now()]
        );

        $permissionId = DB::table('permissions')->where('slug', 'view_office_finance')->value('id');

        DB::table('menu_items')->updateOrInsert(
            ['title' => 'Office Finance', 'url' => 'office-finance'],
            [
                'parent_id' => null,
                'icon' => 'ti ti-report-money',
                'menu_group' => 'CRM',
                'permission_id' => $permissionId,
                'sort_order' => 15,
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        );

        $roleIds = DB::table('roles')
            ->whereIn('role_code', ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'ACCOUNTANT'])
            ->pluck('id');

        foreach ($roleIds as $roleId) {
            DB::table('role_permissions')->updateOrInsert([
                'role_id' => $roleId,
                'permission_id' => $permissionId,
            ]);
        }
    }
}
