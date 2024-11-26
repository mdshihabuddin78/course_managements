<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CourseReview extends Model
{
    use HasFactory;


    protected $fillable = [
        'course_id',
        'review_id'
    ];


    // Relationship with course
    public function course()
    {
        return $this->belongsTo(Course::class);
    }

    // Relationship with review
    public function review()
    {
        return $this->belongsTo(Review::class);
    }
}
