<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LessonQuiz extends Model
{
    use HasFactory;

    protected $fillable = [
        'quiz_id', 'lesson_id'
    ];


    // Relationship with quiz
    public function quiz()
    {
        return $this->belongsTo(Quiz::class);
    }
    // Relationship with course
    public function lesson()
    {
        return $this->belongsTo(Lesson::class);
    }
}
