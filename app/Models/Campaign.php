<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Campaign extends Model
{
    protected $fillable = [
        'name', 'channel', 'audience', 'subject', 'body',
        'whatsapp_template', 'whatsapp_template_lang', 'status',
        'total_recipients', 'sent_email', 'sent_whatsapp', 'failed_count',
        'created_by', 'sent_at',
    ];

    protected function casts(): array
    {
        return [
            'sent_at' => 'datetime',
        ];
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function recipients(): HasMany
    {
        return $this->hasMany(CampaignRecipient::class);
    }

    public function sendsEmail(): bool
    {
        return in_array($this->channel, ['email', 'both'], true);
    }

    public function sendsWhatsApp(): bool
    {
        return in_array($this->channel, ['whatsapp', 'both'], true);
    }
}
