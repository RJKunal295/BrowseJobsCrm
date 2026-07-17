<!DOCTYPE html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body style="margin:0;padding:0;background:#f4f5f7;font-family:Arial,Helvetica,sans-serif;color:#333;">
	<div style="max-width:560px;margin:24px auto;background:#fff;border-radius:8px;overflow:hidden;border:1px solid #e5e7eb;">
		<div style="background:#dc3545;color:#fff;padding:18px 24px;font-size:18px;font-weight:bold;">
			Posting Reminder — {{ config('app.name') }}
		</div>
		<div style="padding:24px;">
			<p style="margin:0 0 12px;">
				No new post has been published on <strong>{{ ucfirst($account->platform) }}</strong>
				(<strong>{{ $account->label }}</strong>) in the last 24 hours.
			</p>
			<p style="margin:0 0 12px;color:#555;">
				Last post: <strong>{{ $lastPostAt ?? 'no posts recorded yet' }}</strong><br>
				Consecutive daily reminders: <strong>{{ $reminderCount }}</strong>
			</p>
			<p style="margin:0 0 12px;">
				Please publish a new post to keep the page active. You'll keep receiving this reminder each day
				until a new post is detected.
			</p>
			<p style="margin:0;color:#888;font-size:12px;">Automated reminder from {{ config('app.name') }} · Social Alerts.</p>
		</div>
	</div>
</body>
</html>
