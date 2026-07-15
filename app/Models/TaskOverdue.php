<?php

namespace App\Notifications;

use App\Models\Task;
use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

class TaskOverdue extends Notification
{
    use Queueable;

    public function __construct(
        public Task $task,
        public User $assignee
    ) {
    }

    /**
     * @return array<int, string|object>
     */
    public function via($notifiable): array
    {
        return ['mail', 'database', WebPushChannel::class];
    }

    public function toMail($notifiable): MailMessage
    {
        $isTheLateAssignee = $notifiable->id === $this->assignee->id;

        $mail = (new MailMessage)
            ->subject("🚩 Overdue Task: {$this->task->title}")
            ->error() // red-styled action button, signals urgency
            ->greeting($isTheLateAssignee
                ? "Hi {$notifiable->full_name},"
                : "Hi {$notifiable->full_name}, (monitoring alert)")
            ->line($isTheLateAssignee
                ? "You have not completed your task, and it is now overdue."
                : "{$this->assignee->full_name} has not completed an assigned task, and it is now overdue.")
            ->line("Task: {$this->task->title}")
            ->line("Due date: {$this->task->due_date->format('d M Y')}");

        if ($this->task->description) {
            $mail->line("Description: {$this->task->description}");
        }

        return $mail
            ->action('View Task', route('tasks.show', $this->task->id))
            ->line('Please take action as soon as possible.');
    }

    public function toDatabase($notifiable): array
    {
        $isTheLateAssignee = $notifiable->id === $this->assignee->id;

        return [
            'title'   => '🚩 Overdue Task',
            'message' => $isTheLateAssignee
                ? "You have not completed \"{$this->task->title}\" — it was due {$this->task->due_date->format('d M Y')}."
                : "{$this->assignee->full_name} has not completed \"{$this->task->title}\" (due {$this->task->due_date->format('d M Y')}).",
            'url'  => route('tasks.show', $this->task->id),
            'icon' => 'ti ti-flag-3',
        ];
    }

    public function toWebPush($notifiable, $notification): WebPushMessage
    {
        $isTheLateAssignee = $notifiable->id === $this->assignee->id;

        return (new WebPushMessage)
            ->title('🚩 Overdue Task')
            ->icon('/build/assets/img/logo-small.svg')
            ->body($isTheLateAssignee
                ? "You haven't completed \"{$this->task->title}\""
                : "{$this->assignee->full_name} hasn't completed \"{$this->task->title}\"")
            ->action('View', 'view')
            ->data(['url' => route('tasks.show', $this->task->id)])
            ->options(['TTL' => 1000]);
    }
}