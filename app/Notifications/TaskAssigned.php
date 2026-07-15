<?php

namespace App\Notifications;

use App\Models\Task;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

class TaskAssigned extends Notification
{
    use Queueable;

    public function __construct(public Task $task)
    {
    }

    /**
     * @return array<int, string|object>
     */
    public function via($notifiable): array
    {
        return ['database', WebPushChannel::class];
    }

    public function toDatabase($notifiable): array
    {
        return [
            'title'   => 'New Task Assigned',
            'message' => "\"{$this->task->title}\" — due {$this->task->due_date->format('d M Y')}.",
            'url'     => route('tasks.show', $this->task->id),
            'icon'    => 'ti ti-clipboard-list',
        ];
    }

    public function toWebPush($notifiable, $notification): WebPushMessage
    {
        return (new WebPushMessage)
            ->title('New Task Assigned')
            ->icon('/build/assets/img/logo-small.svg')
            ->body("\"{$this->task->title}\" — due {$this->task->due_date->format('d M Y')}")
            ->action('View', 'view')
            ->data(['url' => route('tasks.show', $this->task->id)])
            ->options(['TTL' => 1000]);
    }
}