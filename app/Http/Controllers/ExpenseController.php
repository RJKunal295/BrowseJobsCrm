<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class ExpenseController extends Controller
{
    public function index(Request $request): View
    {
        $query = Expense::with('creator');

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(function ($q) use ($search) {
                $q->where('title', 'like', "%{$search}%")
                    ->orWhere('vendor', 'like', "%{$search}%")
                    ->orWhere('notes', 'like', "%{$search}%");
            });
        }

        if ($request->filled('category')) {
            $query->where('category', $request->input('category'));
        }

        if ($request->filled('status')) {
            $query->where('status', $request->input('status'));
        }

        $expenses = $query->orderByDesc('expense_date')->paginate(15)->withQueryString();

        $categories = Expense::select('category')->distinct()->orderBy('category')->pluck('category');

        $totalSpend = Expense::where('status', 'paid')->sum('amount');
        $thisMonth = Expense::where('status', 'paid')
            ->whereMonth('expense_date', now()->month)
            ->whereYear('expense_date', now()->year)
            ->sum('amount');
        $pending = Expense::where('status', 'pending')->sum('amount');
        $categoryCount = $categories->count();

        return view('expenses.index', compact(
            'expenses', 'categories', 'totalSpend', 'thisMonth', 'pending', 'categoryCount'
        ));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);
        $validated['created_by'] = Auth::id();

        Expense::create($validated);

        return redirect()->route('expenses.index')->with('success', 'Expense added successfully.');
    }

    public function update(Request $request, Expense $expense): RedirectResponse
    {
        $expense->update($this->validated($request));

        return redirect()->route('expenses.index')->with('success', 'Expense updated successfully.');
    }

    public function destroy(Expense $expense): RedirectResponse
    {
        $expense->delete();

        return redirect()->route('expenses.index')->with('success', 'Expense deleted successfully.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'title'          => 'required|string|max:150',
            'category'       => 'required|string|max:100',
            'amount'         => 'required|numeric|min:0',
            'expense_date'   => 'required|date',
            'payment_method' => 'required|in:cash,card,upi,bank_transfer,cheque,other',
            'vendor'         => 'nullable|string|max:150',
            'status'         => 'required|in:paid,pending,cancelled',
            'notes'          => 'nullable|string|max:1000',
        ]);
    }
}