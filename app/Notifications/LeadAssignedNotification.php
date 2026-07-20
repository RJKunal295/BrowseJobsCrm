<?php

namespace App\Notifications;

use App\Models\Lead;
use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

/**
 * Sent to the HR user a lead is assigned to — in-app bell (database)
 * plus an instant web-push banner with sound.
 */
class LeadAssignedNotification extends Notification
{
    use Queueable;

    public function __construct(public Lead $lead, public ?User $assignedBy = null) {}

    /**
     * @return array<int, string|object>
     */
    public function via($notifiable): array
    {
        return ['database', WebPushChannel::class];
    }

    private function messageText(): string
    {
        $by = $this->assignedBy?->full_name ?? 'HR Manager';

        return $this->lead->displayName().' ('.$this->lead->mobile.') assigned by '.$by.'. Please follow up.';
    }

    /**
     * @return array<string, string>
     */
    public function toDatabase($notifiable): array
    {
        return [
            'title' => 'New lead assigned to you',
            'message' => $this->messageText(),
            'url' => route('leads.show', $this->lead->id),
            'icon' => 'ti ti-user-check',
        ];
    }

    public function toWebPush($notifiable, $notification): WebPushMessage
    {
        return (new WebPushMessage)
            ->title('New lead assigned to you')
            ->icon('/build/assets/img/logo-small.svg')
            ->body($this->messageText())
            ->action('View', 'view')
            ->data(['url' => route('leads.show', $this->lead->id)])
            // Unique tag per lead+assignment so a banner is never silently replaced.
            ->tag('lead-assigned-'.$this->lead->id.'-'.$notification->id)
            ->vibrate([200, 100, 200])
            ->requireInteraction()
            // High urgency so FCM/Mozilla deliver immediately instead of
            // batching while the device looks idle or is in battery saver.
            ->options(['TTL' => 1200, 'urgency' => 'high']);
    }
}
