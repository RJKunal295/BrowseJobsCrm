<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LeaveRequest extends Model
{
    protected $fillable = [
        'user_id', 'leave_type_id', 'from_date', 'to_date', 'is_half_day',
        'total_days', 'reason', 'status', 'applied_at',
        'reviewed_by', 'reviewed_at', 'review_remarks',
    ];

    protected function casts(): array
    {
        return [
            'from_date'   => 'date',
            'to_date'     => 'date',
            'is_half_day' => 'boolean',
            'total_days'  => 'decimal:1',
            'applied_at'  => 'datetime',
            'reviewed_at' => 'datetime',
        ];
    }

    protected static function booted(): void
    {
        static::creating(function (LeaveRequest $leaveRequest) {
            $leaveRequest->applied_at ??= now();
            $leaveRequest->status ??= 'pending';

            if (!$leaveRequest->total_days) {
                $leaveRequest->total_days = $leaveRequest->is_half_day
                    ? 0.5
                    : $leaveRequest->from_date->diffInDays($leaveRequest->to_date) + 1;
            }
        });
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function leaveType(): BelongsTo
    {
        return $this->belongsTo(LeaveType::class);
    }

    public function reviewer(): BelongsTo
    {
        return $this->belongsTo(User::class, 'reviewed_by');
    }

    public function isPending(): bool
    {
        return $this->status === 'pending';
    }
}