<?php

use App\Http\Controllers\FinanceController;
use App\Models\IncentiveRecord;
use App\Models\LeadStatus;
use App\Models\Permission;
use App\Models\Role;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;

uses(RefreshDatabase::class);

/**
 * Create a user with a role and the given permission slugs.
 */
function makeUser(string $roleCode, array $permSlugs = []): User
{
    static $seq = 0;
    $seq++;

    $role = Role::create(['role_name' => $roleCode, 'role_code' => $roleCode, 'is_active' => true]);

    foreach ($permSlugs as $slug) {
        $perm = Permission::firstOrCreate(['slug' => $slug], ['name' => $slug, 'module' => 'Test']);
        $role->permissions()->syncWithoutDetaching([$perm->id]);
    }

    return User::create([
        'employee_id' => 'EMP-'.$roleCode.'-'.$seq,
        'first_name' => 'Test',
        'email' => strtolower($roleCode).$seq.'@test.local',
        'password' => 'password',
        'role_id' => $role->id,
    ]);
}

it('lets a MEDIA_STRATEGIST add a lead with only a mobile number', function () {
    LeadStatus::firstOrCreate(['slug' => 'new'], ['name' => 'New', 'sort_order' => 1]);
    $user = makeUser('MEDIA_STRATEGIST', ['view_leads', 'create_lead']);

    $this->actingAs($user)->post('/leads', ['mobile' => '9998887777'])->assertRedirect();

    $this->assertDatabaseHas('leads', ['mobile' => '9998887777', 'source' => 'manual']);
});

it('requires a name for non-media roles when adding a lead', function () {
    LeadStatus::firstOrCreate(['slug' => 'new'], ['name' => 'New', 'sort_order' => 1]);
    $user = makeUser('HR_MANAGER', ['view_leads', 'create_lead']);

    $this->actingAs($user)->post('/leads', ['mobile' => '9998887777'])->assertSessionHasErrors('name');
});

it('forbids roles without create_lead from adding a lead', function () {
    $user = makeUser('SALES_EXECUTIVE', ['view_leads']);

    $this->actingAs($user)->post('/leads', ['mobile' => '9998887777', 'name' => 'Nope'])->assertForbidden();
});

it('blocks the office finance page without permission and allows it with permission', function () {
    $this->actingAs(makeUser('EMPLOYEE'))->get('/office-finance')->assertForbidden();

    $this->actingAs(makeUser('ACCOUNTANT', ['view_office_finance']))->get('/office-finance')->assertOk();
});

it('totals incentive and bonus records on the finance dashboard', function () {
    $user = makeUser('EMPLOYEE');

    IncentiveRecord::create(['user_id' => $user->id, 'type' => 'incentive', 'amount' => 5000, 'period_month' => 7, 'period_year' => 2026, 'status' => 'paid']);
    IncentiveRecord::create(['user_id' => $user->id, 'type' => 'bonus', 'amount' => 2000, 'period_month' => 7, 'period_year' => 2026, 'status' => 'approved']);

    $data = app(FinanceController::class)->dashboard()->getData();

    expect((float) $data['totalIncentive'])->toBe(5000.0);
    expect((float) $data['totalBonus'])->toBe(2000.0);
});
