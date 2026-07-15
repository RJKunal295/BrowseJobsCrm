<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class LeadDemoSeeder extends Seeder
{
    private int $mediaStrategistId;
    private int $hrManagerId;
    private array $hrExecutiveIds;

    public function run(): void
    {
        $this->resolveUserIds();

        $statuses = DB::table('lead_statuses')->pluck('id', 'slug');
        $lostReasons = DB::table('lost_reasons')->pluck('id', 'reason');

        $leadsData = [
            ['name' => 'Rahul Sharma',      'mobile' => '9876500001', 'source' => 'Meta Ads',    'campaign' => 'Diwali Offer',      'status' => 'joined',         'lost_reason' => null],
            ['name' => 'Priya Verma',       'mobile' => '9876500002', 'source' => 'Google Ads',  'campaign' => 'Search - Brand',    'status' => 'joined',         'lost_reason' => null],
            ['name' => 'Amit Yadav',        'mobile' => '9876500003', 'source' => 'Meta Ads',    'campaign' => 'Summer Sale',       'status' => 'joined',         'lost_reason' => null],
            ['name' => 'Sneha Kulkarni',    'mobile' => '9876500004', 'source' => 'Website',     'campaign' => null,                'status' => 'joined',         'lost_reason' => null],
            ['name' => 'Karan Malhotra',    'mobile' => '9876500005', 'source' => 'Google Ads',  'campaign' => 'New Year Promo',    'status' => 'joined',         'lost_reason' => null],

            ['name' => 'Anjali Singh',      'mobile' => '9876500006', 'source' => 'Meta Ads',    'campaign' => 'Diwali Offer',      'status' => 'lost',           'lost_reason' => 'Price too high'],
            ['name' => 'Vikas Gupta',       'mobile' => '9876500007', 'source' => 'Google Ads',  'campaign' => 'Search - Brand',    'status' => 'lost',           'lost_reason' => 'Joined a competitor'],
            ['name' => 'Neha Reddy',        'mobile' => '9876500008', 'source' => 'Meta Ads',    'campaign' => 'Summer Sale',       'status' => 'lost',           'lost_reason' => 'No response after follow-ups'],
            ['name' => 'Suresh Patil',      'mobile' => '9876500009', 'source' => 'Website',     'campaign' => null,                'status' => 'lost',           'lost_reason' => 'Not interested in offer'],
            ['name' => 'Divya Nair',        'mobile' => '9876500010', 'source' => 'Google Ads',  'campaign' => 'New Year Promo',    'status' => 'lost',           'lost_reason' => 'Location / timing not suitable'],

            ['name' => 'Rohit Chawla',      'mobile' => '9876500011', 'source' => 'Meta Ads',    'campaign' => 'Diwali Offer',      'status' => 'follow_up',      'lost_reason' => null],
            ['name' => 'Pooja Iyer',        'mobile' => '9876500012', 'source' => 'Google Ads',  'campaign' => 'Search - Brand',    'status' => 'follow_up',      'lost_reason' => null],
            ['name' => 'Manish Joshi',      'mobile' => '9876500013', 'source' => 'Website',     'campaign' => null,                'status' => 'follow_up',      'lost_reason' => null],
            ['name' => 'Kavita Desai',      'mobile' => '9876500014', 'source' => 'Meta Ads',    'campaign' => 'Summer Sale',       'status' => 'follow_up',      'lost_reason' => null],

            ['name' => 'Arjun Menon',       'mobile' => '9876500015', 'source' => 'Google Ads',  'campaign' => 'New Year Promo',    'status' => 'interested',     'lost_reason' => null],
            ['name' => 'Shweta Rao',        'mobile' => '9876500016', 'source' => 'Meta Ads',    'campaign' => 'Diwali Offer',      'status' => 'interested',     'lost_reason' => null],
            ['name' => 'Deepak Mishra',     'mobile' => '9876500017', 'source' => 'Website',     'campaign' => null,                'status' => 'interested',     'lost_reason' => null],

            ['name' => null,                'mobile' => '9876500018', 'source' => 'Google Ads',  'campaign' => 'Search - Brand',    'status' => 'invalid_number', 'lost_reason' => null],
            ['name' => null,                'mobile' => '9876500019', 'source' => 'Meta Ads',    'campaign' => 'Summer Sale',       'status' => 'invalid_number', 'lost_reason' => null],

            ['name' => null,                'mobile' => '9876500020', 'source' => 'Website',     'campaign' => null,                'status' => 'new',            'lost_reason' => null],
        ];

        $now = Carbon::now();

        foreach ($leadsData as $i => $data) {
            $createdAt = $now->copy()->subDays(20 - $i)->setTime(10, 0);
            $executiveId = $this->hrExecutiveIds[$i % count($this->hrExecutiveIds)];
            $isNew = $data['status'] === 'new';

            // ---- leads ----
            $leadId = DB::table('leads')->insertGetId([
                'name'                => $data['name'],
                'mobile'              => $data['mobile'],
                'email'               => $data['name'] ? strtolower(str_replace(' ', '.', $data['name'])) . '@example.com' : null,
                'source'              => $data['source'],
                'campaign_name'       => $data['campaign'],
                'added_by_user_id'    => $this->mediaStrategistId,
                'current_status_id'   => $statuses[$data['status']],
                'assigned_to_user_id' => $isNew ? null : $executiveId,
                'assigned_by_user_id' => $isNew ? null : $this->hrManagerId,
                'assigned_at'         => $isNew ? null : $createdAt->copy()->addHour(),
                'created_at'          => $createdAt,
                'updated_at'          => $now,
            ]);

            // ---- lead_notifications: lead_created (to HR Manager) ----
            DB::table('lead_notifications')->insert([
                'lead_id'        => $leadId,
                'notify_user_id' => $this->hrManagerId,
                'type'           => 'lead_created',
                'channel'        => 'whatsapp',
                'is_read'        => true,
                'sent_at'        => $createdAt,
                'created_at'     => $createdAt,
                'updated_at'     => $createdAt,
            ]);

            if ($isNew) {
                continue; // brand-new lead: no assignment/conversation/history yet
            }

            // ---- lead_assignments ----
            DB::table('lead_assignments')->insert([
                'lead_id'             => $leadId,
                'assigned_to_user_id' => $executiveId,
                'assigned_by_user_id' => $this->hrManagerId,
                'assigned_at'         => $createdAt->copy()->addHour(),
                'created_at'          => $createdAt->copy()->addHour(),
                'updated_at'          => $createdAt->copy()->addHour(),
            ]);

            // ---- lead_notifications: lead_assigned (to HR Executive) ----
            DB::table('lead_notifications')->insert([
                'lead_id'        => $leadId,
                'notify_user_id' => $executiveId,
                'type'           => 'lead_assigned',
                'channel'        => 'whatsapp',
                'is_read'        => true,
                'sent_at'        => $createdAt->copy()->addHour(),
                'created_at'     => $createdAt->copy()->addHour(),
                'updated_at'     => $createdAt->copy()->addHour(),
            ]);

            // ---- lead_status_history: always starts at "new" ----
            DB::table('lead_status_history')->insert([
                'lead_id'            => $leadId,
                'status_id'          => $statuses['new'],
                'lost_reason_id'     => null,
                'changed_by_user_id' => $this->hrManagerId,
                'remarks'            => 'Lead assigned to HR Executive.',
                'created_at'         => $createdAt->copy()->addHour(),
                'updated_at'         => $createdAt->copy()->addHour(),
            ]);

            // ---- lead_conversations: first call ----
            $callTime = $createdAt->copy()->addHours(3);
            DB::table('lead_conversations')->insert([
                'lead_id'            => $leadId,
                'channel'            => 'call',
                'direction'          => 'outbound',
                'transcript'         => "HR: Hi, this is regarding your enquiry from {$data['source']}. Are you still interested?\nLead: " .
                                        ($data['status'] === 'invalid_number' ? '[Number unreachable / switched off]' : 'Yes, tell me more about the offer.'),
                'duration_seconds'   => $data['status'] === 'invalid_number' ? 0 : rand(60, 300),
                'handled_by_user_id' => $executiveId,
                'occurred_at'        => $callTime,
                'created_at'         => $callTime,
                'updated_at'         => $callTime,
            ]);

            if ($data['status'] === 'invalid_number') {
                DB::table('lead_status_history')->insert([
                    'lead_id'            => $leadId,
                    'status_id'          => $statuses['invalid_number'],
                    'lost_reason_id'     => null,
                    'changed_by_user_id' => $executiveId,
                    'remarks'            => 'Number unreachable after multiple attempts.',
                    'created_at'         => $callTime->copy()->addMinutes(5),
                    'updated_at'         => $callTime->copy()->addMinutes(5),
                ]);
                continue;
            }

            // ---- move to "interested" for everyone else ----
            DB::table('lead_status_history')->insert([
                'lead_id'            => $leadId,
                'status_id'          => $statuses['interested'],
                'lost_reason_id'     => null,
                'changed_by_user_id' => $executiveId,
                'remarks'            => 'Lead responded positively on first call.',
                'created_at'         => $callTime->copy()->addMinutes(10),
                'updated_at'         => $callTime->copy()->addMinutes(10),
            ]);

            if (in_array($data['status'], ['interested', 'follow_up'])) {
                // ---- second touchpoint: WhatsApp follow-up ----
                $waTime = $callTime->copy()->addDay();
                DB::table('lead_conversations')->insert([
                    'lead_id'            => $leadId,
                    'channel'            => 'whatsapp',
                    'direction'          => 'outbound',
                    'transcript'         => "HR: Hi, just following up on our call. Do you have any questions about the plan?\nLead: I need a bit more time to decide.",
                    'duration_seconds'   => null,
                    'handled_by_user_id' => $executiveId,
                    'occurred_at'        => $waTime,
                    'created_at'         => $waTime,
                    'updated_at'         => $waTime,
                ]);

                if ($data['status'] === 'follow_up') {
                    DB::table('lead_status_history')->insert([
                        'lead_id'            => $leadId,
                        'status_id'          => $statuses['follow_up'],
                        'lost_reason_id'     => null,
                        'changed_by_user_id' => $executiveId,
                        'remarks'            => 'Lead asked for more time, scheduled follow-up.',
                        'created_at'         => $waTime->copy()->addMinutes(5),
                        'updated_at'         => $waTime->copy()->addMinutes(5),
                    ]);
                }
                continue; // interested / follow_up leads stop here
            }

            // ---- joined or lost: final call + final status ----
            $finalCallTime = $callTime->copy()->addDays(2);
            $finalTranscript = $data['status'] === 'joined'
                ? "HR: Great news, we can get you started right away. Shall I proceed with enrollment?\nLead: Yes, please go ahead."
                : "HR: Just checking in again, are you looking to move forward?\nLead: " . ($data['lost_reason'] ?? 'Not at this time, thank you.');

            DB::table('lead_conversations')->insert([
                'lead_id'            => $leadId,
                'channel'            => 'call',
                'direction'          => 'outbound',
                'transcript'         => $finalTranscript,
                'duration_seconds'   => rand(90, 400),
                'handled_by_user_id' => $executiveId,
                'occurred_at'        => $finalCallTime,
                'created_at'         => $finalCallTime,
                'updated_at'         => $finalCallTime,
            ]);

            DB::table('lead_status_history')->insert([
                'lead_id'            => $leadId,
                'status_id'          => $statuses[$data['status']],
                'lost_reason_id'     => $data['lost_reason'] ? $lostReasons[$data['lost_reason']] : null,
                'changed_by_user_id' => $executiveId,
                'remarks'            => $data['status'] === 'joined'
                    ? 'Lead confirmed and enrolled.'
                    : 'Lead marked as lost: ' . $data['lost_reason'],
                'created_at'         => $finalCallTime->copy()->addMinutes(5),
                'updated_at'         => $finalCallTime->copy()->addMinutes(5),
            ]);

            // ---- tag the conversation for future AI analysis (lost leads only) ----
            if ($data['status'] === 'lost') {
                $conversationId = DB::table('lead_conversations')
                    ->where('lead_id', $leadId)
                    ->latest('id')
                    ->value('id');

                $tagMap = [
                    'Price too high'                 => 'price_objection',
                    'Joined a competitor'            => 'lost_to_competitor',
                    'No response after follow-ups'   => 'no_answer',
                    'Not interested in offer'        => 'not_interested',
                    'Location / timing not suitable' => 'timing_issue',
                ];

                DB::table('lead_conversation_tags')->insert([
                    'conversation_id' => $conversationId,
                    'tag'             => $tagMap[$data['lost_reason']] ?? 'other',
                    'created_at'      => $finalCallTime,
                    'updated_at'      => $finalCallTime,
                ]);
            }
        }
    }

    /**
     * Look up real user IDs from the `users` table by their role_code,
     * instead of relying on hardcoded IDs that may not exist.
     */
    private function resolveUserIds(): void
    {
        $mediaStrategistId = DB::table('users')
            ->join('roles', 'users.role_id', '=', 'roles.id')
            ->where('roles.role_code', 'MEDIA_STRATEGIST')
            ->value('users.id');

        $hrManagerId = DB::table('users')
            ->join('roles', 'users.role_id', '=', 'roles.id')
            ->where('roles.role_code', 'HR_MANAGER')
            ->value('users.id');

        $hrExecutiveIds = DB::table('users')
            ->join('roles', 'users.role_id', '=', 'roles.id')
            ->where('roles.role_code', 'HR')
            ->pluck('users.id')
            ->toArray();

        if (!$mediaStrategistId) {
            throw new \RuntimeException(
                'No user found with role_code MEDIA_STRATEGIST. ' .
                'Make sure your users table has been seeded with real employees and roles before running this seeder.'
            );
        }

        if (!$hrManagerId) {
            throw new \RuntimeException(
                'No user found with role_code HR_MANAGER. ' .
                'Make sure your users table has been seeded with real employees and roles before running this seeder.'
            );
        }

        if (empty($hrExecutiveIds)) {
            throw new \RuntimeException(
                'No users found with role_code HR. ' .
                'Make sure your users table has been seeded with real employees and roles before running this seeder.'
            );
        }

        $this->mediaStrategistId = $mediaStrategistId;
        $this->hrManagerId = $hrManagerId;
        $this->hrExecutiveIds = $hrExecutiveIds;

        $this->command?->info("Using Media Strategist ID: {$this->mediaStrategistId}");
        $this->command?->info("Using HR Manager ID: {$this->hrManagerId}");
        $this->command?->info('Using HR Executive IDs: ' . implode(', ', $this->hrExecutiveIds));
    }
}