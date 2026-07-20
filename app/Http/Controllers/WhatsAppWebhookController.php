<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

/**
 * Receives Meta WhatsApp Cloud API webhooks.
 *
 * GET  = one-time verification handshake when the Callback URL is saved in the
 *        Meta app (echo hub.challenge if the verify token matches).
 * POST = delivery/read status updates and inbound messages. Logged for now so
 *        delivery of lead alerts is auditable; extend later for two-way chat.
 */
class WhatsAppWebhookController extends Controller
{
    public function verify(Request $request): Response
    {
        $expected = config('services.whatsapp.webhook_verify_token');

        if (
            filled($expected)
            && $request->query('hub_mode') === 'subscribe'
            && hash_equals($expected, (string) $request->query('hub_verify_token'))
        ) {
            return response($request->query('hub_challenge', ''), 200)
                ->header('Content-Type', 'text/plain');
        }

        return response('Verification failed', 403);
    }

    public function handle(Request $request): Response
    {
        $payload = $request->json()->all();

        foreach (data_get($payload, 'entry.*.changes.*.value', []) as $value) {
            // Delivery/read receipts for messages we sent (lead alerts etc.).
            foreach ($value['statuses'] ?? [] as $status) {
                Log::info('WhatsApp status', [
                    'to' => $status['recipient_id'] ?? null,
                    'status' => $status['status'] ?? null,
                    'message_id' => $status['id'] ?? null,
                    'errors' => $status['errors'] ?? null,
                ]);
            }

            // Inbound replies from recipients (also resets Meta's 24h window).
            foreach ($value['messages'] ?? [] as $message) {
                Log::info('WhatsApp inbound message', [
                    'from' => $message['from'] ?? null,
                    'type' => $message['type'] ?? null,
                    'text' => data_get($message, 'text.body'),
                ]);
            }
        }

        // Meta expects a fast 200 regardless, or it retries and eventually
        // disables the webhook.
        return response('OK', 200);
    }
}
