<?php

namespace App\Http\Controllers;

use App\Product;
use App\ProductImages;
use App\Providers\HelperServiceProvider;
use App\User;
use Illuminate\Http\Request;

use Libraries\MyLibrary\MyLibrary;

class ProductsController extends Controller
{
    //
    public function guestPincode(Request $request){

        $pincode = $request->pincode;
        $data = MyLibrary::getLatLng_FromPinCode($pincode);

        if(!$data['status']){
            return response()->json(['status' => false , 'errors' => $data['errors']]);
        }

        try{

            $lat = $data['lat'];
            $lng = $data['lng'];
            $radius_to = DEFAULT_MILES_RANGE;
            $radius_from = 0; //By default zero

            // Get the products in the nearest range
            $result = Product::getProducts_in_MilesRange($lat , $lng , $radius_from , $radius_to);

            if($result)
                return response()->json(['status' => true , 'items' => $result , 'cordinates' => $data]);
            else
                return response()->json(['status' => false , 'errors' => 'No products found!']);


        }catch (\Exception $ex){
            return response()->json([ 'errors' => 'Cant identify geo location']);
        }

    }


    public function getProducts_list(Request $request){

        $user = MyLibrary::getJWTUser($request);
        try{

            $lat = $request->lat;
            $lng = $request->lng;
            $radius_from = $request->radius_from;
            $radius_to = $request->radius_to;

            $filter[] = array();
            $filter['price_from'] = $request->price_from;
            $filter['price_to'] = $request->price_to;
            $filter['discounted_price_from'] = $request->discounted_price_from;
            $filter['discounted_price_to'] = $request->discounted_price_to;



            // Get the products in the nearest range
            $result = Product::getProducts_in_MilesRange($lat , $lng , $radius_from , $radius_to , $user->id );

            return response()->json(['status' => true , 'items' => $result]);

        }catch (\Exception $ex){
            return response()->json([ 'errors' => 'Cant identify geo location']);
        }

    }

    /**
     * Get products in dom markup format
     * @param $lat
     * @param $lng
     * @param $radius
     * @return \Illuminate\Http\JsonResponse|string
     */
    public function getProducts_DomMarkupXml(Request $request){

        $lat = $request->lat;
        $lng = $request->lng;
        $radius_from = $request->radius_from;
        $radius_to = $request->radius_to;

        // Start XML file, create parent node
        $dom = new \DOMDocument("1.0");
        $node = $dom->createElement("markers");
        $parnode = $dom->appendChild($node);

        //Get products
        $result = Product::getProducts_in_MilesRange($lat , $lng , $radius_from , $radius_to);

        foreach($result as $row)
        {
            $row = collect($row);
            $node = $dom->createElement("marker");
            $newnode = $parnode->appendChild($node);
            $newnode->setAttribute("id", $row['id']);
            $newnode->setAttribute("name", $row['name']);
            $newnode->setAttribute("address", $row['address']);
            $newnode->setAttribute("lat", $row['lat']);
            $newnode->setAttribute("lng", $row['lng']);
            $newnode->setAttribute("distance", $row['distance']);
        }
//        return $dom->saveXML();

        return response()->json(['status' => true , 'items' => $result]);
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getProductDetails(Request $request){

        $product = Product::find($request->product_id);
        $product_image = ProductImages::where('product_id' , $request->product_id)->get();

        $image_url = array();
        // Product Images
        $i=0;
        foreach($product_image as $img)
            $image_url[] = array( 'img_url' => MyLibrary::getProductImageURL($img->filename));


        $request->merge(['seller_id' => $product->user_id]);
        $exclude_id = $request->product_id;
        // Get other products of this seller
        $other_items = $this->getProductsBySeller($request , $exclude_id);

        if($product){
            return response()->json(['status' => true , 'product_details' => $product , 'product_images' => $image_url  , 'other_items' => $other_items]);
        }

        return response()->json('empty');
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getProductsBySeller(Request $request , $exclude_id = 0){

        $products = Product::where('user_id' , $request->seller_id)
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

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function createProduct(Request $request){

        $currentUser = MyLibrary::getJWTUser($request);
        //Considering only plain details
        $validator = Product::productValidator($request);
        if($validator->fails()){
            return response()->json(['status' => false , 'errors' => $validator->errors()->first()]);
        }

        $request->merge(['user_id' => $currentUser->id]);
        $product = Product::createProduct($request);
        //Expecting images
        $status = ProductImages::uploadImages($request , $product->id);

        if($product){
            return response()->json(['status' => true , 'data' => $product]);
        }
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function uploadProductImage(Request $request){

        $status = ProductImages::uploadImages($request , $request->product_id);
        if($status){
            return response()->json(['status' => true , 'message' => 'Image Uploaded Successfully']);
        }

    }

    public function deleteProductImage(Request $request){

    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getSellerProfileDetails(Request $request){

        $base_url = env('APP_URL');
        $currentUser = MyLibrary::getJWTUser($request);
        $seller_id = $request->seller_id;

        $seller = collect(User::find($seller_id));

        $profile_image = $seller['profile_image'];
        $cover_image = $seller['cover_image'];

        $dummy_user_image = $base_url . 'image/user_image.png';
        // merge profile image and cover picture
        $merged =   $seller->merge(
            [
                'profile_image' => ($profile_image)?$base_url .  'uploads/profile_image/'.$profile_image:$dummy_user_image,
                'cover_image' => ($cover_image)?$base_url .  'uploads/cover_image/'.$cover_image:'',
            ]
        );

        // Get products by seller
        $seller_products = $this->getProductsBySeller($request);

        return response()->json(['status' => 'true' ,  'seller_profile' => $merged->all() , 'seller_products' => $seller_products  ]);
    }
}
