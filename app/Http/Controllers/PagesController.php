<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PagesController extends Controller
{
    //

    public function geoSearch()
    {

        return view('plug_test.geo_search');
    }

    public function storeLocator(Request $request)
    {


// Get parameters from URL
        $center_lat = $request->lat;
        $center_lng = $request->lng;
        $radius = $request->radius;


// Start XML file, create parent node
        $dom = new \DOMDocument("1.0");
        $node = $dom->createElement("markers");
        $parnode = $dom->appendChild($node);

// Search the rows in the markers table
//        $query = sprintf("SELECT id, name, address, lat, lng, ( 3959 * acos( cos( radians('%s') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('%s') ) + sin( radians('%s') ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < '%s' ORDER BY distance LIMIT 0 , 20",


        $result = \DB::select("SELECT id, name, address, lat, lng, ( 3959 * acos( cos( radians(".$center_lat.") ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(".$center_lng.") ) + sin( radians(".$center_lat.") ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < ".$radius." ORDER BY distance LIMIT 0 , 20");

//        dump($result);



// Iterate through the rows, adding XML nodes for each
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
       return $dom->saveXML();


    }



}
