<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LeaveBalance extends Model
{
    protected $fillable = [
        'user_id', 'leave_type_id', 'year', 'allocated_days', 'used_days',
    ];

    protected function casts(): array
    {
        return [
            'allocated_days' => 'decimal:1',
            'used_days' => 'decimal:1',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function leaveType(): BelongsTo
    {
        return $this->belongsTo(LeaveType::class);
    }

    public function getRemainingDaysAttribute(): float
    {
        return (float) $this->allocated_days - (float) $this->used_days;
    }

    /**
     * Get this user's balance row for a leave type + year, creating it
     * (using the leave type's default allocation) if it doesn't exist yet.
     */
    public static function findOrCreateFor(int $userId, int $leaveTypeId, int $year): self
    {
        $balance = static::firstOrNew([
            'user_id'       => $userId,
            'leave_type_id' => $leaveTypeId,
            'year'          => $year,
        ]);

        if (!$balance->exists) {
            $leaveType = LeaveType::find($leaveTypeId);
            $balance->allocated_days = $leaveType->default_days_per_year ?? 0;
            $balance->used_days = 0;
            $balance->save();
        }

        return $balance;
    }
}