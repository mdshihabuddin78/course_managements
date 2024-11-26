<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    use HasFactory;

    protected $fillable = ['module_id', 'name', 'status'];

    public function roles()
    {
        return $this->belongsToMany(Role::class, 'role_permissions'); // Assuming 'role_permissions' is the pivot table
    }

    public function module()
    {
        return $this->belongsTo(Module::class);
    }
}
