<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Supports\MyFileHelper;
use Illuminate\Http\Request;

class MyFileController extends Controller
{
    use MyFileHelper;

    public function upload(Request $request)
    {
        try {
            // Validate the incoming request
            $request->validate([
                'file' => 'required|max:204800', // Max size of 200MB
            ]);

            // Handle the uploaded file
            $file = $request->file('file');
            $key = $request->input('key');
            if ($file) {
                $path = $file->store('uploads', 'public'); // Store the file in public/images

                // Extract file information
                $fileName = $file->getClientOriginalName();  // Get the original file name
                $extension = $file->getClientOriginalExtension();  // Get the file extension
                $size = $file->getSize();  // Get the file size in bytes

                // Return a response with file info, path, and URL
                return response()->json([
                    'success' => true,
                    'path' => $path,
                    'name' => $fileName,
                    'extension' => $extension,
                    'size' => $size,
                    'duration' => $request->input('duration')
                ]);
            }

            return response()->json(['success' => false, 'message' => 'File upload failed.'], CODE_DANGER);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Something went wrong: ' . $e->getMessage()], 500);
        }
    }

}
