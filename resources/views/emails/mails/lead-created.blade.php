<!DOCTYPE html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body style="margin:0;padding:0;background:#f4f5f7;font-family:Arial,Helvetica,sans-serif;color:#333;">
	<div style="max-width:560px;margin:24px auto;background:#fff;border-radius:8px;overflow:hidden;border:1px solid #e5e7eb;">
		<div style="background:#0d6efd;color:#fff;padding:18px 24px;font-size:18px;font-weight:bold;">
			New Lead — {{ config('app.name') }}
		</div>
		<div style="padding:24px;">
			<p style="margin:0 0 12px;">A new lead has just been generated:</p>
			<table style="width:100%;border-collapse:collapse;font-size:14px;">
				<tr><td style="padding:6px 8px;color:#888;width:120px;">Name</td><td style="padding:6px 8px;"><strong>{{ $lead->name ?: '—' }}</strong></td></tr>
				<tr><td style="padding:6px 8px;color:#888;">Mobile</td><td style="padding:6px 8px;"><strong>{{ $lead->mobile }}</strong></td></tr>
				<tr><td style="padding:6px 8px;color:#888;">Email</td><td style="padding:6px 8px;">{{ $lead->email ?: '—' }}</td></tr>
				<tr><td style="padding:6px 8px;color:#888;">Source</td><td style="padding:6px 8px;">{{ $lead->source ?: 'manual' }}</td></tr>
				@if ($lead->campaign_name)
					<tr><td style="padding:6px 8px;color:#888;">Campaign</td><td style="padding:6px 8px;">{{ $lead->campaign_name }}</td></tr>
				@endif
				<tr><td style="padding:6px 8px;color:#888;">Received</td><td style="padding:6px 8px;">{{ $lead->created_at->format('d M Y, h:i A') }}</td></tr>
			</table>
			<p style="margin:20px 0;">
				<a href="{{ route('leads.show', $lead->id) }}"
					style="background:#0d6efd;color:#fff;text-decoration:none;padding:10px 20px;border-radius:6px;display:inline-block;">
					View lead
				</a>
			</p>
			<p style="margin:0;color:#888;font-size:12px;">Automated notification from {{ config('app.name') }}.</p>
		</div>
	</div>
</body>
</html>
