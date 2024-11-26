<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\Permission;
use App\Models\Role;
use App\Models\RoleModule;
use App\Models\RolePermission;
use App\Supports\BaseCrudHelper;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use function League\Flysystem\delete;

class RoleController extends Controller
{
    use BaseCrudHelper;

    public function __construct()
    {
        $this->model = new Role(); // Inject the Role model // Example: eager load 'permissions' and 'users' for show
        $this->with = ['users', 'permissions', 'modules:id,name'];
    }


    public function show($id)
    {
        try {
            // Fetch the record with optional relationships
            $record = Role::with('users:id,role_id,name')->findOrFail($id);

            $record->setAttribute('modules', RoleModule::where('role_id', $id)->pluck('module_id')->toArray());
            $record->setAttribute('permissions', RolePermission::where('role_id', $id)->pluck('permission_id')->toArray());

            return retRes('Successfully found record', $record, 200); // Use the standard 200 status code
        } catch (ModelNotFoundException $e) {
            return retRes('Record not found', null, 404);
        } catch (\Exception $e) {
            return retRes('Something went wrong with fetching the record', null, 500);
        }
    }

    public function addPermission(Request $request)
    {
        $record = null;
        try {
            if ($request->module_id) {
                $record = RoleModule::create($request->all());
            } else if ($request->permission_id) {
                $record = RolePermission::create($request->all());
            } else {
                return retRes('Invalid data provided', $record, 400); // Handle invalid type error
            }

            return retRes('Permission added successfully', $record); // Success response
        } catch (\Exception $e) {
            return retRes('Something went wrong with adding new permission', $record, 500);
        }
    }

    public function removePermission(Request $request)
    {
        try {
            $data = ['modules' => [], 'permissions' => []];
            $roleId = $request->role_id;

            // Check if module_id is provided
            if ($moduleId = $request->module_id) {
                $record = RoleModule::where('role_id', $roleId)->where('module_id', $moduleId)->first();

                if ($record) {
                    // Remove all permissions related to the module in a single query
                    $permissionIds = Permission::where('module_id', $moduleId)->pluck('id')->toArray();
                    RolePermission::where('role_id', $roleId)->whereIn('permission_id', $permissionIds)->delete();

                    $data['modules'][] = $moduleId;
                    $data['permissions'] = array_merge($data['permissions'], $permissionIds);
                }
            }
            // Check if permission_id is provided
            else if ($permissionId = $request->permission_id) {
                $record = RolePermission::where('role_id', $roleId)->where('permission_id', $permissionId)->first();

                if ($record) {
                    $data['permissions'][] = $permissionId;
                }
            }
            // Handle invalid data
            else {
                return retRes('Invalid data provided', null, 400);
            }

            // If the record is found, delete it and return success response
            if (isset($record) && $record) {
                $record->delete();
                return retRes('Permission deleted successfully', $data);
            }

            return retRes('Record not found', null, 404);
        } catch (\Exception $e) {
            return retRes('Something went wrong with removing the permission', null, 500);
        }
    }
}
