<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchasedCourse extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'course_id', 'current_lesson_id', 'current_quiz_id', 'marks'
    ];



    // Relationship with user
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    // Relationship with course
    public function course()
    {
        return $this->belongsTo(Course::class);
    }
}
