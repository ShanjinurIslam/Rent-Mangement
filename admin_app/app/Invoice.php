<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
        'rent_issue_id','month','year','electricity_bill','gas_bill','water_bill','service_charge','previous_due','total_payable'
    ];
}
