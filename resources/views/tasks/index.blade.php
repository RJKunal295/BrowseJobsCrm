@extends('layouts.app')

@section('title', 'Tasks')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Tasks{{ $isMonitor ? ' — All (Monitor View)' : '' }}</h4>
		<a href="{{ route('tasks.create') }}" class="btn btn-primary">
			<i class="ti ti-plus me-1"></i> New Task
		</a>
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
			<form method="GET" action="{{ route('tasks.index') }}" class="row g-3 align-items-end">
				<div class="col-md-3">
					<label class="form-label">Status</label>
					<select name="status" class="form-select">
						<option value="">All</option>
						<option value="pending" @selected(request('status') === 'pending')>Pending</option>
						<option value="in_progress" @selected(request('status') === 'in_progress')>In Progress</option>
						<option value="completed" @selected(request('status') === 'completed')>Completed</option>
						<option value="overdue" @selected(request('status') === 'overdue')>Overdue</option>
					</select>
				</div>
				@if ($isMonitor)
					<div class="col-md-3">
						<label class="form-label">Assignee</label>
						<select name="assignee_id" class="form-select">
							<option value="">All</option>
							@foreach ($users as $u)
								<option value="{{ $u->id }}" @selected(request('assignee_id') == $u->id)>{{ $u->full_name }}</option>
							@endforeach
						</select>
					</div>
				@endif
				<div class="col-md-3 d-flex gap-2">
					<button type="submit" class="btn btn-primary"><i class="ti ti-filter me-1"></i> Filter</button>
					<a href="{{ route('tasks.index') }}" class="btn btn-outline-light">Reset</a>
				</div>
			</form>
		</div>
	</div>
	<!-- End Filters -->

	<div class="card">
		<div class="card-body">
			<div class="table-responsive custom-table">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>##</th>
							<th>Title</th>
							<th>Assignees</th>
							<th>Due Date</th>
							<th>Priority</th>
							<th>Status</th>
							<th>Progress</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						@forelse ($tasks as $index => $task)
							@php
								$total = $task->assignees->count();
								$done = $task->assignees->where('pivot.is_completed', true)->count();
								$overdue = $task->isOverdue();
								$priorityColors = ['low' => 'badge-soft-secondary', 'medium' => 'badge-soft-warning', 'high' => 'badge-soft-danger'];
								$statusColors = ['pending' => 'badge-soft-secondary', 'in_progress' => 'badge-soft-info', 'completed' => 'badge-soft-success'];
							@endphp
							<tr @if ($overdue) style="background-color:#fff5f5;" @endif>
								<td @if ($overdue) style="border-left:3px solid #dc3545;" @endif>{{ $index + 1 }}</td>
								<td>
									{{ $task->title }}
									@if ($overdue)
										<span class="badge badge-soft-danger ms-1"><i class="ti ti-flag-3"></i> Overdue</span>
									@endif
								</td>
								<td>
									@foreach ($task->assignees as $a)
										<span class="badge {{ $a->pivot->is_completed ? 'badge-soft-success' : 'badge-soft-secondary' }} me-1">
											{{ $a->full_name }}
										</span>
									@endforeach
								</td>
								<td>{{ $task->due_date->format('d M Y') }}</td>
								<td><span class="badge {{ $priorityColors[$task->priority] }}">{{ ucfirst($task->priority) }}</span></td>
								<td><span class="badge {{ $statusColors[$task->status] }}">{{ ucfirst(str_replace('_', ' ', $task->status)) }}</span></td>
								<td>{{ $done }} / {{ $total }}</td>
								<td>
									<a href="{{ route('tasks.show', $task->id) }}" class="btn btn-sm btn-outline-light">
										<i class="ti ti-eye"></i> View
									</a>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="7" class="text-center py-4">No tasks found.</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>

			<div class="mt-3">
				{{ $tasks->links() }}
			</div>
		</div>
	</div>

@endsection