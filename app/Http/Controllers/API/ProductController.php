<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function index()
    {
        $records = Product::orderBy('id', 'desc')->get();
        return response()->json([
            'records' => $records
        ], 200);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required'
        ]);

        $model = new Product();
        $model->title = $request->title;
        $model->slug = Str::slug($request->title);;
        $model->price = $request->price;
        $model->sale_price = $request->sale_price;
        $model->description = $request->description;

        if($request->thumbnail){
            $strpos = strpos($request->thumbnail, ';');
            $sub = substr($request->thumbnail, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $thumbnail = time().".".$ex;
            $img = Image::make($request->thumbnail)->resize(700, 500);
            $upload_path = public_path()."/admin/images/products/thumbnails/";
            $exist_image = $upload_path.$model->thumbnail;
            $img->save($upload_path.$thumbnail);
            if(file_exists($exist_image)){
                @unlink($exist_image);
            }
        }else{
            $thumbnail = $model->thumbnail;
        }
        $model->thumbnail = $thumbnail;
        $model->save();

        if(!empty($model) && $request->hasfile('images'))
        {
            $model_image = new ProductImage();
            foreach($request->file('images') as $image)
            {
                $strpos = strpos($image, ';');
                $sub = substr($image, 0, $strpos);
                $ex = explode('/', $sub)[1];
                $image_name = time().".".$ex;
                $img = Image::make($image)->resize(700, 500);
                $upload_path = public_path()."/admin/images/products/thumbnails/images/";
                $img->save($upload_path.$image_name);

                $model_image->image = $image_name;
                $model_image->save();
            }
        }
    }
    public function edit($id)
    {
        $model = Product::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }
    public function show($id)
    {
        $model = Product::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $model = Product::find($id);
        $this->validate($request, [
            'title' => 'required'
        ]);

        $model->title = $request->title;
        $model->slug = Str::slug($request->title);;
        $model->price = $request->price;
        $model->sale_price = $request->sale_price;
        $model->description = $request->description;

        if($request->thumbnail != $model->thumbnail){
            $strpos = strpos($request->thumbnail, ';');
            $sub = substr($request->thumbnail, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $thumbnail = time().".".$ex;
            $img = Image::make($request->thumbnail)->resize(700, 500);
            $upload_path = public_path()."/admin/images/products/thumbnails/";
            $exist_image = $upload_path.$model->thumbnail;
            $img->save($upload_path.$thumbnail);
            if(file_exists($exist_image)){
                @unlink($exist_image);
            }
        }else{
            $thumbnail = $model->thumbnail;
        }
        $model->thumbnail = $thumbnail;
        $model->save();

        if(!empty($model) && $request->hasfile('images'))
        {
            $model_image = new ProductImage();
            foreach($request->file('images') as $image)
            {
                $strpos = strpos($image, ';');
                $sub = substr($image, 0, $strpos);
                $ex = explode('/', $sub)[1];
                $image_name = time().".".$ex;
                $img = Image::make($image)->resize(700, 500);
                $upload_path = public_path()."/admin/images/products/thumbnails/images/";
                $img->save($upload_path.$image_name);

                $model_image->image = $image_name;
                $model_image->save();
            }
        }
    }

    public function destroy($id)
    {
        $model = Product::findOrFail($id);
        $model->delete();
    }
}
