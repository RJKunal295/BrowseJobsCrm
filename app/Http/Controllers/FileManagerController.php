<?php

namespace App\Http\Controllers;

use App\Models\FileItem;
use App\Models\Folder;
use App\Models\GoogleAccount;
use App\Services\GoogleDriveService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\View\View;
use Symfony\Component\HttpFoundation\StreamedResponse;
use Throwable;

class FileManagerController extends Controller
{
    public function __construct(private GoogleDriveService $drive) {}

    public function index(?Folder $folder = null): View
    {
        if ($folder) {
            $this->authorizeFolder($folder);
        }

        $folders = Folder::where('user_id', Auth::id())
            ->where('parent_id', $folder?->id)
            ->orderBy('name')
            ->get();

        $files = FileItem::where('user_id', Auth::id())
            ->where('folder_id', $folder?->id)
            ->orderBy('name')
            ->get();

        $breadcrumbs = $folder ? $folder->ancestors() : [];
        $googleAccount = $this->userGoogleAccount();
        $driveReady = $this->driveReady();
        $oauthAvailable = $this->drive->oauthConfigured();

        return view('file-manager.index', compact(
            'folders', 'files', 'folder', 'breadcrumbs', 'driveReady', 'googleAccount', 'oauthAvailable'
        ));
    }

    // ---------- Google Drive OAuth ----------

    public function connectDrive(Request $request): RedirectResponse
    {
        if (! $this->drive->oauthConfigured()) {
            return back()->with('error', 'Google Drive OAuth is not configured. Set GOOGLE_OAUTH_CLIENT_ID / GOOGLE_OAUTH_CLIENT_SECRET in .env.');
        }

        $state = Str::random(40);
        $request->session()->put('google_oauth_state', $state);

        return redirect()->away($this->drive->oauthAuthorizationUrl($state));
    }

    public function driveCallback(Request $request): RedirectResponse
    {
        if ($request->filled('error')) {
            return redirect()->route('file-manager.index')->with('error', 'Google authorization was denied.');
        }

        if (! $request->filled('code') || $request->input('state') !== $request->session()->pull('google_oauth_state')) {
            return redirect()->route('file-manager.index')->with('error', 'Invalid or expired Google authorization. Please try again.');
        }

        try {
            $token = $this->drive->exchangeOAuthCode($request->input('code'));
        } catch (Throwable $e) {
            return redirect()->route('file-manager.index')->with('error', $e->getMessage());
        }

        $existing = $this->userGoogleAccount();

        GoogleAccount::updateOrCreate(
            ['user_id' => Auth::id()],
            [
                'google_email' => $token['email'] ?? optional($existing)->google_email,
                'access_token' => $token['access_token'],
                // Google only returns a refresh_token on first consent — keep the old one otherwise.
                'refresh_token' => $token['refresh_token'] ?? optional($existing)->refresh_token,
                'expires_at' => now()->addSeconds($token['expires_in']),
            ]
        );

        return redirect()->route('file-manager.index')->with('success', 'Google Drive connected. New folders and files will now sync to your Drive.');
    }

    public function disconnectDrive(): RedirectResponse
    {
        GoogleAccount::where('user_id', Auth::id())->delete();

        return redirect()->route('file-manager.index')->with('success', 'Google Drive disconnected. Files will be stored locally only.');
    }

    public function storeFolder(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'parent_id' => 'nullable|exists:folders,id',
        ]);

        $parent = $validated['parent_id'] ? Folder::findOrFail($validated['parent_id']) : null;
        if ($parent) {
            $this->authorizeFolder($parent);
        }

        $folder = Folder::create([
            'user_id' => Auth::id(),
            'parent_id' => $parent?->id,
            'name' => $validated['name'],
        ]);

        $warning = $this->syncFolderToDrive($folder, $parent);

        $redirect = $this->redirectToFolder($parent?->id)->with('success', 'Folder created.');

        return $warning ? $redirect->with('warning', $warning) : $redirect;
    }

    public function uploadFile(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'file' => 'required|file|max:51200', // 50 MB
            'folder_id' => 'nullable|exists:folders,id',
        ]);

        $folder = $validated['folder_id'] ? Folder::findOrFail($validated['folder_id']) : null;
        if ($folder) {
            $this->authorizeFolder($folder);
        }

        $uploaded = $request->file('file');
        $diskPath = $uploaded->store('file-manager', 'local');

        $file = FileItem::create([
            'user_id' => Auth::id(),
            'folder_id' => $folder?->id,
            'name' => $uploaded->getClientOriginalName(),
            'disk_path' => $diskPath,
            'mime' => $uploaded->getClientMimeType(),
            'size' => $uploaded->getSize(),
        ]);

        $warning = $this->syncFileToDrive($file, $folder);

        $redirect = $this->redirectToFolder($folder?->id)->with('success', 'File uploaded.');

        return $warning ? $redirect->with('warning', $warning) : $redirect;
    }

    public function download(FileItem $file): StreamedResponse
    {
        $this->authorizeFile($file);

        abort_unless(Storage::disk('local')->exists($file->disk_path), 404);

        return Storage::disk('local')->download($file->disk_path, $file->name);
    }

    public function destroyFolder(Folder $folder): RedirectResponse
    {
        $this->authorizeFolder($folder);

        $parentId = $folder->parent_id;

        // Remove from Drive (best-effort) then delete locally (cascades children + files).
        try {
            $this->deleteFolderFromDrive($folder);
        } catch (Throwable $e) {
            // Ignore Drive errors on delete — local removal should still proceed.
        }

        $this->deleteLocalFilesRecursively($folder);
        $folder->delete();

        return $this->redirectToFolder($parentId)->with('success', 'Folder deleted.');
    }

    public function destroyFile(FileItem $file): RedirectResponse
    {
        $this->authorizeFile($file);

        $folderId = $file->folder_id;

        if ($file->drive_file_id && $this->driveReady()) {
            try {
                $this->boundDrive()->deleteFile($file->drive_file_id);
            } catch (Throwable $e) {
                // best-effort
            }
        }

        Storage::disk('local')->delete($file->disk_path);
        $file->delete();

        return $this->redirectToFolder($folderId)->with('success', 'File deleted.');
    }

    /**
     * Redirect to a folder's listing, or the root listing when no folder id.
     */
    private function redirectToFolder(?int $folderId): RedirectResponse
    {
        return $folderId
            ? redirect()->route('file-manager.browse', $folderId)
            : redirect()->route('file-manager.index');
    }

    /**
     * Push a new folder to Drive. Returns a warning message on failure, null on success/skip.
     */
    private function syncFolderToDrive(Folder $folder, ?Folder $parent): ?string
    {
        if (! $this->driveReady()) {
            return null;
        }

        try {
            $driveId = $this->boundDrive()->createFolder($folder->name, $parent?->drive_folder_id);
            $folder->update(['drive_folder_id' => $driveId, 'synced' => true]);

            return null;
        } catch (Throwable $e) {
            return 'Folder saved locally but Google Drive sync failed: '.$e->getMessage();
        }
    }

    private function syncFileToDrive(FileItem $file, ?Folder $folder): ?string
    {
        if (! $this->driveReady()) {
            return null;
        }

        try {
            $result = $this->boundDrive()->uploadFile(
                Storage::disk('local')->path($file->disk_path),
                $file->name,
                $file->mime,
                $folder?->drive_folder_id,
            );

            $file->update([
                'drive_file_id' => $result['id'],
                'drive_link' => $result['link'],
                'synced' => true,
            ]);

            return null;
        } catch (Throwable $e) {
            return 'File saved locally but Google Drive sync failed: '.$e->getMessage();
        }
    }

    private function deleteFolderFromDrive(Folder $folder): void
    {
        if ($folder->drive_folder_id && $this->driveReady()) {
            // Deleting a Drive folder removes its children too.
            $this->boundDrive()->deleteFile($folder->drive_folder_id);
        }
    }

    /**
     * The current user's connected Google account, if any.
     */
    private function userGoogleAccount(): ?GoogleAccount
    {
        return GoogleAccount::where('user_id', Auth::id())->first();
    }

    /**
     * The Drive service bound to the right auth mode: the user's OAuth account when
     * available, otherwise the service account.
     */
    private function boundDrive(): GoogleDriveService
    {
        $account = $this->userGoogleAccount();

        if ($account && $this->drive->oauthConfigured()) {
            return $this->drive->usingOAuthAccount($account);
        }

        return $this->drive;
    }

    /**
     * Can we sync to Drive right now? OAuth (user connected) or service account (+ root folder).
     */
    private function driveReady(): bool
    {
        if ($this->userGoogleAccount() && $this->drive->oauthConfigured()) {
            return true;
        }

        return $this->drive->serviceAccountConfigured() && filled(config('services.google_drive.root_folder_id'));
    }

    private function deleteLocalFilesRecursively(Folder $folder): void
    {
        foreach ($folder->files as $file) {
            Storage::disk('local')->delete($file->disk_path);
        }

        foreach ($folder->children as $child) {
            $this->deleteLocalFilesRecursively($child);
        }
    }

    private function authorizeFolder(Folder $folder): void
    {
        abort_unless($folder->user_id === Auth::id(), 403);
    }

    private function authorizeFile(FileItem $file): void
    {
        abort_unless($file->user_id === Auth::id(), 403);
    }
}
