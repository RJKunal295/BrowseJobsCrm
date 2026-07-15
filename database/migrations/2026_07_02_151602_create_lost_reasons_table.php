<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lost_reasons', function (Blueprint $table) {
            $table->id();
            $table->string('reason')->unique();
            $table->timestamps();
        });

        DB::table('lost_reasons')->insert([
            ['reason' => 'Price too high',                'created_at' => now(), 'updated_at' => now()],
            ['reason' => 'Joined a competitor',            'created_at' => now(), 'updated_at' => now()],
            ['reason' => 'No response after follow-ups',   'created_at' => now(), 'updated_at' => now()],
            ['reason' => 'Wrong / invalid number',          'created_at' => now(), 'updated_at' => now()],
            ['reason' => 'Not interested in offer',         'created_at' => now(), 'updated_at' => now()],
            ['reason' => 'Location / timing not suitable',  'created_at' => now(), 'updated_at' => now()],
            ['reason' => 'Other',                           'created_at' => now(), 'updated_at' => now()],
        ]);
    }

    public function down(): void
    {
        Schema::dropIfExists('lost_reasons');
    }
};