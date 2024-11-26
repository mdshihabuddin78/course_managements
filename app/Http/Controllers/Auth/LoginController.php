<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(Request $request){

        $url = $request->query('url');

        return view('auth.login', ['url' => $url]);
    }

    public function doLogin(Request $request){
        // Get login credentials, except for the CSRF token and the 'url' parameter
        $credentials = $request->except('_token', 'url');

        // Attempt to log the user in
        if (Auth::attempt($credentials)) {
            $url = $request->input('url');
            $decodedUrl = urldecode($url);

            $adminIDs = Role::whereIn('name', ['Super Admin', 'Admin', 'Instructor'])->pluck('id')->toArray();

            if ($decodedUrl)
                return redirect($decodedUrl);
            if (in_array(Auth::user()->role_id, $adminIDs))
                return redirect('/admin/dashboard');

            return redirect('/');
        }

        // If authentication fails, redirect back to login with an error message
        return redirect()->back()->with('error', 'Username or Password Invalid');
    }


    public function logout(){
        Auth::logout();
        return redirect('/login');
    }
}
