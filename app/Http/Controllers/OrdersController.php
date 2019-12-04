<?php

namespace App\Http\Controllers;

use App\Order;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Libraries\MyLibrary\MyLibrary;

class OrdersController extends Controller
{
    //

    public function getOrders(Request $request){

        $range = $request->range ;
        $search = $request->search;

        $user = MyLibrary::getJWTUser($request);

        $date_query = '';
        $search_query = '';
        if($range==3){
            $date_range = date('Y-m-d', strtotime(Carbon::now()->subMonth(3)));
            $date_query = " AND o.purchase_date >='" . $date_range . "'";
        }

        if($search){
            $search_query = " AND p.product_title LIKE '%" . $search . "%'";
        }

        \DB::select("SET sql_mode=''");

        $orders = \DB::select("SELECT o.id  , pi.filename , DATE_FORMAT(o.purchase_date,'%m-%d-%y') as purchase_date , o.product_id , p.product_title ,  

                    CASE 
                      WHEN u.handle_name IS NULL THEN u.first_name
                      ELSE CONCAT('@',u.handle_name)
                    END as seller_name
                    ,
                    CASE
                      WHEN pi.filename  IS NULL THEN ''
                      ELSE CONCAT('".env('APP_URL')."uploads/product_images/thumb_', pi.filename  )
                    END AS img_url
                    
                    from orders as o JOIN products as p ON o.product_id=p.id 
                    LEFT JOIN product_images as pi ON pi.product_id=p.id 
                    JOIN users as u ON u.id=p.user_id 
                    
                   
                    
                    WHERE o.user_id = ". $user->id . $date_query . $search_query . "  GROUP BY p.id ");

//        . " AND o.purchase_date >= '" . Carbon::now()->subMonth(-3)->toDateTimeString() . "'"

        return response()->json(['status' => true , 'orders' => $orders ]);

    }

}
