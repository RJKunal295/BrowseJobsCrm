<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LeadCall extends Model
{
    protected $fillable = [
        'lead_id', 'type', 'provider', 'external_campaign_id', 'external_call_id',
        'agent_id', 'status', 'disposition', 'sentiment', 'transcript',
        'recording_url', 'audio_path', 'duration_seconds', 'from_number',
        'to_number', 'language', 'meta', 'initiated_by_user_id', 'started_at', 'ended_at',
    ];

    protected function casts(): array
    {
        return [
            'meta' => 'array',
            'started_at' => 'datetime',
            'ended_at' => 'datetime',
        ];
    }

    public function lead(): BelongsTo
    {
        return $this->belongsTo(Lead::class);
    }

    public function initiatedBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'initiated_by_user_id');
    }
}
