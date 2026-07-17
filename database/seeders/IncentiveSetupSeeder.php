<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class IncentiveSetupSeeder extends Seeder
{
    public function run(): void
    {
        // ---- Menu item (reuses the existing Office Finance permission) ----
        $permissionId = DB::table('permissions')->where('slug', 'view_office_finance')->value('id');

        DB::table('menu_items')->updateOrInsert(
            ['title' => 'Incentives & Bonuses', 'url' => 'incentives'],
            [
                'parent_id' => null,
                'icon' => 'ti ti-trophy',
                'menu_group' => 'CRM',
                'permission_id' => $permissionId,
                'sort_order' => 16,
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        );

        // ---- Carry any existing fixed incentive/bonus into performance records (once) ----
        if (DB::table('incentive_records')->exists()) {
            return;
        }

        $month = now()->month;
        $year = now()->year;

        DB::table('users')
            ->where(fn ($q) => $q->where('incentive', '>', 0)->orWhere('bonus', '>', 0))
            ->select('id', 'incentive', 'bonus')
            ->orderBy('id')
            ->chunk(200, function ($users) use ($month, $year) {
                foreach ($users as $user) {
                    foreach (['incentive', 'bonus'] as $type) {
                        if ((float) $user->$type > 0) {
                            DB::table('incentive_records')->insert([
                                'user_id' => $user->id,
                                'type' => $type,
                                'basis' => 'opening_balance',
                                'amount' => $user->$type,
                                'period_month' => $month,
                                'period_year' => $year,
                                'status' => 'paid',
                                'awarded_at' => now(),
                                'created_at' => now(),
                                'updated_at' => now(),
                            ]);
                        }
                    }
                }
            });
    }
}
