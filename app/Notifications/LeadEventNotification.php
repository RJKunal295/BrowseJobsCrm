<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

/**
 * A flexible lead-pipeline notification delivered to the in-app bell (database) and
 * as a browser web-push (with vibration/sound handled by the service worker).
 */
class LeadEventNotification extends Notification
{
    use Queueable;

    public function __construct(
        public string $titleText,
        public string $messageText,
        public string $url,
        public string $iconClass = 'ti ti-user',
    ) {}

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
            'title' => $this->titleText,
            'message' => $this->messageText,
            'url' => $this->url,
            'icon' => $this->iconClass,
        ];
    }

    public function toWebPush($notifiable, $notification): WebPushMessage
    {
        return (new WebPushMessage)
            ->title($this->titleText)
            ->icon('/build/assets/img/logo-small.svg')
            ->body($this->messageText)
            ->action('View', 'view')
            ->data(['url' => $this->url])
            // Unique tag per notification — reusing a tag makes the browser silently
            // REPLACE the notification still in the tray (Firefox never re-alerts).
            ->tag('lead-'.$notification->id)
            // Read by the service worker to buzz + keep the banner until acted on.
            ->vibrate([200, 100, 200])
            ->requireInteraction()
            // High urgency so FCM/Mozilla deliver immediately instead of
            // batching while the device looks idle or is in battery saver.
            ->options(['TTL' => 1200, 'urgency' => 'high']);
    }
}
