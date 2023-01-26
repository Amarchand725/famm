<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ContactedUs;

class ContactedUsController extends Controller
{
    public function index()
    {
        $records = ContactedUs::orderBy('id', 'desc')->get();
        return response()->json([
            'records' => $records
        ], 200);
    }
    public function show($id)
    {
        $model = ContactedUs::find($id);
        return response()->json([
            'model' => $model
        ], 200);
    }
    public function destroy($id)
    {
        $model = ContactedUs::findOrFail($id);
        $model->delete();
    }
}
