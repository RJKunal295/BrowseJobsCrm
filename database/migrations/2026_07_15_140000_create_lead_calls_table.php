<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lead_calls', function (Blueprint $table) {
            $table->id();

            $table->foreignId('lead_id')->constrained('leads')->cascadeOnDelete();

            $table->enum('type', ['ai', 'manual'])->default('manual');
            $table->string('provider')->nullable();              // e.g. caller_digital
            $table->string('external_campaign_id')->nullable();  // Caller.Digital campaign id
            $table->string('external_call_id')->nullable();      // Caller.Digital call id
            $table->string('agent_id')->nullable();

            $table->enum('status', ['queued', 'ringing', 'in_progress', 'completed', 'failed', 'no_answer', 'busy', 'cancelled'])->default('queued');
            $table->string('disposition')->nullable();
            $table->string('sentiment')->nullable();

            $table->longText('transcript')->nullable();
            $table->string('recording_url', 1024)->nullable();   // provider recording link
            $table->string('audio_path')->nullable();            // locally uploaded audio (manual calls)
            $table->unsignedInteger('duration_seconds')->nullable();

            $table->string('from_number')->nullable();
            $table->string('to_number')->nullable();
            $table->string('language')->nullable();
            $table->json('meta')->nullable();

            $table->foreignId('initiated_by_user_id')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('started_at')->nullable();
            $table->timestamp('ended_at')->nullable();

            $table->timestamps();

            $table->index('lead_id');
            $table->index('external_campaign_id');
            $table->index('external_call_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('lead_calls');
    }
};
