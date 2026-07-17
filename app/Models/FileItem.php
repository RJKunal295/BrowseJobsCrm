<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FileItem extends Model
{
    protected $table = 'files';

    protected $fillable = [
        'user_id', 'folder_id', 'name', 'disk_path',
        'mime', 'size', 'drive_file_id', 'drive_link', 'synced',
    ];

    protected function casts(): array
    {
        return [
            'size' => 'integer',
            'synced' => 'boolean',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function folder(): BelongsTo
    {
        return $this->belongsTo(Folder::class, 'folder_id');
    }
}
