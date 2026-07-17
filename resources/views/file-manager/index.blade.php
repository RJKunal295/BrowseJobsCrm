@extends('layouts.app')

@section('title', 'File Manager')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">File Manager</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>File Manager</span>
			</nav>
		</div>
		<div class="d-flex gap-2">
			@if ($googleAccount)
				<form method="POST" action="{{ route('file-manager.google.disconnect') }}"
					onsubmit="return confirm('Disconnect Google Drive? New files will be stored locally only.');">
					@csrf
					<button type="submit" class="btn btn-outline-success">
						<i class="ti ti-brand-google-drive me-1"></i>
						{{ $googleAccount->google_email ? 'Drive: '.$googleAccount->google_email : 'Drive connected' }}
						<span class="ms-1 text-danger">&times;</span>
					</button>
				</form>
			@elseif ($oauthAvailable)
				<a href="{{ route('file-manager.google.connect') }}" class="btn btn-outline-primary">
					<i class="ti ti-brand-google-drive me-1"></i> Connect Google Drive
				</a>
			@endif
			<button type="button" class="btn btn-outline-primary" onclick="openFolderModal()">
				<i class="ti ti-folder-plus me-1"></i> New Folder
			</button>
			<button type="button" class="btn btn-primary" onclick="openUploadModal()">
				<i class="ti ti-upload me-1"></i> Upload File
			</button>
		</div>
	</div>

	@foreach (['success' => 'success', 'warning' => 'warning', 'error' => 'danger'] as $key => $type)
		@if (session($key))
			<div class="alert alert-{{ $type }} alert-dismissible fade show" role="alert">
				{{ session($key) }}
				<button type="button" class="btn-close" data-bs-dismiss="alert"></button>
			</div>
		@endif
	@endforeach

	@if (! $driveReady)
		<div class="alert alert-info fs-13">
			<i class="ti ti-info-circle me-1"></i>
			@if ($oauthAvailable)
				<strong>Google Drive not connected.</strong> Files are stored locally only. Click
				<strong>Connect Google Drive</strong> above to sign in with your Google account — new folders and files
				will then upload into your Drive automatically.
			@else
				<strong>Google Drive not connected.</strong> Files are stored locally only. To enable Drive sync, set
				<code>GOOGLE_OAUTH_CLIENT_ID</code> / <code>GOOGLE_OAUTH_CLIENT_SECRET</code> in <code>.env</code> and
				register the redirect URI <code>{{ config('services.google_drive.oauth.redirect') }}</code> in your
				Google Cloud OAuth client.
			@endif
		</div>
	@endif

	<!-- Breadcrumb trail -->
	<div class="card mb-3">
		<div class="card-body py-2">
			<nav class="d-flex align-items-center flex-wrap gap-1 fs-14">
				<a href="{{ route('file-manager.index') }}" class="text-decoration-none">
					<i class="ti ti-home me-1"></i>Root
				</a>
				@foreach ($breadcrumbs as $crumb)
					<i class="ti ti-chevron-right text-muted"></i>
					@if ($loop->last)
						<span class="fw-medium">{{ $crumb->name }}</span>
					@else
						<a href="{{ route('file-manager.browse', $crumb->id) }}" class="text-decoration-none">{{ $crumb->name }}</a>
					@endif
				@endforeach
			</nav>
		</div>
	</div>

	<!-- Folders -->
	<div class="row">
		@forelse ($folders as $subfolder)
			<div class="col-xl-2 col-lg-3 col-md-4 col-6 mb-3">
				<div class="card h-100 text-center">
					<div class="card-body">
						<a href="{{ route('file-manager.browse', $subfolder->id) }}" class="text-decoration-none d-block">
							<i class="ti ti-folder-filled text-warning" style="font-size: 3rem;"></i>
							<div class="mt-2 text-truncate fw-medium text-body">{{ $subfolder->name }}</div>
						</a>
						<div class="mt-1">
							@if ($subfolder->synced)
								<span class="badge badge-soft-success fs-11"><i class="ti ti-brand-google-drive"></i> Synced</span>
							@else
								<span class="badge badge-soft-secondary fs-11">Local</span>
							@endif
						</div>
						<form method="POST" action="{{ route('file-manager.folders.destroy', $subfolder->id) }}"
							onsubmit="return confirm('Delete this folder and everything inside it?');" class="mt-2">
							@csrf
							@method('DELETE')
							<button type="submit" class="btn btn-sm btn-outline-danger">
								<i class="ti ti-trash"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		@empty
		@endforelse
	</div>

	<!-- Files -->
	<div class="card">
		<div class="card-header">
			<h6 class="mb-0">Files</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Name</th>
							<th>Type</th>
							<th>Size</th>
							<th>Drive</th>
							<th>Uploaded</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($files as $file)
							<tr>
								<td><i class="ti ti-file me-1 text-muted"></i>{{ $file->name }}</td>
								<td class="fs-13 text-muted">{{ $file->mime ?? '—' }}</td>
								<td>{{ number_format($file->size / 1024, 1) }} KB</td>
								<td>
									@if ($file->synced && $file->drive_link)
										<a href="{{ $file->drive_link }}" target="_blank" rel="noopener"
											class="badge badge-soft-success text-decoration-none">
											<i class="ti ti-brand-google-drive"></i> View
										</a>
									@elseif ($file->synced)
										<span class="badge badge-soft-success">Synced</span>
									@else
										<span class="badge badge-soft-secondary">Local</span>
									@endif
								</td>
								<td>{{ $file->created_at->format('d M Y, h:i A') }}</td>
								<td>
									<div class="d-flex gap-2">
										<a href="{{ route('file-manager.files.download', $file->id) }}"
											class="btn btn-sm btn-icon btn-outline-light">
											<i class="ti ti-download"></i>
										</a>
										<form method="POST" action="{{ route('file-manager.files.destroy', $file->id) }}"
											onsubmit="return confirm('Delete this file?');">
											@csrf
											@method('DELETE')
											<button type="submit" class="btn btn-sm btn-icon btn-outline-danger">
												<i class="ti ti-trash"></i>
											</button>
										</form>
									</div>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="6" class="text-center py-4">This folder is empty.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- New Folder Modal -->
	<div class="modal fade" id="folderModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" action="{{ route('file-manager.folders.store') }}">
					@csrf
					<input type="hidden" name="parent_id" value="{{ $folder?->id }}">
					<div class="modal-header">
						<h5 class="modal-title">New Folder</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<label class="form-label">Folder name <span class="text-danger">*</span></label>
						<input type="text" name="name" class="form-control" placeholder="e.g. Invoices" required autofocus>
						@if ($driveReady)
							<div class="form-text"><i class="ti ti-brand-google-drive me-1"></i>This folder will also be created in Google Drive automatically.</div>
						@endif
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary"><i class="ti ti-folder-plus me-1"></i> Create</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Upload File Modal -->
	<div class="modal fade" id="uploadModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" action="{{ route('file-manager.files.upload') }}" enctype="multipart/form-data">
					@csrf
					<input type="hidden" name="folder_id" value="{{ $folder?->id }}">
					<div class="modal-header">
						<h5 class="modal-title">Upload File</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<div class="modal-body">
						<label class="form-label">Choose file <span class="text-danger">*</span></label>
						<input type="file" name="file" class="form-control" required>
						<div class="form-text">Up to 50 MB.
							@if ($driveReady)<i class="ti ti-brand-google-drive ms-1"></i> Auto-uploaded to Google Drive.@endif
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary"><i class="ti ti-upload me-1"></i> Upload</button>
					</div>
				</form>
			</div>
		</div>
	</div>

@endsection

@push('scripts')
	<script>
		function openFolderModal() {
			new bootstrap.Modal(document.getElementById('folderModal')).show();
		}

		function openUploadModal() {
			new bootstrap.Modal(document.getElementById('uploadModal')).show();
		}
	</script>
@endpush
