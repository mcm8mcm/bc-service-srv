<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Brand;

class Test extends Controller
{
    //
    public function index(){
        if(DB::Connection()->getDatabaseName()){
            echo "connected successfully to database ".DB::connection()->getDatabaseName();
        }else{
            echo "Can't connect to database";
            return;
        }
        
        //$devices = DB::table('device')->get();
        //dump($devices);
        
        //$brand = new Brand();
        //$brand->name = "Samsung";
        //$brand->save();
        
        dump(Brand::All());
    }
}
