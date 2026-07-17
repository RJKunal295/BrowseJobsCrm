<?php

namespace App\Jobs;

use App\Mail\GenericMail;
use App\Models\Campaign;
use App\Models\Student;
use App\Services\WhatsAppService;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class SendCampaignJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public int $timeout = 3600;

    public function __construct(public Campaign $campaign) {}

    public function handle(WhatsAppService $whatsApp): void
    {
        $campaign = $this->campaign;

        $campaign->update(['status' => 'sending']);

        $query = Student::query();
        if ($campaign->audience === 'active') {
            $query->where('status', 'active');
        }

        $sentEmail = 0;
        $sentWhatsApp = 0;
        $failed = 0;
        $total = 0;

        $query->orderBy('id')->chunkById(200, function ($students) use ($campaign, $whatsApp, &$sentEmail, &$sentWhatsApp, &$failed, &$total) {
            foreach ($students as $student) {
                $total++;
                $name = $student->full_name ?: trim($student->first_name.' '.$student->last_name);

                $recipient = $campaign->recipients()->create([
                    'student_id' => $student->id,
                    'name' => $name,
                    'email' => $student->email,
                    'phone' => $student->phone_number,
                ]);

                $error = null;

                // ---- Email ----
                if ($campaign->sendsEmail() && filled($student->email)) {
                    try {
                        $subject = $this->personalize($campaign->subject ?: $campaign->name, $name);
                        $body = $this->personalize($campaign->body, $name);
                        Mail::to($student->email)->send(new GenericMail($subject, $body));
                        $recipient->email_status = 'sent';
                        $sentEmail++;
                    } catch (\Throwable $e) {
                        $recipient->email_status = 'failed';
                        $error = $e->getMessage();
                        $failed++;
                    }
                }

                // ---- WhatsApp ----
                if ($campaign->sendsWhatsApp() && filled($student->phone_number)) {
                    $messageId = $campaign->whatsapp_template
                        ? $whatsApp->sendTemplate($student->phone_number, $campaign->whatsapp_template, $campaign->whatsapp_template_lang, [$name])
                        : $whatsApp->sendText($student->phone_number, $this->personalize(strip_tags($campaign->body), $name));

                    if ($messageId) {
                        $recipient->whatsapp_status = 'sent';
                        $sentWhatsApp++;
                    } else {
                        $recipient->whatsapp_status = 'failed';
                        $error = $error ?? 'WhatsApp not sent (check provider config / number).';
                        $failed++;
                    }
                }

                if ($error) {
                    $recipient->error = $error;
                }

                $recipient->save();
            }
        });

        $campaign->update([
            'status' => $sentEmail + $sentWhatsApp > 0 ? 'sent' : 'failed',
            'total_recipients' => $total,
            'sent_email' => $sentEmail,
            'sent_whatsapp' => $sentWhatsApp,
            'failed_count' => $failed,
            'sent_at' => now(),
        ]);
    }

    private function personalize(string $body, string $name): string
    {
        return Str::of($body)
            ->replace('{name}', $name)
            ->replace('{{name}}', $name)
            ->toString();
    }
}
