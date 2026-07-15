<?php

namespace App\Http\Controllers;

use App\Models\LeaveType;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class LeaveTypeController extends Controller
{
    public function index(): View
    {
        $leaveTypes = LeaveType::orderBy('name')->paginate(20);

        return view('leave-types.index', compact('leaveTypes'));
    }

    public function create(): View
    {
        return view('leave-types.create');
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name'                   => 'required|string|max:100',
            'code'                   => 'required|string|max:50|unique:leave_types,code|regex:/^[a-z0-9_]+$/',
            'default_days_per_year'  => 'required|integer|min:0',
            'is_active'              => 'nullable|boolean',
        ], [
            'code.regex' => 'Code must be lowercase letters, numbers, and underscores only.',
        ]);

        $validated['is_active'] = $request->boolean('is_active', true);

        LeaveType::create($validated);

        return redirect()->route('leave-types.index')->with('success', 'Leave type created successfully.');
    }

    public function destroy(LeaveType $leaveType): RedirectResponse
    {
        if ($leaveType->leaveRequests()->exists()) {
            return back()->with('error', 'Cannot delete a leave type that already has requests against it. Deactivate it instead.');
        }

        $leaveType->delete();

        return redirect()->route('leave-types.index')->with('success', 'Leave type deleted successfully.');
    }
}