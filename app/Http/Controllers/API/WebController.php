<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Laravel\Sanctum\PersonalAccessToken;
use App\Models\Product;
use App\Models\Testimonial;
use App\Models\Slider;
use App\Models\Blog;
use App\Models\WishList;
use DB;

class WebController extends Controller
{
    public function sliders()
    {
        $sliders = Slider::orderBy('id', 'desc')->get();
        return response()->json([
            'sliders' => $sliders
        ], 200);
    }
    public function products($token)
    {
        if(!empty($token)){
            $token = PersonalAccessToken::findToken($token);
            $user = $token->tokenable;
            $products = Product::orderBy('id', 'desc')->get();
            $data = [];
            foreach($products as $product){
                $iffound = WishList::where('user_id', $user->id)->where('product_id', $product->id)->first();
                $wish = false;
                if($iffound){
                    $wish = true;
                }
                $product['wishlist'] = $wish;

                $data[] = $product;
            }
            $products = $data;
        }else{
            $products = Product::orderBy('id', 'desc')->get();
        }

        return response()->json([
            'products' => $products
        ], 200);
    }
    public function testimonials()
    {
        $records = Testimonial::query()->with(['user' => function ($q) {
            $q->select('id', 'name', 'profile');
        }])
        ->get();
        return response()->json([
            'records' => $records
        ], 200);
    }
    public function blogs()
    {
        $blogs = Blog::query()->with(['createdBy' => function ($q) {
            $q->select('id', 'name', 'profile');
        }])
        ->get();
        return response()->json([
            'blogs' => $blogs
        ], 200);
    }
    public function showBlog($slug)
    {
        // $blog = Blog::with(['createdBy' => function ($q) {
        //     $q->select('id', 'name', 'profile');
        // }])
        // ->where('slug', $slug)
        // ->first();

        $blog = DB::table('blogs')->select('blogs.*','users.name as user_name','users.profile as user_profile')
                    ->leftJoin('users', 'users.id', 'blogs.created_by')
                    ->where('blogs.slug', $slug)
                    ->first();



        return response()->json([
            'blog' => $blog
        ], 200);
    }
    public function showProduct($slug)
    {
        $product = Product::where('slug', $slug)->first();
        return response()->json([
            'product' => $product
        ], 200);
    }
}
