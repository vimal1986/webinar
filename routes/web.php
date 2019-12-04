<?php
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Check the role and do redirects

Route::get('check_role' , 'RolesController@checkRole');

Auth::routes();

Route::get('/logout' , 'AuthController@logout');

Route::get('/' , function (){
    return redirect('login');
});

Route::get('/home' , function (){
    return redirect('admin');
});

Route::group(['prefix' => 'admin', 'middleware' => ['role:admin']], function () {
    /*Route::get('/{status?}', 'AdminController@show')->name('admin');*/
    Route::get('/', 'AdminController@dashBoard')->name('admin');

    Route::get('/users_lists' , 'AdminController@usersLists')->name('usersLists');

    Route::get('/get_userlists' , 'AdminController@getUserLists')->name('getUserLists');

    Route::get('/user_profile/{user_id}' , 'AdminController@userProfile')->name('userProfile');

    Route::post('/delete_user' , 'AdminController@deleteUser');

});

//Route::controller('datatables', 'DatatablesController', [
//    'anyData'  => 'datatables.data',
//    'getIndex' => 'datatables',
//]);
Route::get('/password/reset/', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
/*Route::get('/password/reset/', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');*/
/*get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name();*/
Route::get('password_change_request' , 'UserController@testMail');
Route::get('geo_search' , 'PagesController@geoSearch');
Route::get('storelocator' , 'PagesController@storeLocator');
//Route::get('/', 'ChatsController@index');
Route::get('messages', 'ChatsController@fetchMessages');
Route::post('messages', 'ChatsController@sendMessage');
//BRAINTREE TESTING
Route::get('/create_customer' , 'PaymentsController@createCustomer');
Route::get('/verify_card_details' , 'PaymentsController@verifyCardDetails');
Route::get('/create_sale' , 'PaymentsController@createSale');
// MERCHANT ACCOUNTS & ESCROW
Route::get('/create_merchant_account' , 'PaymentsController@createMerchantAccount');
Route::get('/web_hook' , 'PaymentsController@webHook');
Route::get('/merchant_status' , 'PaymentsController@merchantAccountStatus');
Route::get('/merchant_transaction' , 'PaymentsController@merchantTransaction');