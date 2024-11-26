<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
    use HasFactory;

    protected $fillable = [
        'parent_id',
        'name',
        'link',
        'status',
    ];

    public function sub_modules()
    {
        return $this->hasMany(Module::class, 'parent_id', 'id');
    }

    public function parent()
    {
        return $this->belongsTo(Module::class, 'parent_id', 'id');
    }

    public function permissions() {
        return$this->hasMany(Permission::class);
    }

    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_modules'); // Assuming 'role_modules' is the pivot table
    }
}