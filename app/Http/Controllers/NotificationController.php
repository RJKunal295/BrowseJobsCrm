<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class NotificationController extends Controller
{
    /**
     * Full notifications list page (the "View All Notifications" link target).
     */
    public function index(): View
    {
        $notifications = Auth::user()->notifications()->paginate(20);

        return view('notifications.index', compact('notifications'));
    }

    /**
     * Polled every ~20s from the header dropdown to refresh the bell badge
     * and the latest few notifications, without a full page reload.
     */
    public function poll(): JsonResponse
    {
        $user = Auth::user();

        $items = $user->notifications()
            ->latest()
            ->take(5)
            ->get()
            ->map(function ($n) {
                return [
                    'id'      => $n->id,
                    'title'   => $n->data['title'] ?? 'Notification',
                    'message' => $n->data['message'] ?? '',
                    'url'     => $n->data['url'] ?? '#',
                    'icon'    => $n->data['icon'] ?? 'ti ti-bell',
                    'time'    => $n->created_at->diffForHumans(),
                    'is_read' => (bool) $n->read_at,
                ];
            });

        return response()->json([
            'unread_count' => $user->unreadNotifications()->count(),
            'items'        => $items,
        ]);
    }

    /**
     * Mark one notification read, then redirect to whatever it links to.
     */
    public function markAsRead(string $id): RedirectResponse
    {
        $notification = Auth::user()->notifications()->where('id', $id)->first();
        $notification?->markAsRead();

        return redirect($notification?->data['url'] ?? route('dashboard'));
    }

    public function markAllAsRead(): RedirectResponse
    {
        Auth::user()->unreadNotifications->markAsRead();

        return back();
    }
}