<?php

namespace App\Http\Controllers\backend;

use App\Models\LessonLike;
use App\Models\LessonQuiz;
use App\Supports\LikeHelper;
use App\Supports\MyFileHelper;
use Illuminate\Http\Request;
use Exception;

use App\Http\Controllers\Controller;
use App\Models\Lesson;
use App\Supports\BaseCrudHelper;

class LessonController extends Controller
{
    use BaseCrudHelper, MyFileHelper, LikeHelper;

    public function __construct() {
        $this->model = new Lesson();
        $this->with = ['thumbnail:id,path', 'video:id,path', 'course:id,title', 'likes', 'quizzes'];



        $this->beforeStore = function ($request) {
            $this->storeFile($request, 'thumbnail');
            $this->storeFile($request, 'video');
        };

        $this->beforeUpdate = function ($request) {
            $this->updateFile($request, 'thumbnail');
            $this->updateFile($request, 'video');
        };

        $this->afterDelete = function ($record) {
            if ($record && $record->thumbnail_id) { // delete also file
                $this->deleteFile($record->thumbnail_id);
                $this->deleteFile($record->video_id);
            }
        };
    }

    public function lessonLike(Request $request) {
        return $this->likeHelper($request, new LessonLike(), 'lesson');
    }
}
