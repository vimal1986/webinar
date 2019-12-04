<?php

namespace App\Http\Controllers;

use App\Complaint;
use App\Models\League;
use App\Models\Team;

use App\Order;
use App\Product;
use App\ProductImages;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
use League\Flysystem\Exception;

use Libraries\MyLibrary\MyLibrary;
use function PHPSTORM_META\type;
use Yajra\Datatables\Facades\Datatables; // Yajra

class AdminController extends Controller
{
    public function show($filter_status = null)
    {
        return view('index');
    }


    /*add dashboard*/
    public function dashBoard(){

        try{

            \DB::select("SET sql_mode=''");

            $orders = \DB::select("SELECT o.id  , pi.filename , o.purchase_date  , o.product_id , p.product_title ,  
                    CASE 
                      WHEN u.handle_name IS NULL THEN u.first_name
                      ELSE CONCAT('@',u.handle_name)
                    END as seller_name
                    , p.user_id as seller_id 
                    ,  
                    CASE 
                      WHEN buyer.handle_name IS NULL THEN buyer.first_name
                      ELSE CONCAT('@',buyer.handle_name)
                    END as buyer_name
                    , o.user_id as buyer_id , o.amount as order_amount ,
                    CASE
                      WHEN pi.filename  IS NULL THEN ''
                      ELSE CONCAT('".env('APP_URL')."uploads/product_images/thumb_', pi.filename  )
                    END AS img_url
                    
                    from orders as o JOIN products as p ON o.product_id=p.id 
                    LEFT JOIN product_images as pi ON pi.product_id=p.id 
                    JOIN users as u ON u.id=p.user_id 
                    LEFT JOIN users as buyer ON buyer.id=o.user_id 
                    
                     GROUP BY p.id ORDER BY o.id DESC   LIMIT 5");


            $products = \DB::select("

            SELECT p.* , u.handle_name , u.first_name , u.last_name  , pi.filename , 

            CASE 
              WHEN u.handle_name IS NULL THEN u.first_name
              ELSE CONCAT('@',u.handle_name)
            END as seller_name ,
            
            CASE
                WHEN pi.filename  IS NULL OR '' THEN '".env('APP_URL')."image/unknown_product.png' 
                ELSE CONCAT('".env('APP_URL')."uploads/product_images/thumb_', pi.filename )
            END AS img_url

            from products as p LEFT JOIN product_images as pi ON p.id=pi.product_id
            LEFT JOIN users as u ON p.user_id = u.id 
            GROUP BY p.id ORDER BY p.id DESC LIMIT 5;

            ");

            return view('dashboard/dashboard' , compact('orders' , 'products'));

        } catch (Exception $e){

        }
    }

    public function usersLists()
    {
        //$users = User::all();
        //$dataTable = Datatables::of(User::all())->make(true);
        $users = \DB::table('users')
                        ->join('role_user as ru' , 'ru.user_id' , '=' , 'users.id')
                        ->where('ru.role_id' , '=' ,2) // change 2 to constant
                        ->select(\DB::raw('users.*'))
                        ->get();

        return view('users.lists' , compact('users') );

    }

    public function userProfile($user_id){
        $user = User::find($user_id);
        return view('users.profile' , compact('user' , 'products'));
    }

    /**
     *
     */
    public function deleteUser(Request $request){

        $user = User::find($request->user_id);
        $user->products()->delete();
        $user->delete();

        return \redirect('admin/users_lists')->with('status' , 'Deleted Successfully');

    }

    /**
     * @return mixed
     */
    public function getUserLists(){

        $dataTable = Datatables::collection(User::all())->make(true);
        return $dataTable;

    }

    public function getProductsDetails($product_id){

        $product = Product::find($product_id);
        $product_image = ProductImages::where('product_id' , $product_id)->get();

        $latlng = $product->lat.','.$product->lng;

        $client = new \GuzzleHttp\Client();
        $res = $client->get('http://maps.googleapis.com/maps/api/geocode/json?latlng='.$latlng.'&sensor=true');
        $result = json_decode($res->getBody());

//        dd($res->getStatusCode());

        $formatted_address = '';
        if($res->getStatusCode() == 200){
            try{
                $formatted_address = $result->results[0]->formatted_address;
            }catch(\Exception $ex){

            }
        }

        $image_url = array();
        // Product Images
        $i=0;
        foreach($product_image as $img)
            $image_url[] = MyLibrary::getProductImageURL($img->filename);

        $exclude_id = $product_id;
        // Get other products of this seller
        $other_items = $this->getProductsBySeller($product->user_id , $exclude_id);

//        if($product){
//            return response()->json(['status' => true , 'product_details' => $product , 'product_images' => $image_url  , 'other_items' => $other_items]);
//        }
        return view('users.product_details' , compact('product' , 'image_url' , 'other_items' , 'formatted_address'));

    }


    public function getProductsBySeller($seller_id , $exclude_id = 0){

        $products = Product::where('user_id' , $seller_id)

            ->where('id' , '!=' , $exclude_id)
            ->get();

        $product_images = array();
        //get the images
        foreach($products as $item){
            $prdt_img = ProductImages::where('product_id' , $item->id)->first();
            if($prdt_img){
                $filename = MyLibrary::getProductThumbImageURL($prdt_img->filename);
                $product_images[] = array('id' => $item->id , 'image_url' => $filename) ;
            }
        }

        if($product_images){
            return $product_images;
        }

        return '';

    }

    public function getProductsLists(){

//        $products = Product::join('users as u' , 'u.id' , '=' , 'products.user_id')
//                        ->select('products.*' , 'u.handle_name')->get();

        $date_range_filter = '';
        if(Input::get('from_date')){

            $from_date = date('Y-m-d' , strtotime(Input::get('from_date')));
            $to_date = date('Y-m-d' , strtotime(Input::get('to_date')));
            $date_range_filter =  " AND p.created_at BETWEEN  '" . $from_date . "' AND '" . $to_date . "'";
        }

        \DB::select("SET sql_mode=''");

        $products = \DB::select("

            SELECT p.* , u.handle_name , u.first_name , u.last_name  , pi.filename , 

            CASE 
              WHEN u.handle_name IS NULL THEN u.first_name
              ELSE CONCAT('@',u.handle_name)
            END as seller_name ,
            
            CASE
                WHEN pi.filename  IS NULL OR '' THEN '".env('APP_URL')."image/unknown_product.png' 
                ELSE CONCAT('".env('APP_URL')."uploads/product_images/thumb_', pi.filename )
            END AS img_url

            from products as p LEFT JOIN product_images as pi ON p.id=pi.product_id
            LEFT JOIN users as u ON p.user_id = u.id 
            WHERE 1=1 ". $date_range_filter ."
            GROUP BY p.id 

            ");

        return view('users.product_lists' , compact('products'));
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getOrders(Request $request , $dashboard = false){

        $range = $request->range ;
        $search = $request->search;

        $date_range_filter = '';
        if(Input::get('from_date')){

            $from_date = date('Y-m-d' , strtotime(Input::get('from_date')));
            $to_date = date('Y-m-d' , strtotime(Input::get('to_date')));
            $date_range_filter =  " AND o.purchase_date BETWEEN  '" . $from_date . "' AND '" . $to_date . "'";
        }

        $search_query = '';
        if($search){
            $search_query = " AND p.product_title LIKE '%" . $search . "%'";
        }

        \DB::select("SET sql_mode=''");

        $orders = \DB::select("SELECT o.id  , pi.filename , o.purchase_date  , o.product_id , p.product_title ,  
                    CASE 
                      WHEN u.handle_name IS NULL THEN u.first_name
                      ELSE CONCAT('@',u.handle_name)
                    END as seller_name
                    , p.user_id as seller_id 
                    ,  
                    CASE 
                      WHEN buyer.handle_name IS NULL THEN buyer.first_name
                      ELSE CONCAT('@',buyer.handle_name)
                    END as buyer_name
                    , o.user_id as buyer_id , o.amount as order_amount ,
                    CASE
                      WHEN pi.filename  IS NULL THEN ''
                      ELSE CONCAT('".env('APP_URL')."uploads/product_images/thumb_', pi.filename  )
                    END AS img_url
                    
                    from orders as o JOIN products as p ON o.product_id=p.id 
                    LEFT JOIN product_images as pi ON pi.product_id=p.id 
                    JOIN users as u ON u.id=p.user_id 
                    LEFT JOIN users as buyer ON buyer.id=o.user_id 
                    
                    WHERE 1=1 ". $date_range_filter . $search_query . "  GROUP BY p.id ");

        if($dashboard)
            return $orders;

        return view('orders.orders' , compact('orders'));

    }


    public function invoice($order_id){

        $order = Order::find($order_id);
        return view('orders.order_view' , compact('order'));

    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function supportCenter(){

        $complaints = \DB::table('complaints as c')
                        ->join('orders as o' , 'o.id' , '=' , 'c.order_id')
                        ->join('users as u' , 'u.id' , '=' , 'o.user_id')
                        ->select('c.*' , 'o.user_id' , 'u.handle_name' )
                        ->get();

        return view('support_center.complaints' , compact('complaints'));
    }


}
