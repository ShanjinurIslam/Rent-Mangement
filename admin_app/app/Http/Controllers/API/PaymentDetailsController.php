<?php

namespace App\Http\Controllers\API;

use App\PaymentDetails;
use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Validator;

class PaymentDetailsController extends BaseController
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
            'invoice_id'=>'required',
            'payment_type'=>'required',
            'paid_amount'=>'required',
            'due_amount'=>'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $paymentDetails = PaymentDetails::create($input);

        return $this->sendResponse($paymentDetails->toArray(), 'rent_issue created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\PaymentDetails  $paymentDetails
     * @return \Illuminate\Http\Response
     */
    public function show(PaymentDetails $paymentDetails)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\PaymentDetails  $paymentDetails
     * @return \Illuminate\Http\Response
     */
    public function edit(PaymentDetails $paymentDetails)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\PaymentDetails  $paymentDetails
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, PaymentDetails $paymentDetails)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\PaymentDetails  $paymentDetails
     * @return \Illuminate\Http\Response
     */
    public function destroy(PaymentDetails $paymentDetails)
    {
        //
    }
}
