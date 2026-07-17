<!DOCTYPE html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"></head>
<body style="margin:0;padding:0;background:#f4f5f7;font-family:Arial,Helvetica,sans-serif;color:#333;">
	<div style="max-width:560px;margin:24px auto;background:#fff;border-radius:8px;overflow:hidden;border:1px solid #e5e7eb;">
		<div style="background:#111827;color:#fff;padding:18px 24px;font-size:18px;font-weight:bold;">
			New {{ ucfirst($post->platform) }} Post
		</div>
		<div style="padding:24px;">
			<p style="margin:0 0 12px;"><strong>{{ $accountLabel }}</strong> just published a new
				{{ strtolower($post->media_type ?? 'post') }}.</p>

			@if ($post->thumbnail_url)
				<img src="{{ $post->thumbnail_url }}" alt="Post thumbnail"
					style="max-width:100%;border-radius:8px;margin:8px 0;">
			@endif

			@if ($post->caption)
				<p style="margin:12px 0;color:#444;">{{ \Illuminate\Support\Str::limit($post->caption, 300) }}</p>
			@endif

			<p style="margin:4px 0;color:#888;font-size:13px;">
				Published: {{ optional($post->published_at)->format('d M Y, h:i A') ?? 'just now' }}
			</p>

			@if ($post->permalink)
				<p style="margin:20px 0;">
					<a href="{{ $post->permalink }}" target="_blank"
						style="background:#111827;color:#fff;text-decoration:none;padding:10px 20px;border-radius:6px;display:inline-block;">
						View post
					</a>
				</p>
			@endif

			<p style="margin:0;color:#888;font-size:12px;">
				You receive these alerts because they are enabled in {{ config('app.name') }} → Social Alerts.
			</p>
		</div>
	</div>
</body>
</html>
