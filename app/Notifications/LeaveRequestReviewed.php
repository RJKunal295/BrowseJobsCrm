<?php

namespace App\Notifications;

use App\Models\LeaveRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

class LeaveRequestReviewed extends Notification
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
        return ['mail', 'database', WebPushChannel::class];
    }

    public function toMail($notifiable): MailMessage
    {
        $status = ucfirst($this->leaveRequest->status);

        $mail = (new MailMessage)
            ->subject("Your Leave Request Has Been {$status}")
            ->greeting("Hi {$notifiable->full_name},")
            ->line("Your {$this->leaveRequest->leaveType->name} request from "
                . "{$this->leaveRequest->from_date->format('d M Y')} to "
                . "{$this->leaveRequest->to_date->format('d M Y')} ({$this->leaveRequest->total_days} day(s)) "
                . "has been {$this->leaveRequest->status}.");

        if ($this->leaveRequest->review_remarks) {
            $mail->line("Remarks: {$this->leaveRequest->review_remarks}");
        }

        return $mail
            ->action('View Leave Request', route('leave-requests.show', $this->leaveRequest->id))
            ->line('Thank you.');
    }

    public function toDatabase($notifiable): array
    {
        return [
            'title'   => 'Leave Request ' . ucfirst($this->leaveRequest->status),
            'message' => "Your {$this->leaveRequest->leaveType->name} request has been {$this->leaveRequest->status}.",
            'url'     => route('leave-requests.show', $this->leaveRequest->id),
            'icon'    => $this->leaveRequest->status === 'approved' ? 'ti ti-check' : 'ti ti-x',
        ];
    }

    public function toWebPush($notifiable, $notification): WebPushMessage
    {
        $status = ucfirst($this->leaveRequest->status);

        return (new WebPushMessage)
            ->title("Leave Request {$status}")
            ->icon('/build/assets/img/logo-small.svg')
            ->body("Your {$this->leaveRequest->leaveType->name} request has been {$this->leaveRequest->status}.")
            ->action('View', 'view')
            ->data(['url' => route('leave-requests.show', $this->leaveRequest->id)])
            ->options(['TTL' => 1000]);
    }
}