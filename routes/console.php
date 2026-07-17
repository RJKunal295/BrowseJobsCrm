<?php

use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Schedule;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Schedule::command('tasks:flag-overdue')->dailyAt('09:00');

// ============================================================
// IMPORTANT: Laravel's scheduler only runs when something calls
// `php artisan schedule:run` every minute. On a real Linux server
// you'd add this to crontab:
//
//   * * * * * cd /path-to-project && php artisan schedule:run >> /dev/null 2>&1
//
// On Windows/XAMPP (your setup), there's no cron — use Windows Task
// Scheduler instead:
//   1. Open "Task Scheduler" (search in Start menu)
//   2. Create a new Basic Task, trigger: "Daily", repeat every 1 minute
//   3. Action: Start a program
//      Program: C:\xampp\php\php.exe
//      Arguments: artisan schedule:run
//      Start in: C:\xampp\htdocs\BrowseJobsBackendLaravel
//
// Without this running every minute, tasks:flag-overdue will simply
// never fire on its own, no matter how correct the code is.
// ============================================================

Schedule::command('social:fetch-stats')->hourly();

// Hourly (not just once a day) so "posts today" and "reach" stay reasonably
// current throughout the day rather than only updating at midnight.
// Remember: Windows/XAMPP needs Task Scheduler running
// `php artisan schedule:run` every minute — same setup as your task reminders.

// ---- Login reminders (Feature 1) ----
// Mid-morning: nudge anyone who has not logged in yet (skips Sundays + holidays).
Schedule::command('logins:remind')->weekdays()->dailyAt('11:00');
// Early evening: report anyone STILL not logged in to SUPER_ADMIN + HEAD_OF_OPERATIONS.
Schedule::command('logins:escalate')->weekdays()->dailyAt('17:30');

// ---- Social posts + engagement (Feature 4) ----
// Every 4 hours: fetch latest posts/videos + likes/comments/shares/views, then check for
// posting inactivity. If an account has no new post in the last 24h, email + WhatsApp the
// admins (SUPER_ADMIN, HEAD_OF_OPERATIONS, SOCIAL_MEDIA_MANAGER). Reminders are throttled to
// once per 24h per account, so the 4-hourly checks don't spam recipients.
Schedule::command('social:fetch-posts')->everyFourHours();
Schedule::command('social:check-inactivity')->everyFourHours();

// AI call result sync — fallback when the Caller.Digital webhook can't reach this server.
Schedule::command('calls:sync')->everyTenMinutes();
