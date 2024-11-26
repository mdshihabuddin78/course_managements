<?php

namespace Database\Seeders;

use App\Models\Course;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class ExtraSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $courses = [];
        $currentDate = Carbon::now();

        for ($i = 0; $i < 100; $i++) {
            $startDate = $currentDate->copy()->addDays(rand(1, 30));
            $endDate = $startDate->copy()->addDays(rand(10, 60));

            $courses[] = [
                'user_id' => 1,
                'category_id' => rand(1, 10),
                'sub_category_id' => 1,
                'title' => Str::title('Course ' . ($i + 1)),
                'description' => Str::random(200),
                'price' => rand(50, 500) + 0.99,
                'sits' => rand(5, 50),
                'start_date' => $startDate->toDateString(),
                'end_date' => $endDate->toDateString(),
                'status' => 1,
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        DB::table('courses')->insert($courses);
    }
}
