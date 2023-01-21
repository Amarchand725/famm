<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Slider;
use Intervention\Image\Facades\Image;

class SliderController extends Controller
{
    public function index()
    {
        $models = Slider::orderBy('id', 'desc')->get();
        return response()->json([
            'models' => $models
        ], 200);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required'
        ]);

        $model = new Slider();
        $model->title = $request->title;
        $model->sub_title = $request->sub_title;
        $model->description = $request->description;

        return $request->image;
        if($request->image){
            return $strpos = strpos($request->image, ';');
            $sub = substr($request->image, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $image = time().".".$ex;
            $img = Image::make($request->image)->resize(700, 500);
            $upload_path = public_path()."/admin/images/sliders";
            $exist_image = $upload_path.$model->image;
            $img->save($upload_path.$image);
            if(file_exists($exist_image)){
                @unlink($exist_image);
            }
        }else{
            $image = $model->image;
        }
        $model->image = $image;
        $model->save();

        $response = [
            'success' => true,
            'data' => $model,
            'message' => 'You have added slider successfully.',
        ];

        return response()->json($response, 200);
    }
}
