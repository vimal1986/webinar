<?php

namespace App\Http\Controllers;

use App\ServiceCategory;
use Illuminate\Http\Request;
use Libraries\MyLibrary\MyLibrary;

class ServicesController extends Controller
{
    //

    public function getServiceCategories(Request $request){

//        $user = MyLibrary::getJWTUser($request);
        $serviceCategories = ServiceCategory::where('parent_id' , '=' , 0)->get();
        return response()->json(['status' => true , 'categories' => $serviceCategories]);

    }


    public function getServiceListsbyCategory(Request $request){

        $categories = ServiceCategory::where('parent_id' , '=' , $request->category_id)->get();

        $category_ids = array();
        foreach ($categories as $category){
            $category_ids[] = $category->id;
        }

        $services = \DB::table('services as srvc')
                        ->join('service_categories as cat' , 'cat.id' , '=' , 'srvc.category_id')
                        ->select('srvc.*' , 'cat.category_name' , 'cat.id as category_id' )
                        ->whereIn('srvc.category_id' , $category_ids)
                        ->orderBy('cat.id' , 'ASC')
                        ->orderBy('srvc.id' , 'ASC')
                        ->get();

        return response()->json(['status' => true , 'services' => $services , 'sub_level_categories' => $categories]);
    }


}
