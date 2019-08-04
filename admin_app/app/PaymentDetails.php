<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PaymentDetails extends Model
{
    protected $fillable = [
        'payment_type','bank_name','check_number','paid_amount'
    ];
}
