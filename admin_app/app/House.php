<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class House extends Model
{
    protected $fillable = [
        'house_name','address_line_1','address_line_2','city','country','zipcode'
    ];
}
