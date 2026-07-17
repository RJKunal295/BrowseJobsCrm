<?php

namespace App\Http\Controllers;

use App\Models\Note;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class NotesController extends Controller
{
    public function index(Request $request): View
    {
        $query = Note::where('user_id', Auth::id());

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(function ($q) use ($search) {
                $q->where('title', 'like', "%{$search}%")
                    ->orWhere('body', 'like', "%{$search}%");
            });
        }

        if ($request->filled('color')) {
            $query->where('color', $request->input('color'));
        }

        $notes = $query->orderByDesc('is_pinned')
            ->orderByDesc('updated_at')
            ->paginate(24)
            ->withQueryString();

        return view('notes.index', compact('notes'));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $this->validated($request);
        $validated['user_id'] = Auth::id();

        Note::create($validated);

        return redirect()->route('notes.index')->with('success', 'Note created successfully.');
    }

    public function update(Request $request, Note $note): RedirectResponse
    {
        $this->authorizeNote($note);

        $note->update($this->validated($request));

        return redirect()->route('notes.index')->with('success', 'Note updated successfully.');
    }

    public function togglePin(Note $note): RedirectResponse
    {
        $this->authorizeNote($note);

        $note->update(['is_pinned' => ! $note->is_pinned]);

        return redirect()->route('notes.index')->with('success', $note->is_pinned ? 'Note pinned.' : 'Note unpinned.');
    }

    public function destroy(Note $note): RedirectResponse
    {
        $this->authorizeNote($note);

        $note->delete();

        return redirect()->route('notes.index')->with('success', 'Note deleted successfully.');
    }

    private function validated(Request $request): array
    {
        return $request->validate([
            'title' => 'required|string|max:150',
            'body' => 'nullable|string|max:10000',
            'color' => 'required|in:default,yellow,green,blue,red,purple',
            'is_pinned' => 'sometimes|boolean',
        ]);
    }

    private function authorizeNote(Note $note): void
    {
        abort_unless($note->user_id === Auth::id(), 403);
    }
}
