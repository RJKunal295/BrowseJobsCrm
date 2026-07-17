<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('campaigns', function (Blueprint $table) {
            $table->id();

            $table->string('name');
            $table->enum('channel', ['email', 'whatsapp', 'both'])->default('email');
            $table->enum('audience', ['all', 'active'])->default('active'); // students

            $table->string('subject')->nullable();                 // email subject
            $table->longText('body');                              // email HTML / whatsapp text
            $table->string('whatsapp_template')->nullable();       // optional approved template name
            $table->string('whatsapp_template_lang')->default('en_US');

            $table->enum('status', ['draft', 'sending', 'sent', 'failed'])->default('draft');
            $table->unsignedInteger('total_recipients')->default(0);
            $table->unsignedInteger('sent_email')->default(0);
            $table->unsignedInteger('sent_whatsapp')->default(0);
            $table->unsignedInteger('failed_count')->default(0);

            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();
            $table->timestamp('sent_at')->nullable();

            $table->timestamps();

            $table->index('status');
        });

        Schema::create('campaign_recipients', function (Blueprint $table) {
            $table->id();

            $table->foreignId('campaign_id')->constrained('campaigns')->cascadeOnDelete();
            $table->foreignId('student_id')->nullable()->constrained('students')->nullOnDelete();

            $table->string('name')->nullable();
            $table->string('email')->nullable();
            $table->string('phone')->nullable();

            $table->enum('email_status', ['skipped', 'pending', 'sent', 'failed'])->default('skipped');
            $table->enum('whatsapp_status', ['skipped', 'pending', 'sent', 'failed'])->default('skipped');
            $table->text('error')->nullable();

            $table->timestamps();

            $table->index('campaign_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('campaign_recipients');
        Schema::dropIfExists('campaigns');
    }
};
