<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LessonReview extends Model
{
    use HasFactory;

    protected $fillable = [
        'lesson_id',
        'review_id'
    ];

    // Relationship with lesson
    public function lesson()
    {
        return $this->belongsTo(Lesson::class);
    }
    // Relationship with review
    public function review()
    {
        return $this->belongsTo(Review::class);
    }
}
