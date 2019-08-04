<?php

use Illuminate\Http\Request;

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

Route::post('register', 'API\AuthController@register');
Route::post('login', 'API\AuthController@login');

Route::middleware('auth:api')->group( function () {
    Route::post('add-renter', 'API\RenterController@store');
    Route::get('get-renter', 'API\RenterController@get');
    Route::post('add-house', 'API\HouseController@store');
    Route::get('get-house', 'API\HouseController@get');
    Route::post('add-flat', 'API\FlatController@store');
    Route::get('get-flat', 'API\FlatController@get');
    Route::post('add-rent', 'API\RentIssueController@store');
    Route::post('add-invoice', 'API\InvoiceController@store');
    Route::post('add-payment', 'API\PaymentDetailsController@store');
});
