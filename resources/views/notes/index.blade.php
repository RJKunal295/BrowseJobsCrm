@extends('layouts.app')

@section('title', 'Notes')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">Notes</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>Notes</span>
			</nav>
		</div>
		<button type="button" class="btn btn-primary" onclick="openNoteModal()">
			<i class="ti ti-plus me-1"></i> Add Note
		</button>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	<!-- Filters -->
	<div class="card mb-3">
		<div class="card-body">
			<form method="GET" action="{{ route('notes.index') }}" class="row g-3 align-items-end">
				<div class="col-md-6">
					<label class="form-label">Search</label>
					<input type="text" name="search" class="form-control" placeholder="Search title or content..."
						value="{{ request('search') }}">
				</div>
				<div class="col-md-3">
					<label class="form-label">Color</label>
					<select name="color" class="form-select">
						<option value="">All colors</option>
						@foreach (['default', 'yellow', 'green', 'blue', 'red', 'purple'] as $c)
							<option value="{{ $c }}" @selected(request('color') === $c)>{{ ucfirst($c) }}</option>
						@endforeach
					</select>
				</div>
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary"><i class="ti ti-filter me-1"></i> Filter</button>
					<a href="{{ route('notes.index') }}" class="btn btn-outline-light">Reset</a>
				</div>
			</form>
		</div>
	</div>
	<!-- End Filters -->

	@php
		$colorMap = [
			'default' => '#ffffff',
			'yellow'  => '#fff8e1',
			'green'   => '#e8f5e9',
			'blue'    => '#e3f2fd',
			'red'     => '#ffebee',
			'purple'  => '#f3e5f5',
		];
	@endphp

	<div class="row">
		@forelse ($notes as $note)
			<div class="col-xl-3 col-lg-4 col-md-6 mb-3">
				<div class="card h-100" style="background: {{ $colorMap[$note->color] ?? '#ffffff' }};">
					<div class="card-body d-flex flex-column">
						<div class="d-flex align-items-start justify-content-between gap-2 mb-2">
							<h6 class="mb-0 text-truncate">
								@if ($note->is_pinned)
									<i class="ti ti-pin-filled text-warning me-1"></i>
								@endif
								{{ $note->title }}
							</h6>
							<div class="dropdown">
								<button class="btn btn-sm btn-icon btn-outline-light border-0" data-bs-toggle="dropdown">
									<i class="ti ti-dots-vertical"></i>
								</button>
								<ul class="dropdown-menu dropdown-menu-end">
									<li>
										<button type="button" class="dropdown-item" onclick='openNoteModal(@json($note))'>
											<i class="ti ti-edit me-1"></i> Edit
										</button>
									</li>
									<li>
										<form method="POST" action="{{ route('notes.toggle-pin', $note->id) }}">
											@csrf
											@method('PATCH')
											<button type="submit" class="dropdown-item">
												<i class="ti ti-pin me-1"></i> {{ $note->is_pinned ? 'Unpin' : 'Pin' }}
											</button>
										</form>
									</li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li>
										<form method="POST" action="{{ route('notes.destroy', $note->id) }}"
											onsubmit="return confirm('Delete this note?');">
											@csrf
											@method('DELETE')
											<button type="submit" class="dropdown-item text-danger">
												<i class="ti ti-trash me-1"></i> Delete
											</button>
										</form>
									</li>
								</ul>
							</div>
						</div>
						<p class="text-muted fs-13 flex-grow-1" style="white-space: pre-wrap;">{{ \Illuminate\Support\Str::limit($note->body, 220) }}</p>
						<div class="fs-12 text-muted mt-2">
							<i class="ti ti-clock me-1"></i> {{ $note->updated_at->diffForHumans() }}
						</div>
					</div>
				</div>
			</div>
		@empty
			<div class="col-12">
				<div class="card">
					<div class="card-body text-center py-5">
						<i class="ti ti-note fs-1 text-muted d-block mb-2"></i>
						No notes yet. Click <strong>Add Note</strong> to create your first one.
					</div>
				</div>
			</div>
		@endforelse
	</div>

	<div class="mt-2">
		{{ $notes->links() }}
	</div>

	<!-- Add/Edit Note Modal -->
	<div class="modal fade" id="noteModal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<form method="POST" id="noteForm" action="{{ route('notes.store') }}">
					@csrf
					<div id="noteMethodField"></div>

					<div class="modal-header">
						<h5 class="modal-title" id="noteModalTitle">Add Note</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
						<div class="row g-3">
							<div class="col-md-8">
								<label class="form-label">Title <span class="text-danger">*</span></label>
								<input type="text" name="title" id="note_title" class="form-control"
									placeholder="Note title" required>
							</div>
							<div class="col-md-4">
								<label class="form-label">Color</label>
								<select name="color" id="note_color" class="form-select">
									<option value="default">Default</option>
									<option value="yellow">Yellow</option>
									<option value="green">Green</option>
									<option value="blue">Blue</option>
									<option value="red">Red</option>
									<option value="purple">Purple</option>
								</select>
							</div>
							<div class="col-md-12">
								<label class="form-label">Content</label>
								<textarea name="body" id="note_body" rows="6" class="form-control"
									placeholder="Write your note..."></textarea>
							</div>
							<div class="col-md-12">
								<div class="form-check">
									<input type="hidden" name="is_pinned" value="0">
									<input type="checkbox" name="is_pinned" id="note_is_pinned" value="1" class="form-check-input">
									<label class="form-check-label" for="note_is_pinned">Pin this note to the top</label>
								</div>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="noteSubmitBtn">
							<i class="ti ti-device-floppy me-1"></i> Save Note
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- End Modal -->

@endsection

@push('scripts')
	<script>
		function openNoteModal(note) {
			const form = document.getElementById('noteForm');
			const title = document.getElementById('noteModalTitle');
			const methodField = document.getElementById('noteMethodField');
			const submitBtn = document.getElementById('noteSubmitBtn');

			if (note) {
				title.textContent = 'Edit Note';
				form.action = `/notes/${note.id}`;
				methodField.innerHTML = '@method('PATCH')';
				submitBtn.innerHTML = '<i class="ti ti-device-floppy me-1"></i> Update Note';

				document.getElementById('note_title').value = note.title || '';
				document.getElementById('note_body').value = note.body || '';
				document.getElementById('note_color').value = note.color || 'default';
				document.getElementById('note_is_pinned').checked = !!note.is_pinned;
			} else {
				title.textContent = 'Add Note';
				form.action = "{{ route('notes.store') }}";
				methodField.innerHTML = '';
				submitBtn.innerHTML = '<i class="ti ti-device-floppy me-1"></i> Save Note';
				form.reset();
			}

			new bootstrap.Modal(document.getElementById('noteModal')).show();
		}
	</script>
@endpush
