<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Named lead_notifications (not "notifications") to avoid clashing with
        // Laravel's built-in notifications table if you ever use it.
        Schema::create('lead_notifications', function (Blueprint $table) {
            $table->id();

            $table->foreignId('lead_id')
                ->constrained('leads')
                ->cascadeOnDelete();

            $table->foreignId('notify_user_id')
                ->constrained('users')
                ->cascadeOnDelete();                 // HR Manager on creation, HR Executive on assignment

            $table->string('type');                  // lead_created, lead_assigned
            $table->string('channel')->default('system'); // system, whatsapp, email

            $table->boolean('is_read')->default(false);
            $table->timestamp('sent_at')->nullable();

            $table->timestamps();

            $table->index(['notify_user_id', 'is_read']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('lead_notifications');
    }
};