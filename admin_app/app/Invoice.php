<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
        'month','year','electricity_bill','gas_bill','water_bill','electricity_bill','service_charge','previous_due'
    ];
}
