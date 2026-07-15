<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lead_assignments', function (Blueprint $table) {
            $table->id();

            $table->foreignId('lead_id')
                ->constrained('leads')
                ->cascadeOnDelete();

            $table->foreignId('assigned_to_user_id')
                ->constrained('users')
                ->cascadeOnDelete();                  // HR Executive

            $table->foreignId('assigned_by_user_id')
                ->constrained('users')
                ->cascadeOnDelete();                  // HR Manager

            $table->timestamp('assigned_at');
            $table->timestamps();

            $table->index('lead_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('lead_assignments');
    }
};