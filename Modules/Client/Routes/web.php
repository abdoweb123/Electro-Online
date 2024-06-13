<?php

use App\Http\Middleware\Localization;
use Illuminate\Support\Facades\Route;
use Modules\Client\Http\Controllers\Controller;

Route::group(['prefix' => 'admin', 'as' => 'admin.'], function () {
    Route::group(['middleware' => [Localization::class, 'auth:admin']], function () {
        Route::resources(['clients' => Controller::class]);
        Route::POST('client/{id}/send-message', [Controller::class, 'SendMessage'])->name('send-message');
    });
});
