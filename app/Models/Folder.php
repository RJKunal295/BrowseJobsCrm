<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Folder extends Model
{
    protected $fillable = [
        'user_id', 'parent_id', 'name', 'drive_folder_id', 'synced',
    ];

    protected function casts(): array
    {
        return [
            'synced' => 'boolean',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function parent(): BelongsTo
    {
        return $this->belongsTo(Folder::class, 'parent_id');
    }

    public function children(): HasMany
    {
        return $this->hasMany(Folder::class, 'parent_id');
    }

    public function files(): HasMany
    {
        return $this->hasMany(FileItem::class, 'folder_id');
    }

    /**
     * Breadcrumb trail from root to this folder.
     *
     * @return array<int, Folder>
     */
    public function ancestors(): array
    {
        $trail = [];
        $folder = $this;

        while ($folder) {
            array_unshift($trail, $folder);
            $folder = $folder->parent;
        }

        return $trail;
    }
}
