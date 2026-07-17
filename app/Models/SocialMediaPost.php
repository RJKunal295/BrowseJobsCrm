<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SocialMediaPost extends Model
{
    protected $fillable = [
        'social_account_id', 'platform', 'external_post_id', 'caption',
        'media_type', 'permalink', 'thumbnail_url', 'published_at', 'notified',
        'likes', 'comments', 'shares', 'views', 'raw_payload', 'metrics_synced_at',
    ];

    protected function casts(): array
    {
        return [
            'published_at' => 'datetime',
            'metrics_synced_at' => 'datetime',
            'raw_payload' => 'array',
            'notified' => 'boolean',
        ];
    }

    public function account(): BelongsTo
    {
        return $this->belongsTo(SocialAccount::class, 'social_account_id');
    }
}
