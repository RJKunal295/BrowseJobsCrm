<?php

namespace App\Console\Commands;

use App\Models\Student;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class SyncStudentsFromTaurus extends Command
{
    protected $signature = 'students:sync-taurus {--limit=1000 : Records per page}';

    protected $description = 'Fetch students from the TaurusAI admin API and upsert into the local students table';

    // Safety cap — for ~1 lakh records at limit=1000, that's ~100 pages.
    // Set generously above that so a real sync never gets cut off, but a
    // runaway/looping API response can't hang the command forever.
    private const MAX_PAGES = 500;

    public function handle(): int
    {
        $baseUrl = config('services.taurus.base_url');
        $token   = config('services.taurus.token');

        if (!$baseUrl || !$token) {
            $this->error('THETAURUS_API_BASE or THETAURUS_API_TOKEN is not set in .env');
            return self::FAILURE;
        }

        $page  = 1;
        $limit = (int) $this->option('limit');
        $total = 0;

        do {
            $response = Http::withToken($token)
                ->timeout(60)
                ->get("{$baseUrl}/students/admin/all", [
                    'page'      => $page,
                    'limit'     => $limit,
                    'sortBy'    => 'createdAt',
                    'sortOrder' => 'desc',
                ]);

            if ($response->failed()) {
                $this->error("Request failed on page {$page}: {$response->status()}");
                Log::error('TaurusAI sync failed', [
                    'page'   => $page,
                    'status' => $response->status(),
                    'body'   => $response->body(),
                ]);
                return self::FAILURE;
            }

            $data = $response->json();

            // FIX: the API nests the array TWO levels deep — data.students —
            // not one level (data.data or data.students at the top). The
            // old `$data['data'] ?? $data['students']` grabbed the wrapper
            // object itself, not the actual array of student records.
            $students = $data['data']['students'] ?? [];

            if (empty($students)) {
                $this->line("Page {$page}: no records returned, stopping.");
                break;
            }

            $rows = [];
            foreach ($students as $record) {
                $externalId = $record['_id'] ?? $record['id'] ?? null;

                if (!$externalId) {
                    continue; // skip malformed records rather than crash the whole sync
                }

                $rows[] = [
                    'external_id'  => $externalId,
                    'first_name'   => $record['firstName'] ?? null,
                    'last_name'    => $record['lastName'] ?? null,
                    'full_name'    => $record['fullname'] ?? $record['fullName'] ?? trim(
                        ($record['firstName'] ?? '') . ' ' . ($record['lastName'] ?? '')
                    ),
                    'email'        => $record['email'] ?? null,
                    'phone_number' => $record['phoneNumber'] ?? null,
                    'status'       => $record['studentProfile']['status'] ?? 'active',
                    'created_at'   => now(),
                    'updated_at'   => now(),
                ];
            }

            if (!empty($rows)) {
                // ONE bulk query for this whole page of up to 1000 records,
                // instead of 1000 separate updateOrCreate() calls. This is
                // what makes syncing ~1 lakh records actually feasible —
                // ~100 queries total instead of ~200,000.
                Student::upsert(
                    $rows,
                    ['external_id'],
                    ['first_name', 'last_name', 'full_name', 'email', 'phone_number', 'status', 'updated_at']
                );
                $total += count($rows);
            }

            $this->line("Page {$page}: synced " . count($rows) . " records (running total: {$total})");

            $hasMore = count($students) === $limit;
            $page++;

            if ($page > self::MAX_PAGES) {
                $this->warn("Hit safety cap of " . self::MAX_PAGES . " pages — stopping early. Increase MAX_PAGES if you genuinely have more data than this.");
                break;
            }

        } while ($hasMore);

        $this->info("Synced {$total} students from TaurusAI.");
        return self::SUCCESS;
    }
}