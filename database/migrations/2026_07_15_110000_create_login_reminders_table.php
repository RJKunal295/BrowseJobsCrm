<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('login_reminders', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->date('reminder_date');

            $table->unsignedInteger('email_count')->default(0);
            $table->unsignedInteger('whatsapp_count')->default(0);
            $table->timestamp('last_reminded_at')->nullable();

            $table->boolean('logged_in')->default(false);      // did they log in on this date (eventually)?
            $table->boolean('escalated')->default(false);       // was this reported to admins?
            $table->timestamp('escalated_at')->nullable();

            $table->timestamps();

            $table->unique(['user_id', 'reminder_date']);
            $table->index('reminder_date');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('login_reminders');
    }
};
