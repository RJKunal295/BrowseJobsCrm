<?php

namespace App\Console\Commands;

use App\Mail\LoginEscalationMail;
use App\Models\LoginReminder;
use App\Models\User;
use App\Services\LoginReminderService;
use App\Services\WhatsAppService;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Mail;

class EscalateLoginReminders extends Command
{
    protected $signature = 'logins:escalate';

    protected $description = 'Report to admins (SUPER_ADMIN, HEAD_OF_OPERATIONS) the users still not logged in after reminders.';

    /**
     * Roles that receive the escalation report.
     */
    private const ADMIN_ROLE_CODES = ['SUPER_ADMIN', 'HEAD_OF_OPERATIONS'];

    public function handle(LoginReminderService $service, WhatsAppService $whatsApp): int
    {
        $today = now()->timezone(config('app.timezone'));

        // Users who were reminded today and still have not logged in.
        $remindedUserIds = LoginReminder::whereDate('reminder_date', $today)
            ->where('email_count', '>', 0)
            ->pluck('user_id');

        $stillMissing = $service->usersMissingLoginOn($today)
            ->whereIn('id', $remindedUserIds);

        if ($stillMissing->isEmpty()) {
            $this->info('No one left to escalate — everyone reminded has since logged in.');

            return self::SUCCESS;
        }

        $rows = $service->contactRows($stillMissing);
        $admins = User::query()->withRoleCode(self::ADMIN_ROLE_CODES)->where('is_active', true)->get();

        if ($admins->isEmpty()) {
            $this->warn('No SUPER_ADMIN / HEAD_OF_OPERATIONS users found to notify.');
        }

        // Email each admin the report.
        foreach ($admins as $admin) {
            if (filled($admin->email)) {
                try {
                    Mail::to($admin->email)->send(new LoginEscalationMail($rows, $today->format('d M Y')));
                } catch (\Throwable $e) {
                    $this->error("Escalation email failed for {$admin->email}: {$e->getMessage()}");
                }
            }

            $number = $admin->whatsapp_number ?: $admin->phone;
            if (filled($number)) {
                $whatsApp->sendText($number, $this->whatsAppSummary($rows, $today->format('d M Y')));
            }
        }

        // Mark those reminder rows as escalated.
        LoginReminder::whereDate('reminder_date', $today)
            ->whereIn('user_id', $stillMissing->pluck('id'))
            ->update(['escalated' => true, 'escalated_at' => now()]);

        $this->info("Escalated {$stillMissing->count()} user(s) to {$admins->count()} admin(s).");

        return self::SUCCESS;
    }

    /**
     * @param  array<int, array{name: string, email: string, mobile: string}>  $rows
     */
    private function whatsAppSummary(array $rows, string $date): string
    {
        $lines = collect($rows)
            ->map(fn (array $r) => "• {$r['name']} ({$r['mobile']})")
            ->implode("\n");

        return "*Login Alert — {$date}*\n".count($rows)." employee(s) not logged in after reminders:\n".$lines;
    }
}
