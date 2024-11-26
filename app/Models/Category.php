<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{

    use HasFactory;

    protected $fillable = [
        'thumbnail_id',
        'title',
        'details',
        'status',
    ];


    // Relationship with Courses
    public function courses()
    {
        return $this->hasMany(Course::class, 'category_id');
    }
    // Relationship with File
    public function thumbnail()
    {
        return $this->belongsTo(MyFile::class, 'thumbnail_id');
    }
}
