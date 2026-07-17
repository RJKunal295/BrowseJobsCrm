<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Privacy Policy | {{ config('app.name') }}</title>
	<style>
		:root { --brand:#dc3545; --ink:#1f2937; --muted:#6b7280; --line:#e5e7eb; }
		* { box-sizing:border-box; }
		body { margin:0; background:#f6f7f9; color:var(--ink); font-family:-apple-system,Segoe UI,Roboto,Helvetica,Arial,sans-serif; line-height:1.65; }
		.wrap { max-width:820px; margin:0 auto; padding:32px 20px 64px; }
		header { border-bottom:3px solid var(--brand); padding-bottom:16px; margin-bottom:28px; }
		h1 { margin:0 0 4px; font-size:28px; }
		.meta { color:var(--muted); font-size:14px; }
		h2 { font-size:19px; margin:28px 0 8px; }
		p, li { font-size:15.5px; }
		ul { padding-left:20px; }
		a { color:var(--brand); }
		.card { background:#fff; border:1px solid var(--line); border-radius:10px; padding:24px 28px; }
		.foot { color:var(--muted); font-size:13px; margin-top:28px; text-align:center; }
		code { background:#f1f3f5; padding:1px 6px; border-radius:4px; }
	</style>
</head>
<body>
	<div class="wrap">
		<header>
			<h1>Privacy Policy</h1>
			<div class="meta">{{ config('app.name') }} &middot; Last updated: 16 July 2026</div>
		</header>

		<div class="card">
			<p>This Privacy Policy explains how <strong>{{ config('app.name') }}</strong> ("we", "us", "our") collects,
				uses, and protects information when you use our internal customer-relationship and social-media
				management application (the "Service").</p>

			<h2>1. Information We Collect</h2>
			<ul>
				<li><strong>Account &amp; employee data</strong> you provide (name, email, phone, role) to sign in and use the Service.</li>
				<li><strong>Connected social accounts</strong> — when you authorise a LinkedIn, Instagram, or YouTube
					account, we receive access tokens and read profile, post, follower, reach, and engagement data
					for the accounts you connect.</li>
				<li><strong>Business records</strong> you create in the Service (leads, students, campaigns, notes, files, tasks).</li>
				<li><strong>Usage &amp; log data</strong> such as login times and device/browser information, used for security and attendance.</li>
			</ul>

			<h2>2. How We Use Information</h2>
			<ul>
				<li>To provide the Service: analytics dashboards, posting-activity monitoring, and reporting.</li>
				<li>To send operational notifications (email and WhatsApp) that you or your administrators configure.</li>
				<li>To secure accounts and prevent unauthorised access.</li>
			</ul>

			<h2>3. Third-Party Platforms</h2>
			<p>The Service integrates with third-party APIs. Your use of connected accounts is also governed by their terms:</p>
			<ul>
				<li><strong>LinkedIn</strong> (Community Management API) — <a href="https://www.linkedin.com/legal/privacy-policy" target="_blank" rel="noopener">LinkedIn Privacy Policy</a></li>
				<li><strong>Meta / Instagram</strong> (Graph API) — <a href="https://privacycenter.instagram.com/policy" target="_blank" rel="noopener">Instagram Privacy Policy</a></li>
				<li><strong>Google / YouTube</strong> (Data &amp; Drive API) — <a href="https://policies.google.com/privacy" target="_blank" rel="noopener">Google Privacy Policy</a></li>
			</ul>
			<p>We only request the minimum access needed, and we do not sell your data or share it with unrelated third parties.</p>

			<h2>4. Data Storage &amp; Security</h2>
			<p>Data is stored in our application database. Access tokens are encrypted at rest. Access to the Service is
				restricted to authorised users with role-based permissions.</p>

			<h2>5. Data Retention</h2>
			<p>We retain data for as long as your account is active or as needed to provide the Service. You may
				disconnect any social account at any time, which removes its stored access tokens.</p>

			<h2>6. Your Choices</h2>
			<ul>
				<li>Disconnect connected LinkedIn/Instagram/YouTube/Google accounts from within the Service.</li>
				<li>Turn notification alerts on or off per platform.</li>
				<li>Request access to or deletion of your data by contacting us.</li>
			</ul>

			<h2>7. Contact Us</h2>
			<p>For any privacy questions or data requests, contact:
				<a href="mailto:support@browsejobs.com">support@browsejobs.com</a>.</p>

			<p style="color:var(--muted); font-size:13px; margin-top:24px;">
				This policy may be updated from time to time. Continued use of the Service after changes constitutes
				acceptance of the updated policy.
			</p>
		</div>

		<div class="foot">&copy; {{ date('Y') }} {{ config('app.name') }}. All rights reserved.</div>
	</div>
</body>
</html>
