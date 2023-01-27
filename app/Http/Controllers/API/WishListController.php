<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Laravel\Sanctum\PersonalAccessToken;
use App\Models\WishList;
use App\Models\Product;

class WishListController extends Controller
{
    public function index()
    {
        # code...
    }
    public function store(Request $request)
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
        }

        $product = Product::where('slug', $request->slug)->first();

        $model = new WishList();
        $model->user_id = $user->id;
        $model->product_id = $product->id;
        $model->save();
    }
    public function removeProduct(Request $request)
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
        }

        $product = Product::where('slug', $request->slug)->first();

        WishList::where('user_id', $user->id)->where('product_id', $product->id)->delete();
    }

    public function UserWishListCount($token)
    {
        $token = PersonalAccessToken::findToken($token);

        if (!$token) {
            $response = [
                'success' => false,
                'message' => 'Credentials not found.'
            ];

            return response()->json($response);
        }else{
            $user = $token->tokenable;
        }

        $wishlist_count = WishList::where('user_id', $user->id)->count();
        return response()->json([
            'wishlist_count' => $wishlist_count
        ], 200);
    }
}
