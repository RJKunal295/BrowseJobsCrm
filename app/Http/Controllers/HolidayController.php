<?php

namespace App\Http\Controllers;

use App\Models\Holiday;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use Symfony\Component\HttpFoundation\StreamedResponse;

class HolidayController extends Controller
{
    /**
     * List holidays for a given year, or all years if year=all.
     * Visible to everyone logged in; Add/Edit/Delete only for manage_holidays.
     */
    public function index(Request $request): View
    {
        $year = $request->input('year', now()->year); // 'all' or a specific year

        $query = Holiday::query();
        if ($year !== 'all') {
            $query->where('year', (int) $year);
        }

        $holidays = $query->orderBy('holiday_date')->get();

        $availableYears = Holiday::select('year')->distinct()->pluck('year')->push(now()->year)->unique()->sort()->values();

        $canManage = Auth::user()->hasPermission('manage_holidays');

        return view('holidays.index', compact('holidays', 'year', 'availableYears', 'canManage'));
    }

    /**
     * Download the same filtered list as a CSV (opens directly in Excel).
     * Available to any logged-in user, not just those who can manage holidays.
     */
    public function export(Request $request): StreamedResponse
    {
        $year = $request->input('year', now()->year);

        $query = Holiday::query();
        if ($year !== 'all') {
            $query->where('year', (int) $year);
        }

        $holidays = $query->orderBy('holiday_date')->get();

        $filename = $year === 'all' ? 'holidays_all_years.csv' : "holidays_{$year}.csv";

        return response()->streamDownload(function () use ($holidays) {
            $handle = fopen('php://output', 'w');

            // UTF-8 BOM so Excel doesn't mangle special characters on Windows.
            fwrite($handle, "\xEF\xBB\xBF");

            fputcsv($handle, ['Holiday', 'Date', 'Day', 'Type', 'Description']);

            foreach ($holidays as $holiday) {
                fputcsv($handle, [
                    $holiday->title,
                    $holiday->holiday_date->format('d M Y'),
                    $holiday->day_name,
                    $holiday->is_optional ? 'Optional' : 'Public',
                    $holiday->description ?? '',
                ]);
            }

            fclose($handle);
        }, $filename, [
            'Content-Type' => 'text/csv; charset=UTF-8',
        ]);
    }

    public function create(): View
    {
        $this->authorizeManage();

        return view('holidays.create');
    }

    public function store(Request $request): RedirectResponse
    {
        $this->authorizeManage();

        $validated = $request->validate([
            'title'        => 'required|string|max:150',
            'holiday_date' => 'required|date',
            'is_optional'  => 'nullable|boolean',
            'description'  => 'nullable|string|max:500',
        ]);

        Holiday::create([
            'title'        => $validated['title'],
            'holiday_date' => $validated['holiday_date'],
            'is_optional'  => $request->boolean('is_optional'),
            'description'  => $validated['description'] ?? null,
            'created_by'   => Auth::id(),
        ]);

        $year = \Carbon\Carbon::parse($validated['holiday_date'])->year;

        return redirect()->route('holidays.index', ['year' => $year])->with('success', 'Holiday added successfully.');
    }

    public function edit(Holiday $holiday): View
    {
        $this->authorizeManage();

        return view('holidays.edit', compact('holiday'));
    }

    public function update(Request $request, Holiday $holiday): RedirectResponse
    {
        $this->authorizeManage();

        $validated = $request->validate([
            'title'        => 'required|string|max:150',
            'holiday_date' => 'required|date',
            'is_optional'  => 'nullable|boolean',
            'description'  => 'nullable|string|max:500',
        ]);

        $holiday->update([
            'title'        => $validated['title'],
            'holiday_date' => $validated['holiday_date'],
            'is_optional'  => $request->boolean('is_optional'),
            'description'  => $validated['description'] ?? null,
        ]);

        $year = \Carbon\Carbon::parse($validated['holiday_date'])->year;

        return redirect()->route('holidays.index', ['year' => $year])->with('success', 'Holiday updated successfully.');
    }

    public function destroy(Holiday $holiday): RedirectResponse
    {
        $this->authorizeManage();

        $year = $holiday->year;
        $holiday->delete();

        return redirect()->route('holidays.index', ['year' => $year])->with('success', 'Holiday deleted successfully.');
    }

    private function authorizeManage(): void
    {
        if (!Auth::user()->hasPermission('manage_holidays')) {
            abort(403, 'You do not have permission to manage holidays.');
        }
    }
}