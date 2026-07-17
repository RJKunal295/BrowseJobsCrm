<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LoginReminder extends Model
{
    protected $fillable = [
        'user_id', 'reminder_date', 'email_count', 'whatsapp_count',
        'last_reminded_at', 'logged_in', 'escalated', 'escalated_at',
    ];

    protected function casts(): array
    {
        return [
            'reminder_date' => 'date',
            'last_reminded_at' => 'datetime',
            'escalated_at' => 'datetime',
            'logged_in' => 'boolean',
            'escalated' => 'boolean',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}
