<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Widen the enum to include youtube. Raw SQL, since Laravel's schema
        // builder doesn't have a clean cross-DB way to alter enum values.
        DB::statement("ALTER TABLE social_accounts MODIFY platform ENUM('instagram', 'youtube') NOT NULL DEFAULT 'instagram'");

        Schema::table('social_accounts', function (Blueprint $table) {
            $table->string('channel_id')->nullable()->after('ig_user_id');
        });
    }

    public function down(): void
    {
        Schema::table('social_accounts', function (Blueprint $table) {
            $table->dropColumn('channel_id');
        });

        DB::statement("ALTER TABLE social_accounts MODIFY platform ENUM('instagram') NOT NULL DEFAULT 'instagram'");
    }
};