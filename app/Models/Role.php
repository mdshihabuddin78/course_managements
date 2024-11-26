<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'status'];

    public function permissions()
    {
        return $this->belongsToMany(Permission::class, 'role_permissions'); // Assuming 'role_permissions' is the pivot table
    }

    public function modules()
    {
        return $this->belongsToMany(Module::class, 'role_modules'); // Assuming 'role_modules' is the pivot table
    }

    public function users()
    {
        return $this->hasMany(User::class);
    }
}
