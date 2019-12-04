<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Zizaco\Entrust\Traits\EntrustUserTrait;

use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;


use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Cashier\Billable;

class User extends Authenticatable
{

    use Notifiable;
    use Billable;

    use EntrustUserTrait { restore as private restoreB; } // add this trait to your user model
    use SoftDeletes { restore as private restoreA; }

    public function restore()
    {
        $this->restoreA();
        $this->restoreB();
    }

    protected $dates = ['deleted_at'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'mobile' ,'first_name' , 'last_name' , 'handle_name' , 'profile_image' ,
        'cover_image' , 'is_active'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];


    public function products(){
        return $this->hasMany('App\Product' , 'user_id' , 'id');
    }


    /**
     * Validation for user registeration
     * @param Request $request
     * @return mixed
     */
    public static function registerValidator(Request $request){

        // Validation
        $validator = Validator::make($request->all() , [
            'name'     => 'required|max:30',
            'email'    => 'required|email|max:255|unique:users',
            'password' => 'required|confirmed|min:6',
            'mobile'   => 'required|max:15'
        ]);

        return $validator;
    }

    public static function loginValidator($request){

        $validator = Validator::make($request->all() , [
            'email' => 'required|email',
            'password'  => 'required'
        ]);

        return $validator;
    }

    public static function updateProfileValidator($request){

        // Validation
        $validator = Validator::make($request->all() , [

            'first_name'    => 'required|max:30',
            'last_name' => 'required|max:30',
            'handle_name' => 'required|max:30',
            'mobile'   => 'required|max:15'

        ]);

        return $validator;
    }
    /**
     * Create the user
     * @param Request $request
     * @throws \Exception
     */
    public static function createUser(Request $request){

        try{
            $user = User::create([
                'name' => $request->get('name'),
                'email' => $request->get('email'),
                'password' => bcrypt($request->get('password')),
                'mobile'    => $request->get('mobile'),
                'first_name' => $request->get('name'),
                'last_name' => '',
                'profile_image' => '' ,
                'cover_image' => '' ,
                'is_active' => true
            ]);

        }catch (\Exception $ex){
            throw new \Exception('User creation failed | ' . $ex->getMessage());
        }

        return $user;
    }

    /**
     * Registeration mail to User
     * @param User $user
     * @return string
     */
    public static function registeration_MailToUser(\App\User $user){

        try{
            $email = $user->email;
            Mail::send('mails.user_registered', [ 'user' => $user ], function ($message) use ($email) {
                $message->from(ADMIN_EMAIL_TO, ADMIN_EMAIL_TO_NAME);
                $message->bcc(DEVELEPOR_TEST_MAIL);
                $message->to($email)->subject('You have successfully registered');
            });
        }catch(\Exception $ex){
            return 'Mail Send Failed | ' . $ex ->getMessage();
        }

    }

    /**
     * Registeration mail to admin
     * @param User $user
     * @return string
     */
    public static function registeration_MailToAdmin(\App\User $user){

        try{
            $email = $user->email;
            Mail::send('mails.user_registered_admin', [ 'user' => $user ], function ($message)  {

                $message->from(ADMIN_EMAIL_TO, ADMIN_EMAIL_TO_NAME);
                $message->bcc(DEVELEPOR_TEST_MAIL);
                $message->to(ADMIN_EMAIL_TO)->subject('New User Registeration');
            });
        }catch(\Exception $ex){
            return 'Mail Send Failed | ' . $ex ->getMessage();
         }
    }

    public function orders(){
        return $this->hasMany('App\Order' , 'user_id' , 'id');
    }

}
