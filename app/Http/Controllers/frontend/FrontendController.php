<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\PurchasedCourse;
use App\Models\ReviewLike;
use App\Models\Role;
use App\Models\StudentLesson;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FrontendController extends Controller
{
    // for home page
    public function index()
    {
        try {
            $courseQuery = Course::where('status', 1)
                ->with(['thumbnail:id,path', 'category:id,title', 'likes'])
                ->withAvg('reviews', 'rating')
                ->withCount('students');

            $data = [
                'popular_courses' => (clone $courseQuery)
                    ->orderBy('students_count', 'desc')
                    ->take(8)
                    ->get(),

                'new_courses' => $courseQuery
                    ->orderBy('created_at', 'desc')
                    ->take(8)
                    ->get(),

                'categories' => Category::where('status', 1)
                    ->with(['thumbnail', 'courses:id,category_id,title'])
                    ->get()
            ];

            $data['new_courses'] = $data['new_courses']->map(function ($course) {
                $course->created_ago = $course->created_at_human;
                return $course;
            });

            return retRes('Fetched all data for home page', $data);

        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }
    }


    // for courses page
    public function courses(Request $request)
    {
        try {
            $categories = $request->input('categories_id');

            $data = Course::where('status', 1)
                ->when(!empty($categories), function($query) use ($categories) {
                    return $query->whereIn('category_id', $categories);
                })
                ->with(['thumbnail:id,path', 'category:id,title', 'likes', 'reviews'])
                ->withCount('students')
                ->withAvg('reviews', 'rating')
                ->paginate(20);

            return retRes('Fetched all data for courses page', $data);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }
    }

    // for course details page
    public function showCurse($id)
    {
        try {
            $data = [];
            $data['course'] = Course::with(['thumbnail:id,path', 'category:id,title', 'likes', 'lessons.thumbnail:id,path', 'lessons.video:id,duration', 'course_reviews.review.user.avatar', 'quizzes.questions:id,quiz_id,title,option_a,option_b,option_c,option_d', 'user_purchased'])
                ->withCount('students')
                ->findOrFail($id);
            $data['likes'] = $data['course']->likes->pluck('user_id');
            $data['reviews'] = $data['course']->course_reviews->pluck('review');

            $data['reviews_likes'] = [];
            foreach ($data['reviews'] as $review) {
                $data['reviews_likes'][$review->id] = ReviewLike::where('review_id', $review->id)->pluck('user_id');
            }

            $data['lessons_likes'] = [];
            foreach ($data['course']->lessons as $lesson) {
                $data['lessons_likes'][$lesson->id] = $lesson->likes->pluck('user_id');
                    //ReviewLike::where('review_id', $lesson->id)->pluck('user_id');
            }

            $ri = Auth::user() ? PurchasedCourse::where('course_id', $id)->where('user_id', Auth::id())->first() : [];
            if ($ri) {
                $lessonsIds = $data['course']->lessons->pluck('id');
                $ri->completed_lessons_id = StudentLesson::whereIn('lesson_id', $lessonsIds)
                    ->where('user_id', Auth::id())
                    ->where('status', 1)
                    ->pluck('lesson_id');
            }
            $data['running_info'] = $ri ? $ri : [];

            return retRes('Fetched course data for course page', $data);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }
    }

    public function showLesson($id)
    {
        try {
            $data = [];
            $data['lesson'] = Lesson::with([
                'thumbnail:id,path',
                'video:id,path,duration',
                'likes',
                'course.lessons.thumbnail:id,path',
                'course.lessons.video:id,path,duration',
                'lesson_reviews.review.user',
                'quizzes.questions'
            ])->findOrFail($id);

            // Get all lessons in the course and collect their IDs
            $lessons = $data['lesson']->course->lessons;
            $lessonIds = $lessons->pluck('id')->all();
            $currentLessonIndex = array_search($id, $lessonIds);

            // Determine previous and next lessons based on the current lesson's index
            $data['prev'] = $currentLessonIndex > 0 ? $lessons[$currentLessonIndex - 1] : null;
            $data['next'] = $currentLessonIndex < count($lessonIds) - 1 ? $lessons[$currentLessonIndex + 1] : null;


            $data['reviews'] = $data['lesson']->lesson_reviews->pluck('review');
            $data['likes'] = $data['lesson']->likes->pluck('user_id');

            $data['reviews-likes'] = [];
            foreach ($data['reviews'] as $review) {
                $data['reviews-likes'][$review->id] = ReviewLike::where('review_id', $review->id)->pluck('user_id');
            }

            $ri = [];
            if (Auth::user()) {
                $ri = StudentLesson::where('lesson_id', $id)
                    ->where('user_id', Auth::id())
                    ->first();

                if ($ri) {
                    $ric = PurchasedCourse::where('course_id', $data['lesson']->course->id)
                        ->where('user_id', Auth::id())
                        ->first();

                    $ri->current_lesson_id = $ric->current_lesson_id;
                    $ri->ric_id = $ric->id;

                    $lessonsIds = $data['lesson']->course->lessons->pluck('id');
                    $ri->completed_lessons_id = StudentLesson::whereIn('lesson_id', $lessonsIds)
                        ->where('user_id', Auth::id())
                        ->where('status', 1)
                        ->pluck('lesson_id');
                }
            }
            $data['running_info'] = $ri ?: [];

            return retRes('Fetched lesson data for lesson page', $data);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }
    }

    public function purchase($id) {
        try {
            // Ensure user is authenticated
            $user = auth()->user();
            $studentRole = Role::where('name', 'Student')->first(); // Fetch the first match
            if (!$user || !$studentRole || $user->role_id !== $studentRole->id)
                return retRes('User is not authenticated or not a student.', null, CODE_DANGER);

            // Use firstOrNew to find existing purchase or create a new instance
            $purchase = PurchasedCourse::firstOrNew([
                'user_id' => $user->id,
                'course_id' => $id,
            ]);

            // Check if the course has already been purchased
            if ($purchase->exists)
                return retRes('You have already purchased this course.', null, CODE_EXIST);


            $purchase->save();
            return retRes('Course purchased successfully!', $purchase, CODE_SUCCESS);
        } catch (Exception $e) {
            return retRes('Failed to purchase course', null, 500);
        }
    }

    public function updateCourseRunning(Request $request, $id)
    {
        try {
            $record = PurchasedCourse::findOrFail($id);
            if ($record) {
                $data = $request->all();

                if ($request->input('current_lesson_id') < $record->current_lesson_id)
                    unset($data['current_lesson_id']);
                else {
                    // move the crr les id and create new student lesson record
                    $lesson = Lesson::findOrFail($data['current_lesson_id']);
                    if ($lesson) {
                        StudentLesson::create([
                            'user_id' => Auth::id(),
                            'lesson_id' => $lesson->id,
                            'current_quiz_id' => $lesson->quizzes->first() ? $lesson->quizzes->first()->id : null
                        ]);
                    }
                }

                $record->update($data);
                return retRes('Running info updated', $record);
            }

            return retRes('Data not found', null, CODE_NOT_FOUND);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }

    }

    public function updateLessonRunning(Request $request, $id)
    {
        try {
            $record = StudentLesson::findOrFail($id);
            if ($record) {
                $data = $request->all();

                if ($request->input('current_quiz_id') < $record->current_quiz_id)
                    unset($data['current_quiz_id']);

                $record->update($data);
                return retRes('Running info updated', $record);
            }

            return retRes('Data not found', null, CODE_NOT_FOUND);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }

    }
}
