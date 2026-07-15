@extends('layouts.app')

@section('title', 'New Task')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">New Task</h4>
		<a href="{{ route('tasks.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<form method="POST" action="{{ route('tasks.store') }}">
				@csrf

				<div class="row g-3">
					<div class="col-md-8">
						<label class="form-label">Task Title <span class="text-danger">*</span></label>
						<input type="text" name="title" class="form-control @error('title') is-invalid @enderror"
							value="{{ old('title') }}" required>
						@error('title') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Due Date <span class="text-danger">*</span></label>
						<input type="date" name="due_date" class="form-control @error('due_date') is-invalid @enderror"
							value="{{ old('due_date') }}" required>
						@error('due_date') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-4">
						<label class="form-label">Priority <span class="text-danger">*</span></label>
						<select name="priority" class="form-select @error('priority') is-invalid @enderror" required>
							<option value="low" @selected(old('priority') === 'low')>Low</option>
							<option value="medium" @selected(old('priority', 'medium') === 'medium')>Medium</option>
							<option value="high" @selected(old('priority') === 'high')>High</option>
						</select>
						@error('priority') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-12">
						<label class="form-label">Description</label>
						<textarea name="description" rows="3"
							class="form-control @error('description') is-invalid @enderror">{{ old('description') }}</textarea>
						@error('description') <div class="invalid-feedback">{{ $message }}</div> @enderror
					</div>

					<div class="col-md-12">
						<label class="form-label">Assign To <span class="text-danger">*</span></label>
						<div class="border rounded p-3" style="max-height: 260px; overflow-y: auto;">
							@foreach ($users as $u)
								<div class="form-check">
									<input class="form-check-input" type="checkbox" name="assignee_ids[]"
										value="{{ $u->id }}" id="assignee_{{ $u->id }}"
										@checked(collect(old('assignee_ids'))->contains($u->id))>
									<label class="form-check-label" for="assignee_{{ $u->id }}">
										{{ $u->full_name }}
									</label>
								</div>
							@endforeach
						</div>
						<small class="text-muted">Select one or more people. Each will be notified and can mark their own portion complete.</small>
						@error('assignee_ids') <div class="text-danger fs-13 mt-1">{{ $message }}</div> @enderror
					</div>
				</div>

				<div class="mt-4 d-flex gap-2">
					<button type="submit" class="btn btn-primary">Create Task</button>
					<a href="{{ route('tasks.index') }}" class="btn btn-outline-light">Cancel</a>
				</div>
			</form>
		</div>
	</div>

@endsection