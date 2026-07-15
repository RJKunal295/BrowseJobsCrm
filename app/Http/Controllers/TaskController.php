<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Models\User;
use App\Notifications\TaskAssigned;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use Illuminate\View\View;

class TaskController extends Controller
{
    private const MONITOR_ROLE_CODES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS'];

    /**
     * Monitors (Super Admin / Admin / Head Of Operations) see every task.
     * Everyone else sees tasks they created or were assigned to.
     */
    public function index(Request $request): View
    {
        $user = Auth::user();
        $isMonitor = $this->isMonitor($user);

        $query = Task::with(['creator', 'assignees']);

        if (!$isMonitor) {
            $query->where(function ($q) use ($user) {
                $q->where('created_by', $user->id)
                  ->orWhereHas('assignees', fn ($q2) => $q2->where('users.id', $user->id));
            });
        }

        if ($request->filled('status')) {
            if ($request->input('status') === 'overdue') {
                $query->where('status', '!=', 'completed')->whereDate('due_date', '<', now()->toDateString());
            } else {
                $query->where('status', $request->input('status'));
            }
        }

        if ($isMonitor && $request->filled('assignee_id')) {
            $query->whereHas('assignees', fn ($q) => $q->where('users.id', $request->input('assignee_id')));
        }

        $tasks = $query->orderByDesc('created_at')->paginate(20)->withQueryString();

        $users = User::orderBy('full_name')->get(['id', 'full_name']);

        return view('tasks.index', compact('tasks', 'users', 'isMonitor'));
    }

    public function create(): View
    {
        $users = User::orderBy('full_name')->get(['id', 'full_name']);

        return view('tasks.create', compact('users'));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'title'          => 'required|string|max:150',
            'description'    => 'nullable|string|max:2000',
            'due_date'       => 'required|date',
            'priority'       => 'required|in:low,medium,high',
            'assignee_ids'   => 'required|array|min:1',
            'assignee_ids.*' => 'exists:users,id',
        ]);

        $task = Task::create([
            'title'       => $validated['title'],
            'description' => $validated['description'] ?? null,
            'due_date'    => $validated['due_date'],
            'priority'    => $validated['priority'],
            'status'      => 'pending',
            'created_by'  => Auth::id(),
        ]);

        $pivotData = collect($validated['assignee_ids'])->mapWithKeys(fn ($id) => [
            $id => ['is_completed' => false],
        ])->all();

        $task->assignees()->attach($pivotData);

        $assignees = User::whereIn('id', $validated['assignee_ids'])->get();
        Notification::send($assignees, new TaskAssigned($task));

        return redirect()->route('tasks.index')->with('success', 'Task created and assigned successfully.');
    }

    public function show(Task $task): View
    {
        $user = Auth::user();
        $isMonitor = $this->isMonitor($user);
        $isCreator = $task->created_by === $user->id;

        $task->load(['creator', 'assignees']);

        $isAssignee = $task->assignees->contains('id', $user->id);

        if (!$isMonitor && !$isCreator && !$isAssignee) {
            abort(403);
        }

        return view('tasks.show', compact('task', 'isMonitor', 'isCreator', 'isAssignee'));
    }

    /**
     * The current user marks their OWN portion of a task complete.
     */
    public function markComplete(Task $task): RedirectResponse
    {
        $user = Auth::user();

        $isAssignee = $task->assignees()->where('users.id', $user->id)->exists();
        if (!$isAssignee) {
            abort(403, 'You are not assigned to this task.');
        }

        $task->assignees()->updateExistingPivot($user->id, [
            'is_completed' => true,
            'completed_at' => now(),
        ]);

        $task->refreshOverallStatus();

        return back()->with('success', 'Marked your portion of this task as complete.');
    }

    public function destroy(Task $task): RedirectResponse
    {
        $user = Auth::user();

        if ($task->created_by !== $user->id && !$this->isMonitor($user)) {
            abort(403);
        }

        $task->delete();

        return redirect()->route('tasks.index')->with('success', 'Task deleted successfully.');
    }

    private function isMonitor(User $user): bool
    {
        return $user->role && in_array($user->role->role_code, self::MONITOR_ROLE_CODES, true);
    }
}