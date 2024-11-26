<?php

namespace Database\Seeders;

use App\Models\SubCategory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SubCategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $subCategories = [
            // Web Development
            [
                'title' => 'HTML & CSS',
                'category_id' => 1, // Web Development
            ],
            [
                'title' => 'JavaScript Frameworks',
                'category_id' => 1, // Web Development
            ],
            [
                'title' => 'Backend Development',
                'category_id' => 1, // Web Development
            ],
        ];

        foreach ($subCategories as $subCategory) {
            SubCategory::create(array_merge($subCategory, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }
    }
}
