<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $settings =[
            // General Settings
            [
                'key' => 'application_name',
                'name' => 'Application Name',
                'type' => 'text',
                'group' => 'general',
                'value' => 'SkillSyntax'
            ],
            [
                'key' => 'application_slogan',
                'name' => 'Application Slogan',
                'type' => 'text',
                'group' => 'general',
                'value' => ' Be A Skilled Soul'
            ],
            [
                'key' => 'default_course_status',
                'name' => 'Default course Status',
                'type' => 'select',
                'group' => 'general',
                'value' => '2'
            ],
            [
                'key' => 'default_user_role',
                'name' => 'Default User Role',
                'type' => 'select',
                'group' => 'general',
                'value' => '4'
            ],
            [
                'key' => 'default_course_duration',
                'name' => 'Default Course Duration (Weeks)',
                'type' => 'number',
                'group' => 'general',
                'value' => '26'
            ],
            [
                'key' => 'default_quiz_time_limit',
                'name' => 'Default Quiz Time Limit (Second)',
                'type' => 'number',
                'group' => 'general',
                'value' => '300'
            ],
            [
                'key' => 'items_per_page',
                'name' => 'Show Items/Page',
                'type' => 'number',
                'group' => 'general',
                'value' => '10'
            ],
        ];



        foreach ($settings as $setting) {
            Setting::create(array_merge($setting, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }
    }
}
