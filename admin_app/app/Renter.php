<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Renter extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'nid','passport','email','mobile_number','nationality','gender','address_line_1','address_line_2','city','country','zipcode'
    ];
}
