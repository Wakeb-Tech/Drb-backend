<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event_file extends Model
{
    protected $guarded = [];

    public function event()
    {
        return $this->belongsTo("App\Models\Event");
    }
}
