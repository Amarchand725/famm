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

        if($request->image){
            $strpos = strpos($request->image, ';');
            $sub = substr($request->image, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $image = time().".".$ex;
            $img = Image::make($request->image)->resize(700, 500);
            $upload_path = public_path()."/admin/images/sliders/";
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
    }
    public function edit($id)
    {
        $model = Slider::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }
    public function show($id)
    {
        $model = Slider::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $model = Slider::find($id);
        $this->validate($request, [
            'title' => 'required'
        ]);

        $model->title = $request->title;
        $model->sub_title = $request->sub_title;
        $model->description = $request->description;

        if($request->image != $model->image){
            $strpos = strpos($request->image, ';');
            $sub = substr($request->image, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $image = time().".".$ex;
            $img = Image::make($request->image)->resize(700, 500);
            $upload_path = public_path()."/admin/images/sliders/";
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
    }

    public function destroy($id)
    {
        $model = Slider::findOrFail($id);
        $image_path = public_path()."/admin/images/sliders/";
        $image = $image_path.$model->image;
        if(file_exists($image)){
            @unlink($image);
        }
        $model->delete();
    }
}
