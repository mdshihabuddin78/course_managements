<?php

namespace App\Http\Middleware;

use App\Models\Role;
use Closure;
use Illuminate\Http\Request;

class CheckRole
{
    public function handle(Request $request, Closure $next)
    {

        $studentRoleID = Role::where('name', 'Student')->value('id');
        if ($request->user() && $request->user()->role_id === $studentRoleID) {
            return redirect('/')->with('error', 'You do not have admin access');
        }

        return $next($request);
    }
}
