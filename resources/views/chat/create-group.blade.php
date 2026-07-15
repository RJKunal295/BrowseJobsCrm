@extends('layouts.app')

@section('title', 'New Group Chat')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">New Group Chat</h4>
		<a href="{{ route('chat.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to Chat
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('chat.group.store') }}">
				@csrf

				<div class="mb-3">
					<label class="form-label">Group Name <span class="text-danger">*</span></label>
					<input type="text" name="name" class="form-control @error('name') is-invalid @enderror"
						value="{{ old('name') }}" placeholder="e.g. Marketing Team" required>
					@error('name') <div class="invalid-feedback">{{ $message }}</div> @enderror
				</div>

				<div class="mb-3">
					<label class="form-label">Add Members <span class="text-danger">*</span></label>
					<div class="border rounded p-3" style="max-height: 300px; overflow-y: auto;">
						@foreach ($users as $u)
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="participant_ids[]"
									value="{{ $u->id }}" id="member_{{ $u->id }}"
									@checked(collect(old('participant_ids'))->contains($u->id))>
								<label class="form-check-label" for="member_{{ $u->id }}">
									{{ $u->full_name }}
								</label>
							</div>
						@endforeach
					</div>
					@error('participant_ids') <div class="text-danger fs-13 mt-1">{{ $message }}</div> @enderror
				</div>

				<div class="d-flex gap-2">
					<button type="submit" class="btn btn-primary">Create Group</button>
					<a href="{{ route('chat.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection