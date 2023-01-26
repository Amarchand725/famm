<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Testimonial;

class TestimonialController extends Controller
{
    public function index()
    {
        $records = Testimonial::query()->with(['user' => function ($q) {
            $q->select('id', 'name', 'profile');
        }])
        ->get();
        return response()->json([
            'records' => $records
        ], 200);
    }
    public function destroy($id)
    {
        $model = Testimonial::findOrFail($id);
        $model->delete();
    }
}
