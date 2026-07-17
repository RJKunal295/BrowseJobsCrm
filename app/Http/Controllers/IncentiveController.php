<?php

namespace App\Http\Controllers;

use App\Models\IncentiveRecord;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class IncentiveController extends Controller
{
    public function index(Request $request): View
    {
        $query = IncentiveRecord::with(['user', 'awardedBy']);

        if ($request->filled('user_id')) {
            $query->where('user_id', $request->input('user_id'));
        }
        if ($request->filled('type')) {
            $query->where('type', $request->input('type'));
        }
        if ($request->filled('status')) {
            $query->where('status', $request->input('status'));
        }
        if ($request->filled('year')) {
            $query->where('period_year', $request->input('year'));
        }
        if ($request->filled('month')) {
            $query->where('period_month', $request->input('month'));
        }

        $records = $query->latest()->paginate(20)->withQueryString();

        $base = IncentiveRecord::query();
        $totalIncentive = (clone $base)->where('type', 'incentive')->sum('amount');
        $totalBonus = (clone $base)->where('type', 'bonus')->sum('amount');
        $pendingAmount = (clone $base)->where('status', 'pending')->sum('amount');
        $thisMonth = (clone $base)->where('period_year', now()->year)->where('period_month', now()->month)->sum('amount');

        return view('incentives.index', [
            'records' => $records,
            'users' => User::where('employment_status', 'Active')->orderBy('full_name')->get(['id', 'full_name']),
            'years' => IncentiveRecord::select('period_year')->distinct()->orderByDesc('period_year')->pluck('period_year'),
            'totalIncentive' => $totalIncentive,
            'totalBonus' => $totalBonus,
            'pendingAmount' => $pendingAmount,
            'thisMonth' => $thisMonth,
        ]);
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);
        $validated['awarded_by_user_id'] = Auth::id();
        $validated['awarded_at'] = now();

        IncentiveRecord::create($validated);

        return back()->with('success', ucfirst($validated['type']).' awarded successfully.');
    }

    public function update(Request $request, IncentiveRecord $incentive): RedirectResponse
    {
        $incentive->update($this->validated($request));

        return back()->with('success', 'Record updated.');
    }

    public function updateStatus(Request $request, IncentiveRecord $incentive): RedirectResponse
    {
        $validated = $request->validate(['status' => 'required|in:pending,approved,paid']);

        $incentive->update(['status' => $validated['status']]);

        return back()->with('success', 'Status updated to '.$validated['status'].'.');
    }

    public function destroy(IncentiveRecord $incentive): RedirectResponse
    {
        $incentive->delete();

        return back()->with('success', 'Record deleted.');
    }

    private function validated(Request $request): array
    {
        $data = $request->validate([
            'user_id' => 'required|exists:users,id',
            'type' => 'required|in:incentive,bonus',
            'basis' => 'nullable|string|max:100',
            'quantity' => 'nullable|numeric|min:0',
            'rate' => 'nullable|numeric|min:0',
            'amount' => 'required|numeric|min:0',
            'period_month' => 'required|integer|min:1|max:12',
            'period_year' => 'required|integer|min:2000|max:2100',
            'status' => 'required|in:pending,approved,paid',
            'notes' => 'nullable|string|max:1000',
        ]);

        // If a quantity + rate were given but no explicit amount typed, derive it.
        if (empty($request->input('amount')) && filled($data['quantity']) && filled($data['rate'])) {
            $data['amount'] = round($data['quantity'] * $data['rate'], 2);
        }

        return $data;
    }
}
