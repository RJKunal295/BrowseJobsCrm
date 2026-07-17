<?php

namespace App\Mail;

use App\Models\SocialMediaPost;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class NewSocialPostMail extends Mailable
{
    use Queueable, SerializesModels;

    public function __construct(public SocialMediaPost $post, public string $accountLabel) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'New '.ucfirst($this->post->platform).' post — '.$this->accountLabel,
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.mails.new-social-post',
        );
    }
}
