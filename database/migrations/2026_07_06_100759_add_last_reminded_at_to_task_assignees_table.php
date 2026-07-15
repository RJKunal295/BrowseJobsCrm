<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('task_assignees', function (Blueprint $table) {
            // is_flagged/flagged_at stay as a permanent "this has been overdue
            // at some point" marker for the UI badge. last_reminded_at is what
            // actually controls whether today's reminder gets (re-)sent.
            $table->timestamp('last_reminded_at')->nullable()->after('flagged_at');
        });
    }

    public function down(): void
    {
        Schema::table('task_assignees', function (Blueprint $table) {
            $table->dropColumn('last_reminded_at');
        });
    }
};