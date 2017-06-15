<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Controllers\MCM_AUTH;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(Request $request){
        $validator = validator::make($request->all(),['email' => 'required|min:3', 'password' => 'required|min:6']);
        if($validator->fails()){
            $errors = $validator->errors(); 
            return back()->with(['errors' => $errors]);
        }
        
        $res = Auth::attempt(['email' => $request->email, 'password' => $request->password, 'active' => 1]);
        if($res){
            return redirect(route('home'));
        }
    }
    
}