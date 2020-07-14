<?php

namespace App\Models;
use App\Models\Publisher;
use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
	protected $guarded = [];

    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }
}
