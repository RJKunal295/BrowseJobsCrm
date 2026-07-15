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
        Schema::create('users', function (Blueprint $table) {
            // ---------- Primary Key ----------
            $table->id();

            // ---------- 1. Basic Information ----------
            $table->string('employee_id')->unique();
            $table->string('first_name');
            $table->string('last_name')->nullable();
            $table->string('full_name')->nullable();
            $table->enum('gender', ['Male', 'Female', 'Other'])->nullable();
            $table->date('date_of_birth')->nullable();
            $table->string('profile_photo')->nullable();
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('phone', 20)->nullable();
            $table->string('whatsapp_number', 20)->nullable();
            $table->string('alternate_phone', 20)->nullable();

            // ---------- 2. Employment Details ----------
            $table->string('designation')->nullable();
            $table->string('department')->nullable();
            $table->foreignId('role_id')
                  ->nullable()
                  ->constrained('roles')
                  ->nullOnDelete();
            $table->foreignId('reporting_manager_id')
                  ->nullable()
                  ->constrained('users')
                  ->nullOnDelete();
            $table->enum('employee_type', ['Permanent', 'Contract', 'Intern'])->nullable();
            $table->date('joining_date')->nullable();
            $table->date('resignation_date')->nullable();
            $table->date('last_working_day')->nullable();
            $table->enum('employment_status', ['Active', 'Inactive', 'Resigned', 'Terminated'])
                  ->default('Active');

            // ---------- 3. Salary Details ----------
            $table->decimal('salary', 10, 2)->nullable();
            $table->enum('salary_type', ['Monthly', 'Hourly'])->nullable();
            $table->decimal('incentive', 10, 2)->nullable();
            $table->decimal('bonus', 10, 2)->nullable();
            $table->string('pan_number', 20)->nullable();
            $table->string('aadhaar_number', 20)->nullable();
            $table->string('pf_number', 30)->nullable();
            $table->string('esi_number', 30)->nullable();
            $table->string('uan_number', 30)->nullable();

            // ---------- 4. Bank Details ----------
            $table->string('bank_name')->nullable();
            $table->string('account_holder_name')->nullable();
            $table->string('account_number', 30)->nullable();
            $table->string('ifsc_code', 15)->nullable();
            $table->string('branch_name')->nullable();
            $table->string('upi_id')->nullable();

            // ---------- 5. Address ----------
            $table->text('address')->nullable();
            $table->string('city')->nullable();
            $table->string('state')->nullable();
            $table->string('country')->nullable();
            $table->string('pincode', 10)->nullable();

            // ---------- 6. Documents ----------
            $table->string('aadhaar_file')->nullable();
            $table->string('pan_file')->nullable();
            $table->string('resume')->nullable();
            $table->string('offer_letter')->nullable();
            $table->string('experience_letter')->nullable();
            $table->string('salary_slip')->nullable();
            $table->string('cancelled_cheque')->nullable();

            // ---------- 8. Audit Fields ----------
            $table->boolean('is_active')->default(true);
            $table->timestamp('last_login_at')->nullable();
            $table->rememberToken();
            $table->foreignId('created_by')->nullable()->constrained('users')->nullOnDelete();
            $table->foreignId('updated_by')->nullable()->constrained('users')->nullOnDelete();
            $table->softDeletes();
            $table->timestamps();

            // ---------- Indexes ----------
            $table->index('department');
            $table->index('role_id');
            $table->index('employment_status');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['role_id']);
            $table->dropForeign(['reporting_manager_id']);
            $table->dropForeign(['created_by']);
            $table->dropForeign(['updated_by']);
        });

        Schema::dropIfExists('users');
    }
};