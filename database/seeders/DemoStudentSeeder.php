<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DemoStudentSeeder extends Seeder
{
    public function run(): void
    {
        // Emails use Gmail "+alias" addressing so every demo student lands in the
        // same real inbox (krishnabharggav@gmail.com) — safe for testing campaigns.
        $students = [
            ['external_id' => 'DEMO-1', 'first_name' => 'Krish', 'last_name' => 'Demo One',   'email' => 'krishnabharggav+demo1@gmail.com', 'phone_number' => '919000000001'],
            ['external_id' => 'DEMO-2', 'first_name' => 'Krish', 'last_name' => 'Demo Two',   'email' => 'krishnabharggav+demo2@gmail.com', 'phone_number' => '919000000002'],
            ['external_id' => 'DEMO-3', 'first_name' => 'Krish', 'last_name' => 'Demo Three', 'email' => 'krishnabharggav+demo3@gmail.com', 'phone_number' => '919000000003'],
        ];

        foreach ($students as $student) {
            DB::table('students')->updateOrInsert(
                ['email' => $student['email']],
                array_merge($student, [
                    'full_name' => $student['first_name'].' '.$student['last_name'],
                    'status' => 'active',
                    'created_at' => now(),
                    'updated_at' => now(),
                ])
            );
        }
    }
}
