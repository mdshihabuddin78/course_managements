<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Supports\BaseCrudHelper;
use App\Supports\MyFileHelper;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    use BaseCrudHelper, MyFileHelper;

    public function __construct() {
        $this->model = new Category();
        $this->with = ['thumbnail:id,path'];

        $this->beforeStore = function ($request) {
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
}
