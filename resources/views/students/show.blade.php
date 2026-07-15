@extends('layouts.app')

@section('title', 'Student Profile')

@section('content')

	<div class="d-flex align-items-center justify-content-between gap-2 mb-4 flex-wrap">
		<h4 class="mb-0">Student Profile</h4>
		<a href="{{ route('students.index') }}" class="btn btn-outline-light">
			<i class="ti ti-arrow-left me-1"></i> Back to List
		</a>
	</div>

	<div class="card">
		<div class="card-body">
			<div class="d-flex align-items-center gap-3 mb-3">
				<span class="avatar avatar-xl avatar-rounded bg-light text-dark fs-24">
					{{ strtoupper(substr($student->full_name ?? '?', 0, 1)) }}
				</span>
				<div>
					<h5 class="mb-1">{{ $student->full_name ?? trim(($student->first_name ?? '') . ' ' . ($student->last_name ?? '')) }}</h5>
					<span class="badge badge-soft-{{ $student->status === 'active' ? 'success' : 'secondary' }}">
						{{ ucfirst($student->status ?? 'unknown') }}
					</span>
				</div>
			</div>

			<div class="row g-3">
				<div class="col-md-4"><strong>Email:</strong> {{ $student->email ?? '—' }}</div>
				<div class="col-md-4"><strong>Phone:</strong> {{ $student->phone_number ?? '—' }}</div>
				<div class="col-md-4"><strong>Joined:</strong> {{ $student->created_at?->format('d M Y') ?? '—' }}</div>
				<div class="col-md-4"><strong>External ID:</strong> <code>{{ $student->external_id }}</code></div>
			</div>
		</div>
	</div>

	{{-- Enrolled batches, masterclasses, attendance, and mock test results
	     will appear here once those modules are wired up. --}}

@endsection