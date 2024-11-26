<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\CourseQuiz;
use App\Models\LessonQuiz;
use App\Models\Question;
use App\Models\Quiz;
use App\Models\SolvedQuestion;
use App\Supports\BaseCrudHelper;
use Exception;
use Illuminate\Http\Request;

class QuizController extends Controller
{
    use BaseCrudHelper;

    public function __construct()
    {
        $this->model = new Quiz();
        $this->with = ['questions'];

        $this->beforeStore = function ($request) {
            if (!$request->input('time_limit'))
                $request->merge(['time_limit' => getSetting('default_quiz_time_limit')]);
        };
    }


    public function submit(Request $request)
    {
        try {
            $user = auth()->user();
            if (!$user) return retRes('No auth found', null, CODE_DANGER);

            $attempts = $request->all();
            $solvedQsId = [];

            foreach ($attempts as $attempt) {
                $question = Question::find($attempt['question_id']);

                if ($question) {
                    if ($question->correct_answer === $attempt['answer']) {
                        // if the ans is correct then store
                        SolvedQuestion::firstOrCreate([
                            'user_id'     => $user->id,
                            'question_id' => $question->id,
                        ]);

                        $solvedQsId[] = $question->id;
                    } else {
                        // delete the correct one
                        SolvedQuestion::where('user_id', $user->id)
                            ->where('question_id', $question->id)
                            ->delete();
                    }
                }
            }

            return retRes('Successfully submitted quiz.', $solvedQsId, CODE_SUCCESS);

        } catch (Exception $e) {
            // Handle any errors and return a failure response
            return retRes('Failed to submit answers', $e->getMessage(), 500);
        }
    }



    public function addQuizToItem(Request $request, $type) {
        try {
            $quizId = $request->input('quiz_id');

            // Determine the model and foreign key based on the type
            if ($type === 'course') {
                $itemId = $request->input('course_id');
                $model = CourseQuiz::class;
                $foreignKey = 'course_id';
            } elseif ($type === 'lesson') {
                $itemId = $request->input('lesson_id');
                $model = LessonQuiz::class;
                $foreignKey = 'lesson_id';
            } else {
                return retRes('Invalid type specified', null, 400);
            }

            // Use firstOrNew to fetch existing or create new instance without saving
            $quizRelation = $model::firstOrNew(
                [$foreignKey => $itemId, 'quiz_id' => $quizId]
            );

            if ($quizRelation->exists) {
                $quizRelation->delete();
                $quizRelation->quiz->update(['status' => 0]);
                return retRes("Successfully removed {$type} quiz", ['flag' => 0, 'quiz' => $quizRelation->quiz]);
            }

            // Save new quiz to item
            $quizRelation->fill($request->all())->save();
            $quizRelation->quiz->update(['status' => 1]);
            return retRes("Successfully added {$type} quiz", ['flag' => 1, 'quiz' => $quizRelation->quiz]);

        } catch (Exception $e) {
            return retRes("Failed to manipulate {$type} quiz", null, 500);
        }
    }

}
