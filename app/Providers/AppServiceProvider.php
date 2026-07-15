<?php

namespace App\Providers;

use App\Models\MenuItem;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Blade::if('permission', function (string $slug) {
            return auth()->check() && auth()->user()->hasPermission($slug);
        });

        View::composer('partials.sidebar', function ($view) {
            $view->with('menuTree', MenuItem::treeForUser(auth()->user()));
        });

        View::composer('partials.header', function ($view) {
            if (auth()->check()) {
                $view->with('headerNotifications', auth()->user()->notifications()->latest()->take(5)->get());
                $view->with('headerUnreadCount', auth()->user()->unreadNotifications()->count());
            } else {
                $view->with('headerNotifications', collect());
                $view->with('headerUnreadCount', 0);
            }
        });

        Paginator::useBootstrapFive();
    }
}