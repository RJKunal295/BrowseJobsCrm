<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lead_statuses', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('slug')->unique();
            $table->string('color')->nullable();
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
        });

        // Seed the default statuses so the app has them immediately after migrating.
        DB::table('lead_statuses')->insert([
            ['name' => 'New',            'slug' => 'new',             'sort_order' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Interested',     'slug' => 'interested',      'sort_order' => 2, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Follow-up',      'slug' => 'follow_up',       'sort_order' => 3, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Not Interested', 'slug' => 'not_interested',  'sort_order' => 4, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Invalid Number', 'slug' => 'invalid_number',  'sort_order' => 5, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Joined',         'slug' => 'joined',          'sort_order' => 6, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Lost',           'slug' => 'lost',            'sort_order' => 7, 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('lead_statuses');
    }
};