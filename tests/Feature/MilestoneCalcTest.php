<?php

use App\Models\Milestone;

// Period math for a 'custom' metric needs no database.

it('computes a monthly period window and label', function () {
    $m = new Milestone(['metric' => 'custom', 'period_type' => 'monthly', 'period_year' => 2026, 'period_month' => 7, 'target_value' => 100]);

    expect($m->periodStart()->toDateString())->toBe('2026-07-01');
    expect($m->periodEnd()->toDateString())->toBe('2026-07-31');
    expect($m->periodLabel())->toBe('Jul 2026');
});

it('computes a quarterly window', function () {
    $m = new Milestone(['metric' => 'custom', 'period_type' => 'quarterly', 'period_year' => 2026, 'period_quarter' => 3, 'target_value' => 100]);

    expect($m->periodStart()->toDateString())->toBe('2026-07-01');
    expect($m->periodEnd()->toDateString())->toBe('2026-09-30');
    expect($m->periodLabel())->toBe('Q3 2026');
});

it('computes progress percent and achievement for a custom metric', function () {
    $m = new Milestone(['metric' => 'custom', 'period_type' => 'yearly', 'period_year' => 2026, 'target_value' => 200, 'current_value' => 50]);

    expect($m->progressPercent())->toBe(25.0);
    expect($m->isAchieved())->toBeFalse();

    $m->current_value = 200;
    expect($m->isAchieved())->toBeTrue();
    expect($m->progressPercent())->toBe(100.0);
});
