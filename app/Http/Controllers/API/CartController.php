<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Laravel\Sanctum\PersonalAccessToken;
use App\Models\Cart;
use App\Models\Product;

class CartController extends Controller
{
    public function store(Request $request)
    {
        $token = PersonalAccessToken::findToken($request->token);
        $user = $token->tokenable;
        $product = Product::where('slug', $request->slug)->first();
        $iffound = Cart::where('user_id', $user->id)->where('product_id', $product->id)->first();
        if($iffound){
            $iffound->quantity = $iffound->quantity+1;
            $iffound->save();
        }else{
            Cart::create([
                'user_id' => $user->id,
                'product_id' => $product->id,
                'quantity' => 1,
            ]);
        }
    }

    public function cartCount($token)
    {
        $token = PersonalAccessToken::findToken($token);
        $user = $token->tokenable;
        $cart_count = Cart::where('user_id', $user->id)->count();
        return response()->json([
            'cart_count' => $cart_count
        ], 200);
    }

    public function openCart($token)
    {
        $token = PersonalAccessToken::findToken($token);
        $user = $token->tokenable;
        $cart_products = Cart::where('user_id', $user->id)->get();
        $cart_data = [];
        $grand_total = 0;
        foreach($cart_products as $cart_product){
            $product = [
                'id' => $cart_product->id,
                'product_id' => $cart_product->hasProduct->id,
                'thumbnail' => $cart_product->hasProduct->thumbnail,
                'title' => $cart_product->hasProduct->title,
                'price' => number_format($cart_product->hasProduct->sale_price, 2),
                'quantity' => $cart_product->quantity,
                'sub_total' => number_format($cart_product->quantity*$cart_product->hasProduct->sale_price, 2),
            ];

            $cart_data[] = $product;
            $grand_total += $product['sub_total'];
        }
        return response()->json([
            'cart_data' => $cart_data,
            'grand_total' => number_format($grand_total, 2)
        ], 200);
    }

    public function destroy($id)
    {
        $model = Cart::findOrFail($id);
        $model->delete();
    }

    public function clearCart($token)
    {
        $token = PersonalAccessToken::findToken($token);
        $user = $token->tokenable;

        Cart::where('user_id', $user->id)->delete();
    }

    public function cartPlusQuantity(Request $request)
    {
        $token = PersonalAccessToken::findToken($request->token);
        $user = $token->tokenable;
        $iffound = Cart::where('user_id', $user->id)->where('product_id', $request->product_id)->first();
        $iffound->quantity = $iffound->quantity+1;
        $iffound->save();
    }
    public function cartMinusQuantity(Request $request)
    {
        $token = PersonalAccessToken::findToken($request->token);
        $user = $token->tokenable;
        $iffound = Cart::where('user_id', $user->id)->where('product_id', $request->product_id)->first();
        if($iffound->quantity==1){
            return false;
        }
        $iffound->quantity = $iffound->quantity-1;
        $iffound->save();
    }
}
