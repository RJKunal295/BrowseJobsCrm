<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

class PushSubscriptionController extends Controller
{
    /**
     * Called from the browser after the user grants notification permission
     * and the Push API generates a subscription object.
     */
    public function store(Request $request): JsonResponse
    {
        $validated = $request->validate([
            'endpoint' => 'required|string',
            'keys.p256dh' => 'required|string',
            'keys.auth'   => 'required|string',
        ]);

        $request->user()->updatePushSubscription(
            $validated['endpoint'],
            $validated['keys']['p256dh'],
            $validated['keys']['auth']
        );

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