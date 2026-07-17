<?php

namespace App\Services;

use App\Models\GoogleAccount;
use Google\Client as GoogleClient;
use Google\Service\Drive;
use Google\Service\Drive\DriveFile;
use Google\Service\Oauth2;
use RuntimeException;

/**
 * Google Drive wrapper supporting two auth modes:
 *
 *  1. OAuth (recommended for personal Gmail) — the user connects their own Google account;
 *     files upload into their Drive. Bind an account with usingOAuthAccount() first.
 *  2. Service account (fallback) — requires a Shared Drive (Workspace); a personal My-Drive
 *     folder will fail with a storage-quota error.
 *
 * OAuth setup:
 *  1. Google Cloud → create an OAuth Client (Web application), enable the Drive API.
 *  2. Add the redirect URI from config('services.google_drive.oauth.redirect').
 *  3. Set GOOGLE_OAUTH_CLIENT_ID / GOOGLE_OAUTH_CLIENT_SECRET in .env.
 */
class GoogleDriveService
{
    private const OAUTH_SCOPES = ['https://www.googleapis.com/auth/drive.file'];

    private ?Drive $service = null;

    private ?GoogleAccount $oauthAccount = null;

    /**
     * Operate as a specific connected Google account (OAuth mode).
     */
    public function usingOAuthAccount(GoogleAccount $account): self
    {
        $this->oauthAccount = $account;
        $this->service = null;

        return $this;
    }

    public function oauthConfigured(): bool
    {
        return filled(config('services.google_drive.oauth.client_id'))
            && filled(config('services.google_drive.oauth.client_secret'));
    }

    public function serviceAccountConfigured(): bool
    {
        $keyFile = $this->keyFilePath();

        return $keyFile !== null && is_file($keyFile);
    }

    /**
     * Ready to sync? True in OAuth mode when an account is bound, else if the service account exists.
     */
    public function isConfigured(): bool
    {
        if ($this->oauthAccount) {
            return $this->oauthConfigured();
        }

        return $this->serviceAccountConfigured();
    }

    // ---------- OAuth helpers ----------

    public function oauthAuthorizationUrl(string $state): string
    {
        $client = $this->baseOAuthClient();
        $client->setState($state);
        $client->setAccessType('offline');
        $client->setPrompt('consent');

        return $client->createAuthUrl();
    }

    /**
     * Exchange an auth code for tokens.
     *
     * @return array{access_token: string, refresh_token: ?string, expires_in: int, email: ?string}
     */
    public function exchangeOAuthCode(string $code): array
    {
        $client = $this->baseOAuthClient();
        $token = $client->fetchAccessTokenWithAuthCode($code);

        if (isset($token['error'])) {
            throw new RuntimeException('Google token exchange failed: '.($token['error_description'] ?? $token['error']));
        }

        $email = null;
        try {
            $client->setAccessToken($token);
            $email = data_get((new Oauth2($client))->userinfo->get(), 'email');
        } catch (\Throwable $e) {
            // email is best-effort
        }

        return [
            'access_token' => $token['access_token'],
            'refresh_token' => $token['refresh_token'] ?? null,
            'expires_in' => (int) ($token['expires_in'] ?? 3600),
            'email' => $email,
        ];
    }

    // ---------- Drive operations ----------

    public function createFolder(string $name, ?string $parentDriveId = null): string
    {
        $metadata = new DriveFile(array_filter([
            'name' => $name,
            'mimeType' => 'application/vnd.google-apps.folder',
            'parents' => $this->resolveParents($parentDriveId),
        ]));

        $folder = $this->service()->files->create($metadata, [
            'fields' => 'id',
            'supportsAllDrives' => true,
        ]);

        return $folder->id;
    }

    /**
     * @return array{id: string, link: ?string}
     */
    public function uploadFile(string $localPath, string $name, ?string $mime = null, ?string $parentDriveId = null): array
    {
        $metadata = new DriveFile(array_filter([
            'name' => $name,
            'parents' => $this->resolveParents($parentDriveId),
        ]));

        $file = $this->service()->files->create($metadata, [
            'data' => file_get_contents($localPath),
            'mimeType' => $mime ?: 'application/octet-stream',
            'uploadType' => 'multipart',
            'fields' => 'id,webViewLink',
            'supportsAllDrives' => true,
        ]);

        return [
            'id' => $file->id,
            'link' => $file->webViewLink ?? null,
        ];
    }

    public function deleteFile(string $driveId): void
    {
        $this->service()->files->delete($driveId, ['supportsAllDrives' => true]);
    }

    /**
     * Parent folder id(s). Empty array = the account's Drive root (OAuth only).
     *
     * @return array<int, string>
     */
    private function resolveParents(?string $parentDriveId): array
    {
        if ($parentDriveId) {
            return [$parentDriveId];
        }

        $root = config('services.google_drive.root_folder_id');

        if (filled($root)) {
            return [$root];
        }

        // Service-account mode cannot write to its own (quota-less) Drive root.
        if (! $this->oauthAccount) {
            throw new RuntimeException('No Google Drive parent folder configured. Set GOOGLE_DRIVE_ROOT_FOLDER_ID.');
        }

        return []; // OAuth: create at the user's Drive root
    }

    private function service(): Drive
    {
        if ($this->service instanceof Drive) {
            return $this->service;
        }

        return $this->service = new Drive($this->oauthAccount ? $this->oauthClient($this->oauthAccount) : $this->serviceAccountClient());
    }

    private function serviceAccountClient(): GoogleClient
    {
        if (! $this->serviceAccountConfigured()) {
            throw new RuntimeException('Google Drive is not configured. Missing service-account key file.');
        }

        $client = new GoogleClient;
        $client->setAuthConfig($this->keyFilePath());
        $client->setScopes([Drive::DRIVE]);

        return $client;
    }

    private function oauthClient(GoogleAccount $account): GoogleClient
    {
        $client = $this->baseOAuthClient();

        // Seconds remaining until expiry (0 or negative means expired → triggers a refresh below).
        $expiresIn = $account->expires_at ? now()->diffInSeconds($account->expires_at, false) : 0;

        $client->setAccessToken(array_filter([
            'access_token' => $account->access_token,
            'refresh_token' => $account->refresh_token,
            'expires_in' => max(0, (int) $expiresIn),
        ]));

        // Refresh if expired and persist the new token.
        if ($client->isAccessTokenExpired() && $account->refresh_token) {
            $new = $client->fetchAccessTokenWithRefreshToken($account->refresh_token);

            if (isset($new['error'])) {
                throw new RuntimeException('Google token refresh failed: '.($new['error_description'] ?? $new['error']));
            }

            $account->update([
                'access_token' => $new['access_token'],
                'expires_at' => now()->addSeconds((int) ($new['expires_in'] ?? 3600)),
            ]);

            $client->setAccessToken(array_merge($new, ['refresh_token' => $account->refresh_token]));
        }

        return $client;
    }

    private function baseOAuthClient(): GoogleClient
    {
        $client = new GoogleClient;
        $client->setClientId(config('services.google_drive.oauth.client_id'));
        $client->setClientSecret(config('services.google_drive.oauth.client_secret'));
        $client->setRedirectUri(config('services.google_drive.oauth.redirect'));
        $client->setScopes(array_merge(self::OAUTH_SCOPES, ['email']));

        return $client;
    }

    private function keyFilePath(): ?string
    {
        $path = config('services.google_drive.key_file');

        if (blank($path)) {
            return null;
        }

        return str_starts_with($path, DIRECTORY_SEPARATOR) || preg_match('/^[A-Za-z]:\\\\/', $path)
            ? $path
            : base_path($path);
    }
}
