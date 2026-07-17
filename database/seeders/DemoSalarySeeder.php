<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DemoSalarySeeder extends Seeder
{
    /**
     * Demo monthly base salary (INR) per role tier.
     */
    private const SALARY_BY_ROLE = [
        'SUPER_ADMIN' => 150000,
        'ADMIN' => 120000,
        'HEAD_OF_OPERATIONS' => 110000,
        'HR_MANAGER' => 80000,
        'SALES_MANAGER' => 80000,
        'MARKETING_MANAGER' => 80000,
        'TECH_MANAGER' => 85000,
        'HR_TEAM_LEAD' => 55000,
        'HR_ADMIN' => 50000,
        'SOCIAL_MEDIA_MANAGER' => 55000,
        'MEDIA_STRATEGIST' => 50000,
        'DATA_ENGINEER_TRAINER' => 60000,
        'TECH_MENTOR' => 55000,
        'TRAINER' => 45000,
        'STUDENT_COUNSELOR' => 35000,
        'SALES_EXECUTIVE' => 35000,
        'MARKETING_EXECUTIVE' => 35000,
        'SUPPORT_EXECUTIVE' => 32000,
        'ACCOUNTANT' => 45000,
        'HR' => 38000,
        'EMPLOYEE' => 30000,
    ];

    public function run(): void
    {
        $users = DB::table('users')
            ->leftJoin('roles', 'roles.id', '=', 'users.role_id')
            ->select('users.id', 'users.salary', 'users.incentive', 'users.bonus', 'roles.role_code')
            ->get();

        foreach ($users as $user) {
            $update = [];

            // Set a demo salary only where one isn't already recorded.
            if (blank($user->salary) || (float) $user->salary <= 0) {
                $base = self::SALARY_BY_ROLE[$user->role_code] ?? 30000;
                // Small per-user variation so the data looks realistic.
                $update['salary'] = $base + ($user->id % 5) * 1500;
            }

            $salaryForCalc = (float) ($update['salary'] ?? $user->salary);

            if (blank($user->incentive) || (float) $user->incentive == 0) {
                $update['incentive'] = round($salaryForCalc * (0.08 + ($user->id % 4) * 0.01), 2);
            }
            if (blank($user->bonus) || (float) $user->bonus == 0) {
                $update['bonus'] = round($salaryForCalc * 0.05, 2);
            }

            if (! empty($update)) {
                $update['updated_at'] = now();
                DB::table('users')->where('id', $user->id)->update($update);
            }
        }
    }
}
