<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Course;
use App\Models\Lesson;
use App\Models\Module;
use App\Models\MyFile;
use App\Models\Quiz;
use App\Models\Role;
use App\Models\Setting;
use App\Models\SubCategory;
use App\Models\User;
use App\Supports\Helper;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SupportController extends Controller
{
    use Helper;

    public function requiredData()
    {
        $data = [];

        if (request()->has('auth')) {
            $data['auth'] = null;
            $auth = Auth::user();
            if ($auth) {
                $data['auth'] = $auth->load('avatar')->load('role');
                $data['auth']['purchased_courses_id'] = $data['auth']->purchased_courses->pluck('id');
                $data['auth']['solved_questions_id'] = $data['auth']->solved_questions->pluck('question_id');
            }
        }


        if (request()->has('users'))
            $data['users'] = User::all();

        if (request()->has('courses'))
            $data['courses'] = Course::all();

        if (request()->has('categories'))
            $data['categories'] = Category::all();

        if (request()->has('sub_categories'))
            $data['sub_categories'] = SubCategory::all();

        if (request()->has('lessons'))
            $data['lessons'] = Lesson::all();

        if (request()->has('my_files'))
            $data['my_files'] = MyFile::all();

        if (request()->has('modules')) {
            $query = Module::query();

            $withRelations = [];
            if (request()->has('with_permissions'))
                $withRelations[] = 'permissions:id,module_id,name,status';

            if (request()->has('with_roles'))
                $withRelations[] = 'roles';

            if (request()->has('parents_only'))
                $query->where('parent_id', 0);

            if (!empty($withRelations))
                $data['modules'] = $query->with($withRelations)->get();
            else
                $data['modules'] = $query->get();
        }


        if (request()->has('roles'))
            $data['roles'] = Role::all();

        if (request()->has('quizzes'))
            $data['quizzes'] = Quiz::where('status', 0)->get(['id', 'title']); // ret not added == 0

        if (request()->has('items_per_page')) {
            $p = Setting::where('key', 'items_per_page')->first();
            $data['items_per_page'] = $p ? $p->value : 10;
        }

        return retRes('Successfully fetched all records', $data);
    }



    public function getConfigurations()
    {
        $permittedModuleId = [];
        if (auth()->user() && auth()->user()->role_id)
            $permittedModuleId = DB::table('role_modules')->where('role_id', auth()->user()->role_id)->get()->pluck('module_id')->toArray();

        $data['modules'] = Module::where('parent_id', 0)
            ->whereIn('id', $permittedModuleId)
            ->with(['sub_modules'=>function ($subModules) use ($permittedModuleId) {
                $subModules->whereIn('id', $permittedModuleId);
            }])
            ->get()->toArray();

        $data['permissions'] = $this->authPermissions();

        $auth = Auth::user();
        if ($auth) $auth->load('avatar')->load('role');
        $data['auth'] = $auth;

        $data['settings'] = Setting::pluck('value', 'key')->toArray();

        return retRes('Successfully fetched all records', $data);
    }
}
