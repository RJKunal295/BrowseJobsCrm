<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'postmark' => [
        'key' => env('POSTMARK_API_KEY'),
    ],

    'resend' => [
        'key' => env('RESEND_API_KEY'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'slack' => [
        'notifications' => [
            'bot_user_oauth_token' => env('SLACK_BOT_USER_OAUTH_TOKEN'),
            'channel' => env('SLACK_BOT_USER_DEFAULT_CHANNEL'),
        ],
    ],

    'taurus' => [
        'base_url' => env('THETAURUS_API_BASE'),
        'token' => env('THETAURUS_API_TOKEN'),
    ],

    'google_drive' => [
        // Path (relative to base_path) to the service-account JSON key file.
        'key_file' => env('GOOGLE_DRIVE_KEY_FILE', 'storage/app/google/service-account.json'),
        // ID of a Drive folder shared with the service account — new folders/files land here.
        'root_folder_id' => env('GOOGLE_DRIVE_ROOT_FOLDER_ID'),

        // OAuth mode (recommended for personal Gmail): the user connects their own Google
        // account and files upload into their Drive. Takes priority over the service account.
        'oauth' => [
            'client_id' => env('GOOGLE_OAUTH_CLIENT_ID'),
            'client_secret' => env('GOOGLE_OAUTH_CLIENT_SECRET'),
            'redirect' => env('GOOGLE_OAUTH_REDIRECT_URI', rtrim((string) env('APP_URL', 'http://localhost'), '/').'/file-manager/google/callback'),
        ],
    ],

    'whatsapp' => [
        // Meta WhatsApp Cloud API.
        'phone_number_id' => env('WHATSAPP_PHONE_NUMBER_ID'),
        'access_token' => env('WHATSAPP_ACCESS_TOKEN'),
        'api_version' => env('WHATSAPP_API_VERSION', 'v21.0'),
        'default_country_code' => env('WHATSAPP_DEFAULT_COUNTRY_CODE', '91'),
    ],

    'linkedin' => [
        'client_id' => env('LINKEDIN_CLIENT_ID'),
        'client_secret' => env('LINKEDIN_CLIENT_SECRET'),
        // Must exactly match an "Authorized redirect URL" in the LinkedIn app.
        'redirect' => env('LINKEDIN_REDIRECT_URI', rtrim((string) env('APP_URL', 'http://localhost'), '/').'/social-accounts/linkedin/callback'),
        // Org-page scopes need the "Community Management API" product approved on the app.
        'scopes' => env('LINKEDIN_SCOPES', 'openid profile email r_organization_social rw_organization_admin r_organization_admin'),
        'api_version' => env('LINKEDIN_API_VERSION', '202401'),
    ],

    // Shared secret the website sends (X-Lead-Token header) to the public lead-capture endpoint.
    'lead_capture_token' => env('LEAD_CAPTURE_TOKEN'),

    'caller_digital' => [
        // Caller.Digital Campaigns API — outbound AI voice calls.
        'base_url' => env('CALLER_DIGITAL_BASE_URL', 'https://35-223-76-161.nip.io'),
        'email' => env('CALLER_DIGITAL_EMAIL'),
        'password' => env('CALLER_DIGITAL_PASSWORD'),
        'api_key' => env('CALLER_DIGITAL_API_KEY'),
        'agent_id' => env('CALLER_DIGITAL_AGENT_ID'),          // default AI agent UUID
        'from_number' => env('CALLER_DIGITAL_FROM_NUMBER'),     // E.164 caller ID
        'default_language' => env('CALLER_DIGITAL_LANGUAGE', 'english'),
        'webhook_secret' => env('CALLER_DIGITAL_WEBHOOK_SECRET'), // shared secret to verify incoming webhooks
        // Automatically place an AI call the moment a lead is generated.
        'auto_call' => env('CALLER_DIGITAL_AUTO_CALL', true),
        // Max AI calls allowed per day (0 = unlimited). Guards against runaway cost.
        'daily_cap' => (int) env('CALLER_DIGITAL_DAILY_CAP', 0),
    ],

];
