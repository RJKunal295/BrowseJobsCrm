<?php

namespace App\Console\Commands;

use App\Models\MeetingReport;
use App\Models\User;
use App\Notifications\LeadEventNotification;
use App\Services\AiLeadAnalysisService;
use App\Services\GoogleDriveService;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Str;

/**
 * Scans the Google Drive "Meet Recordings" folder for new meeting transcripts
 * (Google Docs that Meet saves automatically), runs an AI analysis on each —
 * attendance vs the team roster, per-person updates, blockers, action items —
 * stores the report, and notifies the admin roles.
 *
 * Graceful no-op when Drive or the folder id or an AI key is missing.
 */
class AnalyzeMeetingTranscripts extends Command
{
    protected $signature = 'meetings:analyze';

    protected $description = 'Analyze new Google Meet transcripts from Drive and publish AI meeting reports.';

    private const ADMIN_ROLE_CODES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'HR_MANAGER'];

    private const SYSTEM_PROMPT = <<<'PROMPT'
You are a meeting analyst for BrowseJobs, an HR/recruitment company. You are given
the plain-text transcript of a team standup/meeting (Google Meet transcript, where
each line is prefixed with the speaker's name) plus the roster of active employees.

FIRST, output exactly two lines (plain text, no markdown):
ATTENDEES: comma-separated names from the roster who spoke or are clearly present
ABSENTEES: comma-separated roster names with no evidence of presence

Match names loosely (transcript may show partial names or nicknames); when a
transcript speaker matches nobody on the roster, still count them as an attendee
using the transcript name.

THEN output the report in EXACTLY these markdown sections:

## Meeting Summary
2-4 sentences: what the meeting covered and its overall tone/energy.

## Per-Person Updates
One bullet per attendee: what they reported, committed to, or raised. Note anyone
who attended but said almost nothing.

## Blockers & Risks
Bullet points of problems raised and who raised them. If none, say so.

## Decisions & Action Items
Numbered list: action, owner, and deadline if mentioned.

## Coaching Notes for Management
2-4 bullets: participation imbalances, recurring blockers, follow-ups management
should make. Be candid but constructive.

Base everything strictly on the transcript — never invent statements.
PROMPT;

    public function handle(GoogleDriveService $drive, AiLeadAnalysisService $ai): int
    {
        $folderId = config('services.meetings.transcripts_folder_id');

        if (blank($folderId)) {
            $this->info('MEET_TRANSCRIPTS_FOLDER_ID not set — skipping meeting analysis.');

            return self::SUCCESS;
        }

        if (! $drive->serviceAccountConfigured()) {
            $this->warn('Google Drive service account not configured — cannot read transcripts.');

            return self::SUCCESS;
        }

        $docs = $drive->listFilesInFolder($folderId, 'application/vnd.google-apps.document');

        $new = collect($docs)
            ->reject(fn (array $doc) => MeetingReport::where('drive_file_id', $doc['id'])->exists())
            ->values();

        if ($new->isEmpty()) {
            $this->info('No new transcripts to analyze.');

            return self::SUCCESS;
        }

        $roster = User::where('is_active', true)->pluck('full_name')->filter()->values();

        foreach ($new as $doc) {
            $this->info("Analyzing: {$doc['name']}");

            try {
                $transcript = Str::limit($drive->exportAsText($doc['id']), 150000, "\n[... transcript truncated ...]");

                $result = $ai->generate(
                    self::SYSTEM_PROMPT,
                    "TEAM ROSTER:\n".$roster->implode(', ')."\n\nTRANSCRIPT ({$doc['name']}):\n\n".$transcript
                );

                [$attendees, $absentees, $analysis] = $this->parseResult($result['text'], $roster);

                $report = MeetingReport::create([
                    'drive_file_id' => $doc['id'],
                    'title' => Str::limit(str_replace(' - Transcript', '', $doc['name']), 240),
                    'meeting_date' => Carbon::parse($doc['createdTime'])->timezone(config('app.timezone'))->toDateString(),
                    'attendees' => $attendees,
                    'absentees' => $absentees,
                    'analysis' => $analysis,
                    'provider' => $result['provider'],
                    'model' => $result['model'],
                    'transcript_link' => $doc['webViewLink'],
                ]);

                $this->notifyAdmins($report);
                $this->info("Report #{$report->id} created — ".count($attendees).' attended, '.count($absentees).' absent.');
            } catch (\Throwable $e) {
                // Leave the doc unprocessed so the next run retries it.
                $this->error("Failed on {$doc['name']}: {$e->getMessage()}");
                \Log::warning('Meeting transcript analysis failed', ['file' => $doc['name'], 'error' => $e->getMessage()]);
            }
        }

        return self::SUCCESS;
    }

    /**
     * Split the AI output into the attendance header lines and the report body.
     *
     * @param  Collection<int, string>  $roster
     * @return array{0: array<int, string>, 1: array<int, string>, 2: string}
     */
    private function parseResult(string $text, $roster): array
    {
        $attendees = [];
        $absentees = [];

        if (preg_match('/^ATTENDEES:\s*(.*)$/mi', $text, $m)) {
            $attendees = array_values(array_filter(array_map('trim', explode(',', $m[1]))));
        }
        if (preg_match('/^ABSENTEES:\s*(.*)$/mi', $text, $m)) {
            $absentees = array_values(array_filter(array_map('trim', explode(',', $m[1]))));
        }

        // Report body = everything from the first markdown heading onward.
        $bodyStart = strpos($text, '##');
        $analysis = $bodyStart !== false ? trim(substr($text, $bodyStart)) : trim($text);

        return [$attendees, $absentees, $analysis];
    }

    private function notifyAdmins(MeetingReport $report): void
    {
        $admins = User::query()->withRoleCode(self::ADMIN_ROLE_CODES)->where('is_active', true)->get();

        foreach ($admins as $admin) {
            $admin->notify(new LeadEventNotification(
                'Meeting report ready',
                $report->title.' — '.count($report->attendees ?? []).' attended, '.count($report->absentees ?? []).' absent.',
                route('meeting-reports.show', $report),
                'ti ti-report-analytics',
            ));
        }
    }
}
