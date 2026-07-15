<?php

// Save as: app/Http/Controllers/EnrollmentController.php
//
// Requires the Razorpay PHP SDK:
//   composer require razorpay/razorpay
//
// Add to .env:
//   RAZORPAY_KEY_ID=rzp_test_xxxxxxxxxxxx
//   RAZORPAY_KEY_SECRET=xxxxxxxxxxxxxxxxxxxxxxxx
//
// Add to config/services.php:
//   'razorpay' => [
//       'key'    => env('RAZORPAY_KEY_ID'),
//       'secret' => env('RAZORPAY_KEY_SECRET'),
//   ],

namespace App\Http\Controllers;

use App\Models\Enrollment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Razorpay\Api\Api;

class EnrollmentController extends Controller
{
    /**
     * Course registration fees, in INR.
     * Keep this in sync with src/data/courses.json on the frontend.
     */
    private const COURSE_FEES = [
        'data-engineering'  => 30000,
        'devops'            => 30000,
        'data-analytics'    => 20000,
        'python-django'     => 20000,
        'agentic-ai'        => 20000,
        'cyber-security'    => 20000,
        'servicenow'        => 20000,
        'python-backend'    => 20000,
    ];

    /**
     * POST /api/enrollments
     * Creates the enrollment row and a matching Razorpay order.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'student_name'  => 'required|string|max:191',
            'email'         => 'required|email|max:191',
            'phone'         => 'required|string|max:20',
            'qualification' => 'required|string|max:191',
            'address'       => 'required|string',
            'course_slug'   => 'required|string|max:100',
            'course_title'  => 'required|string|max:191',
        ]);

        // Never trust an amount sent from the client — always look it up server-side.
        $amount = self::COURSE_FEES[$validated['course_slug']] ?? null;
        if (! $amount) {
            return response()->json(['message' => 'Unknown course.'], 422);
        }

        $enrollment = Enrollment::create([
            ...$validated,
            'amount'         => $amount,
            'currency'       => 'INR',
            'payment_status' => 'pending',
        ]);

        try {
            $api = new Api(config('services.razorpay.key'), config('services.razorpay.secret'));

            $razorpayOrder = $api->order->create([
                'receipt'         => 'enrollment_' . $enrollment->id,
                'amount'          => $amount * 100, // Razorpay expects paise
                'currency'        => 'INR',
                'payment_capture' => 1,
                'notes'           => [
                    'enrollment_id' => $enrollment->id,
                    'course'        => $validated['course_title'],
                ],
            ]);

            $enrollment->update(['razorpay_order_id' => $razorpayOrder['id']]);

            return response()->json([
                'enrollment_id' => $enrollment->id,
                'order_id'      => $razorpayOrder['id'],
                'amount'        => $amount * 100,
                'currency'      => 'INR',
            ]);
        } catch (\Throwable $e) {
            Log::error('Razorpay order creation failed: ' . $e->getMessage());
            return response()->json(['message' => 'Could not start payment. Please try again.'], 500);
        }
    }

    /**
     * POST /api/enrollments/verify
     * Verifies the Razorpay payment signature and marks the enrollment as paid.
     */
    public function verify(Request $request)
    {
        $validated = $request->validate([
            'enrollment_id'      => 'required|integer|exists:enrollments,id',
            'razorpay_order_id'   => 'required|string',
            'razorpay_payment_id' => 'required|string',
            'razorpay_signature'  => 'required|string',
        ]);

        $enrollment = Enrollment::findOrFail($validated['enrollment_id']);

        try {
            $api = new Api(config('services.razorpay.key'), config('services.razorpay.secret'));

            $api->utility->verifyPaymentSignature([
                'razorpay_order_id'   => $validated['razorpay_order_id'],
                'razorpay_payment_id' => $validated['razorpay_payment_id'],
                'razorpay_signature'  => $validated['razorpay_signature'],
            ]);

            $enrollment->update([
                'razorpay_payment_id' => $validated['razorpay_payment_id'],
                'razorpay_signature'  => $validated['razorpay_signature'],
                'payment_status'      => 'paid',
            ]);

            return response()->json(['status' => 'ok']);
        } catch (\Throwable $e) {
            $enrollment->update(['payment_status' => 'failed']);
            Log::error('Razorpay signature verification failed: ' . $e->getMessage());
            return response()->json(['message' => 'Payment verification failed.'], 422);
        }
    }
}
