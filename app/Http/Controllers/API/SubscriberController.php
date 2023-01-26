<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Subscriber;

class SubscriberController extends Controller
{
    public function index()
    {
        $records = Subscriber::orderBy('id', 'desc')->get();
        return response()->json([
            'records' => $records
        ], 200);
    }
    public function store(Request $request)
    {
        $this->validate($request, [
            'email' => 'required'
        ]);

        $model = new Subscriber();
        $model->email = $request->email;
        $model->save();
    }
    public function destroy($id)
    {
        $model = Subscriber::findOrFail($id);
        $model->delete();
    }
}
