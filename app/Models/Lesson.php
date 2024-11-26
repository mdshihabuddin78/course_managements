<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Lesson extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'course_id',
        'thumbnail_id',
        'video_id',
        'title',
        'description',
        'status',
    ];

    public function prev()
    {
        return Lesson::where('id', '<', $this->id)
            ->orderBy('id', 'desc')
            ->first();
    }

    // Method to get the next lesson based on ID
    public function next()
    {
        return Lesson::where('id', '>', $this->id)
            ->orderBy('id', 'asc')
            ->first();
    }

    // Is complete this lesson by student
    public function is_complete()
    {
        $studentLesson = StudentLesson::where('lesson_id', $this->id)
            ->where('user_id', Auth::id())
            ->first();

        return $studentLesson && $studentLesson->status === 1;
    }


    // Define the relationship with the Course model
    public function course()
    {
        return $this->belongsTo(Course::class);
    }
    // Relationship with File
    public function thumbnail()
    {
        return $this->belongsTo(MyFile::class, 'thumbnail_id');
    }
    // Relationship with File
    public function video()
    {
        return $this->belongsTo(MyFile::class, 'video_id');
    }
    // Relationship with CourseLike
    public function likes()
    {
        return $this->hasMany(LessonLike::class);
    }
    // Relationship with LessonReview
    public function lesson_reviews()
    {
        return $this->hasMany(LessonReview::class);
    }
    // Relationship with quizzes
    public function quizzes()
    {
        return $this->belongsToMany(Quiz::class, 'lesson_quizzes');
    }
}
