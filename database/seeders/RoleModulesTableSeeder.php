<?php

namespace Database\Seeders;

use App\Models\Module;
use App\Models\Role;
use App\Models\RoleModule;
use Illuminate\Database\Seeder;

class RoleModulesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->giveRoleModules('Super Admin');
        $this->giveRoleModules('Admin', ['Dashboard', 'Product', 'Products', 'Category', 'Categories', 'Sub Categories', 'User', 'Profile', 'Users']);
        $this->giveRoleModules('Instructor', ['Dashboard', 'Course', 'Courses', 'User', 'Profile']);
    }


    private function giveRoleModules($roleName, array $modules = ['all'])
    {
        $role = Role::where('name', $roleName)->first();
        if (!$role) return;

        $moduleIDs = [];

        if (count($modules) === 1 && $modules[0] === 'all') {
            $moduleIDs = Module::pluck('id')->toArray();
        } else {
            // Get specific module IDs
            foreach ($modules as $moduleName) {
                $module = Module::where('name', $moduleName)->first();
                if ($module) $moduleIDs[] = $module->id;
            }
        }

        // Insert role-module records
        foreach ($moduleIDs as $permID) {
            RoleModule::create([
                'role_id' => $role->id,
                'module_id' => $permID,
            ]);
        }
    }
}