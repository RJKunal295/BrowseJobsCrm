<?php

use App\Services\WhatsAppService;

// Pure logic — no database needed.

it('prefixes the default country code onto a bare 10-digit number', function () {
    expect(app(WhatsAppService::class)->normalizeNumber('9876543210'))->toBe('919876543210');
});

it('strips spaces, plus signs and dashes', function () {
    expect(app(WhatsAppService::class)->normalizeNumber('+91 98765-43210'))->toBe('919876543210');
});

it('leaves an already-prefixed number intact', function () {
    expect(app(WhatsAppService::class)->normalizeNumber('919876543210'))->toBe('919876543210');
});

it('returns null for blank or non-numeric input', function () {
    $wa = app(WhatsAppService::class);
    expect($wa->normalizeNumber(''))->toBeNull();
    expect($wa->normalizeNumber(null))->toBeNull();
    expect($wa->normalizeNumber('abc'))->toBeNull();
});

it('is not configured when credentials are absent', function () {
    expect(app(WhatsAppService::class)->isConfigured())->toBeFalse();
});
