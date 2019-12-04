<?php

namespace App\Http\Controllers;

use App\CreateInvoice;
use Illuminate\Http\Request;
use Libraries\MyLibrary\MyLibrary;

class InvoiceController extends Controller
{
    //

    public function createInvoice(Request $request){

        $user = MyLibrary::getJWTUser($request);

        $invoice = CreateInvoice::create([
            'seller_id' => $user->id ,
            'buyer_id' => $request->buyer_id ,
            'product_id' => $request->product_id ,
            'meeting_location_address' => $request->meeting_location_address ,
            'price' => $request->price ,
            'discount_price' => $request->discount_price,
            'agreed_price' => $request->agreed_price
        ]);

        CreateInvoice::sendMailToBuyer($invoice);

    }
}
