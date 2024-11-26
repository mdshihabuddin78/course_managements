<?php

namespace Database\Seeders;

use App\Models\Lesson;
use App\Models\LessonReview;
use App\Models\Review;
use App\Models\User;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class LessonReviewsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create(); // Instantiate Faker
        $lesson = Lesson::findOrFail(1);
        $users = User::all();

        // Link each lesson to some reviews
        if ($lesson) {
            for ($i = 1; $i <= 2; $i++) {

                // Create a review for the lesson
                $review = Review::create([
                    'user_id' => $users->random()->id, // Assign a random user
                    'comment' => $faker->sentence(), // Random test comment
                    'type' => 3 // Indicate it's a lesson review
                ]);

                // Link the review to the lesson
                LessonReview::create([
                    'lesson_id' => $lesson->id,
                    'review_id' => $review->id,
                ]);
            }
        }
    }
}
