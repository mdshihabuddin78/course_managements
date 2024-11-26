<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\Category;
use App\Models\SubCategory;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        $query = $request->get('query');

        // Search in Users
        $users = User::where('name', 'LIKE', "%{$query}%")
            ->orWhere('email', 'LIKE', "%{$query}%")
            ->get();

        // Search in Courses
        $courses = Course::where('title', 'LIKE', "%{$query}%")
            ->orWhere('description', 'LIKE', "%{$query}%")
            ->with('thumbnail')
            ->with('category')
            ->get();

        // Search in Lessons
        $lessons = Lesson::where('title', 'LIKE', "%{$query}%")
            ->orWhere('description', 'LIKE', "%{$query}%")
            ->get();

        // Search in Categories
        $categories = Category::where('title', 'LIKE', "%{$query}%")
            ->get();

        // Search in SubCategories
        $subcategories = SubCategory::where('title', 'LIKE', "%{$query}%")
            ->get();

        return response()->json([
            'users' => $users,
            'courses' => $courses,
            'lessons' => $lessons,
            'categories' => $categories,
            'subcategories' => $subcategories,
        ]);
    }
}

