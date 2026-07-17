<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use App\Models\IncentiveRecord;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;

class FinanceController extends Controller
{
    /**
     * Office finance overview: payroll (salary + incentive + bonus) + office expenses.
     */
    public function dashboard(): View
    {
        // ---- Payroll: salary is fixed on the user; incentive/bonus are performance records ----
        $totalSalary = (float) User::sum('salary');
        $totalIncentive = (float) IncentiveRecord::where('type', 'incentive')->sum('amount');
        $totalBonus = (float) IncentiveRecord::where('type', 'bonus')->sum('amount');
        $totalPayroll = $totalSalary + $totalIncentive + $totalBonus;

        // ---- Office expenses (exclude cancelled) ----
        $expenseBase = Expense::where('status', '!=', 'cancelled');

        $totalExpenses = (float) (clone $expenseBase)->sum('amount');
        $paidExpenses = (float) Expense::where('status', 'paid')->sum('amount');
        $pendingExpenses = (float) Expense::where('status', 'pending')->sum('amount');
        $thisMonthExpenses = (float) Expense::where('status', '!=', 'cancelled')
            ->whereMonth('expense_date', now()->month)
            ->whereYear('expense_date', now()->year)
            ->sum('amount');

        // ---- Total outflow ----
        $totalOutflow = $totalPayroll + $totalExpenses;

        // ---- Chart: outflow composition (donut) ----
        $outflowComposition = [
            'labels' => ['Salaries', 'Incentives', 'Bonus', 'Office Expenses'],
            'data' => [round($totalSalary), round($totalIncentive), round($totalBonus), round($totalExpenses)],
        ];

        // ---- Chart: expenses by category (pie) ----
        $byCategory = (clone $expenseBase)
            ->select('category', DB::raw('SUM(amount) as total'))
            ->groupBy('category')
            ->orderByDesc('total')
            ->get();

        $expensesByCategory = [
            'labels' => $byCategory->pluck('category'),
            'data' => $byCategory->pluck('total')->map(fn ($v) => round((float) $v)),
        ];

        // ---- Chart: last 6 months expense trend (bar) ----
        $trendLabels = [];
        $trendData = [];
        for ($i = 5; $i >= 0; $i--) {
            $month = now()->copy()->subMonths($i);
            $trendLabels[] = $month->format('M Y');
            $trendData[] = round((float) Expense::where('status', '!=', 'cancelled')
                ->whereMonth('expense_date', $month->month)
                ->whereYear('expense_date', $month->year)
                ->sum('amount'));
        }

        return view('finance.dashboard', compact(
            'totalSalary', 'totalIncentive', 'totalBonus', 'totalPayroll',
            'totalExpenses', 'paidExpenses', 'pendingExpenses', 'thisMonthExpenses', 'totalOutflow',
            'outflowComposition', 'expensesByCategory', 'trendLabels', 'trendData'
        ));
    }

    /**
     * Payroll editor — set salary, incentive, and bonus per employee.
     */
    public function payroll(Request $request): View
    {
        $query = User::with('role')->where('employment_status', 'Active');

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(fn ($q) => $q->where('full_name', 'like', "%{$search}%")
                ->orWhere('employee_id', 'like', "%{$search}%"));
        }

        $users = $query->orderBy('full_name')->paginate(20)->withQueryString();

        // Incentive/bonus are earned per performance — total them from the records module.
        $incentiveByUser = IncentiveRecord::where('type', 'incentive')
            ->select('user_id', DB::raw('SUM(amount) as total'))->groupBy('user_id')->pluck('total', 'user_id');
        $bonusByUser = IncentiveRecord::where('type', 'bonus')
            ->select('user_id', DB::raw('SUM(amount) as total'))->groupBy('user_id')->pluck('total', 'user_id');

        return view('finance.payroll', compact('users', 'incentiveByUser', 'bonusByUser'));
    }

    /**
     * Only the fixed salary is edited here — incentives/bonuses are managed as performance records.
     */
    public function updatePayroll(Request $request, User $user): RedirectResponse
    {
        $validated = $request->validate(['salary' => 'required|numeric|min:0']);

        $user->update(['salary' => $validated['salary']]);

        return back()->with('success', "Salary updated for {$user->full_name}.");
    }
}
