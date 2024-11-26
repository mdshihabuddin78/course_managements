<?php
namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Models\Message;
use Illuminate\Support\Facades\Auth;
use Exception;

class MessageController extends Controller
{
    public function sendMessage(Request $request)
    {
        try {
            // Create a new message
            $message = Message::create($request->all());
            return retRes('Message sent successfully', $message);
        } catch (Exception $e) {
            return retRes('Server error, please try again later.', null, 500);
        }
    }

    public function getMessages()
    {
        try {
            if (!Auth::check()) return retRes('Not authenticated', null, CODE_DANGER);

            $data = [];
            $data['received_messages'] = Message::with('sender')->where('receiver_id', Auth::id())->get();
            $data['sent_messages'] = Message::with(['receiver'])->where('sender_id', Auth::id())->get();

            return retRes('Successfully fetched all messages.', $data);
        } catch (Exception $e) {
            return retRes('Server error, please try again later.', null, 500);
        }
    }

    public function hideMessage($id)
    {
        try {
            $message = Message::findOrFail($id);
            if (!Auth::check() || $message->receiver_id !== Auth::id())
                return retRes('Not authenticated', null, CODE_DANGER);

            $message->update(['show_rc' => 0]);
            return retRes('Message hidden successfully', $message);
        } catch (ModelNotFoundException $e) {
            return retRes('Message not found', null, CODE_NOT_FOUND);
        } catch (Exception $e) {
            return retRes('Server error, please try again later.', null, 500);
        }
    }
    public function deleteMessage($id)
    {
        try {
            $message = Message::findOrFail($id);
            if (!Auth::check() || $message->sender_id !== Auth::id())
                return retRes('Not authenticated', null, CODE_DANGER);

            $message->delete();
            return retRes('Message deleted successfully', ['id' => $id]);
        } catch (ModelNotFoundException $e) {
            return retRes('Message not found', null, CODE_NOT_FOUND);
        } catch (Exception $e) {
            return retRes('Server error, please try again later.', null, 500);
        }
    }

}
