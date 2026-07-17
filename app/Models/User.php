<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use NotificationChannels\WebPush\HasPushSubscriptions;

class User extends Authenticatable
{
    use HasFactory, HasPushSubscriptions, Notifiable, SoftDeletes;

    protected $fillable = [
        // Basic Information
        'employee_id', 'first_name', 'last_name', 'full_name', 'gender',
        'date_of_birth', 'profile_photo', 'email', 'password',
        'phone', 'whatsapp_number', 'alternate_phone',

        // Employment Details
        'designation', 'department', 'role_id', 'reporting_manager_id',
        'employee_type', 'joining_date', 'resignation_date',
        'last_working_day', 'employment_status',

        // Salary Details
        'salary', 'salary_type', 'incentive', 'bonus',
        'pan_number', 'aadhaar_number', 'pf_number', 'esi_number', 'uan_number',

        // Bank Details
        'bank_name', 'account_holder_name', 'account_number', 'ifsc_code',
        'branch_name', 'upi_id',

        // Address
        'address', 'city', 'state', 'country', 'pincode',

        // Documents
        'aadhaar_file', 'pan_file', 'resume', 'offer_letter',
        'experience_letter', 'salary_slip', 'cancelled_cheque',

        // Audit
        'is_active', 'created_by', 'updated_by',
    ];

    protected $hidden = [
        'password',
        'remember_token',
        // Sensitive fields — hide from API responses by default
        'pan_number', 'aadhaar_number',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'date_of_birth' => 'date',
            'joining_date' => 'date',
            'resignation_date' => 'date',
            'last_working_day' => 'date',
            'salary' => 'decimal:2',
            'incentive' => 'decimal:2',
            'bonus' => 'decimal:2',
            'is_active' => 'boolean',
            'last_login_at' => 'datetime',
        ];
    }

    // ---------- Relationships ----------

    public function role(): BelongsTo
    {
        return $this->belongsTo(Role::class);
    }

    public function reportingManager(): BelongsTo
    {
        return $this->belongsTo(User::class, 'reporting_manager_id');
    }

    public function subordinates(): HasMany
    {
        return $this->hasMany(User::class, 'reporting_manager_id');
    }

    public function loginLogs(): HasMany
    {
        return $this->hasMany(UserLoginLog::class);
    }

    public function activeSession(): HasMany
    {
        return $this->loginLogs()->where('is_active_session', true);
    }

    public function createdBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function updatedBy(): BelongsTo
    {
        return $this->belongsTo(User::class, 'updated_by');
    }

    public function hasPermission(string $slug): bool
    {
        return $this->role?->hasPermission($slug) ?? false;
    }

    /**
     * Limit a query to users whose role matches one of the given role codes.
     *
     * @param  Builder<User>  $query
     * @param  array<int, string>  $codes
     */
    public function scopeWithRoleCode($query, array $codes)
    {
        return $query->whereHas('role', fn ($q) => $q->whereIn('role_code', $codes));
    }
}
