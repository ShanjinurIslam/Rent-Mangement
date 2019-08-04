<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RentIssue extends Model
{
    protected $fillable = [
        'renter_id','flat_id','start_month','start_year','initial_rent','increase_per_year'
    ];
}
