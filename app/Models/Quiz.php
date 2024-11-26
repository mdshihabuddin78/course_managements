<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Quiz extends Model
{
    use HasFactory;

    protected $fillable = ['user_id', 'title', 'time_limit', 'status'];

    public function questions()
    {
        return $this->hasMany(Question::class);
    }

    public function courses()
    {
        return $this->belongsToMany(Course::class, 'course_quizzes');
    }
}
