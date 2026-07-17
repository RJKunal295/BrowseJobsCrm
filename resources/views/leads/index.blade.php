@extends('layouts.app')

@section('title', 'Leads')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Leads</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>CRM / Leads</span>
			</nav>
		</div>
		@if ($canCreate)
			<button type="button" class="btn btn-primary" onclick="openLeadModal()">
				<i class="ti ti-plus me-1"></i> Add Lead
			</button>
		@endif
	</div>

	@foreach (['success' => 'success', 'error' => 'danger'] as $key => $type)
		@if (session($key))
			<div class="alert alert-{{ $type }} alert-dismissible fade show" role="alert">
				{{ session($key) }}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		@endif
	@endforeach

	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('leads.index') }}" class="row g-3 align-items-end">
				<div class="col-md-4">
					<label class="form-label">Search</label>
					<input type="text" name="search" class="form-control" placeholder="Name, mobile, email..." value="{{ request('search') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Status</label>
					<select name="status_id" class="form-select">
						<option value="">All statuses</option>
						@foreach ($statuses as $s)
							<option value="{{ $s->id }}" @selected((string) request('status_id') === (string) $s->id)>{{ $s->name }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-2">
					<label class="form-label">Source</label>
					<select name="source" class="form-select">
						<option value="">All sources</option>
						@foreach ($sources as $src)
							<option value="{{ $src }}" @selected(request('source') === $src)>{{ ucfirst($src) }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-2">
					<label class="form-label">Assignment</label>
					<select name="assignment" class="form-select">
						<option value="">All</option>
						<option value="unassigned" @selected(request('assignment') === 'unassigned')>Unassigned</option>
						<option value="assigned" @selected(request('assignment') === 'assigned')>Assigned</option>
						<option value="mine" @selected(request('assignment') === 'mine')>Assigned to me</option>
					</select>
				</div>
				<div class="col-md-1 d-flex gap-2">
					<button type="submit" class="btn btn-primary"><i class="ti ti-filter"></i></button>
					<a href="{{ route('leads.index') }}" class="btn btn-outline-light">Reset</a>
				</div>
			</form>
		</div>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Lead</th><th>Mobile</th><th>Source</th><th>Status</th><th>Assigned To</th><th>Created</th><th>Action</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($leads as $lead)
							<tr>
								<td>
									<a href="{{ route('leads.show', $lead) }}">{{ $lead->name ?: '(no name)' }}</a>
									@if ($lead->email)<div class="fs-12 text-muted">{{ $lead->email }}</div>@endif
								</td>
								<td>{{ $lead->mobile }}</td>
								<td class="text-capitalize">{{ $lead->source ?: 'manual' }}</td>
								<td>
									@if ($lead->status)
										<span class="badge" style="background: {{ $lead->status->color ?: '#6c757d' }}; color:#fff;">{{ $lead->status->name }}</span>
									@else — @endif
								</td>
								<td>{{ $lead->assignee->full_name ?? '—' }}</td>
								<td>{{ $lead->created_at->format('d M Y') }}</td>
								<td><a href="{{ route('leads.show', $lead) }}" class="btn btn-sm btn-icon btn-outline-light"><i class="ti ti-eye"></i></a></td>
							</tr>
						@empty
							<tr><td colspan="7" class="text-center py-4">No leads found.</td></tr>
						@endforelse
					</tbody>
				</table>
			</div>
			<div class="mt-3">{{ $leads->links() }}</div>
		</div>
	</div>

	<!-- Add Lead Modal -->
	<div class="modal fade" id="leadModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" action="{{ route('leads.store') }}">
					@csrf
					<div class="modal-header">
						<h5 class="modal-title">Add Lead</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						@if ($isMediaStrategist)
							<div class="alert alert-info fs-13 py-2"><i class="ti ti-info-circle me-1"></i> As a Media Strategist, only a mobile number is required.</div>
						@endif
						<div class="mb-3">
							<label class="form-label">Mobile <span class="text-danger">*</span></label>
							<input type="text" name="mobile" class="form-control" placeholder="+91..." required>
						</div>
						<div class="mb-3">
							<label class="form-label">Name @unless ($isMediaStrategist)<span class="text-danger">*</span>@endunless</label>
							<input type="text" name="name" class="form-control" @unless ($isMediaStrategist) required @endunless>
						</div>
						<div class="mb-3">
							<label class="form-label">Email</label>
							<input type="email" name="email" class="form-control">
						</div>
						<div class="mb-0">
							<label class="form-label">Campaign (optional)</label>
							<input type="text" name="campaign_name" class="form-control">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary"><i class="ti ti-device-floppy me-1"></i> Save Lead</button>
					</div>
				</form>
			</div>
		</div>
	</div>

@endsection

@push('scripts')
	<script>
		function openLeadModal() { new bootstrap.Modal(document.getElementById('leadModal')).show(); }
		@if ($errors->any()) document.addEventListener('DOMContentLoaded', openLeadModal); @endif
	</script>
@endpush
