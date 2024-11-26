<?php

namespace Database\Seeders;

use App\Models\Course;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class CoursesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $courses = [
            [
                'user_id' => 1,
                'category_id' => 2,
                'sub_category_id' => 1,
                'title' => 'Java & DSA Course for Placement',
                'description' => '<h2>This Tutorial</h2><p>This tutorial is made to help you learn Data Structures and Algorithms (DSA) fast and easy.</p><p>Animations, like the one below, are used to explain ideas along the way.</p><p>First, you will learn the fundamentals of DSA: understanding different data structures, basic algorithm concepts, and how they are used in programming.</p><p>Then, you will learn more about complex data structures like trees and graphs, study advanced sorting and searching algorithms, explore concepts like time complexity, and more.</p><p>This tutorial will give you a solid foundation in Data Structures and Algorithms, an essential skill for any software developer.</p><p><br></p><h2>What You Should Already Know</h2><p>Although Data Structures and Algorithms is actually not specific to any programming language, you should have a basic understanding of programming in one of these common programming languages:</p><ul><li><a href="https://www.w3schools.com/python/default.asp" rel="noopener noreferrer" target="_blank" style="color: inherit;">Python</a></li><li><a href="https://www.w3schools.com/c/index.php" rel="noopener noreferrer" target="_blank" style="color: inherit;">C</a></li><li><a href="https://www.w3schools.com/cpp/default.asp" rel="noopener noreferrer" target="_blank" style="color: inherit;">C++</a></li><li><a href="https://www.w3schools.com/java/default.asp" rel="noopener noreferrer" target="_blank" style="color: inherit;">Java</a></li><li><a href="https://www.w3schools.com/js/default.asp" rel="noopener noreferrer" target="_blank" style="color: inherit;">JavaScript</a></li></ul><h2>DSA History</h2><p>The word \'algorithm\' comes from \'al-Khwarizmi\', named after a Persian scholar who lived around year 800.</p><p>The concept of algorithmic problem-solving can be traced back to ancient times, long before the invention of computers.</p><p>The study of Data Structures and Algorithms really took off with the invention of computers in the 1940s, to efficiently manage and process data.</p><p>Today, DSA is a key part of Computer Science education and professional programming, helping us to create faster and more powerful software.</p><p><br></p>',
                'price' => 3598,
                'sits' => 50,
                'start_date' => '2024-01-01',
                'end_date' => '2024-03-01',
                'status' => 1,
            ],
            [
                'user_id' => 2,
                'category_id' => 2,
                'sub_category_id' => 2,
                'title' => 'Data Science Bootcamp',
                'description' => 'Become a data scientist in this comprehensive bootcamp covering Python, R, and machine learning.',
                'price' => 199.99,
                'sits' => 30,
                'start_date' => '2024-02-01',
                'end_date' => '2024-04-01',
                'status' => 1,
            ],
            [
                'user_id' => 1,
                'category_id' => 3,
                'sub_category_id' => 3,
                'title' => 'Graphic Design Fundamentals',
                'description' => 'An introduction to graphic design concepts, tools, and techniques.',
                'price' => 89.99,
                'sits' => 40,
                'start_date' => '2024-03-01',
                'end_date' => '2024-05-01',
                'status' => 1,
            ],
        ];

        foreach ($courses as $course) {
            Course::create(array_merge($course, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }
    }
}
