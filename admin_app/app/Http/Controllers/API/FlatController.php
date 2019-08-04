<?php

namespace App\Http\Controllers\API;

use App\Flat;
use App\House;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;

class FlatController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $input = array(
                "flat_name" => "",
                "house_id" => 0,
                "vacancy_status" => false,
            );

        $input['flat_name']=$request['flat_name'];
        $house = House::where('house_name', $request['house_name'])->first();
        $input['house_id']= $house['id'];

        print($input['house_id']);

        $flat = Flat::create($input);

        return $this->sendResponse($flat->toArray(), 'Flat created successfully.');
    }

    public function get(Request $request){
        $input = $request->header('house_name') ;
        $house = House::where('house_name', $input)->first();

        if (is_null($house)) {
            return $this->sendError('House not found.');
        }

        $flat = Flat::where('house_id', $house['id'])->where('flat_name', $request->header('flat_name'))->first();

        if (is_null($flat)) {
            return $this->sendError('Flat not found.');
        }
        return $this->sendResponse($flat->toArray(), 'Flat retrieved successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Flat  $flat
     * @return \Illuminate\Http\Response
     */
    public function show(Flat $flat)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Flat  $flat
     * @return \Illuminate\Http\Response
     */
    public function edit(Flat $flat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Flat  $flat
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Flat $flat)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Flat  $flat
     * @return \Illuminate\Http\Response
     */
    public function destroy(Flat $flat)
    {
        //
    }
}
