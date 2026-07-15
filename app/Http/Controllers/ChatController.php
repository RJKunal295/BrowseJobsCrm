<?php

namespace App\Http\Controllers;

use App\Models\Conversation;
use App\Models\Message;
use App\Models\User;
use App\Notifications\NewChatMessage;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;

class ChatController extends Controller
{
    private const MONITOR_ROLE_CODES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS'];

    public function index(Request $request): View
    {
        $user = Auth::user();
        $isMonitor = $this->isMonitor($user);
        $viewingAsMonitor = $isMonitor && $request->boolean('monitor');

        $conversations = $viewingAsMonitor
            ? Conversation::with(['participants', 'latestMessage'])->orderByDesc('updated_at')->get()
            : $this->conversationsFor($user);

        $users = User::where('id', '!=', $user->id)->orderBy('full_name')->get(['id', 'full_name', 'profile_photo']);

        $activeConversationId = $request->input('conversation');

        return view('chat.index', compact('conversations', 'users', 'isMonitor', 'viewingAsMonitor', 'activeConversationId'));
    }

    public function show(Conversation $conversation): JsonResponse
    {
        $this->authorizeAccess($conversation);

        $user = Auth::user();
        $isParticipant = $conversation->participants()->where('users.id', $user->id)->exists();

        $messages = $conversation->messages()->with('sender')->get()
            ->map(fn (Message $m) => $this->formatMessage($m));

        if ($isParticipant) {
            $conversation->participants()->updateExistingPivot($user->id, ['last_read_at' => now()]);
        }

        return response()->json([
            'conversation' => [
                'id'             => $conversation->id,
                'name'           => $conversation->displayNameFor($user),
                'type'           => $conversation->type,
                'avatar'         => $conversation->avatarUrlFor($user),
                'participants'   => $conversation->participants->pluck('full_name'),
                'is_participant' => $isParticipant,
            ],
            'messages' => $messages,
        ]);
    }

    public function pollMessages(Request $request, Conversation $conversation): JsonResponse
    {
        $this->authorizeAccess($conversation);

        $afterId = (int) $request->input('after_id', 0);

        $messages = $conversation->messages()
            ->with('sender')
            ->where('id', '>', $afterId)
            ->get()
            ->map(fn (Message $m) => $this->formatMessage($m));

        if ($messages->isNotEmpty()) {
            $user = Auth::user();
            $isParticipant = $conversation->participants()->where('users.id', $user->id)->exists();
            if ($isParticipant) {
                $conversation->participants()->updateExistingPivot($user->id, ['last_read_at' => now()]);
            }
        }

        return response()->json(['messages' => $messages]);
    }

    public function listPoll(Request $request): JsonResponse
    {
        $user = Auth::user();
        $viewingAsMonitor = $this->isMonitor($user) && $request->boolean('monitor');

        $conversations = $viewingAsMonitor
            ? Conversation::with(['participants', 'latestMessage'])->orderByDesc('updated_at')->get()
            : $this->conversationsFor($user);

        $payload = $conversations->map(function (Conversation $c) use ($user) {
            return [
                'id'              => $c->id,
                'name'            => $c->displayNameFor($user),
                'type'            => $c->type,
                'avatar'          => $c->avatarUrlFor($user),
                'last_message'    => $c->latestMessage?->body,
                'last_message_at' => $c->latestMessage?->created_at?->diffForHumans(),
                'unread'          => $c->unreadCountFor($user),
            ];
        });

        return response()->json(['conversations' => $payload]);
    }

    public function storeMessage(Request $request, Conversation $conversation): JsonResponse
    {
        $this->authorizeParticipant($conversation);

        $validated = $request->validate(['body' => 'required|string|max:5000']);

        $message = $conversation->messages()->create([
            'sender_id' => Auth::id(),
            'body'      => $validated['body'],
        ]);

        $conversation->touch();

        $recipients = $conversation->participants()->where('users.id', '!=', Auth::id())->get();
        if ($recipients->isNotEmpty()) {
            Notification::send($recipients, new NewChatMessage($message));
        }

        return response()->json($this->formatMessage($message->load('sender')));
    }

    public function startPrivate(User $user): RedirectResponse
    {
        $me = Auth::user();

        if ($user->id === $me->id) {
            return back()->with('error', 'You cannot start a chat with yourself.');
        }

        $existing = Conversation::where('type', 'private')
            ->whereHas('participants', fn ($q) => $q->where('users.id', $me->id))
            ->whereHas('participants', fn ($q) => $q->where('users.id', $user->id))
            ->first();

        if (!$existing) {
            $existing = Conversation::create(['type' => 'private', 'created_by' => $me->id]);
            $existing->participants()->attach([$me->id, $user->id]);
        }

        return redirect()->route('chat.index', ['conversation' => $existing->id]);
    }

    public function createGroup(): View
    {
        $users = User::orderBy('full_name')->get(['id', 'full_name']);

        return view('chat.create-group', compact('users'));
    }

    public function storeGroup(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name'              => 'required|string|max:150',
            'participant_ids'   => 'required|array|min:1',
            'participant_ids.*' => 'exists:users,id',
        ]);

        $conversation = Conversation::create([
            'type'       => 'group',
            'name'       => $validated['name'],
            'created_by' => Auth::id(),
        ]);

        $participantIds = collect($validated['participant_ids'])->push(Auth::id())->unique();
        $pivotData = $participantIds->mapWithKeys(fn ($id) => [
            $id => ['is_admin' => $id === Auth::id()],
        ])->all();

        $conversation->participants()->attach($pivotData);

        return redirect()->route('chat.index', ['conversation' => $conversation->id])->with('success', 'Group created successfully.');
    }

    private function conversationsFor(User $user)
    {
        return Conversation::with(['participants', 'latestMessage'])
            ->whereHas('participants', fn ($q) => $q->where('users.id', $user->id))
            ->orderByDesc('updated_at')
            ->get();
    }

    private function formatMessage(Message $message): array
    {
        return [
            'id'          => $message->id,
            'sender_id'   => $message->sender_id,
            'sender_name' => $message->sender->full_name ?? 'Unknown',
            'body'        => $message->body,
            'time'        => $message->created_at->format('h:i A'),
            'is_mine'     => $message->sender_id === Auth::id(),
        ];
    }

    private function authorizeAccess(Conversation $conversation): void
    {
        $user = Auth::user();
        $isParticipant = $conversation->participants()->where('users.id', $user->id)->exists();

        if (!$isParticipant && !$this->isMonitor($user)) {
            abort(403);
        }
    }

    private function authorizeParticipant(Conversation $conversation): void
    {
        $isParticipant = $conversation->participants()->where('users.id', Auth::id())->exists();

        if (!$isParticipant) {
            abort(403, 'Only participants can send messages in this conversation.');
        }
    }

    private function isMonitor(User $user): bool
    {
        return $user->role && in_array($user->role->role_code, self::MONITOR_ROLE_CODES, true);
    }
}