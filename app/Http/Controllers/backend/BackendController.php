<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\Role;
use App\Models\User;
use Exception;

class BackendController extends Controller
{
    // for dashboard page
    public function dashboard()
    {
        try {
            $data = [];
            $data['courses'] = Course::select('id', 'title')->get();
            $data['lessons'] = Lesson::select('id', 'title')->get();

            $student_role_id = Role::where('name', 'Student')->value('id');
            $data['students'] = User::where('role_id', $student_role_id)->select('id', 'name')->get();

            $instructor_role_id = Role::where('name', 'Instructor')->value('id');
            $data['instructors'] = User::where('role_id', $instructor_role_id)->select('id', 'name')->get();

            return retRes('Fetched all data for dashboard page', $data);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }
    }

}
