<?php

namespace Database\Seeders;

use App\Models\Course;
use App\Models\Lesson;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LessonsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $course = Course::findOrFail(1);
        $lessons = [
            'Introduction to Java Language | Lecture 1',
            'Variables in Java | Input Output',
            'Conditional Statements | If-else, Switch Break',
            'Loops in Java',
            '9 Best Patterns Questions in Java (for Beginners)',
            'Advanced Pattern Questions in Java',
        ];

        foreach ($lessons as $index => $title) {
            Lesson::create([
                'course_id' => $course->id,
                'user_id' => 1,
                'title' => $title,
                'description' => "This is the detailed description for {$title} of the course {$course->title}, covering essential concepts and exercises.",
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }

    }
}
