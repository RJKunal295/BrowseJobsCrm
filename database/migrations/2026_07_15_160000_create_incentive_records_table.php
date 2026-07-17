<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('incentive_records', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->enum('type', ['incentive', 'bonus'])->default('incentive');

            // What this award is for: per_lead, target_achieved, festival_bonus, manual, etc.
            $table->string('basis')->nullable();
            $table->decimal('quantity', 12, 2)->nullable(); // e.g. number of leads converted
            $table->decimal('rate', 12, 2)->nullable();     // per-unit rate
            $table->decimal('amount', 12, 2);               // final awarded amount

            $table->unsignedTinyInteger('period_month'); // 1-12
            $table->unsignedSmallInteger('period_year');

            $table->enum('status', ['pending', 'approved', 'paid'])->default('pending');
            $table->text('notes')->nullable();

            $table->foreignId('awarded_by_user_id')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('awarded_at')->nullable();

            $table->timestamps();

            $table->index(['user_id', 'type']);
            $table->index(['period_year', 'period_month']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('incentive_records');
    }
};
