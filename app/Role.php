<?php namespace App;

use Zizaco\Entrust\EntrustRole;

class Role extends EntrustRole
{

    /**
     * @return \Illuminate\Database\Eloquent\Model|null|static
     */
    public static function getAdminRole(){

        $adminRole = Role::where('name' , '=' , 'admin')->first();
        return $adminRole;
    }

    /**
     * @return \Illuminate\Database\Eloquent\Model|null|static
     */
    public static function getUserRole(){
        $userRole = Role::where('name' , '=' , 'user')->first();
        return $userRole;
    }

    /**
     * @param $role
     * @return \Illuminate\Database\Eloquent\Model|null|static
     */
    public static function getRole($role){
        $userRole = Role::where('name' , '=' , $role)->first();
        return $userRole;
    }

    /**
     * @param User $user
     * @param $user_role
     */
    public static function attachRoleToUser( \App\User $user , $user_role){

        if($user_role == USER_ROLE_ID){
            return Self::attachUserRole($user);
        }elseif($user_role == PROFESSIONAL_ROLE_ID){
            return Self::attachProfessionalRole($user);
        }

    }

    /**
     * @param $user
     * @throws \Exception
     */
    public static function attachUserRole($user){
        try{

            $userRole = Role::find(USER_ROLE_ID);
            $user->AttachRole($userRole);

        }catch(\Exception $ex){

            throw new \Exception('Roles attach failed');
        }
    }


    /**
     * @param $user
     * @throws \Exception
     */
    public static function attachProfessionalRole($user){
        try{
            $profRole = Role::find(PROFESSIONAL_ROLE_ID);
            $user->AttachRole($profRole);
        }catch(\Exception $ex){

            throw new \Exception('Roles attach failed');
        }
    }

}