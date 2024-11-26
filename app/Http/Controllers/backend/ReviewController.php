<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Review;
use App\Models\ReviewLike;
use App\Supports\BaseCrudHelper;
use App\Supports\LikeHelper;
use Illuminate\Http\Request;

class ReviewController extends Controller
{
    use BaseCrudHelper, LikeHelper;

    public function __construct() {
        $this->model = new Review();
        $this->with = ['user'];
    }


    public function reviewLike(Request $request){
        return $this->likeHelper($request, new ReviewLike(), 'review');
    }
}
