<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\AdminController;
use App\Http\Controllers\API\SliderController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\SubscriberController;
use App\Http\Controllers\API\TestimonialController;
use App\Http\Controllers\API\BlogController;
use App\Http\Controllers\API\ContactedUsController;
use App\Http\Controllers\API\SettingController;
use App\Http\Controllers\API\AboutUsController;
use App\Http\Controllers\API\WebController;
use App\Http\Controllers\API\WishListController;
use App\Http\Controllers\API\CartController;
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

Route::controller(WebController::class)->group(function(){
    Route::get('/products/{token}', 'products');
    Route::get('/testimonials', 'testimonials');
    Route::get('/sliders', 'sliders');
    Route::get('/blogs', 'blogs');
    Route::get('/blogs/show/{slug}', 'showBlog');
    Route::get('/shop/products/show/{slug}', 'showProduct');
});

Route::controller(WishListController::class)->group(function(){
    Route::post('/wishlists/create', 'store');
    Route::post('/wishlists/remove/product', 'removeProduct');
    Route::get('/wishlists/count/{token}', 'UserWishListCount');
});
Route::controller(CartController::class)->group(function(){
    Route::post('/cart/add_to_cart', 'store');
    Route::get('/cart/count/{token}', 'cartCount');
    Route::get('/cart/open/{token}', 'openCart');
    Route::get('/cart/destroy/{id}', 'destroy');
    Route::get('/cart/clear/{token}', 'clearCart');
    Route::post('/cart/plus', 'cartPlusQuantity');
    Route::post('/cart/minus', 'cartMinusQuantity');
});

//admin
Route::controller(AboutUsController::class)->group(function(){
    Route::get('admin/about_us/show/{id}', 'show');
    Route::get('admin/about_us/edit/{id}', 'edit');
    Route::post('admin/about_us/update/{id}', 'update');
});
Route::controller(SettingController::class)->group(function(){
    Route::get('admin/setting/show/{id}', 'show');
    Route::get('admin/setting/edit/{id}', 'edit');
    Route::post('admin/setting/update/{id}', 'update');
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

Route::controller(ProductController::class)->group(function(){
    Route::get('/admin/products', 'index');
    Route::post('/admin/products/create', 'store');
    Route::get('admin/products/edit/{id}', 'edit');
    Route::get('admin/products/show/{id}', 'show');
    Route::post('admin/products/update/{id}', 'update');
    Route::get('admin/products/destroy/{id}', 'destroy');
});
Route::controller(SubscriberController::class)->group(function(){
    Route::get('/admin/subscribers', 'index');
    Route::post('/web/subscribers/create', 'store'); //used for frontend user
    Route::get('admin/subscribers/destroy/{id}', 'destroy');
});
Route::controller(TestimonialController::class)->group(function(){
    Route::get('/admin/testimonials', 'index');
    Route::get('admin/testimonials/destroy/{id}', 'destroy');
});
Route::controller(BlogController::class)->group(function(){
    Route::get('/admin/blogs', 'index');
    Route::post('/admin/blogs/create', 'store');
    Route::get('admin/blogs/edit/{id}', 'edit');
    Route::get('admin/blogs/show/{id}', 'show');
    Route::post('admin/blogs/update/{id}', 'update');
    Route::get('admin/blogs/destroy/{id}', 'destroy');
});
Route::controller(ContactedUsController::class)->group(function(){
    Route::get('/admin/contacted_us', 'index');
    Route::get('admin/contacted_us/show/{id}', 'show');
    Route::get('admin/contacted_us/destroy/{id}', 'destroy');
});
