<?php

namespace App\Mail;

use App\Models\SocialAccount;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class PostInactivityMail extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(
        public SocialAccount $account,
        public ?string $lastPostAt,
        public int $reminderCount,
    ) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'No new '.ucfirst($this->account->platform).' post in 24h — '.$this->account->label,
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.mails.post-inactivity',
        );
    }
}
