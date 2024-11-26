<?php

namespace App\Http\Controllers\backend;


use App\Http\Controllers\Controller;
use App\Models\CourseReview;
use App\Models\LessonReview;
use App\Models\Review;
use App\Supports\BaseCrudHelper;
use Exception;
use Illuminate\Http\Request;

class LessonReviewController extends Controller
{
    use BaseCrudHelper;

    public function __construct() {
        $this->model = new LessonReview();
        $this->with = ['lesson:id,title', 'review'];
    }


    public function store(Request $request)
    {
        if (! $this->can($this->task(PERM_ADD)))
            return $this->retNoPermRes(PERM_ADD);

        try {
            // store the review
            mergeAuth($request);
            $review = Review::create($request->all());

            //store course review
            $request->merge(['review_id' => $review->id]);
            LessonReview::create($request->all());
            return retRes('Successfully created record', $review);
        } catch (Exception $e) {
            return retRes('Failed to create record', null, 500);
        }
    }
}
