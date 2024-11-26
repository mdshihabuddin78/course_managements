<?php

namespace Database\Seeders;

use App\Models\Quiz;
use Illuminate\Database\Seeder;

class QuizzesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $quizzes = [
            ['title' => 'Java & DSA Course for Placement - Quiz 1'],
            ['title' => 'Java & DSA Course for Placement - Quiz 2'],
            ['title' => 'Java & DSA Course for Placement - Quiz 3'],
            ['title' => 'Introduction to Java Language - Quiz'],
            ['title' => 'Variables in Java - Quiz'],
            ['title' => 'Conditional Statements - Quiz'],
            ['title' => 'Loops in Java - Quiz'],
            ['title' => 'Patterns - Quiz'],
            ['title' => 'Quiz'],
            ['title' => 'Quiz'],
            ['title' => 'Quiz'],
            ['title' => 'Quiz'],
            ['title' => 'Quiz'],

        ];

        foreach ($quizzes as $qui) {
            Quiz::create(array_merge($qui, [
                'user_id' => 1,
                'created_at' => now(),
                'updated_at' => now(),
                'time_limit' => getSetting('default_quiz_time_limit'),
            ]));
        }

    }
}
