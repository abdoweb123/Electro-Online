<?php

use App\Http\Controllers\Client\AddressController;
use App\Http\Controllers\Payment\OrderTapController;
use App\Http\Controllers\Payment\WalletTapController;
use App\Http\Controllers\Client\AuthController;
use App\Http\Controllers\Client\HomeController;
use App\Http\Middleware\ForceSSL;
use App\Http\Middleware\Localization;
use App\Mail\OrderSummary;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Storage;

Route::group(['as' => 'Client.', 'middleware' => [Localization::class, ForceSSL::class]], function () {
    Route::GET('/', [HomeController::class, 'home'])->name('home');
    Route::GET('/device/{device_id?}/{color_id?}', [HomeController::class, 'device'])->name('device');
    Route::GET('/build-your-device/{device_id?}/{color_id?}', [HomeController::class, 'BuildYourDevice'])->name('BuildYourDevice');
    Route::any('/categories/{category?}', [HomeController::class, 'categories'])->name('categories');
    Route::GET('/shoping-cart', [HomeController::class, 'cart'])->name('cart');
    Route::POST('/check-out/{delivery_id?}', [HomeController::class, 'confirm'])->name('confirm');
    Route::GET('/Check-out/{delivery_id?}', [HomeController::class, 'confirmPage'])->name('confirmPage');
    Route::POST('/place-order/{delivery_id}', [HomeController::class, 'submit'])->name('submit');

    Route::POST('/toggle-wishlist', [HomeController::class, 'ToggleWishlist'])->name('ToggleWishlist');
    Route::POST('/add-to-cart', [HomeController::class, 'AddToCart'])->name('AddToCart');

    Route::POST('/cart-delete', [HomeController::class, 'deleteitem'])->name('deleteitem');
    Route::POST('/cart-plus', [HomeController::class, 'plus'])->name('plus');
    Route::POST('/cart-minus', [HomeController::class, 'minus'])->name('minus');
    
    Route::POST('set-data', [HomeController::class, 'SetData'])->name('set-data');
    Route::POST('send-message', [HomeController::class, 'SendMessage'])->name('send-message');

    Route::view('/services', 'Client.services')->name('services');
    Route::view('/faq', 'Client.faq')->name('faq');
    Route::view('/about', 'Client.about')->name('about');
    Route::view('/terms', 'Client.terms')->name('terms');
    Route::view('/contact', 'Client.contact')->name('contact');
    Route::view('/privacy', 'Client.privacy')->name('privacy');

    Route::any('/report', [HomeController::class, 'report'])->name('report');
    Route::any('/reports', [HomeController::class, 'reports'])->name('reports');
    Route::POST('/contact', [HomeController::class, 'contact'])->name('contact');

    Route::group(['middleware' => ['guest:client']], function () {
        Route::view('/login', 'Client.login')->name('login');
        Route::POST('/login', [AuthController::class, 'login'])->name('login');

        Route::view('/register', 'Client.register')->name('register');
        Route::POST('/register', [AuthController::class, 'register'])->name('register');

        Route::view('/forget', 'Client.forget')->name('forget');
        Route::POST('/forget', [AuthController::class, 'forget'])->name('forget');
    });
    Route::group(['middleware' => ['auth:client']], function () {
        Route::view('/profile/{type?}', 'Client.profile')->name('profile');
        Route::POST('/profile', [AuthController::class, 'profile'])->name('profile');
        
        Route::resource('/address', AddressController::class);

        Route::any('/logout', [AuthController::class, 'logout'])->name('logout');
    });
    
    
    
    Route::group(['prefix' => 'payment','as' => 'payment.'], function () {
        Route::group(['prefix' => 'tap','as' => 'tap.'], function () {
            Route::group(['prefix' => 'order','as' => 'order.'], function () {
                Route::any('init', [OrderTapController::class,'init'])->name('init');
                Route::any('response', [OrderTapController::class,'response'])->name('response');
            });
            Route::group(['prefix' => 'wallet','as' => 'wallet.'], function () {
                Route::any('init', [WalletTapController::class,'init'])->name('init');
                Route::any('response', [WalletTapController::class,'response'])->name('response');
            });
        });
    });
});

//Route::any('test',function (){
//    $Client = auth('client')->user();
//    $Order =  \Modules\Order\Entities\Model::where('id',116)->first();
//
//    $data = ['Order' => $Order];
//    $filename = md5($Order->id) . '.pdf';
//    $pdfPath = 'Orders/' . $filename; // Relative path to public storage directory
//
//    // Generate PDF and save it
//    $pdf = \Mccarlosen\LaravelMpdf\Facades\LaravelMpdf::loadView('emails.order_summary', $data)->output();
//
//    // Store the PDF using Storage
//    $storedPath =  Storage::disk('public')->put($pdfPath, $pdf);
//
//    if ($storedPath) {
//        $fullPdfPath = storage_path('app/public/' . $pdfPath);
//
////        Mail::to([$Client->email])->send(new OrderSummary($Order,$fullPdfPath));
//
//    }
//
//
//    return view('emails.order_summary',compact('Order'));
//});
