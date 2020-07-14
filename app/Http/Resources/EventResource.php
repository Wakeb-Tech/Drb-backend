<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use App\Models\Location;
use App\Models\Publisher;
use App\Models\Interest;
use App\Http\Resources\UserResource;
class EventResource extends JsonResource
{

    protected $publisher_id;
    protected $follow_id;
    protected $users;

    public function foo($value){
        $this->publisher_id = $value;
       $result =  publisher::find($this->publisher_id);
       $follow_id = $result->followers->pluck('follow_id')->toArray();
       $this->follow_id = $follow_id;

       $friends = Publisher::whereHas('events', function($q) {
            return $q->where('event_id', $this->id);
            })->whereIn('id', $this->follow_id)->take(2)->get();

       $others = Publisher::whereHas('events', function($q) {
            return $q->where('event_id', $this->id);
            })->take(2)->get();

       $merged = $friends->merge($others);
       $filterResponse =  UserResource::collection($merged)->publisher($this->publisher_id);
       // $users =   $filterResponse->all();
       $this->users = $filterResponse;



        return $this;
    }

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */


    public function toArray($request)
    {

          return [
            "id" => $this->id,
            "name_ar" => $this->name_ar,
            "name_en" => $this->name_en,
            "desc_ar" => $this->desc_ar,
            "desc_en" => $this->desc_en,
            "address" => $this->address,
            "lat" => $this->lat,
            "lng" => $this->lng,
            "distance" => (string)$this->distance,
            "start_date" => $this->startAt,
            "end_date" => $this->endAt,
            "start_hour" => $this->startHour,
            "end_hour" => $this->endHour,
            "cost" => $this->cost,
            "url" => $this->url,
            'country'=> Location::where('id', $this->city->parent_id)->first(),
            "city" => $this->city,
            "files" => $this->files,
            "type" => $this->topics,
            "category" => $this->category,
            "user_count"=>$this->publishers_count,
            "interest_count"=>$this->interests_count,
            "join" => publisher::whereHas('events', function($q) {
            return $q->where('event_id', $this->id);
            })->where('id', $this->publisher_id)->first() == null ? false :true,
	    "interest" => Interest::where('publisher_id',$this->publisher_id)->where('event_id', $this->id)->first() == null ? false :true,
            "users" => $this->users
            // "users" => UserResource::collection($this->users)->publisher($this->publisher_id)

            
            
        ];
    }

    public static function collection($resource){
        // dd($resource);
        return new EventResourceCollection($resource);
    }
}
