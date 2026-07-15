<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('social_accounts', function (Blueprint $table) {
            $table->id();

            $table->enum('platform', ['instagram'])->default('instagram'); // extend later: facebook, linkedin, youtube
            $table->string('label'); // e.g. "Browsejobs", "The Offer Letter", "Kris Personal"
            $table->string('ig_user_id')->nullable(); // Instagram Business Account ID (resolved from the token)

            // Encrypted at rest via the model's cast — never stored or logged in plaintext.
            $table->text('access_token');
            $table->timestamp('token_expires_at')->nullable();

            $table->boolean('is_active')->default(true);
            $table->text('last_error')->nullable(); // last API error, for quick diagnosis in the UI

            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('social_accounts');
    }
};