<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Laravel\Sanctum\PersonalAccessToken;
use Auth;

class AdminController extends Controller
{
    public function profile(Request $request)
    {
        $token = PersonalAccessToken::findToken($request->token);

        if (!$token) {
            $response = [
                'success' => false,
                'message' => 'Credentials not found.'
            ];

            return response()->json($response);
        }else{
            $user = $token->tokenable;

            $data = [
                'name' => $user->name,
                'profile' => $user->profile,
            ];

            $response = [
                'success' => true,
                'data' => $data,
                'message' => 'Login User Data.',
            ];

            return response()->json($response, 200);
        }
    }
}
