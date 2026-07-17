<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

/**
 * Sends WhatsApp messages through the Meta (Facebook) WhatsApp Cloud API.
 *
 * Setup:
 *  1. Create a Meta app + WhatsApp product, get a Phone Number ID and a permanent access token.
 *  2. Set WHATSAPP_PHONE_NUMBER_ID and WHATSAPP_ACCESS_TOKEN in .env.
 *  3. Plain-text messages only work inside the 24-hour customer-service window; for the first
 *     contact / marketing you must use an approved template (see sendTemplate()).
 *
 * When credentials are absent every call is a logged no-op that returns false, so the rest of
 * the app keeps working without WhatsApp configured.
 */
class WhatsAppService
{
    private string $defaultCountryCode;

    public function __construct()
    {
        $this->defaultCountryCode = (string) config('services.whatsapp.default_country_code', '91');
    }

    public function isConfigured(): bool
    {
        return filled(config('services.whatsapp.phone_number_id'))
            && filled(config('services.whatsapp.access_token'));
    }

    /**
     * Send a plain-text WhatsApp message. Returns the provider message ID, or null on failure/skip.
     */
    public function sendText(?string $to, string $message): ?string
    {
        return $this->send($to, [
            'type' => 'text',
            'text' => ['preview_url' => true, 'body' => $message],
        ]);
    }

    /**
     * Send an approved template message (required for marketing / first contact).
     *
     * @param  array<int, string>  $bodyParams  Ordered {{1}}, {{2}} … body variables.
     */
    public function sendTemplate(?string $to, string $templateName, string $languageCode = 'en_US', array $bodyParams = []): ?string
    {
        $template = [
            'name' => $templateName,
            'language' => ['code' => $languageCode],
        ];

        if (! empty($bodyParams)) {
            $template['components'] = [[
                'type' => 'body',
                'parameters' => array_map(fn (string $value) => ['type' => 'text', 'text' => $value], $bodyParams),
            ]];
        }

        return $this->send($to, [
            'type' => 'template',
            'template' => $template,
        ]);
    }

    /**
     * @param  array<string, mixed>  $payload  The message-type-specific portion of the request.
     */
    private function send(?string $to, array $payload): ?string
    {
        $number = $this->normalizeNumber($to);

        if ($number === null) {
            return null;
        }

        if (! $this->isConfigured()) {
            Log::info('WhatsApp not configured — skipping message.', ['to' => $number]);

            return null;
        }

        $phoneNumberId = config('services.whatsapp.phone_number_id');
        $version = config('services.whatsapp.api_version', 'v21.0');

        try {
            $response = Http::withToken(config('services.whatsapp.access_token'))
                ->post("https://graph.facebook.com/{$version}/{$phoneNumberId}/messages", array_merge([
                    'messaging_product' => 'whatsapp',
                    'to' => $number,
                ], $payload));

            if (! $response->successful()) {
                Log::warning('WhatsApp send failed.', ['to' => $number, 'response' => $response->body()]);

                return null;
            }

            return data_get($response->json(), 'messages.0.id');
        } catch (\Throwable $e) {
            Log::error('WhatsApp send exception.', ['to' => $number, 'error' => $e->getMessage()]);

            return null;
        }
    }

    /**
     * Normalise a phone number to Meta's expected format: country code + number, digits only.
     */
    public function normalizeNumber(?string $raw): ?string
    {
        if (blank($raw)) {
            return null;
        }

        $digits = preg_replace('/\D+/', '', $raw);

        if (blank($digits)) {
            return null;
        }

        // A bare 10-digit number gets the default country code prefixed.
        if (strlen($digits) === 10) {
            $digits = $this->defaultCountryCode.$digits;
        }

        return $digits;
    }
}
