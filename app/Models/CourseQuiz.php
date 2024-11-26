<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CourseQuiz extends Model
{
    use HasFactory;

    protected $fillable = [
        'quiz_id', 'course_id'
    ];


    // Relationship with quiz
    public function quiz()
    {
        return $this->belongsTo(Quiz::class);
    }
    // Relationship with course
    public function course()
    {
        return $this->belongsTo(Course::class);
    }
}
