<?php

namespace Database\Seeders;

use App\Models\Module;
use App\Models\Permission;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class ModulesAndPermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $rawPermissions = ['view', 'add', 'edit', 'delete'];

        $modulesNodes = [
            [
                'module' => ['name' => 'Dashboard', 'link' => '/admin/dashboard', 'icon' => 'mdi mdi-home'],
                'permissions' => $rawPermissions,
                'nodes' => []
            ],
            [
                'module' => ['name' => 'Course', 'icon' => 'fa fa-book'],
                'nodes' => [
                    [
                        'module' => ['name' => 'Courses', 'link' => '/admin/course/courses'],
                        'permissions' => array_merge($rawPermissions, ['accept']),
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Lessons', 'link' => '/admin/course/lessons'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Categories', 'link' => '/admin/course/categories'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Sub Categories', 'link' => '/admin/course/sub-categories'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Pending', 'link' => '/admin/course/pending'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                ]
            ],
            [
                'module' => ['name' => 'Quiz', 'icon' => 'fas fa-clipboard-list'],
                'nodes' => [
                    [
                        'module' => ['name' => 'Quizzes', 'link' => '/admin/quiz/quizzes'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Questions', 'link' => '/admin/quiz/questions'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                ]
            ],
            [
                'module' => ['name' => 'Review', 'icon' => 'fas fa-star'],
                'nodes' => [
                    [
                        'module' => ['name' => 'Reviews', 'link' => '/admin/review/reviews'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Course Reviews', 'link' => '/admin/review/course-review'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Lesson Reviews', 'link' => '/admin/review/lesson-review'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Testimonials', 'link' => '/admin/review/testimonials'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                ]
            ],
            [
                'module' => ['name' => 'User', 'icon' => 'fas fa-user'],
                'nodes' => [
                    [
                        'module' => ['name' => 'Users', 'link' => '/admin/user/users'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Profile', 'link' => '/admin/user/profile'],
                        'permissions' => ['show', 'edit', 'delete'],
                        'nodes' => []
                    ],
                ]
            ],
            [
                'module' => ['name' => 'Configuration', 'icon' => 'fas fa-check-square'],
                'nodes' => [
                    [
                        'module' => ['name' => 'Roles', 'link' => '/admin/config/roles'],
                        'permissions' => array_merge($rawPermissions, ['manage']),
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Modules', 'link' => '/admin/config/modules'],
                        'permissions' => array_merge($rawPermissions, ['manage']),
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Permissions', 'link' => '/admin/config/permissions'],
                        'permissions' => array_merge($rawPermissions, ['manage']),
                        'nodes' => []
                    ],
                    [
                        'module' => ['name' => 'Role Configs', 'link' => '/admin/config/manage-roles'],
                        'permissions' => $rawPermissions,
                        'nodes' => []
                    ],
                ]
            ],
            [
                'module' => ['name' => 'Settings', 'link' => '/admin/settings', 'icon' => 'fas fa-cog'],
                'permissions' => $rawPermissions,
                'nodes' => []
            ],
        ];

        $this->insertModules($modulesNodes);
    }

    /**
     * Recursively insert modules into the database using Eloquent models.
     *
     * @param array $nodes
     * @param int $parentId
     * @return void
     */
    protected function insertModules(array $nodes, $parentId = 0)
    {
        foreach ($nodes as $n) {
            $moduleData = $n['module'];
            $permissions = $n['permissions'] ?? [];
            $moduleData['parent_id'] = $parentId;

            $module = Module::create($moduleData);
            $moduleId = $module->id;

            if (!empty($permissions)) {
                foreach ($permissions as $permission) {
                    Permission::create([
                        'module_id' => $module->id,
                        'name' => $this->formattedModuleName($module->name) . '_' . $permission,
                    ]);
                }
            }

            // Insert child modules
            $this->insertModules($n['nodes'], $moduleId);
        }
    }




    private function formattedModuleName($name)
    {
        /************************************************************************************
         * Convert to lowercase, replace spaces with underscores, and convert to singular:  *
         *      Products => product                                                         *
         *      Sub Categories => sub_category                                              *
         * **********************************************************************************/
        $lowercase = strtolower($name);
        $noSpaces = str_replace(' ', '_', $lowercase);
        return Str::singular($noSpaces);
    }
}