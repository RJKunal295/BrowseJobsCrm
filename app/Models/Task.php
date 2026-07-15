<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Task extends Model
{
    protected $fillable = [
        'title', 'description', 'due_date', 'priority', 'status',
        'created_by', 'completed_at',
    ];

    protected function casts(): array
    {
        return [
            'due_date'     => 'date',
            'completed_at' => 'datetime',
        ];
    }

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function assignees(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'task_assignees')
            ->withPivot(['is_completed', 'completed_at', 'is_flagged', 'flagged_at'])
            ->withTimestamps();
    }

    public function isOverdue(): bool
    {
        return $this->status !== 'completed' && $this->due_date->isPast();
    }

    public function refreshOverallStatus(): void
    {
        $allCompleted = $this->assignees()->wherePivot('is_completed', false)->doesntExist();

        if ($allCompleted && $this->status !== 'completed') {
            $this->update(['status' => 'completed', 'completed_at' => now()]);
        } elseif (!$allCompleted && $this->status === 'completed') {
            $this->update(['status' => 'in_progress', 'completed_at' => null]);
        }
    }
}