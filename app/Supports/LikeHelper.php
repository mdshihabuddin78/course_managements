<?php


namespace App\Supports;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

trait LikeHelper
{
    public function likeHelper(Request $request,  $likeModel, $key) {
        try {
            $recordId = $request->input($key.'_id');
            $userId = Auth::id();

            if ($recordId && $userId) {
                // Fetch the first like record, if it exists
                $preLike = $likeModel->where('user_id', $userId)->where($key.'_id', $recordId)->first();

                if ($preLike) {
                    // If the record exists, delete it (unlike)
                    $preLike->delete();
                    return retRes('Successfully unlike this '.$key, 0);
                } else {
                    // If the record does not exist, create a new like
                    $likeModel->create([$key.'_id' => $recordId, 'user_id' => $userId]);
                    return retRes('Successfully liked this '.$key, 1);
                }
            }

            return retRes('Data not matched', null, CODE_DANGER);
        } catch (\Exception $e) {
            return retRes('Something went wrong', null, CODE_DANGER);
        }
    }

}