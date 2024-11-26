<?php

namespace App\Http\Controllers;

use App\Models\ReviewLike;
use App\Supports\BaseCrudHelper;
use Illuminate\Http\Request;

class ReviewLikeController extends Controller
{
    use BaseCrudHelper;

    function __construct()
    {
        $this->model = new ReviewLike();
    }
}
