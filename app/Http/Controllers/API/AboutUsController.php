<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Models\AboutUs;

class AboutUsController extends Controller
{
    public function edit($id)
    {
        $model = AboutUs::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }
    public function show($id)
    {
        $model = AboutUs::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }
    public function update(Request $request, $id)
    {
        $model = AboutUs::find($id);
        $this->validate($request, [
            'currency' => 'required',
            'banner' => 'required'
        ]);

        $model->currency = $request->currency;
        $model->currency_symbol = $request->currency_symbol;
        $model->fast_delivery = $request->fast_delivery;
        $model->free_shipping = $request->free_shipping;
        $model->best_quality = $request->best_quality;
        $model->banner_title = $request->banner_title;
        $model->banner_content = $request->banner_content;
        $model->subscriber_content = $request->subscriber_content;

        if($request->banner != $model->banner){
            $strpos = strpos($request->banner, ';');
            $sub = substr($request->banner, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $banner = time().".".$ex;
            $img = Image::make($request->banner)->resize(700, 500);
            $upload_path = public_path()."/admin/images/about_us/";
            $exist_image = $upload_path.$model->banner;
            $img->save($upload_path.$banner);
            if(file_exists($exist_image)){
                @unlink($exist_image);
            }
        }else{
            $banner = $model->banner;
        }
        $model->banner = $banner;
        $model->save();
    }
}
