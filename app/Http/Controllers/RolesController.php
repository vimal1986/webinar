<?php

namespace App\Http\Controllers;

use App\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class RolesController extends Controller
{
    //

    public function createAdminRole(){

        $admin = new Role();
        $admin->name         = 'admin';
        $admin->display_name = 'User Administrator'; // optional
        $admin->description  = 'The owner of the App'; // optional
        $admin->save();
    }

    public function createUserRole(){
        $admin = new Role();
        $admin->name         = 'user';
        $admin->display_name = 'User Customer'; // optional
        $admin->description  = 'B to C'; // optional
        $admin->save();
    }

    public function getAdminRole(){

        $adminRole = Role::where('name' , '=' , 'admin')->first();
        return $adminRole;
    }

    public function getUserRole(){
        $userRole = Role::where('name' , '=' , 'user')->first();
        return $userRole;
    }

    public function attachRoleToUser(\App\Role $role , \App\User $user){

        return $user->AttachRole($role);

    }

    // Check role and redirect

    public function checkRole(){

        try{
            $user = Auth::user();

            if($user){

                if($user->hasRole('admin'))
                {
                    return redirect('/admin');
                }
                else{
                    Auth::logout(); // Considering no room for other users in cms , only allows admin
                    return 'Has no admin privillege'; // Considering there can be only admin role
                }
            }
        }
        catch(\Exception $ex){

        }
    }
}
