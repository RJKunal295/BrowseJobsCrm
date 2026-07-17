@extends('layouts.app')

@section('title', 'New Campaign')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">New Campaign</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt;
				<a href="{{ route('campaigns.index') }}" class="text-muted">Campaigns</a> &gt; <span>New</span>
			</nav>
		</div>
		<a href="{{ route('campaigns.index') }}" class="btn btn-outline-light"><i class="ti ti-arrow-left me-1"></i> Back</a>
	</div>

	@if ($errors->any())
		<div class="alert alert-danger">
			<ul class="mb-0">@foreach ($errors->all() as $err)<li>{{ $err }}</li>@endforeach</ul>
		</div>
	@endif

	<form method="POST" action="{{ route('campaigns.store') }}">
		@csrf
		<div class="row">
			<div class="col-lg-8">
				<div class="card">
					<div class="card-body">
						<div class="row g-3">
							<div class="col-md-12">
								<label class="form-label">Campaign name <span class="text-danger">*</span></label>
								<input type="text" name="name" class="form-control" value="{{ old('name') }}"
									placeholder="e.g. New Data Engineering Masterclass" required>
							</div>

							<div class="col-md-6">
								<label class="form-label">Channel <span class="text-danger">*</span></label>
								<select name="channel" id="camp_channel" class="form-select" onchange="toggleEmailFields()"
									@if ($channel) data-locked="1" @endif>
									<option value="email" @selected(old('channel', $channel) === 'email')>Email only</option>
									<option value="whatsapp" @selected(old('channel', $channel) === 'whatsapp')>WhatsApp only</option>
									<option value="both" @selected(old('channel', $channel) === 'both')>Email + WhatsApp</option>
								</select>
							</div>
							<div class="col-md-6">
								<label class="form-label">Audience <span class="text-danger">*</span></label>
								<select name="audience" class="form-select">
									<option value="active" @selected(old('audience') === 'active')>Active students only ({{ number_format($activeStudentCount) }})</option>
									<option value="all" @selected(old('audience') === 'all')>All students ({{ number_format($studentCount) }})</option>
								</select>
							</div>

							<div class="col-md-12 email-field">
								<label class="form-label">Email subject</label>
								<input type="text" name="subject" class="form-control" value="{{ old('subject') }}"
									placeholder="Subject line for the email">
							</div>

							<div class="col-md-12">
								<label class="form-label">Message body <span class="text-danger">*</span></label>
								<textarea name="body" rows="10" class="form-control"
									placeholder="Write your message. Use {name} to insert the student's name. HTML allowed for email.">{{ old('body') }}</textarea>
								<div class="form-text">Tip: <code>{name}</code> is replaced with each student's name. For WhatsApp, HTML tags are stripped to plain text.</div>
							</div>

							<div class="col-md-12 whatsapp-field">
								<hr>
								<h6 class="mb-2"><i class="ti ti-brand-whatsapp me-1 text-success"></i> WhatsApp options</h6>
								<div class="row g-3">
									<div class="col-md-8">
										<label class="form-label">Approved template name (optional)</label>
										<input type="text" name="whatsapp_template" class="form-control" value="{{ old('whatsapp_template') }}"
											placeholder="e.g. masterclass_announcement">
										<div class="form-text">Required by Meta to message students outside the 24-hour window. Leave blank to send the plain body (only reaches users who messaged you recently).</div>
									</div>
									<div class="col-md-4">
										<label class="form-label">Template language</label>
										<input type="text" name="whatsapp_template_lang" class="form-control" value="{{ old('whatsapp_template_lang', 'en_US') }}">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<div class="card">
					<div class="card-body">
						<h6 class="mb-3">Send</h6>
						<p class="fs-13 text-muted">Save as a draft to review recipients first, or send immediately to the selected audience.</p>
						<div class="d-grid gap-2">
							<button type="submit" name="send_now" value="1" class="btn btn-primary"
								onclick="return confirm('Send this campaign to all selected students now?');">
								<i class="ti ti-send me-1"></i> Send now
							</button>
							<button type="submit" name="send_now" value="0" class="btn btn-outline-primary">
								<i class="ti ti-device-floppy me-1"></i> Save as draft
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

@endsection

@push('scripts')
	<script>
		function toggleEmailFields() {
			const channel = document.getElementById('camp_channel').value;
			document.querySelectorAll('.email-field').forEach(el => el.classList.toggle('d-none', channel === 'whatsapp'));
			document.querySelectorAll('.whatsapp-field').forEach(el => el.classList.toggle('d-none', channel === 'email'));
		}
		document.addEventListener('DOMContentLoaded', toggleEmailFields);
	</script>
@endpush
