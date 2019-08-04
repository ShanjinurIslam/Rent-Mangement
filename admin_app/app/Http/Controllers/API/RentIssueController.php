<?php

namespace App\Http\Controllers\API;

use App\RentIssue;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;

class RentIssueController extends BaseController
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
        $input = $request->all();
        $validator = Validator::make($input, [
            'renter_id'=>'required',
            'flat_id'=>'required',
            'start_month'=>'required',
            'start_year'=>'required',
            'initial_rent'=>'required',
            'increase_per_year'=>'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $rentIssue = RentIssue::create($input);

        return $this->sendResponse($rentIssue->toArray(), 'rent_issue created successfully.');

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\RentIssue  $rentIssue
     * @return \Illuminate\Http\Response
     */
    public function show(RentIssue $rentIssue)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\RentIssue  $rentIssue
     * @return \Illuminate\Http\Response
     */
    public function edit(RentIssue $rentIssue)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\RentIssue  $rentIssue
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, RentIssue $rentIssue)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\RentIssue  $rentIssue
     * @return \Illuminate\Http\Response
     */
    public function destroy(RentIssue $rentIssue)
    {
        //
    }
}
