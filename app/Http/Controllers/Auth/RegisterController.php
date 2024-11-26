<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    public function store(Request $request)
    {
        // Validation with unique email check
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'password' => 'required|confirmed', // Added confirmation rule
        ]);


        $studentRoleID = Role::where('name', 'Student')->value('id');

        // Create user
        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'role_id' => $studentRoleID,
            'password' => Hash::make($request->password),
        ]);

        $url = $request->input('url');

        // Redirect after successful registration
        return redirect()->route('login', ['url' => $url])->with('success', 'Registration successful.');
    }
}