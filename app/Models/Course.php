<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 'category_id', 'sub_category_id', 'title', 'description', 'price', 'sits', 'start_date', 'end_date', 'thumbnail_id', 'status',
    ];

    protected $appends = ['duration']; // Ensure duration is always included

    public function getDurationAttribute()
    {
        $startDate = Carbon::parse($this->start_date);
        $endDate = Carbon::parse($this->end_date);

        return $startDate->diffInDays($endDate);
    }
    public function getCreatedAtHumanAttribute()
    {
        return Carbon::parse($this->created_at)->diffForHumans();
    }
    // Relationship with User (Instructor)
    public function instructor()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function students() {
        return $this->belongsToMany(User::class, 'purchased_courses');
    }

    // Relationship with Category
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function sub_category()
    {
        return $this->belongsTo(SubCategory::class, 'sub_category_id');
    }
    // Relationship with File
    public function thumbnail()
    {
        return $this->belongsTo(MyFile::class, 'thumbnail_id');
    }
    // Relationship with Lessons
    public function lessons()
    {
        return $this->hasMany(Lesson::class, 'course_id');
    }
    // Relationship with CourseLike
    public function likes()
    {
        return $this->hasMany(CourseLike::class, 'course_id');
    }
    // Relationship with CourseReview
    public function course_reviews()
    {
        return $this->hasMany(CourseReview::class);
    }
    // Relationship with CourseReview
    public function reviews()
    {
        return $this->belongsToMany(Review::class, 'course_reviews');
    }
    // Relationship with quizzes
    public function quizzes()
    {
        return $this->belongsToMany(Quiz::class, 'course_quizzes');
    }

    public function user_purchased()
    {
        return $this->belongsToMany(User::class, 'purchased_courses');
    }
}
