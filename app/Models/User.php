<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['role_id', 'name', 'email', 'avatar_id', 'bio', 'mobile', 'website', 'github','gender','date_of_birth', 'location', 'status', 'email_verified_at', 'password'];


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function role()
    {
        return $this->belongsTo(Role::class);
    }


    // Relationship with File
    public function avatar()
    {
        return $this->belongsTo(MyFile::class, 'avatar_id');
    }

    // Relationship with Courses
    public function courses()
    {
        return $this->hasMany(Course::class, 'user_id');
    }

    public function purchased_courses()
    {
        return $this->belongsToMany(Course::class, 'purchased_courses');
    }

    public function solved_questions()
    {
        return $this->hasMany(SolvedQuestion::class);
    }


    // Relationship with Reviews
//    public function reviews()
//    {
//        return $this->hasMany(Review::class, 'user_id');
//    }
}
