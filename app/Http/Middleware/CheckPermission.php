<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class CheckPermission
{
    /**
     * Usage in routes:
     *   Route::middleware('permission:manage_users')->group(function () { ... });
     */
    public function handle(Request $request, Closure $next, string $permissionSlug): Response
    {
        $user = Auth::user();

        if (!$user || !$user->hasPermission($permissionSlug)) {
            abort(403, 'You do not have permission to access this page.');
        }

        return $next($request);
    }
}