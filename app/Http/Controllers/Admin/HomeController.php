<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\BasicController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Modules\Category\Entities\Model as Category;

class HomeController extends BasicController
{
    public function index(Request $request)
    {
        $orders_no = DB::table('orders')->count();
        $coupons_no = DB::table('coupons')->count();
        $categories_no = DB::table('categories')->count();
        $devices_no = DB::table('devices')->count();
        $services_no = DB::table('services')->count();
        $ads_no = DB::table('ads')->count();
        $deliveries_no = DB::table('deliveries')->count();

        return view('Admin.home',compact(
                'orders_no',
                'coupons_no',
                'categories_no',
                'devices_no',
                'services_no',
                'ads_no',
                'deliveries_no',
            ));

       
    }
    
    
} //end of class
