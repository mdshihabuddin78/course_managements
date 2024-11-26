<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use App\Supports\BaseCrudHelper;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    use BaseCrudHelper;

    public function __construct()
    {
        $this->model = new Setting();
    }


    public function index()
    {
        if ($this->checkAuth && !$this->can($this->task(PERM_VIEW)))
            return $this->retNoPermRes(PERM_VIEW);

        try {
            $settings = $this->model->get()->groupBy('group');
            return retRes('Successfully fetched all records', $settings);
        } catch (Exception $e) {
            return retRes('Failed to fetch records', null, 500);
        }
    }



    public function updateAll(Request $request)
    {
        if ($this->checkAuth && !$this->can($this->task(PERM_EDIT)))
            return $this->retNoPermRes(PERM_EDIT);

        try {
            foreach ($request->all() as $sg) {
                foreach ($sg as $setting) {
                    Setting::where('key', $setting['key'])->update(['value' => $setting['value']]);
                }
            }


            $settings = Setting::pluck('value', 'key')->toArray();
            return retRes('Successfully updated record', $settings);
        } catch (Exception $e) {
            return retRes('Failed to update record', null, 500);
        }
    }
}
