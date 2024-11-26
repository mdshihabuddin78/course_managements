<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Module;
use App\Supports\BaseCrudHelper;

class ModuleController extends Controller
{

    use BaseCrudHelper;

    public function __construct()
    {
        $this->model = new Module();
        $this->with = ['permissions:id,module_id,name,status', 'roles', 'parent:id,name'];
    }

//    public function index()
//    {
//        $module = Module::with('permissions:id,module_id,name,status')->get();
//        return $this->retRes('Successfully fetched data', $module, 200);
//    }

//    public function store(Request $request)
//    {
//        $request->validate(['name' => 'required']);
//        $module = Module::create($request->all());
//        return response()->json($module, 201);
//    }
//
//    public function show($id)
//    {
//        return response()->json(Module::findOrFail($id));
//    }
//
//    public function update(Request $request, $id)
//    {
//        $request->validate(['name' => 'required']);
//        $module = Module::findOrFail($id);
//        $module->update($request->all());
//        return response()->json($module);
//    }
//
//    public function destroy($id)
//    {
//        // Check if the module exists before trying to delete it
//        $module = Module::find($id);
//        if (!$module) {
//            return response()->json(['message' => 'Module not found'], 404);
//        }
//
//        $module->delete(); // Use delete method on the model instance
//        return response()->json(null, 204);
//    }
}
