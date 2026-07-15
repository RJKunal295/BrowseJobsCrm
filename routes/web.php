<?php

use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\CalendarController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ExpenseAnalyticsController;
use App\Http\Controllers\ExpenseController;
use App\Http\Controllers\HolidayController;
use App\Http\Controllers\LeaveRequestController;
use App\Http\Controllers\LeaveTypeController;
use App\Http\Controllers\UserManagementController;
use App\Http\Controllers\MenuItemController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\PushSubscriptionController;
use App\Http\Controllers\RolePermissionController;
use App\Http\Controllers\SocialAccountController;
use App\Http\Controllers\SocialDashboardController;
use App\Http\Controllers\StudentController;
use App\Http\Controllers\TaskController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/login', [LoginController::class, 'loginForm'])->name('login.show');
Route::post('/login', [LoginController::class, 'login'])->name('login');
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');



// ---- User Management ----
Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->middleware(['auth'])->name('dashboard');
    Route::resource('manage-users', UserManagementController::class)->parameters(['manage-users' => 'user'])->names('users');
    Route::patch('manage-users/{user}/toggle-status', [UserManagementController::class, 'toggleStatus'])->name('users.toggle-status');
    Route::resource('menu-items', MenuItemController::class);
    Route::resource('permissions', PermissionController::class)->only(['index', 'create', 'store', 'destroy']);
    Route::get('roles-permissions', [RolePermissionController::class, 'index'])->name('roles-permissions.index');
    Route::post('roles-permissions', [RolePermissionController::class, 'update'])->name('roles-permissions.update');

    Route::prefix('attendance')->name('attendance.')->group(function () {
        Route::get('/', [AttendanceController::class, 'index'])->name('index');        // Summary (main page)
        Route::get('/log', [AttendanceController::class, 'log'])->name('log');          // Detailed session log
        Route::get('/create', [AttendanceController::class, 'create'])->name('create');
        Route::post('/', [AttendanceController::class, 'store'])->name('store');
        Route::patch('/{log}/force-logout', [AttendanceController::class, 'forceLogout'])->name('force-logout');
    });

    Route::prefix('leave-requests')->name('leave-requests.')->group(function () {
        Route::get('/', [LeaveRequestController::class, 'index'])->name('index');
        Route::get('/create', [LeaveRequestController::class, 'create'])->name('create');
        Route::post('/', [LeaveRequestController::class, 'store'])->name('store');
        Route::get('/{leaveRequest}', [LeaveRequestController::class, 'show'])->name('show');
        Route::patch('/{leaveRequest}/approve', [LeaveRequestController::class, 'approve'])->name('approve');
        Route::patch('/{leaveRequest}/reject', [LeaveRequestController::class, 'reject'])->name('reject');
        Route::patch('/{leaveRequest}/cancel', [LeaveRequestController::class, 'cancel'])->name('cancel');
    });

    Route::prefix('notifications')->name('notifications.')->group(function () {
        Route::get('/', [NotificationController::class, 'index'])->name('index');
        Route::get('/poll', [NotificationController::class, 'poll'])->name('poll');
        Route::get('/{id}/read', [NotificationController::class, 'markAsRead'])->name('read');
        Route::post('/mark-all-read', [NotificationController::class, 'markAllAsRead'])->name('read-all');
    });
    Route::post('push-subscriptions', [PushSubscriptionController::class, 'store'])->name('push-subscriptions.store');
    Route::delete('push-subscriptions', [PushSubscriptionController::class, 'destroy'])->name('push-subscriptions.destroy');

    Route::resource('leave-types', LeaveTypeController::class)->only(['index', 'create', 'store', 'destroy']);
    Route::resource('holidays', HolidayController::class)->except(['show']);
    Route::get('holidays-export', [HolidayController::class, 'export'])->name('holidays.export');
    Route::resource('tasks', TaskController::class)->except(['edit', 'update']);
    Route::patch('tasks/{task}/complete', [TaskController::class, 'markComplete'])->name('tasks.complete');
    
    Route::prefix('chat')->name('chat.')->group(function () {
        Route::get('/', [ChatController::class, 'index'])->name('index');
        Route::get('/list-poll', [ChatController::class, 'listPoll'])->name('list-poll');
    
        Route::get('/group/create', [ChatController::class, 'createGroup'])->name('group.create');
        Route::post('/group', [ChatController::class, 'storeGroup'])->name('group.store');
    
        Route::post('/start/{user}', [ChatController::class, 'startPrivate'])->name('start');
    
        Route::get('/{conversation}', [ChatController::class, 'show'])->name('show');
        Route::post('/{conversation}/messages', [ChatController::class, 'storeMessage'])->name('messages.store');
        Route::get('/{conversation}/messages/poll', [ChatController::class, 'pollMessages'])->name('messages.poll');
    });

    Route::get('social-dashboard', [SocialDashboardController::class, 'index'])->name('social-dashboard.index');
    Route::prefix('social-accounts')->name('social-accounts.')->group(function () {
    
        // ---- Instagram ----
        Route::prefix('instagram')->name('instagram.')->group(function () {
            Route::get('/', [SocialAccountController::class, 'indexInstagram'])->name('index');
            Route::get('/create', [SocialAccountController::class, 'create'])->name('create');
            Route::post('/', [SocialAccountController::class, 'store'])->name('store');
        });
    
        // ---- YouTube ----
        Route::prefix('youtube')->name('youtube.')->group(function () {
            Route::get('/', [SocialAccountController::class, 'indexYoutube'])->name('index');
            Route::get('/create', [SocialAccountController::class, 'createYoutube'])->name('create');
            Route::post('/', [SocialAccountController::class, 'storeYoutube'])->name('store');
        });
    
        // ---- Shared actions — work on any account by ID, regardless of platform ----
        Route::post('/{socialAccount}/sync', [SocialAccountController::class, 'sync'])->name('sync');
        Route::post('/{socialAccount}/refresh-token', [SocialAccountController::class, 'refreshToken'])->name('refresh-token');
        Route::patch('/{socialAccount}/toggle', [SocialAccountController::class, 'toggleActive'])->name('toggle');
        Route::delete('/{socialAccount}', [SocialAccountController::class, 'destroy'])->name('destroy');
    });

    Route::get('calendar', [CalendarController::class, 'index'])->name('calendar.index');
    Route::get('calendar/events', [CalendarController::class, 'events'])->name('calendar.events');  
    Route::resource('expenses', ExpenseController::class)->except(['show', 'create', 'edit']);
    Route::get('expenses-analytics', [ExpenseAnalyticsController::class, 'index'])->name('expenses.analytics');

    Route::get('students', [StudentController::class, 'index'])->name('students.index');
    Route::get('students/{student}', [StudentController::class, 'show'])->name('students.show');

});