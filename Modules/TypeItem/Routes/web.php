<?php

use App\Http\Middleware\Localization;
use Illuminate\Support\Facades\Route;
use Modules\TypeItem\Http\Controllers\Controller;

Route::group(['prefix' => 'admin', 'as' => 'admin.'], function () {
    Route::group(['middleware' => [Localization::class, 'auth:admin']], function () {
        Route::get('typeItems/{type}', [Controller::class,'index'])->name('typeItems.index');
        Route::get('typeItems/create/{type}', [Controller::class,'create'])->name('typeItems.create');
        Route::post('typeItems/store', [Controller::class,'store'])->name('typeItems.store');
        Route::get('typeItems/show/{type_item_id}', [Controller::class,'show'])->name('typeItems.show');
        Route::get('typeItems/edit/{type_item_id}', [Controller::class,'edit'])->name('typeItems.edit');
        Route::put('typeItems/update/{type_item_id}', [Controller::class,'update'])->name('typeItems.update');
        Route::delete('typeItems/destroy/{type_item_id}', [Controller::class,'destroy'])->name('typeItems.destroy');
    });
});
