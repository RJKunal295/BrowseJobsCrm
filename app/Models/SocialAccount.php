<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class SocialAccount extends Model
{
    protected $fillable = [
        'platform', 'label', 'ig_user_id', 'channel_id', 'username', 'account_type',
        'profile_picture_url', 'biography', 'following_count',
        'access_token', 'token_expires_at', 'last_synced_at',
        'is_active', 'last_error', 'created_by',
    ];

    protected $hidden = [
        'access_token',
    ];

    protected function casts(): array
    {
        return [
            'access_token'     => 'encrypted',
            'token_expires_at' => 'datetime',
            'last_synced_at'   => 'datetime',
            'is_active'        => 'boolean',
        ];
    }

    public function stats(): HasMany
    {
        return $this->hasMany(SocialMediaStat::class);
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function latestStat()
    {
        return $this->stats()->latest('stat_date')->first();
    }

    public function isTokenExpiringSoon(): bool
    {
        return $this->token_expires_at && $this->token_expires_at->diffInDays(now()) <= 7;
    }
}