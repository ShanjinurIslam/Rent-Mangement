<?php

namespace App\Http\Controllers;

use App\Renter;
use DB;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;

class RenterController extends BaseController
{
    public function store(Request $request)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'name'=>'required',
            'mobile_number'=>'required',
            'nationality'=>'required',
            'gender'=>'required',
            'address_line_1'=>'required',
            'city'=>'required',
            'country'=>'required',
            'zipcode'=>'required',
        ]);


        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $renter = Renter::create($input);

        return $this->sendResponse($renter->toArray(), 'Renter created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Renter  $renter
     * @return \Illuminate\Http\Response
     */
    public function get(Request $request)
    {
        $input = $request->header('name') ;
        $renter = Renter::where('name', $input)->first();

        if (is_null($renter)) {
            return $this->sendError('Renter not found.');
        }

        return $this->sendResponse($renter, 'Renter retrieved successfully.');
    }

    public function update(Request $request, Renter $renter)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'name'=>'required',
            'mobile_number'=>'required',
            'nationality'=>'required',
            'gender'=>'required',
            'address_line_1'=>'required',
            'city'=>'required',
            'country'=>'required',
            'zipcode'=>'required',
        ]);


        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $renter = $input ;
        $renter->save();

        return $this->sendResponse($renter->toArray(), 'Product updated successfully.');
    }

    public function destroy(Renter $renter)
    {
        $renter->delete() ;
        return $this->sendResponse($product->toArray(), 'Renter deleted successfully.');
    }
}
