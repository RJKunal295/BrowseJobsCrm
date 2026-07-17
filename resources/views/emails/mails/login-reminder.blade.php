<!DOCTYPE html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body style="margin:0;padding:0;background:#f4f5f7;font-family:Arial,Helvetica,sans-serif;color:#333;">
	<div style="max-width:560px;margin:24px auto;background:#fff;border-radius:8px;overflow:hidden;border:1px solid #e5e7eb;">
		<div style="background:#dc3545;color:#fff;padding:18px 24px;font-size:18px;font-weight:bold;">
			{{ config('app.name') }}
		</div>
		<div style="padding:24px;">
			<p style="margin:0 0 12px;">Hi {{ $user->full_name ?? $user->first_name }},</p>
			<p style="margin:0 0 12px;">
				Our records show you have <strong>not logged in today</strong>
				({{ now()->timezone(config('app.timezone'))->format('d M Y') }}).
			</p>
			<p style="margin:0 0 12px;">
				Please log in to mark your attendance as soon as possible. If you are on leave or unwell,
				kindly apply for leave or inform your reporting manager.
			</p>
			<p style="margin:20px 0;">
				<a href="{{ url('/login') }}"
					style="background:#dc3545;color:#fff;text-decoration:none;padding:10px 20px;border-radius:6px;display:inline-block;">
					Log in now
				</a>
			</p>
			<p style="margin:0;color:#888;font-size:12px;">This is an automated reminder from {{ config('app.name') }}.</p>
		</div>
	</div>
</body>
</html>
