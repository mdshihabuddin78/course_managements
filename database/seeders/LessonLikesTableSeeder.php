<?php

namespace Database\Seeders;

use App\Models\Lesson;
use App\Models\LessonLike;
use App\Models\User;
use Illuminate\Database\Seeder;

class LessonLikesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = User::all();
        $lesson = Lesson::findOrFail(1);

        // each user likes all lesson
        if ($lesson) {
            foreach ($users as $user) {
                LessonLike::create([
                    'user_id' => $user->id,
                    'lesson_id' => $lesson->id,
                ]);
            }
        }
    }
}
