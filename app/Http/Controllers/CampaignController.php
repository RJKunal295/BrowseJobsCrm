<?php

namespace App\Http\Controllers;

use App\Jobs\SendCampaignJob;
use App\Models\Campaign;
use App\Models\Student;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class CampaignController extends Controller
{
    public function index(): View
    {
        $campaigns = Campaign::with('creator')->latest()->paginate(15);

        $studentCount = Student::count();
        $activeStudentCount = Student::where('status', 'active')->count();

        return view('campaigns.index', compact('campaigns', 'studentCount', 'activeStudentCount'));
    }

    /**
     * Compose form. $channel locks the UI to email / whatsapp when reached via those menu links.
     */
    public function create(Request $request, ?string $channel = null): View
    {
        $channel = in_array($channel, ['email', 'whatsapp'], true) ? $channel : null;

        $studentCount = Student::count();
        $activeStudentCount = Student::where('status', 'active')->count();

        return view('campaigns.create', compact('channel', 'studentCount', 'activeStudentCount'));
    }

    public function store(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'name' => 'required|string|max:200',
            'channel' => 'required|in:email,whatsapp,both',
            'audience' => 'required|in:all,active',
            'subject' => 'nullable|string|max:255|required_if:channel,email,both',
            'body' => 'required|string',
            'whatsapp_template' => 'nullable|string|max:255',
            'whatsapp_template_lang' => 'nullable|string|max:20',
            'send_now' => 'nullable|boolean',
        ]);

        $validated['created_by'] = Auth::id();
        $validated['whatsapp_template_lang'] = $validated['whatsapp_template_lang'] ?? 'en_US';

        $campaign = Campaign::create($validated);

        if ($request->boolean('send_now')) {
            return $this->send($campaign);
        }

        return redirect()->route('campaigns.show', $campaign)->with('success', 'Campaign saved as draft.');
    }

    public function show(Campaign $campaign): View
    {
        $campaign->load('creator');
        $recipients = $campaign->recipients()->latest()->paginate(30);

        return view('campaigns.show', compact('campaign', 'recipients'));
    }

    public function send(Campaign $campaign): RedirectResponse
    {
        if ($campaign->status === 'sending') {
            return back()->with('error', 'This campaign is already being sent.');
        }

        // Send during the request so it works without a background queue worker.
        // Large audiences can take a while — allow the request the time it needs.
        @set_time_limit(0);

        SendCampaignJob::dispatchSync($campaign);
        $campaign->refresh();

        return redirect()->route('campaigns.show', $campaign)->with(
            'success',
            "Campaign sent. Emails: {$campaign->sent_email}, WhatsApp: {$campaign->sent_whatsapp}, Failed: {$campaign->failed_count}, Recipients: {$campaign->total_recipients}."
        );
    }

    public function destroy(Campaign $campaign): RedirectResponse
    {
        $campaign->delete();

        return redirect()->route('campaigns.index')->with('success', 'Campaign deleted.');
    }

    /**
     * Placeholder for channels not yet available (SMS, Social).
     */
    public function maintenance(string $channel): View
    {
        return view('campaigns.maintenance', ['channel' => $channel]);
    }
}
