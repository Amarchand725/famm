<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Testimonial;
use App\Models\Slider;

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
}
