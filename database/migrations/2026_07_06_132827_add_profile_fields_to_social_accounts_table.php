<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('social_accounts', function (Blueprint $table) {
            $table->string('username')->nullable()->after('ig_user_id');
            $table->string('account_type')->nullable()->after('username'); // BUSINESS / CREATOR
            $table->string('profile_picture_url')->nullable()->after('account_type');
            $table->text('biography')->nullable()->after('profile_picture_url');
            $table->unsignedInteger('following_count')->nullable()->after('biography');
            $table->timestamp('last_synced_at')->nullable()->after('token_expires_at');
        });
    }

    public function down(): void
    {
        Schema::table('social_accounts', function (Blueprint $table) {
            $table->dropColumn([
                'username', 'account_type', 'profile_picture_url',
                'biography', 'following_count', 'last_synced_at',
            ]);
        });
    }
};