<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Support\Facades\Storage;

class Conversation extends Model
{
    protected $fillable = ['type', 'name', 'created_by'];

    public function creator(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function participants(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'conversation_participants')
            ->withPivot(['is_admin', 'last_read_at'])
            ->withTimestamps();
    }

    public function messages(): HasMany
    {
        return $this->hasMany(Message::class)->orderBy('created_at');
    }

    public function latestMessage(): HasOne
    {
        return $this->hasOne(Message::class)->latestOfMany();
    }

    /**
     * "John Doe" for a private chat (the OTHER person), or the group name.
     */
    public function displayNameFor(User $viewer): string
    {
        if ($this->type === 'group') {
            return $this->name ?? 'Group Chat';
        }

        $other = $this->participants->firstWhere('id', '!=', $viewer->id);

        return $other->full_name ?? 'Unknown User';
    }

    /**
     * Photo URL for a private chat's OTHER person, or null for groups
     * (groups fall back to a generic group icon in the UI) and for anyone
     * without a profile photo uploaded (falls back to an initials avatar).
     */
    public function avatarUrlFor(User $viewer): ?string
    {
        if ($this->type === 'group') {
            return null;
        }

        $other = $this->participants->firstWhere('id', '!=', $viewer->id);

        return $other?->profile_photo ? Storage::url($other->profile_photo) : null;
    }

    public function unreadCountFor(User $user): int
    {
        $pivot = $this->participants->firstWhere('id', $user->id)?->pivot;
        $lastRead = $pivot?->last_read_at;

        return $this->messages()
            ->where('sender_id', '!=', $user->id)
            ->when($lastRead, fn ($q) => $q->where('created_at', '>', $lastRead))
            ->count();
    }
}