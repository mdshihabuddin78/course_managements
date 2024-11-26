<?php

namespace Database\Seeders;

use App\Models\Review;
use App\Models\Testimonial;
use App\Models\User;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;

class TestimonialsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create(); // Instantiate Faker
        $users = User::all();

        for ($i = 1; $i <= 5; $i++) {

            $review = Review::create([
                'user_id' => $users->random()->id, // Assign a random user
                'rating' => rand(1, 5), // Random rating between 1 and 5
                'comment' => $faker->sentence(), // Random test comment
                'type' => 1 // Indicate it's a testimonial review
            ]);

            // Link the review to the testimonial
            Testimonial::create([
                'review_id' => $review->id,
            ]);
        }
    }
}
