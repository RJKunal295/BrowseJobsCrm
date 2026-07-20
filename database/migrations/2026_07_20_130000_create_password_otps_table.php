<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('password_otps', function (Blueprint $table) {
            $table->id();
            $table->string('email');
            $table->string('purpose', 20);          // 'reset' (forgot) | 'change' (logged in)
            $table->string('code_hash');            // bcrypt of the 6-digit OTP
            // DATETIME, not TIMESTAMP: MariaDB gives the first TIMESTAMP column
            // an implicit ON UPDATE CURRENT_TIMESTAMP, which would silently
            // reset expiry every time `attempts` is incremented.
            $table->dateTime('expires_at');
            $table->unsignedTinyInteger('attempts')->default(0);
            $table->dateTime('consumed_at')->nullable();
            $table->timestamps();

            $table->index(['email', 'purpose']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('password_otps');
    }
};
