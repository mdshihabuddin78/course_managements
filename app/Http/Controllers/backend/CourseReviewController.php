<?php

namespace App\Http\Controllers\backend;


use App\Http\Controllers\Controller;
use App\Models\CourseReview;
use App\Models\Review;
use App\Supports\BaseCrudHelper;
use Exception;
use Illuminate\Http\Request;

class CourseReviewController extends Controller
{
    use BaseCrudHelper;

    public function __construct() {
        $this->model = new CourseReview();
        $this->with = ['course:id,title', 'review'];
    }

    // Store a new record
    public function store(Request $request)
    {
        if (! $this->can($this->task(PERM_ADD)))
            return $this->retNoPermRes(PERM_ADD);

        try {
            // store the review
            mergeAuth($request);
            $review = Review::create($request->only(['comment', 'user_id','rating','likes']));

            //store course review
            $request->merge(['review_id' => $review->id]);
            CourseReview::create($request->all());
            return retRes('Successfully created record', $review);
        } catch (Exception $e) {
            return retRes('Failed to create record', null, 500);
        }
    }
}
