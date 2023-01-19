<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Auth;

class HomeController extends Controller
{
    public function login(Request $request)
    {
        if(!empty($request->all())){
            $messages = ([
                'email.required' => 'Email is required',
                'password.required' => 'Password is required'
            ]);
            $this->validate($request, [
                'email' => 'required',
                'password' => 'required',
            ], $messages);

            $user = User::where('email', $request->email)->first();
            if(!empty($user)){
                $credentials = $request->only('email', 'password');

                if (Auth::attempt($credentials)) {
                    return response()->json([
                        'status' => 'success',
                    ]);
                }
                return response()->json([
                    'status' => 'failed',
                ]);
            }elseif(!empty($user) && $user->status==0){
                return response()->json([
                    'status' => 'failed-inactive',
                ]);
            }else{
                return response()->json([
                    'status' => 'failed-credential',
                ]);
            }
        }else{
            return view('login');
        }
    }
}
