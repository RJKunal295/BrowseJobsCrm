<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('leave_types', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('code')->unique();
            $table->unsignedInteger('default_days_per_year')->default(0);
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        DB::table('leave_types')->insert([
            ['name' => 'Casual Leave',   'code' => 'casual',   'default_days_per_year' => 12, 'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Sick Leave',     'code' => 'sick',     'default_days_per_year' => 10, 'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Earned Leave',   'code' => 'earned',   'default_days_per_year' => 15, 'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Maternity Leave','code' => 'maternity','default_days_per_year' => 90, 'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Paternity Leave','code' => 'paternity','default_days_per_year' => 7,  'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
            ['name' => 'Unpaid Leave',   'code' => 'unpaid',   'default_days_per_year' => 0,  'is_active' => 1, 'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('leave_types');
    }
};