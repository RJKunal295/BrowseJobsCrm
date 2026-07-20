<?php

namespace App\Http\Controllers;

use App\Notifications\LeadEventNotification;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class PushSubscriptionController extends Controller
{
    /**
     * Send a real web push to the logged-in user so they can verify
     * this browser + OS actually displays notifications with sound.
     */
    public function sendTest(Request $request): JsonResponse
    {
        $user = $request->user();

        if ($user->pushSubscriptions()->count() === 0) {
            return response()->json([
                'success' => false,
                'message' => 'No push subscription yet for your account — click Enable Push (or allow notifications) in this browser first, then reload the page.',
            ], 422);
        }

        $user->notify(new LeadEventNotification(
            'Test notification ✅',
            'Web push works on this account — sent at '.now()->format('h:i:s A').'. If you did not see a banner, check Windows notification settings for your browser.',
            url('/'),
            'ti ti-bell-ringing',
        ));

        return response()->json(['success' => true]);
    }

    /**
     * Diagnostic beacon: the header push script reports each setup step here
     * so push problems on any user's browser are visible in the server log.
     */
    public function diag(Request $request): JsonResponse
    {
        \Log::info('PUSH-DIAG', [
            'user' => $request->user()->id,
            'step' => (string) $request->input('step'),
            'detail' => (string) $request->input('detail'),
            'agent' => substr((string) $request->userAgent(), 0, 60),
        ]);

        return response()->json(['ok' => true]);
    }

    /**
     * Called from the browser after the user grants notification permission
     * and the Push API generates a subscription object.
     */
    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'endpoint' => 'required|string',
            'keys.p256dh' => 'required|string',
            'keys.auth' => 'required|string',
        ]);

        $request->user()->updatePushSubscription(
            $validated['endpoint'],
            $validated['keys']['p256dh'],
            $validated['keys']['auth']
        );

        \Log::info('Push subscription synced', [
            'user_id' => $request->user()->id,
            'endpoint' => substr($validated['endpoint'], 0, 60),
        ]);

        return response()->json(['success' => true]);
    }

    /**
     * Called when the user disables notifications from this browser
     * (or the subscription becomes invalid client-side).
     */
    public function destroy(Request $request): JsonResponse
    {
        $endpoint = $request->input('endpoint');
        $request->user()->deletePushSubscription($endpoint);

        return response()->json(['success' => true]);
    }
}
