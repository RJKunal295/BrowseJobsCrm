<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SocialPostReminder extends Model
{
    protected $fillable = [
        'social_account_id', 'platform', 'last_post_at',
        'reminder_count', 'last_reminded_at', 'resolved',
    ];

    protected function casts(): array
    {
        return [
            'last_post_at' => 'datetime',
            'last_reminded_at' => 'datetime',
            'resolved' => 'boolean',
        ];
    }

    public function account(): BelongsTo
    {
        return $this->belongsTo(SocialAccount::class, 'social_account_id');
    }
}
