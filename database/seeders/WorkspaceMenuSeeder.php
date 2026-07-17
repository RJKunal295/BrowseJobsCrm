<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class WorkspaceMenuSeeder extends Seeder
{
    public function run(): void
    {
        // Workspace tools are common — visible to every logged-in user (permission_id = null),
        // so they intentionally have NO permission and don't appear on the Roles & Permissions screen.
        $menuItems = [
            ['title' => 'Email',        'icon' => 'ti ti-mail',      'url' => 'email',        'sort_order' => 40],
            ['title' => 'To Do',        'icon' => 'ti ti-checklist', 'url' => 'todos',        'sort_order' => 41],
            ['title' => 'Notes',        'icon' => 'ti ti-notes',     'url' => 'notes',        'sort_order' => 42],
            ['title' => 'File Manager', 'icon' => 'ti ti-folders',   'url' => 'file-manager', 'sort_order' => 43],
        ];

        foreach ($menuItems as $item) {
            DB::table('menu_items')->updateOrInsert(
                ['title' => $item['title'], 'url' => $item['url']],
                [
                    'parent_id' => null,
                    'icon' => $item['icon'],
                    'menu_group' => 'Workspace',
                    'permission_id' => null, // common — visible to everyone
                    'sort_order' => $item['sort_order'],
                    'is_active' => true,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]
            );
        }
    }
}
