<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('milestones', function (Blueprint $table) {
            $table->id();

            $table->string('title');
            $table->text('description')->nullable();

            // What we measure: 'leads' auto-counts from the leads table; 'custom' is entered manually.
            $table->enum('metric', ['leads', 'custom'])->default('leads');

            // Time window the target applies to.
            $table->enum('period_type', ['monthly', 'quarterly', 'yearly'])->default('monthly');
            $table->unsignedSmallInteger('period_year');
            $table->unsignedTinyInteger('period_month')->nullable();   // 1-12 for monthly
            $table->unsignedTinyInteger('period_quarter')->nullable(); // 1-4 for quarterly

            $table->decimal('target_value', 15, 2);
            $table->decimal('current_value', 15, 2)->default(0);       // used when metric = custom

            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();

            $table->timestamps();

            $table->index(['metric', 'period_type', 'period_year']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('milestones');
    }
};
