<?php

// Save as: app/Models/Enrollment.php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Enrollment extends Model
{
    protected $fillable = [
        'student_name',
        'email',
        'phone',
        'qualification',
        'address',
        'course_slug',
        'course_title',
        'amount',
        'currency',
        'razorpay_order_id',
        'razorpay_payment_id',
        'razorpay_signature',
        'payment_status',
    ];
}
