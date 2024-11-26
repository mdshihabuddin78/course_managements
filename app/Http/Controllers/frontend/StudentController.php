<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\CourseLike;
use App\Models\PurchasedCourse;
use Exception;
use Illuminate\Support\Facades\Auth;

class StudentController extends Controller
{
    public function wishList() {
        try {
            $data = [];
            $data['liked_course'] = CourseLike::where('user_id', Auth::id())->with('course.category')->get()->pluck('course');


            return retRes('Fetched liked course data for wish list page', $data);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }
    }
    public function purchaseHistory() {
        try {
            $data = PurchasedCourse::where('user_id', Auth::id())
                ->with('course:id,title,price')
                ->get(['id', 'course_id', 'created_at'])
                ->map(function ($purchase) {
                    return [
                        'id' => $purchase->id,
                        'course_id' => $purchase->course_id,
                        'created_at' => $purchase->created_at->format('Y-m-d H:i:s'), // Format created_at here
                        'course' => $purchase->course,
                    ];
                });

            return retRes('Fetched student purchases', $data);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }
    }
    public function myCourse(){
        try {
            if (!Auth::user())return retRes('your are not authenticated.', null, CODE_DANGER);

            $data = [];
            $data['purchased_course'] = PurchasedCourse::where('user_id', Auth::id())->with('course.category')->get()->pluck('course');


            return retRes('Fetched liked course data for wish list page', $data);
        } catch (Exception $e) {
            return retRes('Something went wrong', null, 500);
        }
    }
}
