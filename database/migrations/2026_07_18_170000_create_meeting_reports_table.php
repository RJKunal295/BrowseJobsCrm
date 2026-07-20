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
        Schema::create('meeting_reports', function (Blueprint $table) {
            $table->id();
            $table->string('drive_file_id')->unique();       // transcript Google Doc id (dedup key)
            $table->string('title');
            $table->date('meeting_date');
            $table->json('attendees')->nullable();           // names detected in the transcript
            $table->json('absentees')->nullable();           // active users NOT detected
            $table->longText('analysis');                    // AI markdown report
            $table->string('provider', 40)->nullable();
            $table->string('model', 100)->nullable();
            $table->string('transcript_link')->nullable();   // Drive webViewLink
            $table->timestamps();

            $table->index('meeting_date');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('meeting_reports');
    }
};
