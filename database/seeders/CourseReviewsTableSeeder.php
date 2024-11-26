<?php

namespace Database\Seeders;

use App\Models\Course;
use App\Models\CourseReview;
use App\Models\Review;
use App\Models\User;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class CourseReviewsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create(); // Instantiate Faker
        $course = Course::findOrFail(1);
        $users = User::all();

        // Link each course to some reviews
        if ($course) {
            for ($i = 1; $i <= 5; $i++) {

                // Create a review for the course
                $review = Review::create([
                    'user_id' => $users->random()->id, // Assign a random user
                    'rating' => rand(1, 5), // Random rating between 1 and 5
                    'comment' => $faker->sentence(), // Random test comment
                    'type' => 2 // Indicate it's a course review
                ]);

                // Link the review to the course
                CourseReview::create([
                    'course_id' => $course->id,
                    'review_id' => $review->id,
                ]);
            }
        }
    }
}
