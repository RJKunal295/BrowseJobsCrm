@extends('layouts.app')

@section('title', 'To Do')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<div>
			<h4 class="mb-0">To Do</h4>
			<nav class="fs-13 text-muted">
				<a href="{{ url('/') }}" class="text-muted">Home</a> &gt; <span>To Do</span>
			</nav>
		</div>
		<button type="button" class="btn btn-primary" onclick="openTodoModal()">
			<i class="ti ti-plus me-1"></i> Add Task
		</button>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	<!-- Stat Cards -->
	<div class="row mb-3">
		<div class="col-md-4 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Active</p>
					<h4 class="mb-0">{{ $activeCount }}</h4>
					<span class="avatar avatar-rounded bg-primary-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-list-check text-primary"></i>
					</span>
				</div>
			</div>
		</div>
		<div class="col-md-4 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Overdue</p>
					<h4 class="mb-0">{{ $overdueCount }}</h4>
					<span class="avatar avatar-rounded bg-danger-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-alarm text-danger"></i>
					</span>
				</div>
			</div>
		</div>
		<div class="col-md-4 col-sm-6 mb-3">
			<div class="card h-100">
				<div class="card-body position-relative">
					<p class="fw-medium mb-1">Completed</p>
					<h4 class="mb-0">{{ $completedCount }}</h4>
					<span class="avatar avatar-rounded bg-success-transparent position-absolute top-0 end-0 m-3">
						<i class="ti ti-circle-check text-success"></i>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- End Stat Cards -->

	<div class="card">
		<div class="card-header d-flex align-items-center justify-content-between flex-wrap gap-2">
			<ul class="nav nav-pills">
				@foreach (['active' => 'Active', 'completed' => 'Completed', 'all' => 'All'] as $key => $label)
					<li class="nav-item">
						<a class="nav-link {{ $filter === $key ? 'active' : '' }}"
							href="{{ route('todos.index', ['filter' => $key]) }}">{{ $label }}</a>
					</li>
				@endforeach
			</ul>
			<form method="GET" action="{{ route('todos.index') }}" class="d-flex gap-2">
				<input type="hidden" name="filter" value="{{ $filter }}">
				<input type="text" name="search" class="form-control form-control-sm" placeholder="Search..."
					value="{{ request('search') }}" style="min-width: 200px;">
				<select name="priority" class="form-select form-select-sm" style="width: auto;">
					<option value="">All priority</option>
					<option value="high" @selected(request('priority') === 'high')>High</option>
					<option value="medium" @selected(request('priority') === 'medium')>Medium</option>
					<option value="low" @selected(request('priority') === 'low')>Low</option>
				</select>
				<button type="submit" class="btn btn-sm btn-primary"><i class="ti ti-filter"></i></button>
			</form>
		</div>
		<div class="card-body">
			@php
				$priorityColors = ['high' => 'badge-soft-danger', 'medium' => 'badge-soft-warning', 'low' => 'badge-soft-secondary'];
			@endphp
			<div class="list-group list-group-flush">
				@forelse ($todos as $todo)
					@php
						$isOverdue = ! $todo->is_completed && $todo->due_date && $todo->due_date->isPast();
					@endphp
					<div class="list-group-item d-flex align-items-center gap-3 px-0">
						<form method="POST" action="{{ route('todos.complete', $todo->id) }}">
							@csrf
							@method('PATCH')
							<button type="submit" class="btn btn-sm btn-icon border-0 p-0" title="Toggle complete">
								<i class="ti {{ $todo->is_completed ? 'ti-circle-check-filled text-success' : 'ti-circle' }} fs-4"></i>
							</button>
						</form>

						<div class="flex-grow-1">
							<div class="fw-medium {{ $todo->is_completed ? 'text-decoration-line-through text-muted' : '' }}">
								{{ $todo->title }}
							</div>
							@if ($todo->notes)
								<div class="fs-12 text-muted">{{ \Illuminate\Support\Str::limit($todo->notes, 120) }}</div>
							@endif
						</div>

						<span class="badge {{ $priorityColors[$todo->priority] }} text-capitalize">{{ $todo->priority }}</span>

						@if ($todo->due_date)
							<span class="fs-12 {{ $isOverdue ? 'text-danger fw-medium' : 'text-muted' }}">
								<i class="ti ti-calendar-event me-1"></i>{{ $todo->due_date->format('d M Y') }}
							</span>
						@endif

						<div class="d-flex gap-2">
							<button type="button" class="btn btn-sm btn-icon btn-outline-light"
								onclick='openTodoModal(@json($todo))'>
								<i class="ti ti-edit"></i>
							</button>
							<form method="POST" action="{{ route('todos.destroy', $todo->id) }}"
								onsubmit="return confirm('Delete this task?');">
								@csrf
								@method('DELETE')
								<button type="submit" class="btn btn-sm btn-icon btn-outline-danger">
									<i class="ti ti-trash"></i>
								</button>
							</form>
						</div>
					</div>
				@empty
					<div class="text-center py-5 text-muted">
						<i class="ti ti-checklist fs-1 d-block mb-2"></i>
						No tasks here. Add one to get started.
					</div>
				@endforelse
			</div>
		</div>
	</div>

	<!-- Add/Edit Todo Modal -->
	<div class="modal fade" id="todoModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<form method="POST" id="todoForm" action="{{ route('todos.store') }}">
					@csrf
					<div id="todoMethodField"></div>

					<div class="modal-header">
						<h5 class="modal-title" id="todoModalTitle">Add Task</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<div class="modal-body">
						<div class="row g-3">
							<div class="col-md-12">
								<label class="form-label">Task <span class="text-danger">*</span></label>
								<input type="text" name="title" id="todo_title" class="form-control"
									placeholder="What needs to be done?" required>
							</div>
							<div class="col-md-6">
								<label class="form-label">Priority</label>
								<select name="priority" id="todo_priority" class="form-select">
									<option value="high">High</option>
									<option value="medium" selected>Medium</option>
									<option value="low">Low</option>
								</select>
							</div>
							<div class="col-md-6">
								<label class="form-label">Due date</label>
								<input type="date" name="due_date" id="todo_due_date" class="form-control">
							</div>
							<div class="col-md-12">
								<label class="form-label">Notes</label>
								<textarea name="notes" id="todo_notes" rows="3" class="form-control"
									placeholder="Optional details..."></textarea>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="todoSubmitBtn">
							<i class="ti ti-device-floppy me-1"></i> Save Task
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
		function openTodoModal(todo) {
			const form = document.getElementById('todoForm');
			const title = document.getElementById('todoModalTitle');
			const methodField = document.getElementById('todoMethodField');
			const submitBtn = document.getElementById('todoSubmitBtn');

			if (todo) {
				title.textContent = 'Edit Task';
				form.action = `/todos/${todo.id}`;
				methodField.innerHTML = '@method('PATCH')';
				submitBtn.innerHTML = '<i class="ti ti-device-floppy me-1"></i> Update Task';

				document.getElementById('todo_title').value = todo.title || '';
				document.getElementById('todo_priority').value = todo.priority || 'medium';
				document.getElementById('todo_due_date').value = todo.due_date ? todo.due_date.substring(0, 10) : '';
				document.getElementById('todo_notes').value = todo.notes || '';
			} else {
				title.textContent = 'Add Task';
				form.action = "{{ route('todos.store') }}";
				methodField.innerHTML = '';
				submitBtn.innerHTML = '<i class="ti ti-device-floppy me-1"></i> Save Task';
				form.reset();
			}

			new bootstrap.Modal(document.getElementById('todoModal')).show();
		}
	</script>
@endpush
