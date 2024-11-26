<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;

    protected $fillable = [
        'course_id', 'user_id', 'rating', 'comment', 'type', 'status'
    ];

    // Relationship with User
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }


    public function likes()
    {
        return $this->belongsToMany(User::class, 'review_likes', 'review_id', 'user_id');
    }
}
