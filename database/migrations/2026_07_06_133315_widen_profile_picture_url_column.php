<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('social_accounts', function (Blueprint $table) {
            // Instagram's CDN URLs (with all their signed query params) can
            // easily exceed 255 characters — VARCHAR was too small.
            $table->text('profile_picture_url')->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('social_accounts', function (Blueprint $table) {
            $table->string('profile_picture_url')->nullable()->change();
        });
    }
};