<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class EventResourceCollection extends ResourceCollection
{
    protected $publisher_id;

    public function foo($value){
        $this->publisher_id = $value;
        return $this;
    }

    public function toArray($request)
    {
        return $this->collection->map(function (EventResource $resource) use ($request) {
            return $resource->foo($this->publisher_id)->toArray($request);
        })->all();
    }
}
