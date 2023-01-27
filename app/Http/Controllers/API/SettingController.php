<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Models\Setting;

class SettingController extends Controller
{
    public function edit($id)
    {
        $model = Setting::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }
    public function show($id)
    {
        $model = Setting::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }
    public function update(Request $request, $id)
    {
        $model = Setting::find($id);
        $this->validate($request, [
            'name' => 'required',
            'logo' => 'required'
        ]);

        $model->name = $request->name;
        $model->phone = $request->phone;
        $model->address = $request->address;
        $model->email = $request->email;
        $model->about_us = $request->about_us;

        if($request->logo != $model->logo){
            $strpos = strpos($request->logo, ';');
            $sub = substr($request->logo, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $logo = time().".".$ex;
            $img = Image::make($request->logo)->resize(700, 500);
            $upload_path = public_path()."/admin/images/settings/";
            $exist_image = $upload_path.$model->logo;
            $img->save($upload_path.$logo);
            if(file_exists($exist_image)){
                @unlink($exist_image);
            }
        }else{
            $logo = $model->logo;
        }
        $model->logo = $logo;
        $model->save();
    }
}
