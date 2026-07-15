<?php

namespace App\Http\Controllers;

use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\View\View;

class StudentController extends Controller
{
    public function index(Request $request): View
    {
        $query = Student::search($request->input('search'));

        if ($request->filled('status')) {
            $query->where('status', $request->input('status'));
        }

        $students = $query->orderByDesc('created_at')->paginate(20)->withQueryString();

        $statuses = Student::select('status')->distinct()->whereNotNull('status')->pluck('status');

        $totalStudents = Student::count();
        $activeStudents = Student::where('status', 'active')->count();

        return view('students.index', compact('students', 'statuses', 'totalStudents', 'activeStudents'));
    }

    public function show(Student $student): View
    {
        return view('students.show', compact('student'));
    }
}