<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaymentDetails extends Model
{
    protected $fillable = [
        'invoice_id','payment_type','bank_name','cheque_number','paid_amount','due_amount'
    ];
}
