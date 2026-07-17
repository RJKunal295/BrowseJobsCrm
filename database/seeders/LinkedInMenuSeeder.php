<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class LinkedInMenuSeeder extends Seeder
{
    public function run(): void
    {
        // Point the existing "LinkedIn" menu item at the real integration page
        // (it previously pointed at the placeholder "audio-call").
        DB::table('menu_items')
            ->where('title', 'LinkedIn')
            ->update([
                'url' => 'social-accounts/linkedin',
                'icon' => 'ti ti-brand-linkedin',
                'updated_at' => now(),
            ]);
    }
}
