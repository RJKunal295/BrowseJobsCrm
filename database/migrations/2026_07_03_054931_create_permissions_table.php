<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('permissions', function (Blueprint $table) {
            $table->id();
            $table->string('name');          // e.g. "Manage Users"
            $table->string('slug')->unique(); // e.g. "manage_users" — used in code/middleware
            $table->string('module')->nullable(); // e.g. "User Management" — for grouping in a permissions UI
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('permissions');
    }
};