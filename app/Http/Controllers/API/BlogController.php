<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Str;
use App\Models\Blog;
use Laravel\Sanctum\PersonalAccessToken;

class BlogController extends Controller
{
    public function index()
    {
        $records = Blog::query()->with(['createdBy' => function ($q) {
            $q->select('id', 'name');
        }])
        ->orderBy('id', 'desc')
        ->get();
        return response()->json([
            'records' => $records
        ], 200);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required',
            'post' => 'required',
        ]);

        $token = PersonalAccessToken::findToken($request->token);

        if (!$token) {
            $response = [
                'success' => false,
                'message' => 'Credentials not found.'
            ];

            return response()->json($response);
        }else{
            $user = $token->tokenable;
        }

        $model = new Blog();
        $model->created_by = $user->id;
        $model->title = $request->title;
        $model->slug = Str::slug($request->title);
        $model->short_description = $request->short_description;
        $model->full_description = $request->full_description;

        if($request->post){
            $strpos = strpos($request->post, ';');
            $sub = substr($request->post, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $mime_type = explode('/', $sub)[0];
            $post = time().".".$ex;
            $img = Image::make($request->post)->resize(700, 500);
            $upload_path = public_path()."/admin/images/blogs/";
            $exist_image = $upload_path.$model->post;
            $img->save($upload_path.$post);
            if(file_exists($exist_image)){
                @unlink($exist_image);
            }
        }else{
            $post = $model->post;
            $mime_type = $model->mime_type;
        }
        $model->post = $post;
        $model->mime_type = $mime_type;
        $model->save();
    }
    public function edit($id)
    {
        $model = Blog::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }
    public function show($id)
    {
        $model = Blog::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }

    public function update(Request $request, $id)
    {
        $model = Blog::find($id);
        $this->validate($request, [
            'title' => 'required',
            'post' => 'required',
        ]);

        $model->title = $request->title;
        $model->slug = Str::slug($request->title);
        $model->short_description = $request->short_description;
        $model->full_description = $request->full_description;

        if($request->post != $model->post){
            $strpos = strpos($request->post, ';');
            $sub = substr($request->post, 0, $strpos);
            $ex = explode('/', $sub)[1];
            $mime_type = explode('/', $sub)[0];
            $post = time().".".$ex;
            $img = Image::make($request->post)->resize(700, 500);
            $upload_path = public_path()."/admin/images/blogs/";
            $exist_image = $upload_path.$model->post;
            $img->save($upload_path.$post);
            if(file_exists($exist_image)){
                @unlink($exist_image);
            }
        }else{
            $post = $model->post;
            $mime_type = $model->mime_type;
        }
        $model->post = $post;
        $model->mime_type = $mime_type;
        $model->save();
    }

    public function destroy($id)
    {
        $model = Blog::findOrFail($id);
        $model->delete();
    }
}
