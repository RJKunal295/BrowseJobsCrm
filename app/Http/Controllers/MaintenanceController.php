<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\View\View;

class MaintenanceController extends Controller
{
    /**
     * Render a generic "under maintenance" placeholder for menu items whose
     * feature has not been built yet. The page title comes from the route's
     * `title` default (set where the route is registered).
     */
    public function show(Request $request): View
    {
        $title = $request->route()->defaults['title'] ?? 'Coming Soon';

        return view('under-maintenance', ['title' => $title]);
    }
}
