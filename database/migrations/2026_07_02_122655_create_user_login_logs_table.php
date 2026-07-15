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
        Schema::create('user_login_logs', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')
                  ->constrained('users')
                  ->cascadeOnDelete();

            $table->string('session_token')->nullable()->index();

            // ---------- Login Info ----------
            $table->dateTime('login_time')->nullable();
            $table->string('login_ip', 45)->nullable();
            $table->string('login_device_id')->nullable();
            $table->string('login_device_name')->nullable();
            $table->string('login_device_type', 50)->nullable(); // e.g. mobile, desktop, tablet
            $table->string('login_browser')->nullable();
            $table->string('login_os')->nullable();
            $table->text('login_user_agent')->nullable();
            $table->decimal('login_latitude', 10, 8)->nullable();
            $table->decimal('login_longitude', 11, 8)->nullable();
            $table->string('login_location')->nullable(); // resolved address/city

            // ---------- Logout Info ----------
            $table->dateTime('logout_time')->nullable();
            $table->string('logout_ip', 45)->nullable();
            $table->string('logout_device_id')->nullable();
            $table->string('logout_reason')->nullable();

            // ---------- Session State ----------
            $table->boolean('is_active_session')->default(true);

            $table->timestamps();

            // ---------- Indexes ----------
            $table->index('user_id');
            $table->index('login_time');
            $table->index('is_active_session');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user_login_logs');
    }
};