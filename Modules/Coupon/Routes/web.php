<?php

use App\Http\Middleware\ForceSSL;
use App\Http\Middleware\Localization;
use Illuminate\Support\Facades\Route;
use Modules\Coupon\Http\Controllers\Controller;


Route::group(['as' => 'Admin.', 'middleware' => [Localization::class, ForceSSL::class]], function () {
    Route::group(['middleware' => ['auth:admin']], function () {
        Route::resource('coupons', Controller::class);
    });
});

