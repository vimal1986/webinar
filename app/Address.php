<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    //
    protected $fillable = [
        'name' ,
        'address_one' ,
        'address_two' ,
        'phone' ,
        'pincode' ,
        'city' ,
        'user_id'
    ];
}
