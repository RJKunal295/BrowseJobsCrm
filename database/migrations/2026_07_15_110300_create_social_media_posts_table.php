<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('social_media_posts', function (Blueprint $table) {
            $table->id();

            $table->foreignId('social_account_id')->constrained('social_accounts')->cascadeOnDelete();
            $table->string('platform');
            $table->string('external_post_id');            // provider's media/video/post ID
            $table->text('caption')->nullable();
            $table->string('media_type')->nullable();       // IMAGE, VIDEO, REEL, etc.
            $table->string('permalink')->nullable();
            $table->string('thumbnail_url', 1024)->nullable();
            $table->timestamp('published_at')->nullable();
            $table->boolean('notified')->default(false);    // have we alerted admins about this post?

            $table->timestamps();

            $table->unique(['social_account_id', 'external_post_id']);
            $table->index('platform');
        });

        Schema::create('social_alert_settings', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_id')->constrained('users')->cascadeOnDelete();
            $table->enum('platform', ['instagram', 'youtube', 'linkedin']);
            $table->boolean('enabled')->default(true);

            $table->timestamps();

            $table->unique(['user_id', 'platform']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('social_alert_settings');
        Schema::dropIfExists('social_media_posts');
    }
};
