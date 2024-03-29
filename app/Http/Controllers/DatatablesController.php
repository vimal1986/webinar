<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;

use Yajra\Datatables\Datatables;

class DatatablesController extends Controller
{
    //

    public function getIndex()
    {
        return view('datatables.index');
    }

    /**
     * Process datatables ajax request.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function anyData()
    {
        return Datatables::of(User::all())->make(true);
    }

}
