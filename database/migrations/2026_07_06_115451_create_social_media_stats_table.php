<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('social_media_stats', function (Blueprint $table) {
            $table->id();

            $table->foreignId('social_account_id')->constrained('social_accounts')->cascadeOnDelete();
            $table->date('stat_date');

            $table->unsignedInteger('followers_count')->nullable();
            $table->unsignedInteger('posts_today')->default(0);
            $table->unsignedInteger('reach')->nullable();

            $table->timestamps();

            $table->unique(['social_account_id', 'stat_date']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('social_media_stats');
    }
};