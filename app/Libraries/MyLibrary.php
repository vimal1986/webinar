<?php

namespace Libraries\MyLibrary;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use JWTAuth;
use App\User;
use JWTAuthException;

use App\Events\MessageSent;
use Pusher\Pusher;

class MyLibrary{

    public static function testData($data){
        dump($data);
    }

    /**
     * @param Request $request
     * @return mixed
     * @throws \Exception
     */
    public static function getJWTUser(Request $request){

//        $currentUser = JWTAuth::parseToken()->authenticate();
        $currentUser = JWTAuth::toUser($request->input('token'));
        if(!$currentUser) {
            throw new \Exception('Token not verified');
//            return response()->json(['status' => 'false' , 'data' => 'Token not verified']);
        }

        return $currentUser;
    }

    public static function generateOtp($length){

        $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;

    }


    public static function getLatLng_FromPinCode($pincode){

        $client = new \GuzzleHttp\Client();
        $res = $client->get('http://maps.googleapis.com/maps/api/geocode/json?address=' . $pincode);
        $result = json_decode($res->getBody());

        if($res->getStatusCode() != 200){
            return ['status' => false , 'errors' => 'Cant identify geo location' ];
        }

        try{
            $lat = $result->results[0]->geometry->location->lat;
            $lng = $result->results[0]->geometry->location->lng;
        }
        catch(\Exception $ex){

            return ['status' => false , 'errors' => 'Cant identify geo location' ];
        }

        return ['status' => true ,'lat' => $lat , 'lng' => $lng];
    }

    public static function getProductImageURL($filename){
        if($filename)
            return env('APP_URL') . '/uploads/product_images/' . $filename;
        else
            return '';

    }

    public static function getProductThumbImageURL($filename){
        if($filename)
            return env('APP_URL') . '/uploads/product_images/thumb_' . $filename;
        else
            return '';

    }

    public static function firePusher(Request $request ,  $message){

        $options = array(
            'cluster' => 'ap2',
            'encrypted' => true
        );

        $pusher = new Pusher( 'f05414ba67239e5368a5',
            '8cb4b098e222270be88f',
            '395998',
            $options);

        $log = $pusher->trigger('my-channel'.  $request->input('to_id') , 'my-event', $message);

    }

}