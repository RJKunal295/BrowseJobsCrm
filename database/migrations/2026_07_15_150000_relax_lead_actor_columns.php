<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Website-captured leads have no internal user, and AI-driven status changes have no
        // human actor — allow these FK columns to be null. MySQL only; sqlite (tests) can't
        // MODIFY and its enum/text columns are already flexible.
        if (DB::getDriverName() !== 'mysql') {
            return;
        }

        DB::statement('ALTER TABLE leads MODIFY added_by_user_id BIGINT UNSIGNED NULL');
        DB::statement('ALTER TABLE lead_status_history MODIFY changed_by_user_id BIGINT UNSIGNED NULL');
    }

    public function down(): void
    {
        if (DB::getDriverName() !== 'mysql') {
            return;
        }

        DB::statement('ALTER TABLE leads MODIFY added_by_user_id BIGINT UNSIGNED NOT NULL');
        DB::statement('ALTER TABLE lead_status_history MODIFY changed_by_user_id BIGINT UNSIGNED NOT NULL');
    }
};
