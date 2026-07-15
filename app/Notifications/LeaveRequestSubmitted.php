<?php

namespace App\Notifications;

use App\Models\LeaveRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

class LeaveRequestSubmitted extends Notification
{
    use Queueable;

    public function __construct(public LeaveRequest $leaveRequest)
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
            'title'   => 'New Leave Request',
            'message' => "{$this->leaveRequest->user->full_name} applied for {$this->leaveRequest->leaveType->name} "
                . "({$this->leaveRequest->total_days} day(s), {$this->leaveRequest->from_date->format('d M Y')} "
                . "to {$this->leaveRequest->to_date->format('d M Y')}).",
            'url'  => route('leave-requests.show', $this->leaveRequest->id),
            'icon' => 'ti ti-calendar-event',
        ];
    }

    public function toWebPush($notifiable, $notification): WebPushMessage
    {
        return (new WebPushMessage)
            ->title('New Leave Request')
            ->icon('/build/assets/img/logo-small.svg')
            ->body("{$this->leaveRequest->user->full_name} applied for {$this->leaveRequest->leaveType->name}")
            ->action('View', 'view')
            ->data(['url' => route('leave-requests.show', $this->leaveRequest->id)])
            ->options(['TTL' => 1000]);
    }
}