@extends('layouts.app')

@section('title', 'Task Details')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Task Details</h4>
		<a href="{{ route('tasks.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	@if (session('success'))
		<div class="alert alert-success alert-dismissible fade show" role="alert">
			{{ session('success') }}
			<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
	@endif

	@php
		$priorityColors = ['low' => 'badge-soft-secondary', 'medium' => 'badge-soft-warning', 'high' => 'badge-soft-danger'];
		$statusColors = ['pending' => 'badge-soft-secondary', 'in_progress' => 'badge-soft-info', 'completed' => 'badge-soft-success'];
		$myPivot = $task->assignees->firstWhere('id', auth()->id())?->pivot;
	@endphp

	<div class="card mb-3">
		<div class="card-body">
			<div class="d-flex align-items-center justify-content-between mb-3 flex-wrap gap-2">
				<h5 class="mb-0">
					{{ $task->title }}
					@if ($task->isOverdue())
						<span class="badge badge-soft-danger ms-1"><i class="ti ti-flag-3"></i> Overdue</span>
					@endif
				</h5>
				<div class="d-flex gap-2">
					<span class="badge {{ $priorityColors[$task->priority] }}">{{ ucfirst($task->priority) }} priority</span>
					<span class="badge {{ $statusColors[$task->status] }}">{{ ucfirst(str_replace('_', ' ', $task->status)) }}</span>
				</div>
			</div>

			<div class="row g-3 mb-3">
				<div class="col-md-4"><strong>Created By:</strong> {{ $task->creator->full_name }}</div>
				<div class="col-md-4"><strong>Due Date:</strong> {{ $task->due_date->format('d M Y') }}</div>
				<div class="col-md-4"><strong>Created On:</strong> {{ $task->created_at->format('d M Y') }}</div>
			</div>

			@if ($task->description)
				<p><strong>Description:</strong> {{ $task->description }}</p>
			@endif

			@if ($isAssignee && !$myPivot->is_completed)
				<form method="POST" action="{{ route('tasks.complete', $task->id) }}"
					onsubmit="return confirm('Mark your portion of this task as complete?');">
					@csrf
					@method('PATCH')
					<button type="submit" class="btn btn-success">
						<i class="ti ti-check me-1"></i> Mark My Portion Complete
					</button>
				</form>
			@elseif ($isAssignee && $myPivot->is_completed)
				<div class="alert alert-success mb-0">
					<i class="ti ti-check me-1"></i> You completed your portion on {{ $myPivot->completed_at ? \Carbon\Carbon::parse($myPivot->completed_at)->format('d M Y, h:i A') : '—' }}.
				</div>
			@endif
		</div>
	</div>

	<div class="card">
		<div class="card-header">
			<h5 class="mb-0 fs-16 fw-bold">Assignee Progress</h5>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-nowrap">
					<thead class="table-white">
						<tr>
							<th>Assignee</th>
							<th>Status</th>
							<th>Completed At</th>
							<th>Flagged Overdue?</th>
						</tr>
					</thead>
					<tbody>
						@foreach ($task->assignees as $a)
							<tr>
								<td>{{ $a->full_name }}</td>
								<td>
									@if ($a->pivot->is_completed)
										<span class="badge badge-soft-success">Completed</span>
									@else
										<span class="badge badge-soft-secondary">Pending</span>
									@endif
								</td>
								<td>{{ $a->pivot->completed_at ? \Carbon\Carbon::parse($a->pivot->completed_at)->format('d M Y, h:i A') : '—' }}</td>
								<td>
									@if ($a->pivot->is_flagged)
										<span class="badge badge-soft-danger"><i class="ti ti-flag-3"></i> Yes</span>
									@else
										<span class="text-muted">No</span>
									@endif
								</td>
							</tr>
						@endforeach
					</tbody>
				</table>
			</div>
		</div>
	</div>

@endsection