<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\MyFile;
use App\Models\User;
use App\Supports\BaseCrudHelper;
use App\Supports\MyFileHelper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    use BaseCrudHelper, MyFileHelper;

    public function __construct()
    {
        $this->model = new User();
        $this->with = ['role:id,name', 'avatar'];
        $this->showWith = ['role:id,name', 'avatar'];

        // before store set hash the password and set the avatar
        $this->beforeStore = function ($request) {
            $this->storeFile($request, 'avatar');

            $request->merge(['password' => Hash::make($request->password)]);
        };

        // before update merge the new password and set the avatar
        $this->beforeUpdate = function ($request) {
            // set the changed password
            if ($request->password)
                $request->merge(['password' => Hash::make($request->password)]);

            // update the avatar
            $this->updateFile($request, 'avatar');
        };

        $this->afterUpdate = function ($old, $new) {
            $new->load('role');
            $new->load('avatar');
        };


        // after delete the record also delete the avatar
        $this->afterDelete = function ($record) {
            if ($record && $record->avatar_id) { // delete also file
                $this->deleteFile($record->avatar_id);
            }
        };
    }


    public function resetPassword(Request $request)
    {
        // Check if current password is correct
        if (!Hash::check($request->current_password, Auth::user()->password))
            return retRes('Current password is incorrect', null, CODE_DANGER);

        if (strlen($request->new_password) < 6)
            return retRes('Minimum password length is 6', null, CODE_DANGER);

        if ($request->new_password !== $request->new_password_confirmation)
            return retRes('Password confirmation does not match', null, CODE_DANGER);


        // Update the user's password
        $user = Auth::user();
        $user->password = Hash::make($request->new_password);
        $user->save();

        return retRes('Password has been updated');
    }


    public function deleteAvatar(Request $request)
    {
        $avatar_id = $request->input('avatar_id');
        if (!$avatar_id || !$this->deleteFile($avatar_id))
            return retRes('No avatar found', null, CODE_DANGER);

        $record = User::findOrFail($request->input('id'));
        $record->update(['avatar_id' => null]);
        $record->load('role');


        return retRes('The avatar has been deleted', $record);
    }
}
