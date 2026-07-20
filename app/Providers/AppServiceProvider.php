<?php

namespace App\Providers;

use App\Models\MenuItem;
use Illuminate\Notifications\Events\NotificationFailed;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Log;
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

        // Web-push (and other channel) delivery failures are silent by default —
        // log them so "user X never got the notification" is diagnosable.
        Event::listen(NotificationFailed::class, function (NotificationFailed $event) {
            Log::warning('Notification delivery failed', [
                'user_id' => $event->notifiable->id ?? null,
                'channel' => is_string($event->channel) ? $event->channel : get_class($event->channel),
                'notification' => get_class($event->notification),
                'data' => $event->data,
            ]);
        });
    }
}
