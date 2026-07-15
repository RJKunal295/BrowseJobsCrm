<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SocialMediaStat extends Model
{
    protected $fillable = [
        'social_account_id', 'stat_date', 'followers_count', 'posts_today', 'reach',
    ];

    protected function casts(): array
    {
        return [
            'stat_date' => 'date',
        ];
    }

    public function account(): BelongsTo
    {
        return $this->belongsTo(SocialAccount::class, 'social_account_id');
    }
}