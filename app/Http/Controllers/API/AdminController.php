<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;

class AdminController extends Controller
{
    public function profile(Request $request)
    {
        \Auth::guard('web')->user();
    }
}
