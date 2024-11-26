<?php

namespace Database\Seeders;

use App\Models\Category;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories = [
            [
                'title' => 'Web Development',
                'details' => 'Courses on building websites and web applications.',
            ],
            [
                'title' => 'Data Science',
                'details' => 'Courses focused on data analysis, machine learning, and AI.',
            ],
            [
                'title' => 'Graphic Design',
                'details' => 'Courses on visual communication and design principles.',
            ],
            [
                'title' => 'Digital Marketing',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Art Design',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Consolating',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Content Writing',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Finance',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Marketing',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Music & Audio',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Networking',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Photography',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Science',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],
            [
                'title' => 'Videography',
                'details' => 'Courses covering SEO, social media, and online advertising.',
            ],

        ];

        foreach ($categories as $category) {
            Category::create(array_merge($category, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }

    }
}
