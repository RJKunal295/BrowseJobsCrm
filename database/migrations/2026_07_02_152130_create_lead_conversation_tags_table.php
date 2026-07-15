<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('lead_conversation_tags', function (Blueprint $table) {
            $table->id();

            $table->foreignId('conversation_id')
                ->constrained('lead_conversations')
                ->cascadeOnDelete();

            $table->string('tag'); // e.g. price_objection, no_answer, asked_for_callback, confused_about_offer

            $table->timestamps();

            $table->index('tag');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('lead_conversation_tags');
    }
};