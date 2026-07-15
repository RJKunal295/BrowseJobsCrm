<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class UserLoginLog extends Model
{
    use HasFactory;

    protected $table = 'user_login_logs';

    protected $fillable = [
        'user_id', 'session_token',
        'login_time', 'login_ip', 'login_device_id', 'login_device_name',
        'login_device_type', 'login_browser', 'login_os', 'login_user_agent',
        'login_latitude', 'login_longitude', 'login_location',
        'logout_time', 'logout_ip', 'logout_device_id', 'logout_reason',
        'is_active_session',
        // Manual entry / force-logout tracking
        'logout_by_user_id', 'created_by_user_id', 'is_manual_entry', 'manual_reason',
    ];

    protected function casts(): array
    {
        return [
            'login_time' => 'datetime',
            'logout_time' => 'datetime',
            'login_latitude' => 'decimal:8',
            'login_longitude' => 'decimal:8',
            'is_active_session' => 'boolean',
            'is_manual_entry' => 'boolean',
        ];
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    /**
     * The admin/HR user who force-closed this session, if it wasn't the
     * owning user themselves.
     */
    public function logoutBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'logout_by_user_id');
    }

    /**
     * Who manually created this attendance row (only set for manual entries).
     */
    public function createdBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by_user_id');
    }

    /**
     * True if someone other than the session owner closed it out.
     */
    public function getWasForceLoggedOutAttribute(): bool
    {
        return $this->logout_by_user_id && $this->logout_by_user_id !== $this->user_id;
    }

    /**
     * Duration in minutes, null if the session is still active.
     */
    public function getDurationMinutesAttribute(): ?int
    {
        if (!$this->logout_time) {
            return null;
        }

        return (int) $this->login_time->diffInMinutes($this->logout_time);
    }

    /**
     * Google Maps link for this login's coordinates.
     */
    public function getMapsLinkAttribute(): ?string
    {
        if (!$this->login_latitude || !$this->login_longitude) {
            return null;
        }

        return "https://www.google.com/maps?q={$this->login_latitude},{$this->login_longitude}&z=15";
    }
}