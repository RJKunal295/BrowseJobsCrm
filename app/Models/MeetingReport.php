<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MeetingReport extends Model
{
    protected $fillable = [
        'drive_file_id',
        'title',
        'meeting_date',
        'attendees',
        'absentees',
        'analysis',
        'provider',
        'model',
        'transcript_link',
    ];

    protected function casts(): array
    {
        return [
            'meeting_date' => 'date',
            'attendees' => 'array',
            'absentees' => 'array',
        ];
    }
}
