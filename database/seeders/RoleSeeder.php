<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('roles')->insert([
            [
                'role_name' => 'Super Admin',
                'role_code' => 'SUPER_ADMIN',
                'description' => 'Full system access',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Admin',
                'role_code' => 'ADMIN',
                'description' => 'System Administrator',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'HR',
                'role_code' => 'HR',
                'description' => 'Human Resources',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Sales Manager',
                'role_code' => 'SALES_MANAGER',
                'description' => 'Sales Team Manager',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Sales Executive',
                'role_code' => 'SALES_EXECUTIVE',
                'description' => 'Sales Executive',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Marketing Manager',
                'role_code' => 'MARKETING_MANAGER',
                'description' => 'Marketing Manager',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Marketing Executive',
                'role_code' => 'MARKETING_EXECUTIVE',
                'description' => 'Marketing Executive',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Trainer',
                'role_code' => 'TRAINER',
                'description' => 'Trainer',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Student Counselor',
                'role_code' => 'STUDENT_COUNSELOR',
                'description' => 'Student Counselor',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Support Executive',
                'role_code' => 'SUPPORT_EXECUTIVE',
                'description' => 'Support Executive',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Accountant',
                'role_code' => 'ACCOUNTANT',
                'description' => 'Accounts Department',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'role_name' => 'Employee',
                'role_code' => 'EMPLOYEE',
                'description' => 'General Employee',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}