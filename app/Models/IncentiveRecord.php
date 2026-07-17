<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Carbon;

class IncentiveRecord extends Model
{
    protected $fillable = [
        'user_id', 'type', 'basis', 'quantity', 'rate', 'amount',
        'period_month', 'period_year', 'status', 'notes',
        'awarded_by_user_id', 'awarded_at',
    ];

    protected function casts(): array
    {
        return [
            'quantity' => 'decimal:2',
            'rate' => 'decimal:2',
            'amount' => 'decimal:2',
            'awarded_at' => 'datetime',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function awardedBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'awarded_by_user_id');
    }

    public function periodLabel(): string
    {
        return Carbon::create($this->period_year, $this->period_month, 1)->format('M Y');
    }
}
