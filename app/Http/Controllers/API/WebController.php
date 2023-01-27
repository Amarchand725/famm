<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Testimonial;
use App\Models\Slider;
use App\Models\Blog;

class WebController extends Controller
{
    public function sliders()
    {
        $sliders = Slider::orderBy('id', 'desc')->get();
        return response()->json([
            'sliders' => $sliders
        ], 200);
    }
    public function products()
    {
        $products = Product::orderBy('id', 'desc')->get();
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
        $blog = Blog::query()->with(['createdBy' => function ($q) {
            $q->select('id', 'name', 'profile');
        }])
        ->where('slug', $slug)
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
