<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LeadPermissionsSeeder extends Seeder
{
    public function run(): void
    {
        $grants = [
            // Only these roles may ADD a lead.
            'create_lead' => ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'HR_MANAGER', 'MEDIA_STRATEGIST'],
            // Only these roles may see ALL leads; everyone else is scoped to their own.
            'view_all_leads' => ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'HR_MANAGER'],
        ];

        foreach ($grants as $slug => $roleCodes) {
            DB::table('permissions')->updateOrInsert(
                ['slug' => $slug],
                ['name' => ucwords(str_replace('_', ' ', $slug)), 'module' => 'CRM', 'created_at' => now(), 'updated_at' => now()]
            );

            $permissionId = DB::table('permissions')->where('slug', $slug)->value('id');
            $roleIds = DB::table('roles')->whereIn('role_code', $roleCodes)->pluck('id');

            // Reset then grant, so the rule is exact (no stray roles keep it).
            DB::table('role_permissions')->where('permission_id', $permissionId)->delete();

            foreach ($roleIds as $roleId) {
                DB::table('role_permissions')->insert([
                    'role_id' => $roleId,
                    'permission_id' => $permissionId,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}
