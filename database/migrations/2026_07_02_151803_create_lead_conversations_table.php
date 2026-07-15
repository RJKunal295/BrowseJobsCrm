<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lead_conversations', function (Blueprint $table) {
            $table->id();

            $table->foreignId('lead_id')
                ->constrained('leads')
                ->cascadeOnDelete();

            $table->enum('channel', ['call', 'whatsapp', 'email', 'sms']);
            $table->enum('direction', ['inbound', 'outbound']);

            $table->longText('transcript');            // full call transcript or full WhatsApp/email text
            $table->unsignedInteger('duration_seconds')->nullable(); // for calls
            $table->string('recording_url')->nullable();             // call recording, if available

            $table->foreignId('handled_by_user_id')
                ->constrained('users')
                ->cascadeOnDelete();                    // HR Executive who had the conversation

            $table->timestamp('occurred_at');           // actual time of the call/message
            $table->timestamps();

            $table->index(['lead_id', 'occurred_at']);
            $table->index('channel');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('lead_conversations');
    }
};