<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Topic;
use App\Models\Publisher;
use App\Models\Hash;
use App\Models\Interest;
class Event extends Model
{
    protected $guarded = [];

    // public function getDistanceAttribute($value) {
    //     return POWER( POWER($this->lat - $lat,2) + POWER($this->lng - $lng, 2) , .5);
    // }

    public function category()
    {
        return $this->belongsTo("App\Models\EventCategory", "category_id");
    }
    public function city()
    {
        return $this->belongsTo("App\Models\Location", "place_id");
    }

     /*======================*/
    // Interests

    public function interests()
    {
        return $this->hasMany('App\Models\Interest','event_id');
    }

    public function files()
    {
        return $this->hasMany("App\Models\Event_file");
    }
    
    public function topics()
    {
        return $this->belongsToMany(Topic::class)->withTimestamps();
    }

    public function publishers()
    {
        return $this->belongsToMany(Publisher::class)->withTimestamps();
    }
    public function hashs()
    {
        return $this->belongsToMany(Hash::class)->withTimestamps();
    }
    

}
