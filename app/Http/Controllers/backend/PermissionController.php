<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Permission;
use App\Supports\BaseCrudHelper;
use Illuminate\Http\Request;

class PermissionController extends Controller
{

    use BaseCrudHelper;

    public function __construct()
    {
        $this->model = new Permission();
        $this->with = ['module', 'roles'];
    }

//    public function index()
//    {
//        return response()->json(Permission::all());
//    }
//
//    public function store(Request $request)
//    {
//        $request->validate([
//            'name' => 'required',
//            'module_id' => 'required|exists:modules,id', // Ensure module_id exists in the modules table
//        ]);
//
//        $permission = Permission::create($request->all());
//        return response()->json($permission, 201);
//    }
//
//
//
//    public function show($id) // Changed parameter to $id
//    {
//        return response()->json(Permission::findOrFail($id));
//    }
//
//    public function update(Request $request, $id)
//    {
//        $request->validate(['name' => 'required']);
//        $permission = Permission::findOrFail($id);
//        $permission->update($request->all());
//        return response()->json($permission);
//    }
//
//    public function destroy($id) // Changed parameter to $id
//    {
//        Permission::destroy($id);
//        return response()->json(null, 204);
//    }
}
