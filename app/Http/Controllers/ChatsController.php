<?php

namespace App\Http\Controllers;

use App\Message;
use Illuminate\Http\Request;
use Libraries\MyLibrary\MyLibrary;

use App\Events\MessageSent;
use Pusher\Pusher;

class ChatsController extends Controller
{
    //

    /**
     * Show chats
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('chat');
    }

    /**
     * Fetch all messages
     *
     * @return Message
     */
    public function fetchMessages(Request $request)
    {
        $user = MyLibrary::getJWTUser($request);

        $from_id = $user->id;
        $to_id = $request->to_id;

        $messages = \DB::select("
            SELECT  * , DATE_FORMAT(created_at ,'%H:%i %a' ) chat_time 
            FROM    messages a
            WHERE   (a.from_id = $from_id AND a.to_id = $to_id) OR
                    (a.from_id = $to_id AND a.to_id = $from_id)
             
            ORDER   BY created_at ASC
        ");
//        dump($user->messages()->get());

        return response()->json(['status' => true , 'messages' => $messages , 'your_id' => $user->id]);
    }

    /**
     * Persist message to database
     *
     * @param  Request $request
     * @return Response
     */
    public function sendMessage(Request $request)
    {
        $user = MyLibrary::getJWTUser($request);

        $message = Message::create([
            'message' => $request->input('message') ,
            'from_id' => $user->id ,
            'to_id' => $request->input('to_id')
        ]);
//        broadcast(new MessageSent($user, $message))->toOthers();

        $message = collect($message);

        $message = $message->merge([
            'chat_time' => date('H:i D', strtotime($message['created_at'] ))
        ]);

        MyLibrary::firePusher($request , $message);

        return response()->json(['status' => true , 'message'  => $message]);
    }
}
