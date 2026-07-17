<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Allow LinkedIn accounts (raw ALTER avoids needing doctrine/dbal). MySQL only —
        // sqlite (used in tests) stores enums as text and needs no change.
        if (DB::getDriverName() === 'mysql') {
            DB::statement("ALTER TABLE social_accounts MODIFY platform ENUM('instagram','youtube','linkedin') NOT NULL DEFAULT 'instagram'");
        }

        Schema::table('social_accounts', function (Blueprint $table) {
            $table->text('refresh_token')->nullable()->after('access_token');
            $table->unsignedBigInteger('followers_count')->nullable()->after('following_count');
        });

        Schema::table('social_media_posts', function (Blueprint $table) {
            $table->unsignedBigInteger('likes')->nullable()->after('published_at');
            $table->unsignedBigInteger('comments')->nullable()->after('likes');
            $table->unsignedBigInteger('shares')->nullable()->after('comments');
            $table->unsignedBigInteger('views')->nullable()->after('shares');
            $table->json('raw_payload')->nullable()->after('views');
            $table->timestamp('metrics_synced_at')->nullable()->after('raw_payload');
        });

        // One row per account tracks the "no new post" reminder state.
        Schema::create('social_post_reminders', function (Blueprint $table) {
            $table->id();

            $table->foreignId('social_account_id')->constrained('social_accounts')->cascadeOnDelete();
            $table->string('platform');
            $table->timestamp('last_post_at')->nullable();      // newest known post time
            $table->unsignedInteger('reminder_count')->default(0); // consecutive daily reminders sent
            $table->timestamp('last_reminded_at')->nullable();
            $table->boolean('resolved')->default(true);          // true = a recent post exists, no reminder needed

            $table->timestamps();

            $table->unique('social_account_id');
            $table->index('platform');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('social_post_reminders');

        Schema::table('social_media_posts', function (Blueprint $table) {
            $table->dropColumn(['likes', 'comments', 'shares', 'views', 'raw_payload', 'metrics_synced_at']);
        });

        Schema::table('social_accounts', function (Blueprint $table) {
            $table->dropColumn(['refresh_token', 'followers_count']);
        });

        if (DB::getDriverName() === 'mysql') {
            DB::statement("ALTER TABLE social_accounts MODIFY platform ENUM('instagram','youtube') NOT NULL DEFAULT 'instagram'");
        }
    }
};
