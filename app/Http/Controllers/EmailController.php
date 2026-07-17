<?php

namespace App\Http\Controllers;

use App\Mail\GenericMail;
use App\Models\Email;
use App\Models\EmailAttachment;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;
use Throwable;
use Webklex\IMAP\Facades\Client;

class EmailController extends Controller
{
    /**
     * Inbox — fetched live over IMAP.
     */
    public function inbox(Request $request): View
    {
        $messages = [];
        $error = null;

        try {
            $client = Client::account('default');
            $client->connect();

            $query = $client->getFolder('INBOX')->query();

            if ($request->filled('search')) {
                $query->text($request->input('search'));
            }

            $collection = $query->limit(30)->setFetchOrder('desc')->get();

            foreach ($collection as $message) {
                $from = $message->getFrom()[0] ?? null;

                $messages[] = [
                    'uid' => $message->getUid(),
                    'subject' => (string) $message->getSubject() ?: '(no subject)',
                    'from' => $from ? ($from->personal ?: $from->mail) : 'Unknown',
                    'from_mail' => $from->mail ?? '',
                    'date' => optional($message->getDate())->toDate(),
                    'seen' => $message->getFlags()->has('seen'),
                    'has_attachment' => $message->hasAttachments(),
                ];
            }
        } catch (Throwable $e) {
            $error = 'Could not connect to the mailbox. Check your IMAP_* settings in .env. ('.$e->getMessage().')';
        }

        return view('emails.inbox', compact('messages', 'error'));
    }

    /**
     * Read a single inbox message over IMAP.
     */
    public function showInbox(int $uid): View
    {
        $message = null;
        $error = null;

        try {
            $client = Client::account('default');
            $client->connect();

            $imapMessage = $client->getFolder('INBOX')->query()->getMessageByUid($uid);

            if ($imapMessage) {
                $imapMessage->setFlag('Seen');
                $from = $imapMessage->getFrom()[0] ?? null;

                $message = [
                    'uid' => $uid,
                    'subject' => (string) $imapMessage->getSubject() ?: '(no subject)',
                    'from' => $from ? ($from->personal ?: $from->mail) : 'Unknown',
                    'from_mail' => $from->mail ?? '',
                    'date' => optional($imapMessage->getDate())->toDate(),
                    'body' => $imapMessage->hasHTMLBody() ? $imapMessage->getHTMLBody() : nl2br(e($imapMessage->getTextBody())),
                    'attachments' => $imapMessage->getAttachments()->map(fn ($a) => [
                        'name' => $a->getName(),
                        'size' => $a->getSize(),
                    ])->all(),
                ];
            } else {
                $error = 'Message not found.';
            }
        } catch (Throwable $e) {
            $error = 'Could not load the message. ('.$e->getMessage().')';
        }

        return view('emails.show-inbox', compact('message', 'error', 'uid'));
    }

    /**
     * Sent items — stored locally when we send.
     */
    public function sent(Request $request): View
    {
        $query = Email::where('user_id', Auth::id())->with('attachments');

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(function ($q) use ($search) {
                $q->where('subject', 'like', "%{$search}%")
                    ->orWhere('body', 'like', "%{$search}%");
            });
        }

        $emails = $query->orderByDesc('sent_at')->paginate(20)->withQueryString();

        return view('emails.sent', compact('emails'));
    }

    public function showSent(Email $email): View
    {
        abort_unless($email->user_id === Auth::id(), 403);

        $email->load('attachments');

        return view('emails.show-sent', compact('email'));
    }

    public function compose(): View
    {
        return view('emails.compose');
    }

    public function send(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'to' => 'required|string',
            'cc' => 'nullable|string',
            'bcc' => 'nullable|string',
            'subject' => 'required|string|max:255',
            'body' => 'required|string',
            'attachments.*' => 'nullable|file|max:10240', // 10 MB each
        ]);

        $to = $this->parseAddresses($validated['to']);
        $cc = $this->parseAddresses($request->input('cc'));
        $bcc = $this->parseAddresses($request->input('bcc'));

        if (empty($to)) {
            return back()->withInput()->with('error', 'Please provide at least one valid recipient.');
        }

        // Persist attachments to disk first so the Mailable can read them.
        $storedFiles = [];
        if ($request->hasFile('attachments')) {
            foreach ($request->file('attachments') as $file) {
                $path = $file->store('email-attachments', 'local');
                $storedFiles[] = [
                    'path' => Storage::disk('local')->path($path),
                    'name' => $file->getClientOriginalName(),
                    'mime' => $file->getClientMimeType(),
                    'rel_path' => $path,
                    'size' => $file->getSize(),
                ];
            }
        }

        $email = new Email([
            'user_id' => Auth::id(),
            'from_email' => config('mail.from.address'),
            'to' => $to,
            'cc' => $cc,
            'bcc' => $bcc,
            'subject' => $validated['subject'],
            'body' => $validated['body'],
        ]);

        try {
            $mailer = Mail::to($to);

            if (! empty($cc)) {
                $mailer->cc($cc);
            }
            if (! empty($bcc)) {
                $mailer->bcc($bcc);
            }

            $mailer->send(new GenericMail(
                subjectLine: $validated['subject'],
                bodyHtml: $validated['body'],
                files: $storedFiles,
            ));

            $email->status = 'sent';
            $email->sent_at = now();
            $email->save();

            foreach ($storedFiles as $file) {
                $email->attachments()->create([
                    'filename' => $file['name'],
                    'path' => $file['rel_path'],
                    'mime' => $file['mime'],
                    'size' => $file['size'],
                ]);
            }

            return redirect()->route('emails.sent')->with('success', 'Email sent successfully.');
        } catch (Throwable $e) {
            $email->status = 'failed';
            $email->error = $e->getMessage();
            $email->sent_at = now();
            $email->save();

            return back()->withInput()->with('error', 'Email could not be sent: '.$e->getMessage());
        }
    }

    public function destroy(Email $email): RedirectResponse
    {
        abort_unless($email->user_id === Auth::id(), 403);

        foreach ($email->attachments as $attachment) {
            Storage::disk('local')->delete($attachment->path);
        }

        $email->delete();

        return redirect()->route('emails.sent')->with('success', 'Email deleted.');
    }

    public function downloadAttachment(EmailAttachment $attachment)
    {
        abort_unless($attachment->email->user_id === Auth::id(), 403);

        return Storage::disk('local')->download($attachment->path, $attachment->filename);
    }

    /**
     * Split a comma / semicolon / newline separated string into a list of valid emails.
     *
     * @return array<int, string>
     */
    private function parseAddresses(?string $raw): array
    {
        if (blank($raw)) {
            return [];
        }

        return collect(preg_split('/[,;\s]+/', $raw))
            ->map(fn ($address) => trim($address))
            ->filter(fn ($address) => filter_var($address, FILTER_VALIDATE_EMAIL))
            ->unique()
            ->values()
            ->all();
    }
}
