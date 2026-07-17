<?php

namespace App\Http\Controllers;

use App\Models\Lead;
use App\Models\LeadCall;
use App\Models\LeadStatus;
use App\Models\LeadStatusHistory;
use App\Models\User;
use App\Services\CallerDigitalService;
use App\Services\LeadService;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;
use Symfony\Component\HttpFoundation\StreamedResponse;

class LeadController extends Controller
{
    /** Roles that can be assigned a lead by an HR Manager. */
    private const HR_ASSIGNABLE_ROLES = ['HR', 'HR_TEAM_LEAD', 'HR_ADMIN', 'HR_MANAGER'];

    /** Roles allowed to assign leads. */
    private const CAN_ASSIGN_ROLES = ['SUPER_ADMIN', 'ADMIN', 'HEAD_OF_OPERATIONS', 'HR_MANAGER'];

    public function __construct(private LeadService $leads) {}

    public function index(Request $request): View
    {
        $query = Lead::with(['status', 'assignee', 'creator']);

        // Only "view all" roles see every lead; everyone else sees their own (assigned or added).
        if (! $this->canViewAll()) {
            $uid = Auth::id();
            $query->where(fn ($q) => $q->where('assigned_to_user_id', $uid)->orWhere('added_by_user_id', $uid));
        }

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(fn ($q) => $q->where('name', 'like', "%{$search}%")
                ->orWhere('mobile', 'like', "%{$search}%")
                ->orWhere('email', 'like', "%{$search}%"));
        }
        if ($request->filled('status_id')) {
            $query->where('current_status_id', $request->input('status_id'));
        }
        if ($request->filled('source')) {
            $query->where('source', $request->input('source'));
        }
        match ($request->input('assignment')) {
            'unassigned' => $query->whereNull('assigned_to_user_id'),
            'assigned' => $query->whereNotNull('assigned_to_user_id'),
            'mine' => $query->where('assigned_to_user_id', Auth::id()),
            default => null,
        };

        $leads = $query->latest()->paginate(20)->withQueryString();
        $statuses = LeadStatus::orderBy('sort_order')->get();
        $sources = Lead::select('source')->whereNotNull('source')->distinct()->pluck('source');

        return view('leads.index', [
            'leads' => $leads,
            'statuses' => $statuses,
            'sources' => $sources,
            'isMediaStrategist' => $this->roleCode() === 'MEDIA_STRATEGIST',
            'canCreate' => $this->canCreate(),
        ]);
    }

    /**
     * Manual add from the CRM. MEDIA_STRATEGIST needs only a mobile number; other roles need name + mobile.
     */
    public function store(Request $request): RedirectResponse
    {
        abort_unless($this->canCreate(), 403, 'Your role is not allowed to add leads.');

        // MEDIA_STRATEGIST only needs a mobile number; everyone else also needs a name.
        $nameRule = $this->roleCode() === 'MEDIA_STRATEGIST' ? 'nullable' : 'required';

        $validated = $request->validate([
            'mobile' => 'required|string|max:20',
            'name' => $nameRule.'|string|max:150',
            'email' => 'nullable|email|max:150',
            'campaign_name' => 'nullable|string|max:150',
        ]);

        $lead = $this->leads->create($validated, 'manual', Auth::id());

        return redirect()->route('leads.show', $lead)->with('success', 'Lead added and team notified.');
    }

    public function show(Lead $lead): View
    {
        // Scoped users can only open their own leads.
        abort_unless(
            $this->canViewAll() || $lead->assigned_to_user_id === Auth::id() || $lead->added_by_user_id === Auth::id(),
            403
        );

        $lead->load(['status', 'assignee', 'assignedBy', 'creator', 'calls.initiatedBy', 'statusHistory.status', 'statusHistory.changedBy']);

        return view('leads.show', [
            'lead' => $lead,
            'statuses' => LeadStatus::orderBy('sort_order')->get(),
            'hrUsers' => User::query()->withRoleCode(self::HR_ASSIGNABLE_ROLES)->where('is_active', true)->orderBy('full_name')->get(),
            'canAssign' => in_array($this->roleCode(), self::CAN_ASSIGN_ROLES, true),
            'callConfigured' => app(CallerDigitalService::class)->isConfigured(),
        ]);
    }

    /**
     * HR Manager assigns the lead to an HR-role user.
     */
    public function assign(Request $request, Lead $lead): RedirectResponse
    {
        abort_unless(in_array($this->roleCode(), self::CAN_ASSIGN_ROLES, true), 403);

        $validated = $request->validate(['assigned_to_user_id' => 'required|exists:users,id']);

        $lead->update([
            'assigned_to_user_id' => $validated['assigned_to_user_id'],
            'assigned_by_user_id' => Auth::id(),
            'assigned_at' => now(),
        ]);

        // Keep an assignment audit trail.
        DB::table('lead_assignments')->insert([
            'lead_id' => $lead->id,
            'assigned_to_user_id' => $validated['assigned_to_user_id'],
            'assigned_by_user_id' => Auth::id(),
            'assigned_at' => now(),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Notify the assignee: email + WhatsApp + web-push (with sound).
        if ($assignee = User::find($validated['assigned_to_user_id'])) {
            $this->leads->notifyLeadAssigned($lead, $assignee, Auth::user());
        }

        return back()->with('success', 'Lead assigned and the HR user has been notified.');
    }

    public function updateStatus(Request $request, Lead $lead): RedirectResponse
    {
        $validated = $request->validate([
            'status_id' => 'required|exists:lead_statuses,id',
            'remarks' => 'nullable|string|max:1000',
        ]);

        $lead->update(['current_status_id' => $validated['status_id']]);

        LeadStatusHistory::create([
            'lead_id' => $lead->id,
            'status_id' => $validated['status_id'],
            'changed_by_user_id' => Auth::id(),
            'remarks' => $validated['remarks'] ?? null,
        ]);

        return back()->with('success', 'Status updated.');
    }

    /**
     * Manually (re)trigger an outbound AI voice call via Caller.Digital.
     */
    public function triggerAiCall(Lead $lead, CallerDigitalService $caller): RedirectResponse
    {
        if (! $caller->isConfigured()) {
            return back()->with('error', 'Caller.Digital is not configured. Set CALLER_DIGITAL_* in .env.');
        }

        if ($this->leads->aiCallCapReached()) {
            return back()->with('error', "Today's AI call limit has been reached. Try again tomorrow or raise CALLER_DIGITAL_DAILY_CAP.");
        }

        $call = $this->leads->triggerAiCall($lead, Auth::id());

        if ($call && $call->status === 'failed') {
            return back()->with('error', 'Could not start the AI call: '.($call->meta['error'] ?? 'unknown error'));
        }

        return back()->with('success', 'AI call triggered. Results will appear here once the call completes.');
    }

    /**
     * HR logs a call made manually — status, transcript, and an optional audio recording.
     */
    public function storeManualCall(Request $request, Lead $lead): RedirectResponse
    {
        $validated = $request->validate([
            'status' => 'required|in:completed,no_answer,busy,failed',
            'disposition' => 'nullable|string|max:150',
            'duration_seconds' => 'nullable|integer|min:0',
            'transcript' => 'nullable|string',
            'audio' => 'nullable|file|mimetypes:audio/mpeg,audio/mp4,audio/wav,audio/x-wav,audio/webm,audio/ogg|max:20480',
        ]);

        $audioPath = null;
        if ($request->hasFile('audio')) {
            $audioPath = $request->file('audio')->store('lead-call-recordings', 'local');
        }

        LeadCall::create([
            'lead_id' => $lead->id,
            'type' => 'manual',
            'status' => $validated['status'],
            'disposition' => $validated['disposition'] ?? null,
            'duration_seconds' => $validated['duration_seconds'] ?? null,
            'transcript' => $validated['transcript'] ?? null,
            'audio_path' => $audioPath,
            'to_number' => $lead->mobile,
            'initiated_by_user_id' => Auth::id(),
            'started_at' => now(),
            'ended_at' => now(),
        ]);

        return back()->with('success', 'Call logged.');
    }

    public function downloadAudio(LeadCall $call): StreamedResponse
    {
        abort_unless($call->audio_path && Storage::disk('local')->exists($call->audio_path), 404);

        return Storage::disk('local')->download($call->audio_path, 'call-'.$call->id.'-recording'.'.'.pathinfo($call->audio_path, PATHINFO_EXTENSION));
    }

    /**
     * Public website capture endpoint (token-protected). Requires name + email + phone.
     */
    public function apiCapture(Request $request)
    {
        $token = config('services.lead_capture_token');
        if (blank($token) || $request->header('X-Lead-Token') !== $token) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }

        $validated = $request->validate([
            'name' => 'required|string|max:150',
            'email' => 'required|email|max:150',
            'mobile' => 'required|string|max:20',
            'campaign_name' => 'nullable|string|max:150',
        ]);

        // Dedupe: the same number submitting again within 24h returns the existing lead
        // instead of creating a duplicate (and re-firing notifications + a paid AI call).
        $existing = Lead::where('mobile', $validated['mobile'])
            ->where('created_at', '>=', now()->subDay())
            ->first();

        if ($existing) {
            return response()->json(['message' => 'Lead already captured', 'lead_id' => $existing->id, 'duplicate' => true], 200);
        }

        $lead = $this->leads->create($validated, 'website', null);

        return response()->json(['message' => 'Lead captured', 'lead_id' => $lead->id], 201);
    }

    private function roleCode(): ?string
    {
        return Auth::user()?->role?->role_code;
    }

    private function canCreate(): bool
    {
        return (bool) Auth::user()?->hasPermission('create_lead');
    }

    private function canViewAll(): bool
    {
        return (bool) Auth::user()?->hasPermission('view_all_leads');
    }
}
