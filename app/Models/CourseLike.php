<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CourseLike extends Model
{
    use HasFactory;


    protected $fillable = [
        'user_id', 'course_id'
    ];


    // Relationship with user
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    // Relationship with course
    public function course()
    {
        return $this->belongsTo(Course::class, 'course_id');
    }
}
