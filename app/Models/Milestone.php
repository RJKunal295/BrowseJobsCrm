<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class Milestone extends Model
{
    protected $fillable = [
        'title', 'description', 'metric', 'period_type',
        'period_year', 'period_month', 'period_quarter',
        'target_value', 'current_value', 'created_by',
    ];

    protected function casts(): array
    {
        return [
            'target_value' => 'decimal:2',
            'current_value' => 'decimal:2',
        ];
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function periodStart(): Carbon
    {
        return match ($this->period_type) {
            'monthly' => Carbon::create($this->period_year, $this->period_month ?? 1, 1)->startOfMonth(),
            'quarterly' => Carbon::create($this->period_year, (($this->period_quarter ?? 1) - 1) * 3 + 1, 1)->startOfMonth(),
            default => Carbon::create($this->period_year, 1, 1)->startOfYear(),
        };
    }

    public function periodEnd(): Carbon
    {
        return match ($this->period_type) {
            'monthly' => $this->periodStart()->copy()->endOfMonth(),
            'quarterly' => $this->periodStart()->copy()->addMonths(2)->endOfMonth(),
            default => $this->periodStart()->copy()->endOfYear(),
        };
    }

    /**
     * Actual value achieved so far within the period.
     */
    public function achievedValue(): float
    {
        if ($this->metric === 'leads') {
            return (float) DB::table('leads')
                ->whereBetween('created_at', [$this->periodStart(), $this->periodEnd()])
                ->count();
        }

        return (float) $this->current_value;
    }

    public function progressPercent(): float
    {
        $target = (float) $this->target_value;

        if ($target <= 0) {
            return 0.0;
        }

        return round(min(100, ($this->achievedValue() / $target) * 100), 1);
    }

    public function isAchieved(): bool
    {
        return $this->achievedValue() >= (float) $this->target_value;
    }

    public function isExpired(): bool
    {
        return $this->periodEnd()->isPast();
    }

    public function periodLabel(): string
    {
        return match ($this->period_type) {
            'monthly' => $this->periodStart()->format('M Y'),
            'quarterly' => 'Q'.$this->period_quarter.' '.$this->period_year,
            default => (string) $this->period_year,
        };
    }
}
