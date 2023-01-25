<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\AdminController;
use App\Http\Controllers\API\SliderController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::controller(AuthController::class)->group(function(){
    Route::post('login', 'login');
    Route::post('register', 'register');
});

Route::controller(AdminController::class)->group(function(){
    Route::post('/admin/profile', 'profile');
});

Route::controller(SliderController::class)->group(function(){
    Route::get('/admin/sliders', 'index');
    Route::post('/admin/slider/create', 'store');
    Route::get('admin/slider/edit/{id}', 'edit');
    Route::get('admin/slider/show/{id}', 'show');
    Route::post('admin/slider/update/{id}', 'update');
    Route::get('admin/slider/destroy/{id}', 'destroy');
});
