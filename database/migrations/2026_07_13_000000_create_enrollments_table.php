<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

// Save as: database/migrations/2026_07_13_000000_create_enrollments_table.php
// Then run: php artisan migrate

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('enrollments', function (Blueprint $table) {
            $table->id();

            // Student details (from the Enroll Now form)
            $table->string('student_name');
            $table->string('email');
            $table->string('phone', 20);
            $table->string('qualification');
            $table->text('address');

            // Course details
            $table->string('course_slug', 100)->index();
            $table->string('course_title');

            // Payment / Razorpay details
            $table->decimal('amount', 10, 2)->comment('Registration fee amount in INR');
            $table->string('currency', 10)->default('INR');
            $table->string('razorpay_order_id')->nullable()->index();
            $table->string('razorpay_payment_id')->nullable();
            $table->string('razorpay_signature')->nullable();
            $table->enum('payment_status', ['pending', 'paid', 'failed'])->default('pending')->index();

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('enrollments');
    }
};
