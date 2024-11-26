<?php

namespace Database\Seeders;

use App\Models\LessonQuiz;
use App\Models\Quiz;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LessonQuizzesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $quizzes = Quiz::where('status', 0)
            ->whereBetween('id', [4, 8])
            ->take(5)
            ->get();


        foreach ($quizzes as $index => $quiz) {
            LessonQuiz::create([
                'lesson_id' => $index+1,
                'quiz_id' => $quiz->id,
            ]);

            $quiz->update(['status' => 1]);
        }
    }
}
