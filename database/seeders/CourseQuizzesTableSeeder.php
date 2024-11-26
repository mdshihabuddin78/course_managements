<?php

namespace Database\Seeders;

use App\Models\CourseQuiz;
use App\Models\Quiz;
use Illuminate\Database\Seeder;

class CourseQuizzesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $quizzes = Quiz::where('status', 0)->take(3)->get();

        foreach ($quizzes as $quiz) {
            CourseQuiz::create([
                'course_id' => 1,
                'quiz_id' => $quiz->id,
            ]);

            $quiz->update(['status' => 1]);
        }

    }
}
