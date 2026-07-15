<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;

class UserManagementController extends Controller
{
    /**
     * List users with filters + pagination.
     */
    public function index(Request $request): View
    {
        $query = User::query();

        if ($request->filled('mobile')) {
            $query->where('phone', 'like', '%' . $request->input('mobile') . '%');
        }

        if ($request->filled('email')) {
            $query->where('email', 'like', '%' . $request->input('email') . '%');
        }

        if ($request->filled('name')) {
            $query->where('full_name', 'like', '%' . $request->input('name') . '%');
        }

        if ($request->filled('role_id')) {
            $query->where('role_id', $request->input('role_id'));
        }

        if ($request->filled('status')) {
            $query->where('is_active', $request->input('status') === 'active' ? 1 : 0);
        }

        $users = $query->orderByDesc('id')
            ->paginate(15)
            ->withQueryString();

        $roles = DB::table('roles')->orderBy('role_name')->get();

        return view('users.index', compact('users', 'roles'));
    }

    /**
     * Show the create user form.
     */
    public function create(): View
    {
        $roles = DB::table('roles')->orderBy('role_name')->get();
        $managers = User::orderBy('full_name')->get(['id', 'full_name']);

        return view('users.create', compact('roles', 'managers'));
    }

    /**
     * Store a newly created user.
     */
    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            // Basic Information
            'employee_id'      => 'nullable|string|max:50|unique:users,employee_id',
            'first_name'       => 'required|string|max:100',
            'last_name'        => 'nullable|string|max:100',
            'gender'           => 'nullable|in:male,female,other',
            'date_of_birth'    => 'nullable|date',
            'profile_photo'    => 'nullable|image|max:2048',
            'email'            => 'required|email|max:255|unique:users,email',
            'phone'            => 'nullable|string|max:20',
            'whatsapp_number'  => 'nullable|string|max:20',
            'alternate_phone'  => 'nullable|string|max:20',
            'password'         => 'required|string|min:6|confirmed',

            // Employment Details
            'role_id'              => 'required|exists:roles,id',
            'designation'          => 'nullable|string|max:100',
            'department'           => 'nullable|string|max:100',
            'reporting_manager_id' => 'nullable|exists:users,id',
            'employee_type'        => 'nullable|string|max:50',
            'employment_status'    => 'nullable|string|max:50',
            'joining_date'         => 'nullable|date',
            'resignation_date'     => 'nullable|date',
            'last_working_day'     => 'nullable|date',

            // Salary Details
            'salary'          => 'nullable|numeric|min:0',
            'salary_type'     => 'nullable|string|max:20',
            'incentive'       => 'nullable|numeric|min:0',
            'bonus'           => 'nullable|numeric|min:0',
            'pan_number'      => 'nullable|string|max:20',
            'aadhaar_number'  => 'nullable|string|max:20',
            'pf_number'       => 'nullable|string|max:30',
            'esi_number'      => 'nullable|string|max:30',
            'uan_number'      => 'nullable|string|max:30',

            // Bank Details
            'bank_name'            => 'nullable|string|max:100',
            'account_holder_name'  => 'nullable|string|max:100',
            'account_number'       => 'nullable|string|max:30',
            'ifsc_code'            => 'nullable|string|max:20',
            'branch_name'          => 'nullable|string|max:100',
            'upi_id'               => 'nullable|string|max:100',

            // Address
            'address' => 'nullable|string|max:500',
            'city'    => 'nullable|string|max:100',
            'state'   => 'nullable|string|max:100',
            'country' => 'nullable|string|max:100',
            'pincode' => 'nullable|string|max:20',

            // Documents
            'aadhaar_file'       => 'nullable|file|max:5120',
            'pan_file'           => 'nullable|file|max:5120',
            'resume'             => 'nullable|file|max:5120',
            'offer_letter'       => 'nullable|file|max:5120',
            'experience_letter'  => 'nullable|file|max:5120',
            'salary_slip'        => 'nullable|file|max:5120',
            'cancelled_cheque'   => 'nullable|file|max:5120',

            'is_active' => 'nullable|boolean',
        ]);

        // Handle file uploads — each stored under storage/app/public/employees/{field}
        $fileFields = [
            'profile_photo', 'aadhaar_file', 'pan_file', 'resume',
            'offer_letter', 'experience_letter', 'salary_slip', 'cancelled_cheque',
        ];

        $filePaths = [];
        foreach ($fileFields as $field) {
            if ($request->hasFile($field)) {
                $filePaths[$field] = $request->file($field)->store("employees/{$field}", 'public');
            }
        }

        $validated['full_name'] = trim($validated['first_name'] . ' ' . ($validated['last_name'] ?? ''));
        $validated['is_active'] = $request->boolean('is_active', true);

        User::create(array_merge($validated, $filePaths));

        return redirect()->route('users.index')->with('success', 'User created successfully.');
    }

    /**
     * Show the edit user form.
     */
    public function edit(User $user): View
    {
        $roles = DB::table('roles')->orderBy('role_name')->get();
        $managers = User::where('id', '!=', $user->id)->orderBy('full_name')->get(['id', 'full_name']);

        return view('users.edit', compact('user', 'roles', 'managers'));
    }

    /**
     * Update an existing user.
     */
    public function update(Request $request, User $user): RedirectResponse
    {
        $validated = $request->validate([
            // Basic Information
            'employee_id'      => 'nullable|string|max:50|unique:users,employee_id,' . $user->id,
            'first_name'       => 'required|string|max:100',
            'last_name'        => 'nullable|string|max:100',
            'gender'           => 'nullable|in:male,female,other',
            'date_of_birth'    => 'nullable|date',
            'profile_photo'    => 'nullable|image|max:2048',
            'email'            => 'required|email|max:255|unique:users,email,' . $user->id,
            'phone'            => 'nullable|string|max:20',
            'whatsapp_number'  => 'nullable|string|max:20',
            'alternate_phone'  => 'nullable|string|max:20',
            'password'         => 'nullable|string|min:6|confirmed',

            // Employment Details
            'role_id'              => 'required|exists:roles,id',
            'designation'          => 'nullable|string|max:100',
            'department'           => 'nullable|string|max:100',
            'reporting_manager_id' => 'nullable|exists:users,id',
            'employee_type'        => 'nullable|string|max:50',
            'employment_status'    => 'nullable|string|max:50',
            'joining_date'         => 'nullable|date',
            'resignation_date'     => 'nullable|date',
            'last_working_day'     => 'nullable|date',

            // Salary Details
            'salary'          => 'nullable|numeric|min:0',
            'salary_type'     => 'nullable|string|max:20',
            'incentive'       => 'nullable|numeric|min:0',
            'bonus'           => 'nullable|numeric|min:0',
            'pan_number'      => 'nullable|string|max:20',
            'aadhaar_number'  => 'nullable|string|max:20',
            'pf_number'       => 'nullable|string|max:30',
            'esi_number'      => 'nullable|string|max:30',
            'uan_number'      => 'nullable|string|max:30',

            // Bank Details
            'bank_name'            => 'nullable|string|max:100',
            'account_holder_name'  => 'nullable|string|max:100',
            'account_number'       => 'nullable|string|max:30',
            'ifsc_code'            => 'nullable|string|max:20',
            'branch_name'          => 'nullable|string|max:100',
            'upi_id'               => 'nullable|string|max:100',

            // Address
            'address' => 'nullable|string|max:500',
            'city'    => 'nullable|string|max:100',
            'state'   => 'nullable|string|max:100',
            'country' => 'nullable|string|max:100',
            'pincode' => 'nullable|string|max:20',

            // Documents
            'aadhaar_file'       => 'nullable|file|max:5120',
            'pan_file'           => 'nullable|file|max:5120',
            'resume'             => 'nullable|file|max:5120',
            'offer_letter'       => 'nullable|file|max:5120',
            'experience_letter'  => 'nullable|file|max:5120',
            'salary_slip'        => 'nullable|file|max:5120',
            'cancelled_cheque'   => 'nullable|file|max:5120',

            'is_active' => 'nullable|boolean',
        ]);

        // Only replace a file if a new one was actually uploaded; delete the old one first.
        $fileFields = [
            'profile_photo', 'aadhaar_file', 'pan_file', 'resume',
            'offer_letter', 'experience_letter', 'salary_slip', 'cancelled_cheque',
        ];

        $filePaths = [];
        foreach ($fileFields as $field) {
            if ($request->hasFile($field)) {
                if ($user->$field) {
                    Storage::disk('public')->delete($user->$field);
                }
                $filePaths[$field] = $request->file($field)->store("employees/{$field}", 'public');
            }
        }

        // Don't overwrite password/file fields with null just because they weren't submitted.
        unset($validated['password']);
        foreach ($fileFields as $field) {
            unset($validated[$field]);
        }

        $validated['full_name'] = trim($validated['first_name'] . ' ' . ($validated['last_name'] ?? ''));
        $validated['is_active'] = $request->boolean('is_active', true);

        $user->fill(array_merge($validated, $filePaths));

        if ($request->filled('password')) {
            $user->password = $request->input('password'); // hashed automatically via model cast
        }

        $user->save();

        return redirect()->route('users.index')->with('success', 'User updated successfully.');
    }

    /**
     * Show a single user's full details (read-only).
     */
    public function show(User $user): View
    {
        $role = DB::table('roles')->find($user->role_id);
        $manager = $user->reporting_manager_id
            ? User::find($user->reporting_manager_id)
            : null;

        return view('users.show', compact('user', 'role', 'manager'));
    }

    /**
     * Toggle a user's active/inactive status.
     */
    public function toggleStatus(User $user): RedirectResponse
    {
        $user->update([
            'is_active' => !$user->is_active,
        ]);

        $status = $user->is_active ? 'activated' : 'deactivated';

        return redirect()->back()->with('success', "User {$status} successfully.");
    }

    /**
     * Delete a user (soft delete, since the model uses SoftDeletes).
     */
    public function destroy(User $user): RedirectResponse
    {
        $user->delete();

        return redirect()->route('users.index')->with('success', 'User deleted successfully.');
    }
}