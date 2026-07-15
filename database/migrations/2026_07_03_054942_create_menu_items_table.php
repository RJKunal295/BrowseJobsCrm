<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('menu_items', function (Blueprint $table) {
            $table->id();

            $table->foreignId('parent_id')
                ->nullable()
                ->constrained('menu_items')
                ->cascadeOnDelete();          // null = top-level menu item

            $table->string('title');
            $table->string('icon')->nullable();      // e.g. "ti ti-users"
            $table->string('url')->nullable();        // e.g. "manage-users" — passed to url()
            $table->string('menu_group')->nullable(); // e.g. "Main Menu", "CRM", "Reports" — the section header

            $table->foreignId('permission_id')
                ->nullable()
                ->constrained('permissions')
                ->nullOnDelete();             // null = visible to any logged-in user (e.g. Dashboard)

            $table->unsignedInteger('sort_order')->default(0);
            $table->boolean('is_active')->default(true);

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('menu_items');
    }
};