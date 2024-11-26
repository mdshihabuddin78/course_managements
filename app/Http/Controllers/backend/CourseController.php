<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\CourseLike;
use App\Models\PurchasedCourse;
use App\Models\Role;
use App\Models\StudentLesson;
use App\Supports\BaseCrudHelper;
use App\Supports\LikeHelper;
use App\Supports\MyFileHelper;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CourseController extends Controller

{
    use BaseCrudHelper, MyFileHelper, LikeHelper;

    public function __construct()
    {
        $this->model = new Course();
        $this->with = ['thumbnail:id,path', 'category:id,title', 'sub_category:id,title', 'likes', 'quizzes'];
        $this->showWith = ['thumbnail:id,path', 'category:id,title', 'likes', 'lessons', 'reviews.review.user'];


        $this->beforeFetch = function ($query) {
            if (request()->has('get_pending'))
                $query->where('status', 2);
        };

        $this->beforeStore = function ($request) {
            $request->merge(['status' => getSetting('default_course_status')]);
            $this->storeFile($request, 'thumbnail');
        };

        $this->beforeUpdate = function ($request) {
            $this->updateFile($request, 'thumbnail');
        };

        $this->afterDelete = function ($record) {
            if ($record && $record->thumbnail_id) { // delete also file
                $this->deleteFile($record->thumbnail_id);
            }
        };
    }

    public function doLike(Request $request) {
        return $this->likeHelper($request, new CourseLike(), 'course');
    }
}
