<?php

namespace App\Http\Controllers;

use App\Models\Todo;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class TodoController extends Controller
{
    public function index(Request $request): View
    {
        $query = Todo::where('user_id', Auth::id());

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(function ($q) use ($search) {
                $q->where('title', 'like', "%{$search}%")
                    ->orWhere('notes', 'like', "%{$search}%");
            });
        }

        if ($request->filled('priority')) {
            $query->where('priority', $request->input('priority'));
        }

        $filter = $request->input('filter', 'active'); // active, completed, all
        if ($filter === 'active') {
            $query->where('is_completed', false);
        } elseif ($filter === 'completed') {
            $query->where('is_completed', true);
        }

        $todos = $query->orderBy('is_completed')
            ->orderBy('sort_order')
            ->orderByRaw("FIELD(priority, 'high', 'medium', 'low')")
            ->orderByRaw('due_date IS NULL, due_date ASC')
            ->get();

        $base = Todo::where('user_id', Auth::id());
        $activeCount = (clone $base)->where('is_completed', false)->count();
        $completedCount = (clone $base)->where('is_completed', true)->count();
        $overdueCount = (clone $base)->where('is_completed', false)
            ->whereNotNull('due_date')
            ->whereDate('due_date', '<', now())
            ->count();

        return view('todos.index', compact('todos', 'filter', 'activeCount', 'completedCount', 'overdueCount'));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);
        $validated['user_id'] = Auth::id();

        Todo::create($validated);

        return redirect()->route('todos.index')->with('success', 'Task added successfully.');
    }

    public function update(Request $request, Todo $todo): RedirectResponse
    {
        $this->authorizeTodo($todo);

        $todo->update($this->validated($request));

        return redirect()->route('todos.index')->with('success', 'Task updated successfully.');
    }

    public function toggleComplete(Todo $todo): RedirectResponse
    {
        $this->authorizeTodo($todo);

        $completed = ! $todo->is_completed;
        $todo->update([
            'is_completed' => $completed,
            'completed_at' => $completed ? now() : null,
        ]);

        return redirect()->route('todos.index')->with('success', $completed ? 'Task completed.' : 'Task reopened.');
    }

    public function destroy(Todo $todo): RedirectResponse
    {
        $this->authorizeTodo($todo);

        $todo->delete();

        return redirect()->route('todos.index')->with('success', 'Task deleted successfully.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'title' => 'required|string|max:200',
            'notes' => 'nullable|string|max:2000',
            'priority' => 'required|in:low,medium,high',
            'due_date' => 'nullable|date',
        ]);
    }

    private function authorizeTodo(Todo $todo): void
    {
        abort_unless($todo->user_id === Auth::id(), 403);
    }
}
