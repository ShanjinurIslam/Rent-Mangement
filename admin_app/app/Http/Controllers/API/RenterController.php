<?php

namespace App\Http\Controllers;

use App\Renter;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;

class RenterController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $renters = Renter::all() ;
        return $this->sendResponse($renters->toArray(), 'Renters retrieved successfully\n');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
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


        return $this->sendResponse($renter->toArray(), 'Product created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Renter  $renter
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $renter = Renter::find($id);


        if (is_null($renter)) {
            return $this->sendError('Renter not found.');
        }


        return $this->sendResponse($renter->toArray(), 'Renter retrieved successfully.');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Renter  $renter
     * @return \Illuminate\Http\Response
     */
    public function edit(Renter $renter)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Renter  $renter
     * @return \Illuminate\Http\Response
     */
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

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Renter  $renter
     * @return \Illuminate\Http\Response
     */
    public function destroy(Renter $renter)
    {
        $renter->delete() ;
        return $this->sendResponse($product->toArray(), 'Renter deleted successfully.');
    }
}
