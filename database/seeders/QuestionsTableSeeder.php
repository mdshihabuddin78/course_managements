<?php

namespace Database\Seeders;

use App\Models\Question;
use Illuminate\Database\Seeder;

class QuestionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $questions = [
            // Quiz 1 - 3 for course 1
            [
                'quiz_id' => 1,
                'user_id' => 1,
                'title' => 'Which statement is used to exit a switch case in Java?',
                'option_a' => 'exit',
                'option_b' => 'return',
                'option_c' => 'stop',
                'option_d' => 'break',
                'correct_answer' => 'd',
            ],
            [
                'quiz_id' => 1,
                'user_id' => 1,
                'title' => 'Which loop will always execute at least once, regardless of the condition?',
                'option_a' => 'for loop',
                'option_b' => 'while loop',
                'option_c' => 'do-while loop',
                'option_d' => 'foreach loop',
                'correct_answer' => 'c',
            ],
            [
                'quiz_id' => 1,
                'user_id' => 1,
                'title' => 'How many times will while(false) { System.out.print("Loop"); } execute?',
                'option_a' => '0 times',
                'option_b' => '1 time',
                'option_c' => '2 times',
                'option_d' => 'Infinite times',
                'correct_answer' => 'a',
            ],

            [
                'quiz_id' => 2,
                'user_id' => 1,
                'title' => 'Which of these is not a valid type of loop in Java?',
                'option_a' => 'for',
                'option_b' => 'while',
                'option_c' => 'foreach',
                'option_d' => 'repeat-until',
                'correct_answer' => 'd',
            ],
            [
                'quiz_id' => 2,
                'user_id' => 1,
                'title' => 'To print a diamond pattern in Java, which type of loop combination is generally used?',
                'option_a' => 'Only for',
                'option_b' => 'Only while',
                'option_c' => 'Combination of for and if-else',
                'option_d' => 'Only if-else',
                'correct_answer' => 'c',
            ],
            [
                'quiz_id' => 2,
                'user_id' => 1,
                'title' => 'Which nested loop structure would you use to print a pyramid pattern?',
                'option_a' => 'One for loop',
                'option_b' => 'Two for loops',
                'option_c' => 'Three for loops',
                'option_d' => 'if condition only',
                'correct_answer' => 'b',
            ],

            [
                'quiz_id' => 3,
                'user_id' => 1,
                'title' => 'Which of the following is not a Java feature?',
                'option_a' => 'Object-Oriented',
                'option_b' => 'Platform-Independent',
                'option_c' => 'Pointer Manipulation',
                'option_d' => 'Multithreaded',
                'correct_answer' => 'c',
            ],
            [
                'quiz_id' => 3,
                'user_id' => 1,
                'title' => 'Which of these is the correct way to start a Java program?',
                'option_a' => 'public class myProgram',
                'option_b' => 'public static void main(String[] args)',
                'option_c' => 'System.out.println("Hello");',
                'option_d' => 'public void main(String args[])',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 3,
                'user_id' => 1,
                'title' => 'What is the default value of a boolean in Java?',
                'option_a' => '0',
                'option_b' => 'false',
                'option_c' => 'true',
                'option_d' => 'null',
                'correct_answer' => 'b',
            ],

            // quiz 4 for course 1 less 1
            [
                'quiz_id' => 4,
                'user_id' => 1,
                'title' => 'Which of the following is not a keyword in Java?',
                'option_a' => 'class',
                'option_b' => 'try',
                'option_c' => 'static',
                'option_d' => 'include',
                'correct_answer' => 'd',
            ],
            [
                'quiz_id' => 4,
                'user_id' => 1,
                'title' => 'What is the size of the int data type in Java?',
                'option_a' => '8 bits',
                'option_b' => '16 bits',
                'option_c' => '32 bits',
                'option_d' => '64 bits',
                'correct_answer' => 'c',
            ],

            // Quiz 5 course 1 less 2
            [
                'quiz_id' => 5,
                'user_id' => 1,
                'title' => 'Which of the following correctly declares a variable in Java?',
                'option_a' => 'int num = 5;',
                'option_b' => 'num int = 5;',
                'option_c' => 'float = 5.0f',
                'option_d' => 'string name = "John";',
                'correct_answer' => 'a',
            ],
            [
                'quiz_id' => 5,
                'user_id' => 1,
                'title' => 'Which keyword is used to make a variable unchangeable in Java?',
                'option_a' => 'static',
                'option_b' => 'final',
                'option_c' => 'const',
                'option_d' => 'volatile',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 5,
                'user_id' => 1,
                'title' => 'What will System.out.print("Hello World"); output?',
                'option_a' => 'Hello World',
                'option_b' => 'Hello World (with a newline)',
                'option_c' => 'Hello',
                'option_d' => 'Error',
                'correct_answer' => 'a',
            ],
            [
                'quiz_id' => 5,
                'user_id' => 1,
                'title' => 'Which of the following is the correct syntax to read input from a user in Java?',
                'option_a' => 'Scanner input = new Scanner();',
                'option_b' => 'int num = Scanner.nextInt();',
                'option_c' => 'Scanner input = new Scanner(System.in);',
                'option_d' => 'Scanner input = new Scanner(Console);',
                'correct_answer' => 'c',
            ],
            [
                'quiz_id' => 5,
                'user_id' => 1,
                'title' => 'What data type should you use to store the number 123.456?',
                'option_a' => 'int',
                'option_b' => 'long',
                'option_c' => 'double',
                'option_d' => 'boolean',
                'correct_answer' => 'c',
            ],

            // Quiz 6 for course 1 less 3
            [
                'quiz_id' => 6,
                'user_id' => 1,
                'title' => 'What will if (true) { System.out.println("Hello"); } else { System.out.println("Bye"); } print?',
                'option_a' => 'Hello',
                'option_b' => 'Bye',
                'option_c' => 'Nothing',
                'option_d' => 'Error',
                'correct_answer' => 'a',
            ],
            [
                'quiz_id' => 6,
                'user_id' => 1,
                'title' => 'Which of the following operators is used for equality checking in Java?',
                'option_a' => '=',
                'option_b' => '==',
                'option_c' => '===',
                'option_d' => '!=',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 6,
                'user_id' => 1,
                'title' => 'What will be the output of switch(3) { case 1: System.out.print("1"); case 3: System.out.print("3"); }?',
                'option_a' => '1',
                'option_b' => '3',
                'option_c' => '13',
                'option_d' => 'Compilation error',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 6,
                'user_id' => 1,
                'title' => 'What will if (5 > 3) System.out.print("Yes"); else System.out.print("No"); print?',
                'option_a' => 'Yes',
                'option_b' => 'No',
                'option_c' => 'Nothing',
                'option_d' => 'Error',
                'correct_answer' => 'a',
            ],
            [
                'quiz_id' => 6,
                'user_id' => 1,
                'title' => 'Which statement is used to exit a switch case in Java?',
                'option_a' => 'exit',
                'option_b' => 'return',
                'option_c' => 'stop',
                'option_d' => 'break',
                'correct_answer' => 'd',
            ],


            // Quiz 7 for course 1 less 4
            [
                'quiz_id' => 7,
                'user_id' => 1,
                'title' => 'What is the output of for(int i = 0; i < 3; i++) System.out.print(i);?',
                'option_a' => '123',
                'option_b' => '012',
                'option_c' => '345',
                'option_d' => '210',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 7,
                'user_id' => 1,
                'title' => 'Which loop will always execute at least once, regardless of the condition?',
                'option_a' => 'for loop',
                'option_b' => 'while loop',
                'option_c' => 'do-while loop',
                'option_d' => 'foreach loop',
                'correct_answer' => 'c',
            ],
            [
                'quiz_id' => 7,
                'user_id' => 1,
                'title' => 'How many times will while(false) { System.out.print("Loop"); } execute?',
                'option_a' => '0 times',
                'option_b' => '1 time',
                'option_c' => '2 times',
                'option_d' => 'Infinite times',
                'correct_answer' => 'a',
            ],
            [
                'quiz_id' => 7,
                'user_id' => 1,
                'title' => 'What is the output of for(int i = 1; i <= 5; i++) { if(i == 3) break; System.out.print(i); }?',
                'option_a' => '12345',
                'option_b' => '12',
                'option_c' => '123',
                'option_d' => '1245',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 7,
                'user_id' => 1,
                'title' => 'Which of these is not a valid type of loop in Java?',
                'option_a' => 'for',
                'option_b' => 'while',
                'option_c' => 'foreach',
                'option_d' => 'repeat-until',
                'correct_answer' => 'd',
            ],

            // Quiz 8 for course 1 less 5
            [
                'quiz_id' => 8,
                'user_id' => 1,
                'title' => 'Which nested loop structure would you use to print a pyramid pattern?',
                'option_a' => 'One for loop',
                'option_b' => 'Two for loops',
                'option_c' => 'Three for loops',
                'option_d' => 'if condition only',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 8,
                'user_id' => 1,
                'title' => 'To print a pattern with rows of increasing numbers, which approach is most efficient?',
                'option_a' => 'Nested loop with increment on i',
                'option_b' => 'Nested loop with decrement on i',
                'option_c' => 'Using only if-else',
                'option_d' => 'Using a while loop only',
                'correct_answer' => 'a',
            ],



            // extra
            [
                'quiz_id' => 9,
                'user_id' => 1,
                'title' => 'What does PHP stand for?',
                'option_a' => 'Personal Home Page',
                'option_b' => 'PHP: Hypertext Preprocessor',
                'option_c' => 'Preprocessor Hypertext PHP',
                'option_d' => 'None of the above',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 9,
                'user_id' => 1,
                'title' => 'Which of the following is a valid PHP variable?',
                'option_a' => '$variable_name',
                'option_b' => 'variable_name',
                'option_c' => '$variable-name',
                'option_d' => 'None of the above',
                'correct_answer' => 'a',
            ],
            [
                'quiz_id' => 9,
                'user_id' => 1,
                'title' => 'What is the correct syntax to output "Hello World" in JavaScript?',
                'option_a' => 'echo "Hello World";',
                'option_b' => 'print("Hello World");',
                'option_c' => 'console.log("Hello World");',
                'option_d' => 'None of the above',
                'correct_answer' => 'c',
            ],

            [
                'quiz_id' => 10,
                'user_id' => 1,
                'title' => 'Which company developed Java?',
                'option_a' => 'Microsoft',
                'option_b' => 'Google',
                'option_c' => 'Sun Microsystems',
                'option_d' => 'Apple',
                'correct_answer' => 'c',
            ],
            [
                'quiz_id' => 10,
                'user_id' => 1,
                'title' => 'Which keyword is used to create a class in Java?',
                'option_a' => 'class',
                'option_b' => 'public',
                'option_c' => 'new',
                'option_d' => 'define',
                'correct_answer' => 'a',
            ],
            [
                'quiz_id' => 10,
                'user_id' => 1,
                'title' => 'Which method must be implemented by all Java threads?',
                'option_a' => 'start()',
                'option_b' => 'run()',
                'option_c' => 'stop()',
                'option_d' => 'execute()',
                'correct_answer' => 'b',
            ],

            [
                'quiz_id' => 11,
                'user_id' => 1,
                'title' => 'What is the default port number for HTTP?',
                'option_a' => '21',
                'option_b' => '80',
                'option_c' => '443',
                'option_d' => '8080',
                'correct_answer' => 'b',
            ],
            [
                'quiz_id' => 11,
                'user_id' => 1,
                'title' => 'Which protocol is used to send an email?',
                'option_a' => 'FTP',
                'option_b' => 'HTTP',
                'option_c' => 'SMTP',
                'option_d' => 'IMAP',
                'correct_answer' => 'c',
            ],
            [
                'quiz_id' => 11,
                'user_id' => 1,
                'title' => 'Which of the following is a NoSQL database?',
                'option_a' => 'MySQL',
                'option_b' => 'PostgreSQL',
                'option_c' => 'MongoDB',
                'option_d' => 'SQL Server',
                'correct_answer' => 'c',
            ],
        ];

        foreach ($questions as $question) {
            Question::create(array_merge($question, [
                'created_at' => now(),
                'updated_at' => now(),
            ]));
        }

    }
}
