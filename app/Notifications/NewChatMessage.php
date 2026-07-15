<?php

namespace App\Notifications;

use App\Models\Message;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Str;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

class NewChatMessage extends Notification
{
    use Queueable;

    public function __construct(public Message $message)
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
        $conversation = $this->message->conversation;
        $isGroup = $conversation->type === 'group';
        $senderName = $this->message->sender->full_name ?? 'Someone';

        return [
            'title'   => $isGroup ? ($conversation->name ?? 'Group Chat') : $senderName,
            'message' => ($isGroup ? "{$senderName}: " : '') . Str::limit($this->message->body, 80),
            'url'     => route('chat.index', ['conversation' => $conversation->id]),
            'icon'    => 'ti ti-message-circle',
        ];
    }

    public function toWebPush($notifiable, $notification): WebPushMessage
    {
        $conversation = $this->message->conversation;
        $isGroup = $conversation->type === 'group';
        $senderName = $this->message->sender->full_name ?? 'Someone';

        return (new WebPushMessage)
            ->title($isGroup ? ($conversation->name ?? 'Group Chat') : $senderName)
            ->icon('/build/assets/img/logo-small.svg')
            ->body(($isGroup ? "{$senderName}: " : '') . Str::limit($this->message->body, 100))
            ->action('View', 'view')
            ->data(['url' => route('chat.index', ['conversation' => $conversation->id])])
            ->options(['TTL' => 1000]);
    }
}