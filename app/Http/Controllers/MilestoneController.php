<?php

namespace App\Http\Controllers;

use App\Models\Milestone;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class MilestoneController extends Controller
{
    public function index(Request $request): View
    {
        $query = Milestone::with('creator');

        if ($request->filled('period_type')) {
            $query->where('period_type', $request->input('period_type'));
        }

        if ($request->filled('year')) {
            $query->where('period_year', $request->input('year'));
        }

        $milestones = $query->orderByDesc('period_year')
            ->orderByDesc('period_month')
            ->orderByDesc('created_at')
            ->get();

        $years = Milestone::select('period_year')->distinct()->orderByDesc('period_year')->pluck('period_year');

        $achieved = $milestones->filter->isAchieved()->count();
        $inProgress = $milestones->count() - $achieved;

        return view('milestones.index', compact('milestones', 'years', 'achieved', 'inProgress'));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);
        $validated['created_by'] = Auth::id();

        Milestone::create($validated);

        return redirect()->route('milestones.index')->with('success', 'Milestone created.');
    }

    public function update(Request $request, Milestone $milestone): RedirectResponse
    {
        $milestone->update($this->validated($request));

        return redirect()->route('milestones.index')->with('success', 'Milestone updated.');
    }

    public function destroy(Milestone $milestone): RedirectResponse
    {
        $milestone->delete();

        return redirect()->route('milestones.index')->with('success', 'Milestone deleted.');
    }

    private function validated(Request $request): array
    {
        $data = $request->validate([
            'title' => 'required|string|max:200',
            'description' => 'nullable|string|max:1000',
            'metric' => 'required|in:leads,custom',
            'period_type' => 'required|in:monthly,quarterly,yearly',
            'period_year' => 'required|integer|min:2000|max:2100',
            'period_month' => 'nullable|integer|min:1|max:12',
            'period_quarter' => 'nullable|integer|min:1|max:4',
            'target_value' => 'required|numeric|min:0',
            'current_value' => 'nullable|numeric|min:0',
        ]);

        // Keep only the period field relevant to the chosen type.
        if ($data['period_type'] !== 'monthly') {
            $data['period_month'] = null;
        }
        if ($data['period_type'] !== 'quarterly') {
            $data['period_quarter'] = null;
        }

        $data['current_value'] = $data['current_value'] ?? 0;

        return $data;
    }
}
