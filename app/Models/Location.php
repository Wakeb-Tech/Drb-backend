<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    protected $guarded = [];
    protected $primaryKey = 'id';
    protected $table = 'locations';

 
     public function cities()
    {
        return $this->hasMany(App\Models\Location::class, 'parent_id');
    }

    public function country()
    {
        return $this->belongsTo(App\Models\Location::class, 'parent_id');
    }

    


}
