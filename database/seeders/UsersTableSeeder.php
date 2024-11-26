<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $supAdminRoleID = Role::where('name', 'Super Admin')->value('id');
        $adminRoleID = Role::where('name', 'Admin')->value('id');
        $instructorRoleID = Role::where('name', 'Instructor')->value('id');
        $studentRoleID = Role::where('name', 'Student')->value('id');

        $users = [
            [
                'role_id' => $supAdminRoleID,
                'name' => 'Mehedi Hasan',
                'email' => 'mehedi@gmail.com',
                'password' => Hash::make('123456'),
                'bio' => 'Super Admin at the course management system.',
                'mobile' => '1234567890',
                'website' => 'https://www.google.com',
                'github' => 'https://github.com/mad-programmers3/skill-syntax',
                'gender' => 'Male',
                'date_of_birth' => '2002-09-02',
                'location' => 'Dhaka, Bangladesh',
                'email_verified_at' => Carbon::now(),
            ],
            [
                'role_id' => $supAdminRoleID,
                'name' => 'Al Mamun',
                'email' => 'mamun@gmail.com',
                'password' => Hash::make('123456'),
                'bio' => 'Super Admin at the course management system.',
                'mobile' => '1234567891',
                'website' => 'https://www.google.com',
                'github' => 'https://github.com/mad-programmers3/skill-syntax',
                'gender' => 'Male',
                'date_of_birth' => '2002-09-03',
                'location' => 'Dhaka, Bangladesh',
                'email_verified_at' => Carbon::now(),
            ],
            [
                'role_id' => $supAdminRoleID,
                'name' => 'Shihab',
                'email' => 'shihab@gmail.com',
                'password' => Hash::make('123456'),
                'bio' => 'Super Admin at the course management system.',
                'mobile' => '1234567892',
                'website' => 'https://www.google.com',
                'github' => 'https://github.com/mad-programmers3/skill-syntax',
                'gender' => 'Male',
                'date_of_birth' => '2002-09-04',
                'location' => 'Dhaka, Bangladesh',
                'email_verified_at' => Carbon::now(),
            ],
            [
                'role_id' => $supAdminRoleID,
                'name' => 'Super Admin',
                'email' => 'superadmin@gmail.com',
                'password' => Hash::make('123456'),
                'bio' => 'Super Admin at the course management system.',
                'mobile' => '1234567893',
                'website' => 'https://www.google.com',
                'github' => 'https://github.com/mad-programmers3/skill-syntax',
                'gender' => 'Male',
                'date_of_birth' => '2002-09-05',
                'location' => 'Dhaka, Bangladesh',
                'email_verified_at' => Carbon::now(),
            ],
            [
                'role_id' => $adminRoleID,
                'name' => 'Our Admin',
                'email' => 'admin@gmail.com',
                'password' => Hash::make('123456'),
                'bio' => 'Admin at the course management system.',
                'mobile' => '1234567894',
                'website' => 'https://www.google.com',
                'github' => 'https://github.com/mad-programmers3/skill-syntax',
                'gender' => 'Male',
                'date_of_birth' => '2002-09-06',
                'location' => 'Dhaka, Bangladesh',
                'email_verified_at' => Carbon::now(),
            ],
            [
                'role_id' => $instructorRoleID,
                'name' => 'Our Teacher',
                'email' => 'teacher@gmail.com',
                'password' => Hash::make('123456'),
                'bio' => 'Instructor at the course management system.',
                'mobile' => '1234567895',
                'website' => 'https://www.google.com',
                'github' => 'https://github.com/mad-programmers3/skill-syntax',
                'gender' => 'Male',
                'date_of_birth' => '2002-09-07',
                'location' => 'Dhaka, Bangladesh',
                'email_verified_at' => Carbon::now(),
            ],
            [
                'role_id' => $studentRoleID,
                'name' => 'Our Student',
                'email' => 'student@gmail.com',
                'password' => Hash::make('123456'),
                'bio' => 'Student at the course management system.',
                'mobile' => '1234567896',
                'website' => 'https://www.google.com',
                'github' => 'https://github.com/mad-programmers3/skill-syntax',
                'gender' => 'Male',
                'date_of_birth' => '2002-09-08',
                'location' => 'Dhaka, Bangladesh',
                'email_verified_at' => Carbon::now(),
            ],
        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}
