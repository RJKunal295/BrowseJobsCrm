<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Holiday extends Model
{
    protected $fillable = [
        'title', 'holiday_date', 'year', 'is_optional', 'description', 'created_by',
    ];

    protected function casts(): array
    {
        return [
            'holiday_date' => 'date',
            'is_optional'  => 'boolean',
        ];
    }

    protected static function booted(): void
    {
        static::creating(function (Holiday $holiday) {
            if ($holiday->holiday_date) {
                $holiday->year = $holiday->holiday_date->year;
            }
        });

        static::updating(function (Holiday $holiday) {
            if ($holiday->isDirty('holiday_date')) {
                $holiday->year = $holiday->holiday_date->year;
            }
        });
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function getDayNameAttribute(): string
    {
        return $this->holiday_date->format('l'); // e.g. "Monday"
    }
}