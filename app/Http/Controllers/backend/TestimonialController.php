<?php

namespace App\Http\Controllers\backend;


use App\Http\Controllers\Controller;
use App\Models\Testimonial;
use App\Supports\BaseCrudHelper;

class TestimonialController extends Controller
{
    use BaseCrudHelper;

    public function __construct() {
        $this->model = new Testimonial();
        $this->with = ['review'];
    }
}
