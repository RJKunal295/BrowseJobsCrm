<?php

namespace App\Services;

use App\Models\SocialAccount;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;

/**
 * LinkedIn OAuth + organisation content/insights.
 *
 * NOTE: Reading an organisation's posts, follower counts and social actions requires the
 * LinkedIn "Community Management API" product approved on the app, plus the caller being an
 * ADMINISTRATOR of the Page. Without that access the REST calls return 401/403 and the error is
 * recorded on the account. The OAuth connect flow itself works with the basic scopes.
 *
 * Account field mapping for LinkedIn:
 *   - access_token: OAuth access token
 *   - refresh_token: OAuth refresh token (if issued)
 *   - channel_id:   the organisation URN, e.g. "urn:li:organization:12345"
 *   - ig_user_id:   the numeric organisation id (kept for follower-count calls)
 */
class LinkedInInsightsService
{
    private const AUTH_URL = 'https://www.linkedin.com/oauth/v2/authorization';

    private const TOKEN_URL = 'https://www.linkedin.com/oauth/v2/accessToken';

    private const REST_BASE = 'https://api.linkedin.com/rest';

    private function version(): string
    {
        return (string) config('services.linkedin.api_version', '202401');
    }

    private function headers(string $token): array
    {
        return [
            'LinkedIn-Version' => $this->version(),
            'X-Restli-Protocol-Version' => '2.0.0',
        ];
    }

    // ---------- OAuth ----------

    public function authorizationUrl(string $state): string
    {
        return self::AUTH_URL.'?'.http_build_query([
            'response_type' => 'code',
            'client_id' => config('services.linkedin.client_id'),
            'redirect_uri' => config('services.linkedin.redirect'),
            'state' => $state,
            'scope' => config('services.linkedin.scopes'),
        ]);
    }

    /**
     * Exchange an authorization code for tokens.
     *
     * @return array{access_token: string, expires_in: int, refresh_token: ?string}
     */
    public function exchangeCodeForToken(string $code): array
    {
        $response = Http::asForm()->post(self::TOKEN_URL, [
            'grant_type' => 'authorization_code',
            'code' => $code,
            'redirect_uri' => config('services.linkedin.redirect'),
            'client_id' => config('services.linkedin.client_id'),
            'client_secret' => config('services.linkedin.client_secret'),
        ]);

        if (! $response->successful()) {
            throw new \RuntimeException('LinkedIn token exchange failed: '.$response->body());
        }

        $data = $response->json();

        return [
            'access_token' => $data['access_token'],
            'expires_in' => (int) ($data['expires_in'] ?? 5184000),
            'refresh_token' => $data['refresh_token'] ?? null,
        ];
    }

    /**
     * Organisations the authenticated member administers.
     *
     * @return array<int, array{urn: string, id: string, name: string}>
     */
    public function getAdminOrganizations(string $token): array
    {
        $acls = Http::withToken($token)->withHeaders($this->headers($token))
            ->get(self::REST_BASE.'/organizationAcls', [
                'q' => 'roleAssignee',
                'role' => 'ADMINISTRATOR',
                'state' => 'APPROVED',
            ]);

        if (! $acls->successful()) {
            throw new \RuntimeException('Could not list LinkedIn organisations ('.$acls->status().'): '.$acls->body());
        }

        $organizations = [];

        foreach ($acls->json('elements', []) as $element) {
            $urn = $element['organization'] ?? null;
            if (! $urn) {
                continue;
            }

            $id = str_replace('urn:li:organization:', '', $urn);
            $name = $urn;

            // Resolve a human-readable name (best-effort).
            $org = Http::withToken($token)->withHeaders($this->headers($token))
                ->get(self::REST_BASE.'/organizations/'.$id);

            if ($org->successful()) {
                $name = data_get($org->json(), 'localizedName', $urn);
            }

            $organizations[] = ['urn' => $urn, 'id' => $id, 'name' => $name];
        }

        return $organizations;
    }

    // ---------- Insights ----------

    /**
     * Latest organisation posts with engagement metrics.
     *
     * @return array<int, array{external_post_id: ?string, caption: ?string, media_type: string, permalink: ?string, thumbnail_url: ?string, published_at: ?Carbon, likes: ?int, comments: ?int, shares: ?int, raw: array}>
     */
    public function fetchLatestPosts(SocialAccount $account, int $limit = 10): array
    {
        $author = $account->channel_id;

        if (blank($author)) {
            throw new \RuntimeException('LinkedIn organisation URN not set on this account (channel_id).');
        }

        $response = Http::withToken($account->access_token)->withHeaders($this->headers($account->access_token))
            ->get(self::REST_BASE.'/posts', [
                'author' => $author,
                'q' => 'author',
                'count' => $limit,
                'sortBy' => 'LAST_MODIFIED',
            ]);

        if (! $response->successful()) {
            throw new \RuntimeException('LinkedIn posts error ('.$response->status().'): '.$response->body());
        }

        return collect($response->json('elements', []))->map(function (array $post) use ($account) {
            $id = $post['id'] ?? ($post['urn'] ?? null);
            $createdAt = data_get($post, 'createdAt') ?? data_get($post, 'firstPublishedAt');
            $engagement = $id ? $this->fetchSocialActions($account->access_token, $id) : ['likes' => null, 'comments' => null];

            return [
                'external_post_id' => $id,
                'caption' => data_get($post, 'commentary'),
                'media_type' => data_get($post, 'content.media') ? 'MEDIA' : 'POST',
                'permalink' => $id ? 'https://www.linkedin.com/feed/update/'.$id : null,
                'thumbnail_url' => null,
                'published_at' => $createdAt ? Carbon::createFromTimestampMs($createdAt) : null,
                'likes' => $engagement['likes'],
                'comments' => $engagement['comments'],
                'shares' => null, // LinkedIn does not expose reshare counts on the posts API
                'raw' => $post,
            ];
        })->filter(fn ($p) => filled($p['external_post_id']))->values()->all();
    }

    /**
     * Likes + comments for a single post URN (best-effort).
     *
     * @return array{likes: ?int, comments: ?int}
     */
    private function fetchSocialActions(string $token, string $postUrn): array
    {
        $encoded = rawurlencode($postUrn);

        $response = Http::withToken($token)->withHeaders($this->headers($token))
            ->get(self::REST_BASE.'/socialActions/'.$encoded);

        if (! $response->successful()) {
            return ['likes' => null, 'comments' => null];
        }

        return [
            'likes' => data_get($response->json(), 'likesSummary.totalLikes'),
            'comments' => data_get($response->json(), 'commentsSummary.totalFirstLevelComments'),
        ];
    }

    /**
     * Organisation follower count (best-effort).
     */
    public function fetchFollowerCount(SocialAccount $account): ?int
    {
        $orgId = $account->ig_user_id ?: str_replace('urn:li:organization:', '', (string) $account->channel_id);

        if (blank($orgId)) {
            return null;
        }

        $response = Http::withToken($account->access_token)->withHeaders($this->headers($account->access_token))
            ->get(self::REST_BASE.'/networkSizes/urn:li:organization:'.$orgId, [
                'edgeType' => 'COMPANY_FOLLOWED_BY_MEMBER',
            ]);

        if (! $response->successful()) {
            return null;
        }

        return data_get($response->json(), 'firstDegreeSize');
    }
}
