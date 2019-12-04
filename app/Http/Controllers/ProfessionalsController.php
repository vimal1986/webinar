<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Libraries\MyLibrary\MyLibrary;

class ProfessionalsController extends Controller
{
    //

    public function getProfessionals(Request $request){

        $user = MyLibrary::getJWTUser($request);

        //Get Professionals
        $professionals = \DB::table('users')
            ->join('role_user as ru' , 'ru.user_id' , '=' , 'users.id')
            ->where('ru.role_id' , '=' ,PROFESSIONAL_ROLE_ID) // change 2 to constant
            ->select(\DB::raw('users.*'))
            ->get();

        return response()->json(['status' => true , 'professionals' => $professionals]);

    }
}
