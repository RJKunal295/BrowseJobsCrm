<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class LoginEscalationMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * @param  array<int, array{name: string, email: string, mobile: string}>  $rows
     */
    public function __construct(public array $rows, public string $reportDate) {}

    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Login Alert: '.count($this->rows).' employee(s) not logged in on '.$this->reportDate,
        );
    }

    public function content(): Content
    {
        return new Content(
            view: 'emails.mails.login-escalation',
        );
    }
}
