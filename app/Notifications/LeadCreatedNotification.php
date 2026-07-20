<?php

namespace App\Notifications;

use App\Models\Lead;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

/**
 * Sent to admin roles the moment a new lead is generated — in-app bell
 * (database) plus an instant web-push banner with sound.
 */
class LeadCreatedNotification extends Notification
{
    use Queueable;

    public function __construct(public Lead $lead) {}

    /**
     * @return array<int, string|object>
     */
    public function via($notifiable): array
    {
        return ['database', WebPushChannel::class];
    }

    /**
     * @return array<string, string>
     */
    public function toDatabase($notifiable): array
    {
        return [
            'title' => 'New lead generated',
            'message' => ($this->lead->name ?: $this->lead->mobile).' — '.($this->lead->source ?: 'manual'),
            'url' => route('leads.show', $this->lead->id),
            'icon' => 'ti ti-user-plus',
        ];
    }

    public function toWebPush($notifiable, $notification): WebPushMessage
    {
        return (new WebPushMessage)
            ->title('New lead generated')
            ->icon('/build/assets/img/logo-small.svg')
            ->body(($this->lead->name ?: $this->lead->mobile).' — '.($this->lead->source ?: 'manual'))
            ->action('View', 'view')
            ->data(['url' => route('leads.show', $this->lead->id)])
            // Unique tag per lead so a banner is never silently replaced.
            ->tag('lead-created-'.$this->lead->id)
            ->vibrate([200, 100, 200])
            ->requireInteraction()
            // High urgency so FCM/Mozilla deliver immediately instead of
            // batching while the device looks idle or is in battery saver.
            ->options(['TTL' => 1200, 'urgency' => 'high']);
    }
}
