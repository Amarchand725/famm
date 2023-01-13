<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('frontend');
});

Route::get('/admin/login', function () {
    return view('backend');
});

Route::get('/admin/{pathMatch}', function(){ return view('backend'); })->where('pathMatch', '.*');
Route::get('/{pathMatch}', function(){ return view('frontend'); })->where('pathMatch', '.*');
