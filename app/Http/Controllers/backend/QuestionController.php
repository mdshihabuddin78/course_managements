<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Question;
use App\Supports\BaseCrudHelper;

class QuestionController extends Controller
{
    use BaseCrudHelper;

    public function __construct()
    {
        $this->model = new Question();
        $this->with = ['quiz:id,title'];
    }
}
