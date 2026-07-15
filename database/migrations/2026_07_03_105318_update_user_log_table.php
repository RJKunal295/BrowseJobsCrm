<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('user_login_logs', function (Blueprint $table) {
            // Who actually closed this session — the user themselves (self-logout)
            // or an admin/HR person force-closing a stuck/forgotten session.
            $table->foreignId('logout_by_user_id')
                ->nullable()
                ->after('logout_reason')
                ->constrained('users')
                ->nullOnDelete();

            // Who created this row, ONLY relevant for manually-added attendance
            // (i.e. someone forgot to log in/out and HR is backfilling the record).
            $table->foreignId('created_by_user_id')
                ->nullable()
                ->after('logout_by_user_id')
                ->constrained('users')
                ->nullOnDelete();

            // True if this entire row was hand-created by HR/Admin rather than
            // generated automatically by the login/logout flow.
            $table->boolean('is_manual_entry')->default(false)->after('created_by_user_id');

            // Free-text explanation — required for manual entries and for
            // force-logouts performed by someone other than the session owner.
            $table->text('manual_reason')->nullable()->after('is_manual_entry');
        });
    }

    public function down(): void
    {
        Schema::table('user_login_logs', function (Blueprint $table) {
            $table->dropConstrainedForeignId('logout_by_user_id');
            $table->dropConstrainedForeignId('created_by_user_id');
            $table->dropColumn(['is_manual_entry', 'manual_reason']);
        });
    }
};