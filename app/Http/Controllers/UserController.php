<?php
namespace App\Http\Controllers;

use App\Address;
use App\FavouriteSeller;
use App\PasswordOtp;
use App\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Validator;

use JWTAuth;
use App\User;
use JWTAuthException;

use Image;
use File;
use Mockery\Exception;
use Libraries\MyLibrary\MyLibrary;

class UserController extends Controller
{
    private $user;

    public function __construct(User $user)
    {
        $this->user = $user;
    }

    public function register(Request $request)
    {
        // Validation
        $validator = User::registerValidator($request);
        if($validator->fails()) {
            return response()->json(['status' => false , 'errors' => $validator->errors()->first()]);
        }

        $user = User::createUser($request);
        Role::attachRoleToUser($user , USER_ROLE_ID);

        // Mails to user & admin
        User::registeration_MailToUser($user);
        User::registeration_MailToAdmin($user);

        if(HAS_TO_REALEASE_TOKEN) {
            return $this->login($request);
        }

        return response()->json(['status' => true, 'message' => 'User created successfully', 'data' => $user]);
    }

    /**
    * Login Auth
    * @param Request $request
    * @return \Illuminate\Http\JsonResponse
    */
    public function login(Request $request)
    {
        $validator = User::loginValidator($request);
        $credentials = $request->only('email', 'password');
        $token = null;
        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json(['status' => false , 'errors' => 'Invalid email or password']);
            }

        } catch (JWTAuthException $e) {
            return response()->json(['status'=>false , 'errors'=>'Failed to create token']);
        }
        return response()->json(['status' => true , 'token' => $token]);
    }


    /**
     * Get User Profile Details
     * @return \Illuminate\Http\JsonResponse
     */
    public function getUserProfileDetails(Request $request){

        $base_url = env('APP_URL');
        $currentUser = MyLibrary::getJWTUser($request);

        try{

            $currentUser = collect($currentUser);
            // Change profile_image and cover image params
            $profile_image = $currentUser['profile_image'];
            $cover_image = $currentUser['cover_image'];

            // merge profile image nad cover picture
            $dummy_user_image = $base_url . 'image/user_image.png';
            $dummy_cover_image = $base_url . 'image/cover_image.jpg';

            $merged =   $currentUser->merge(
                [
                    'profile_image' => ($profile_image)?$base_url .  'uploads/profile_image/'.$profile_image:$dummy_user_image,
                    'cover_image' => ($cover_image)?$base_url .  'uploads/cover_image/'.$cover_image:$dummy_cover_image,

                ]
            );

            $request->merge(['seller_id' => $currentUser['id']]);
            $prdct = new ProductsController();
            $user_products = $prdct->getProductsBySeller($request);

            return response()->json(['status' => 'true' , 'data' => $merged->all() , 'user_products' => $user_products]);

        }catch(\Exception $ex){

            return response()->json(['status' => false , 'errors' => $ex->getMessage()]);
        }

    }

    // Update profile info

    public function updateProfile(Request $request){

        $base_url = env('APP_URL');
        $currentUser = MyLibrary::getJWTUser($request);

        $validator = User::updateProfileValidator($request);
        if($validator->fails()) {
            return response()->json(['status' => false , 'errors' => $validator->errors()->first()]);
        }

        $details = $request->only
                    (
                         'first_name' , 'last_name' , 'handle_name' , 'mobile'
                    );
        $currentUser->fill($details);

        if($currentUser->save()){

            $currentUser = collect($currentUser);
            // Change profile_image and cover image params
            $profile_image = $currentUser['profile_image'];
            $cover_image = $currentUser['cover_image'];

            // merge profile image nad cover picture
            $merged =   $currentUser->merge(
                [
                    'profile_image' => ($profile_image)?$base_url .  'uploads/profile_image/'.$profile_image:'',
                    'cover_image' => ($cover_image)?$base_url .  'uploads/cover_image/'.$cover_image:'',
                ]
            );

            return response()->json(['status' => true , 'data' => $merged]);
        }
        else
            return response()->json(['status' => false , 'errors' => 'Update Failed' ]);

    }

    public function generateOtp($length){

        $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;

    }
    // There ll be two api for password
    // 1) Password Change request along with otp
    // 2) Change password update form
    // Change user password
    public function requestPasswordChange()
    {
        //
        $currentUser = JWTAuth::parseToken()->authenticate();
        if (!$currentUser) {
            return response()->json(['status' => 'false', 'data' => 'Token not verified']);
        }

        // Code for password otp creation
        try{
            $otp_code = $this->generateOtp(4);
            $passwordOtp = PasswordOtp::create([
                'otp_code' => $otp_code ,
                'user_id' => $currentUser->id,
                'verified' => false
            ]);

            $email = $currentUser->email;
            $data = ''; // Have you figured out any data to send for the mail template?

            Mail::send('mails.password_reset_otp', ['passwordOtp' => $passwordOtp , 'user' => $currentUser ], function ($message) use ($email) {

                $message->from('info@thebelafy.com', 'The belafy');
    //            $message->bcc('info@myvanandman.com');
                $message->bcc('shahil.nissam@brtindia.com');
                $message->to($email)->subject('Your OTP For Password');
            });

        }
        catch(\Exception $ex){
            return response()->json(['status' => 'false' , 'errors' => $ex ]);
        }

        // If mail send we ll send them otp_id not otp_code
        return response()->json(['status' => true , 'data' => ['otp_id' => $passwordOtp->id]]);

    }
    // Verify OTP for ChangePassword 7 Change The Password
    public function changePassword(Request $request , $reset = false){

        //Collect old password and new passwords
        $newPassword = $request->password;
        $confirmPassword = $request->password_confirmation;
        $otpId = $request->otp_id;
//        $otpToken = $request->otp_token;

        $resetRules = [
            'password' => 'required|confirmed|min:6'
        ];

        try{

            $passwordOtp = PasswordOtp::find($otpId);
            $currentUser = User::find($passwordOtp->user_id);

            if($passwordOtp->verified){
                return response()->json(['status' => false , 'data' => 'OTP already used']);
            }
            //check for token expiry
            $curTime = strtotime(date('Y-m-d H:i:s'));
            $verifiedAt = strtotime($passwordOtp->verified_at);

            // Checking whether token validity remains in the 5 minutes range
            if(abs($curTime - $verifiedAt) / 60 > 5){
//                return abs($curTime - $verifiedAt) ;
                return response()->json(['status' => false , 'data' => 'Sorry token is expired']);
            }

//          Please don't remove the commented codes. Let it be there
//            if(!Hash::check(  $request->old_password , $currentUser->password  )){
//
//                return response()->json(['status' => false , 'errors' => 'Password Not Matching']);
//            }

            $resetRules = [
                'password' => 'required|confirmed|min:6'
            ];

            $validator = Validator::make($request->all() , $resetRules);

            if($validator->fails()){
                return response()->json(['status' => false , 'errors' => $validator->errors()->first()]);
            }

            $currentUser->password = bcrypt($request->password);
            $currentUser->save();

            //Verify otp
            $passwordOtp->verified = true;
            $passwordOtp->save();

            return response()->json(['status' => true , 'data' => 'Password updated successfully']);

        }
        catch (\Exception $ex){
            return response()->json(['status' => 'false' , 'errors' => $ex ]);
        }

    }

    public function resetPasswordRequest(Request $request){

        //Get user details
        $email = $request->email;

        $currentUser = User::where('email' , $email)->first();

        if(!$currentUser){
            return response()->json(['status' , false , 'errors' => 'This account is not in belafy' ]);
        }

        // Code for password otp creation
        try{

            $otp_code = $this->generateOtp(4);

            $passwordOtp = PasswordOtp::create([
                'otp_code' => $otp_code ,
                'user_id' => $currentUser->id,
                'verified' => false,
                'token' => ''
            ]);

            $email = $currentUser->email;
            $data = ''; // Have you figured out any data to send for the mail template?

            Mail::send('mails.password_reset_otp', ['passwordOtp' => $passwordOtp , 'user' => $currentUser ], function ($message) use ($email) {

                $message->from('info@thebelafy.com', 'The belafy');
                //            $message->bcc('info@myvanandman.com');
//                $message->bcc('shahil.nissam@brtindia.com');
//                $message->bcc('arunkumar.s@brtindia.com');

                $message->to($email)->subject('Your OTP For Password');

            });

//            return response()->json(['status' => true , 'data' => 'We have sent you the mail to your email id with otp. Please provide the OTP to update your password']);

        }
        catch(\Exception $ex){
            return response()->json(['status' => 'false' , 'errors' => $ex ]);
        }

        // If mail send we ll send them otp_id not otp_code
        return response()->json(['status' => true , 'data' => ['otp_id' => $passwordOtp->id , 'msg' => 'We have sent you the mail to your email id with otp. Please provide the OTP to update your password']]);

    }

    public function checkResetOtp(Request $request){

        $otpId = $request->otp_id;
        $otpCode = $request->otp_code;

        try{

            $passwordOtp = PasswordOtp::find($otpId);

            if(!$passwordOtp)
                return response()->json(['status' => false , 'errors' => 'Wrong OTP Code']);

            if($passwordOtp->verified)
                return response()->json(['status' => false , 'errors' => 'OTP Expired']);

            $currentUser = User::find($passwordOtp->user_id);


            // Verify whether otp is right or wrong??
            if($passwordOtp->otp_code != $otpCode) {
                return response()->json(['status' => false , 'errors' => 'OTP Verfication failed']);
            }


            $passwordOtp->verified_at = date('Y-m-d H:i:s');
            $token = $this->generateOtp(20) . $passwordOtp->id;
            $passwordOtp->token = $token;
            $passwordOtp->save();

            return response()->json(['status' => true , 'token' => $token , 'otp_id' => $otpId]);


        }catch (\Exception $ex){

        }
    }

    /**
     * @param Request $request
     */
    public function updatePassword(Request $request){

        $oldPassword = $request->old_password;
        $password = $request->password;
        $passwordConfirmation = $request->password_confirmation;

        $currentUser = MyLibrary::getJWTUser($request);

        $resetRules = [
            'password' => 'required|confirmed|min:6'
        ];

        $validator = Validator::make($request->all() , $resetRules);
        if($validator->fails()){
            return response()->json(['status' => false , 'errors' => $validator->errors()->first()]);
        }

        if(!Hash::check(  $request->old_password , $currentUser->password  )){
            return response()->json(['status' => false , 'errors' => 'Old Password Not Matching']);
        }

        $currentUser->password = bcrypt($request->password);
        $currentUser->save();

        return response()->json(['status' => true , 'message' => 'Password Changed Successfully!' ]);

    }

    public function resetPassword(Request $request){

        // Reset password and change password after loged in is different
        // But use the same function to override token and take the user from db
        return $this->changePassword($request , 'reset');

    }

    public function testMail(){

        $passwordOtp =  123;

        $email = 'shahil.nissam@brtindia.com';

        try{


            Mail::send('mails.test', ['passwordOtp' => '123' , 'user' => '123' ], function ($message) use ($email) {

                $message->from('info@thebelafy.com', 'The belafy');
//                            $message->bcc($email);
                $temp_mails = ['shahil.nissam@brtindia.com' , 'shahilnizzam@gmail.com'];

                foreach ($temp_mails as $tmp)
                $message->bcc($tmp);
//
                $message->to($email)->subject('Your OTP For Password');

            });

        }
        catch(\Exception $ex){
            return $ex;
        }

        
    }
    

    //Public function update profile pic

    public function updateProfileImage(Request $request){


//        $currentUser = JWTAuth::parseToken()->authenticate();
        $currentUser = JWTAuth::toUser($request->input('token'));

        if(!$currentUser){
            return response()->json(['status' , false , 'errors' => 'This account in not in belafy' ]);
        }

        $validator = Validator::make($request->all() , [
           'profile_image' => 'required'
        ]);

        if($validator->fails())
            return response()->json(['status' => false , 'errors' => $validator->errors()->first()]);


        $image_str = $request->profile_image;
        $array = explode(',', $image_str);

        $image = Image::make(base64_decode($array[1]));

        // resize the image to a width of 300 and constrain aspect ratio (auto height)
        $image->resize(300, null, function ($constraint) {
            $constraint->aspectRatio();
        });

        $profile_image = date('YmdHis') . $this->generateOtp(10) . '.jpg';

        $image->save('uploads/profile_image/' . $profile_image);


        // Delete the previous image
        File::delete('uploads/profile_image/' . $currentUser->profile_image);



        $currentUser->profile_image = $profile_image;
        $currentUser->save();

        $profile_image = env('APP_URL') . 'uploads/profile_image/' . $profile_image;

        return response()->json(['status' => true , 'data' => $profile_image]);




    }

    public function updateCoverImage(Request $request){

        $currentUser = JWTAuth::toUser($request->input('token'));
//        $currentUser = JWTAuth::parseToken()->authenticate();

        $validator = Validator::make($request->all() , [
            'cover_image' => 'required'
        ]);

        if($validator->fails())
            return response()->json(['status' => false , 'errors' => $validator->errors()->first()]);

        $image_str = $request->cover_image;
        $array = explode(',', $image_str);

        $image = Image::make(base64_decode($array[1]));

        // resize the image to a width of 300 and constrain aspect ratio (auto height)
        $image->resize(300,200);

        $cover_image = date('YmdHis') . $this->generateOtp(10) . '.jpg';

        $image->save('uploads/cover_image/' . $cover_image);


        // Delete the previous image
        File::delete('uploads/cover_image/' . $currentUser->cover_image);

        $currentUser->cover_image = $cover_image;
        $currentUser->save();

        $cover_image = env('APP_URL') . 'uploads/cover_image/' . $cover_image;

        return response()->json(['status' => true , 'data' => $cover_image]);

//        try{
//
//
//        }
//        catch (\Exception $ex){
//            return response()->json(['status' => false , 'errors' => $ex]);
//        }




    }

    public function authFacebook(Request $request){

        //GET facebook id
        $facebookId = $request->id;
        $name = $request->name;
        $email = $request->email;

        if(!$facebookId){
            return 'please provide facebook id';
        }
        //Check whether any user associated with this
        $user = User::where('facebook_id' , $facebookId)->first();

        if($user){
            $token = JWTAuth::fromUser($user);
            return response()->json(['status' => true , 'token' => $token]);
        }
        else{ // Log in for the first time using facebook

            if($email){

                $email_user = User::where('email' , '=' ,$email)->first();
                if($email_user){
                    $email_user->facebook_id = $facebookId;
                    $email_user->save();

                    $token = JWTAuth::fromUser($email_user);
                    return response()->json(['status' => true , 'token' => $token]);
                }
            }

            // If it is new user
            $user = User::create([
               'facebook_id' => $facebookId ,
               'name' => $name ,
               'email' => $email ,
               'first_name' => $name
            ]);

            Role::attachRoleToUser($user , $request->user_role);

            // Mails to user & admin
            User::registeration_MailToUser($user);
            User::registeration_MailToAdmin($user);

            $token = JWTAuth::fromUser($user);
            return response()->json(['status' => true , 'token' => $token]);

        }

        return response()->json(['status' => false , 'message' => 'Something went wrong!']);

    }


    // API for seller profile

    public function addFavouriteSeller(Request $request){

        $user = MyLibrary::getJWTUser($request);
        $seller_id = $request->seller_id;

        $fav = FavouriteSeller::where('seller_id' , '=' , $seller_id)->where('user_id' , $user->id)->get();

        if($fav->count()){
            return response()->json(['status' => false , 'errors' => 'Already added to favourites']);
        }

        $favourite = FavouriteSeller::create([
            'user_id' => $user->id ,
            'seller_id' => $seller_id
        ]);

        if($favourite){
            return response()->json(['status' => true , 'data' => 'Added to favourites!']);
        }

    }


    public function getFavouriteSellers(Request $request){

        $base_url = env('APP_URL');
        $user = MyLibrary::getJWTUser($request);
        $favourites = FavouriteSeller::getFavouriteSellers($user->id);

        if(!$favourites) {
            return response()->json(['status' => false , 'data' => 'No Favourite Sellers']);
        }

        $merged = array();

        foreach ($favourites as $list){

            $base_url = env('APP_URL');
            // Change profile_image and cover image params
            $list = collect($list);
            $profile_image = $list['profile_image'];
            $cover_image = $list['cover_image'];

            $dummy_user_image = $base_url . 'image/user_image.png';
            $dummy_cover_image = $base_url . 'image/cover_image.jpg';

            // merge profile image nad cover picture
            $list_merged = $list->merge(
                [
                    'profile_image' => ($profile_image)?$base_url .  'uploads/profile_image/'.$profile_image:$dummy_user_image,
                    'cover_image' => ($cover_image)?$base_url .  'uploads/cover_image/'.$cover_image:$dummy_cover_image,
                ]
            );
            $merged[] = $list_merged;
        }

        return response()->json(['status' => true , 'data' => $merged]);
    }

    public function removeFavouriteSeller(Request $request){

        $user = MyLibrary::getJWTUser($request);

        $del = FavouriteSeller::removeFavouriteSeller($user->id , $request->seller_id);

        if($del){
            return response()->json(['status' => false , 'msg' => 'Deleted Successfully']);
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getAddresses(Request $request){
        $user = MyLibrary::getJWTUser($request);
        $addresses = Address::where('user_id' , $user->id)->get();

        return response()->json(['status' => true  , 'addresses' => $addresses]);
    }

    public function createAddress(Request $request){

        $user = MyLibrary::getJWTUser($request);

        $validator = Validator::make($request->all() , [
            'name' => 'required',
            'address_one' => 'required',
            'phone' => 'required',
            'city'  => 'required' ,
            'pincode' => 'required',
        ]);

        if($validator->fails()){
            return response()->json(['status'=> false , 'address' => $validator->errors()->first()]);
        }

        $address = Address::create([
            'user_id' => $user->id,
            'name' => $request->name ,
            'address_one' => $request->address_one ,
            'address_two' => $request->address_two ,
            'phone' => $request->phone ,
            'city'  => $request->city  ,
            'pincode' => $request->pincode
        ]);

        return response()->json(['status' => true , 'data' => $address]);
    }

    public function updateAddress(Request $request){

        $user = MyLibrary::getJWTUser($request);

        $validator = Validator::make($request->all() , [
            'name' => 'required',
            'address_one' => 'required',
            'phone' => 'required',
            'city'  => 'required' ,
            'pincode' => 'required',
        ]);

        $address = Address::updateOrCreate(['id' => $request->address_id] , [
            'user_id' => $user->id,
            'name' => $request->name ,
            'address_one' => $request->address_one ,
            'address_two' => $request->address_two ,
            'phone' => $request->phone ,
            'city'  => $request->city  ,
            'pincode' => $request->pincode
        ]);

        return response()->json(['status' => true , 'data' => $address]);
    }


}