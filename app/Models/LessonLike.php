<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LessonLike extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'lesson_id'
    ];


    // Relationship with user
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    // Relationship with course
    public function lesson()
    {
        return $this->belongsTo(Lesson::class, 'lesson_id');
    }
}
