<?php

namespace App\Console\Commands;

use App\Models\Task;
use App\Models\User;
use App\Notifications\TaskOverdue;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Notification;

class FlagOverdueTasks extends Command
{
    protected $signature = 'tasks:flag-overdue';

    protected $description = 'Send a daily reminder for every overdue, incomplete task assignment to the assignee plus monitors (Super Admin, Admin, Head Of Operations), repeating every day until completed.';

    private const MONITOR_ROLE_CODES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS'];

    public function handle(): void
    {
        // Pick up assignments that are (a) not yet completed, (b) past their
        // task's due date, and (c) haven't already been reminded TODAY —
        // so running this daily sends one fresh reminder per day, every day,
        // for as long as the assignee still hasn't completed it.
        $overdueRows = DB::table('task_assignees')
            ->join('tasks', 'tasks.id', '=', 'task_assignees.task_id')
            ->where('task_assignees.is_completed', false)
            ->whereDate('tasks.due_date', '<', now()->toDateString())
            ->where(function ($q) {
                $q->whereNull('task_assignees.last_reminded_at')
                  ->orWhereDate('task_assignees.last_reminded_at', '<', now()->toDateString());
            })
            ->select('task_assignees.id as pivot_id', 'task_assignees.task_id', 'task_assignees.user_id')
            ->get();

        if ($overdueRows->isEmpty()) {
            $this->info('No overdue tasks need a reminder today.');
            return;
        }

        $monitors = User::whereHas('role', fn ($q) => $q->whereIn('role_code', self::MONITOR_ROLE_CODES))->get();

        foreach ($overdueRows as $row) {
            $task = Task::find($row->task_id);
            $assignee = User::find($row->user_id);

            if (!$task || !$assignee) {
                continue;
            }

            DB::table('task_assignees')->where('id', $row->pivot_id)->update([
                'is_flagged'       => true, // permanent "has been overdue" badge marker
                'flagged_at'       => DB::raw('COALESCE(flagged_at, NOW())'), // only set the FIRST time
                'last_reminded_at' => now(), // controls tomorrow's re-send
                'updated_at'       => now(),
            ]);

            // Remind the late assignee themselves — every day, until they complete it.
            $assignee->notify(new TaskOverdue($task, $assignee));

            // Remind every monitor too (skip if the assignee is also a monitor,
            // so they don't get the same alert twice).
            $monitorsToNotify = $monitors->reject(fn (User $m) => $m->id === $assignee->id);
            if ($monitorsToNotify->isNotEmpty()) {
                Notification::send($monitorsToNotify, new TaskOverdue($task, $assignee));
            }

            $this->line("Reminded {$assignee->full_name} about overdue task #{$task->id} \"{$task->title}\"");
        }

        $this->info("{$overdueRows->count()} reminder(s) sent.");
    }
}