<!DOCTYPE html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body style="margin:0;padding:0;background:#f4f5f7;font-family:Arial,Helvetica,sans-serif;color:#333;">
	<div style="max-width:640px;margin:24px auto;background:#fff;border-radius:8px;overflow:hidden;border:1px solid #e5e7eb;">
		<div style="background:#dc3545;color:#fff;padding:18px 24px;font-size:18px;font-weight:bold;">
			Login Alert — {{ config('app.name') }}
		</div>
		<div style="padding:24px;">
			<p style="margin:0 0 12px;">
				The following <strong>{{ count($rows) }}</strong> employee(s) had not logged in on
				<strong>{{ $reportDate }}</strong> even after reminders:
			</p>
			<table style="width:100%;border-collapse:collapse;font-size:14px;">
				<thead>
					<tr style="background:#f8f9fa;text-align:left;">
						<th style="padding:8px;border:1px solid #e5e7eb;">Name</th>
						<th style="padding:8px;border:1px solid #e5e7eb;">Email</th>
						<th style="padding:8px;border:1px solid #e5e7eb;">Mobile</th>
					</tr>
				</thead>
				<tbody>
					@foreach ($rows as $row)
						<tr>
							<td style="padding:8px;border:1px solid #e5e7eb;">{{ $row['name'] }}</td>
							<td style="padding:8px;border:1px solid #e5e7eb;">{{ $row['email'] }}</td>
							<td style="padding:8px;border:1px solid #e5e7eb;">{{ $row['mobile'] }}</td>
						</tr>
					@endforeach
				</tbody>
			</table>
			<p style="margin:20px 0 0;color:#888;font-size:12px;">Automated escalation from {{ config('app.name') }}.</p>
		</div>
	</div>
</body>
</html>
