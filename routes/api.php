<?php
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['prefix' => 'v1','middleware' => 'auth:api'], function () {
    //    Route::resource('task', 'TasksController');

    //Please do not remove this if you want adminlte:route and adminlte:link commands to works correctly.
    #adminlte_api_routes
});

//Create Roles for once

Route::get('auth/roles' , function(){

//    $role = new \App\Http\Controllers\RolesController();
//    $role->createAdminRole();
//    $role->createUserRole();

});

Route::post('test_mail', 'UserController@testMail');
Route::post('auth/register', 'UserController@register');
Route::post('auth/login', 'UserController@login');

Route::post('auth/reset' , 'UserController@resetPasswordRequest');
Route::post('check_reset_otp' , 'UserController@checkResetOtp');
Route::post('reset_password' , 'UserController@resetPassword');

/*
 * Social Authentication
*/

Route::post('auth/facebook' , 'UserController@authFacebook');
Route::post('auth/twitter' , 'UserController@authTwitter');
Route::post('auth/instagram' , 'UserController@authInstagram');


Route::group(['middleware' => 'jwt.auth'], function () {

    Route::get('user', 'UserController@getAuthUser');

    //Get user Information
    Route::get('get_user_profile' , 'UserController@getUserProfileDetails');


    //Update profile details
    Route::post('update_profile' , 'UserController@updateProfile');

    // Change Password
    Route::post('password_change_request' , 'UserController@requestPasswordChange');
    Route::post('change_password' , 'UserController@changePassword');

    // this is to change password after logged in
    Route::post('update_password' , 'UserController@updatePassword');

    //Update User Images
    Route::post('update_profile_image' , 'UserController@updateProfileImage');
    Route::post('update_cover_image' , 'UserController@updateCoverImage');

    //ADDRESS API
    Route::post('get_addresses' , 'UserController@getAddresses');
    Route::post('create_address' , 'UserController@createAddress');
    Route::post('update_address' , 'UserController@updateAddress');

    //PROFESSIONALS API
    Route::post('get_professionals' , 'ProfessionalsController@getProfessionals');

    //CHAT API's
    Route::post('get_messages', 'ChatsController@fetchMessages');
    Route::post('post_messages', 'ChatsController@sendMessage');


    //SERVICES API's
    Route::post('get_service_categories' , 'ServicesController@getServiceCategories');
    Route::post('get_service_list_by_category' , 'ServicesController@getServiceListsbyCategory');

});


