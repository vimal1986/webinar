<?php

namespace App\Http\Controllers;

use App\Complaint;
use Illuminate\Http\Request;
use Libraries\MyLibrary\MyLibrary;

class ComplaintsController extends Controller
{
    //

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createComplaint(Request $request){

        $user = MyLibrary::getJWTUser($request);
        $validator = Complaint::complaintValidator($request);
        if($validator->fails()) {
            return response()->json(['status' => false , 'errors' => $validator->errors()->first()]);
        }

        $complaint = Complaint::createComplaint($request , $user);

        if($complaint){
            return response()->json(['status' => true , 'data' => 'Mail has sent to admin']);
        }

    }

    public function showForm(Request $request){

        $user = MyLibrary::getJWTUser($request);
        $order_id = $request->order_id;
        $order = '';

        \DB::select("SET sql_mode=''");

        $orders = \DB::select("SELECT o.id  ,pi.filename , u.first_name , u.last_name , u.email , DATE_FORMAT(o.purchase_date,'%m-%d-%y') as purchase_date , o.product_id , p.product_title ,  

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
                    WHERE o.id=".$order_id . "  GROUP BY p.id ");
        if($orders)
        $order = $orders[0];

        return response()->json(['status' => true , 'order' => $order]);

    }

    public function getComplaints(Request $request){



        $user = MyLibrary::getJWTUser($request);

        $complaints = Complaint::getComplaints(null);

    }


}
