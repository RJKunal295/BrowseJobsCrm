<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class SocialAnalyticsMenuSeeder extends Seeder
{
    public function run(): void
    {
        // Place "Social Analytics" under the Social Feed group (parent id resolved by title).
        $parentId = DB::table('menu_items')->where('title', 'Social Feed')->value('id');

        DB::table('menu_items')->updateOrInsert(
            ['title' => 'Social Analytics', 'url' => 'social-analytics'],
            [
                'parent_id' => $parentId,
                'icon' => 'ti ti-chart-line',
                'menu_group' => 'Main Menu',
                'permission_id' => null, // visible to any logged-in user
                'sort_order' => 12,
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        );
    }
}
