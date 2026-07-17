<?php

namespace App\Console\Commands;

use App\Mail\LoginReminderMail;
use App\Models\Holiday;
use App\Models\LoginReminder;
use App\Services\LoginReminderService;
use App\Services\WhatsAppService;
use Carbon\CarbonInterface;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class SendLoginReminders extends Command
{
    protected $signature = 'logins:remind {--force : Send even on weekends/holidays}';

    protected $description = 'Email + WhatsApp a login reminder to active users who have not logged in today.';

    public function handle(LoginReminderService $service, WhatsAppService $whatsApp): int
    {
        $today = now()->timezone(config('app.timezone'));

        if (! $this->option('force') && $this->isNonWorkingDay($today)) {
            $this->info('Skipping — non-working day (weekend or holiday). Use --force to override.');

            return self::SUCCESS;
        }

        $users = $service->usersMissingLoginOn($today);

        if ($users->isEmpty()) {
            $this->info('Everyone has logged in today. No reminders needed.');

            return self::SUCCESS;
        }

        foreach ($users as $user) {
            $reminder = LoginReminder::firstOrNew([
                'user_id' => $user->id,
                'reminder_date' => $today->toDateString(),
            ]);

            // Email reminder
            if (filled($user->email)) {
                try {
                    Mail::to($user->email)->send(new LoginReminderMail($user));
                    $reminder->email_count = (int) $reminder->email_count + 1;
                } catch (\Throwable $e) {
                    $this->error("Email failed for {$user->email}: {$e->getMessage()}");
                }
            }

            // WhatsApp reminder
            $number = $user->whatsapp_number ?: $user->phone;
            if (filled($number)) {
                $sent = $whatsApp->sendText(
                    $number,
                    "Hi {$user->first_name}, you have not logged in today ({$today->format('d M Y')}). "
                    .'Please log in to mark your attendance. — '.config('app.name')
                );
                if ($sent) {
                    $reminder->whatsapp_count = (int) $reminder->whatsapp_count + 1;
                }
            }

            $reminder->last_reminded_at = now();
            $reminder->save();

            $this->line("Reminded: {$user->full_name} (email x{$reminder->email_count}, whatsapp x{$reminder->whatsapp_count})");
        }

        $this->info("Sent reminders to {$users->count()} user(s).");

        return self::SUCCESS;
    }

    private function isNonWorkingDay(CarbonInterface $date): bool
    {
        if ($date->isSunday()) {
            return true;
        }

        return Holiday::whereDate('holiday_date', $date)->exists();
    }
}
