<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\SubCategory;
use App\Supports\BaseCrudHelper;

class SubCategoryController extends Controller
{
    use BaseCrudHelper;

    public function __construct() {
        $this->model = new SubCategory();
        $this->with = ['category:id,title'];
    }
}
