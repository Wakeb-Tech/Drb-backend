<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Publisher;
use App\Models\Event;


class Interest extends Model
{
	protected $guarded = [];
	
    public  function event()
    {
        return $this->belongsTo('App\Models\Event','event_id','id');
    }

    // benlong to user
    public  function publisher()
    {
        return $this->belongsTo('App\Models\Publisher','publisher_id','id');
    }
}
