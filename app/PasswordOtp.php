<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PasswordOtp extends Model
{
    //
    protected $table = 'password_otps';

    protected $fillable = [
        'user_id' ,
        'otp_code' ,
        'verified'
    ];


}
