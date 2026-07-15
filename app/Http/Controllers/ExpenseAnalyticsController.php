<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class ExpenseAnalyticsController extends Controller
{
    public function index(Request $request): View
    {
        $range = $request->input('range', '30'); // '30', '180', '365', 'all'

        $query = Expense::where('status', 'paid');

        if ($range !== 'all') {
            $query->where('expense_date', '>=', now()->subDays((int) $range));
        }

        // ---- Recent Expenses ----
        $recentExpenses = (clone $query)->orderByDesc('expense_date')->take(6)->get();

        // ---- Spend By Category ----
        $spendByCategory = (clone $query)
            ->select('category', DB::raw('SUM(amount) as total'))
            ->groupBy('category')
            ->orderByDesc('total')
            ->get();

        // ---- Top Vendors ----
        $topVendors = (clone $query)
            ->whereNotNull('vendor')
            ->select('vendor', DB::raw('SUM(amount) as total'))
            ->groupBy('vendor')
            ->orderByDesc('total')
            ->take(6)
            ->get();

        // ---- Monthly Trend (always last 6 months, regardless of range filter) ----
        $monthlyTrend = Expense::where('status', 'paid')
            ->where('expense_date', '>=', now()->subMonths(5)->startOfMonth())
            ->select(
                DB::raw("DATE_FORMAT(expense_date, '%Y-%m') as month"),
                DB::raw('SUM(amount) as total')
            )
            ->groupBy('month')
            ->orderBy('month')
            ->get()
            ->keyBy('month');

        $trendLabels = [];
        $trendData = [];
        for ($i = 5; $i >= 0; $i--) {
            $monthKey = now()->subMonths($i)->format('Y-m');
            $trendLabels[] = now()->subMonths($i)->format('M Y');
            $trendData[] = (float) ($monthlyTrend[$monthKey]->total ?? 0);
        }

        $totalInRange = (clone $query)->sum('amount');

        return view('expenses.analytics', compact(
            'recentExpenses', 'spendByCategory', 'topVendors',
            'trendLabels', 'trendData', 'totalInRange', 'range'
        ));
    }
}