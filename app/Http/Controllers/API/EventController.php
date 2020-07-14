<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Event;
use App\Models\Location;
use App\Models\EventCategory;
use App\Models\Topic;
use App\Models\Publisher;
use App\Models\Interest;
use App\Http\Resources\UserResource;
use App\Http\Resources\EventResource;
use Validator;
use DB;

class EventController extends Controller
{
    use ApiResponseTrait;

    public function get_countries() {
        $countries = Location::whereNull('parent_id')->get();
        if(!$countries) {
            $msg = $request['lang'] == 'ar' ? ' ليس هناك دول موجوده ' : ' No country found ';
            return $this->apiResponse(null, $msg , 200);
        }
        $msg ='';
        return $this->apiResponse( ['event_countries' => $countries] , $msg , 200);
    } // end get_countries


    public function get_cities(Request $request) {

        $validation=Validator::make(
            $request->all(),
            [

                'country_id'     =>'required|numeric',

            ]
        );

        if ($validation->fails()) {
            // $this->_result->FaildReason =  $validation->errors()->first();
            foreach ((array)$validation->errors() as $key => $value) {
                foreach ($value as $msg) {
                    // return response()->json(['status' => false, 'msg' => $msg[0]]);
                    return $this->apiResponse(null, $msg[0] , 400);
                }
            }

        }
        $cities = Location::where('parent_id', $request->country_id)->get();
        if(!$cities) {
            $msg = $request['lang'] == 'ar' ? 'ليس هناك مدن موجوده ' : ' No cities found ';
            return $this->apiResponse(null, $msg , 200);
        }

        $msg = '';
        return $this->apiResponse( ['event_cities' => $cities] , $msg , 200);
    } // end get_cities

    public function get_categories() {
        $categories = EventCategory::get();

        if(!$categories) {
            $msg = $request['lang'] == 'ar' ? 'ليس هناك أقسام موجوده ' : ' No categories found ';
            return $this->apiResponse(null, $msg , 200);
        }

        $msg ='';
        return $this->apiResponse( ['event_categories' => $categories], $msg , 200);

    } // end get_categories

    public function get_topics() {
        $topics = Topic::get();

        if(!$topics) {
            $msg = $request['lang'] == 'ar' ? 'ليس هناك مواضيع' : ' No topics found ';
            return $this->apiResponse(null, $msg , 200);
        }

        $msg ='';
        return $this->apiResponse(['event_topics' => $topics] , $msg , 200);

    } // end get_topics

    public function  get_event(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'event_id' => 'required|numeric|exists:events,id',
            'publisher_id' => 'required|numeric|exists:publishers,id'
        ]);

        if ($validator->fails()) {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return $this->apiResponse(null, $msg[0] , 400);
                }
            }

        }


        $result = Event::where("id", $request->event_id)->withCount(['publishers','interests'])->get();
        $event = EventResource::collection($result)->foo($request->publisher_id);
        $msg = '';
        return $this->apiResponse( ['events' => $event], $msg , 200);

    }

    public function get_nearest(Request $request)  {

        $validator = Validator::make($request->all(),
            [
                'publisher_id' => 'required|numeric|exists:publishers,id',
                'lat'                 => 'required',
                'lng'                 => 'required'

            ]);

        if ($validator->fails()) {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return $this->apiResponse(null, $msg[0] , 400);
                }
            }

        }


        // $lat        = $request['lat'];
        // $lng        = $request['lng'];

        // $radius = 10;
        // $string = "SELECT id, ( 6371 * acos( cos( radians(?) ) *
        // cos( radians( lat ) ) * cos( radians( lng ) - radians(?) ) + sin( radians(?) ) * sin( radians( lat ) ) ) )
        // AS distance FROM events HAVING distance < ? ORDER BY distance LIMIT 0 , 20;";
        // $args = [$lat, $lng, $lat, $radius];


        $location = Event::select('id','lat', 'lng',
            DB::raw(sprintf(
                '(6371 * acos(cos(radians(%1$.7f)) * cos(radians(lat)) * cos(radians(lng) - radians(%2$.7f))
                    + sin(radians(%1$.7f)) * sin(radians(lat)))) AS distance',
                // you can change this name total_distance Easy :)
                request('lat'),
                request('lng')
            )))
            ->having('distance' , '>', 0)->orderBy('distance', 'desc')
            ->limit(20)->get();




        $data = collect($location)->pluck('distance','id')->toArray();
        $ids    =  collect($location)->pluck('id')->toArray();
        $getevents = Event::whereIn('id',$ids)->withCount(['publishers','interests'])->get();
        $second = $getevents;
        foreach($second as $key1 => $value1){
            foreach($data as $key2 => $value2){
                if($value1->id == $key2 ){
                    $value1->distance = $value2;
                }
            }
        }

        $result = collect($second);
        $events = EventResource::collection($result)->foo($request->publisher_id);
        $msg ='';
        return $this->apiResponse( ['events' => $events] , $msg , 200);
    } // end get_nearest


    public function filter(Request $request) {

        $validator = Validator::make($request->all(),
            [
                'publisher_id'            => 'required|numeric',
                'country_id'              => 'nullable',
                'city_id'                 => 'nullable',
                'category_id'             => 'nullable',
                'topic_id'                => 'nullable',
                'date'                    => 'date_format:"Y-m-d"|nullable'

                // 'mounth'                  => 'nullable',
                // 'name'                    => 'nullable',
                // 'cost'                    => 'nullable|in:0,1',

            ]);

        if ($validator->fails()) {
            foreach ((array)$validator->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return $this->apiResponse(null, $msg[0] , 400);
                }
            }

        }

        $conditions = [];

        foreach (request()->toArray() as $key => $value) {
            $conditions[$key] = $value;
        }


        $result =  Event::when($request->city_id, function ($q) use( $conditions ){
            if(array_key_exists('city_id', $conditions)){
                return $q->where('place_id',  $conditions['city_id']);
            }
        })

            ->when($request->category_id, function ($q) use( $conditions ){
                if(array_key_exists('category_id', $conditions)){
                    return $q->where('category_id',  $conditions['category_id']);
                }
            })

            ->when($request->date, function ($q) use( $conditions ){
                if(array_key_exists('date', $conditions)){
                    return $q->whereDate('startAt',date($conditions['date']));
                }
            })

            ->when($request->topic_id, function ($q) use( $conditions ){
                return $q->whereHas('topics', function($query) use( $conditions) {
                    if(array_key_exists('topic_id', $conditions)){
                        return $query->where('topic_id', $conditions['topic_id']);
                    }
                });
            })

            ->when($request->country_id, function ($q) use( $conditions ) {
                return $q->whereHas('city', function($query)  use ($conditions) {
                    if(array_key_exists('country_id', $conditions)){
                        return $query->where('parent_id',$conditions['country_id']);
                    }
                });
            })->withCount(['publishers','interests'])->orderBy('created_at', 'desc')->paginate(10);


        // ->where(function( $query ) use( $conditions ) {
        //      if(array_key_exists('cost', $conditions) && $conditions['cost'] == '0' ){
        //          return $query->where('cost', $conditions['cost']);
        //       } elseif(array_key_exists('cost', $conditions) && $conditions['cost']  != '0'){
        //            return $query->where('cost','>', '0');
        //       }
        //    })

        // ->where(function( $query ) use( $conditions ) {
        //      if(array_key_exists('name', $conditions)){
        //          return $query->where('name_ar', 'LIKE', '%'. $conditions['name'] .'%')->orwhere('name_en', 'LIKE', '%'. $conditions['name'] .'%');
        //       }
        //    })

        // ->where(function( $query ) use( $conditions ) {
        //      if(array_key_exists('month', $conditions)){
        //          return $query->whereMonth('startAt', $conditions['month']);
        //       }
        //    })


        $events = EventResource::collection($result)->foo($request->publisher_id);

        $msg ='';
        return $this->apiResponse(  [ 'events' => $events] , $msg , 200);


    } // end filter

    public function swape_join(Request $request) {
        $validation=Validator::make(
            $request->all(),
            [
                'publisher_id' =>'required|numeric',
                'event_id'     =>'required|numeric'
            ]
        );

        if ($validation->fails()) {
            foreach ((array)$validation->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return $this->apiResponse(null, $msg[0] , 400);
                }
            }
        }


        $event = Event::where('id',$request->event_id)->first();

        $join = publisher::whereHas('events', function($q)  use ($request) {
            return $q->where('event_id',$request->event_id);
        })->where('id',$request->publisher_id)->first();

        if($join) {
            $event->publishers()->detach($request->publisher_id);

            $msg = $request['lang'] == 'ar' ? 'تمت الإضافة بنجاح' : ' successfully unjoined user from this event';

            return response()->json(['status' => true, 'data' => '', 'msg' => $msg]);

        } else {
            $event->publishers()->attach($request->publisher_id);
            $msg =  "successfully added user To event";
            return response()->json(['status' => true, 'data' => '', 'msg' => $msg]);
        }


    } // end swape_join


    public function swapeInterest(Request $request) {
        $validation=Validator::make(
            $request->all(),
            [
                'publisher_id' =>'required|numeric',
                'event_id'     =>'required|numeric'
            ]
        );

        if ($validation->fails()) {
            foreach ((array)$validation->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return $this->apiResponse(null, $msg[0] , 400);
                }
            }
        }

        $interest = Interest::where('event_id', $request->event_id)
            ->where('publisher_id', $request->publisher_id)->first();


        if($interest) {

            $interest->delete();
            $msg = $request['lang'] == 'ar' ? 'تم الحذف بنجاح' : 'successfully removed interest';
            return response()->json(['status' => true, 'data' => '', 'msg' => $msg]);

        } else {

            Interest::create([
                "publisher_id" => $request->publisher_id,
                "event_id" => $request->event_id
            ]);

            $msg = $request['lang'] == 'ar' ? 'تمت الإضافة بنجاح' : ' User added to Interest List successfully';

            return response()->json(['status' => true, 'data' => '', 'msg' => $msg]);
        }


    } // end swape_Interest

    public function get_event_users(Request $request) {
        $validation=Validator::make(
            $request->all(),
            [
                'event_id'     =>'required|numeric',
                'publisher_id' =>'required|numeric'
            ]
        );

        if ($validation->fails()) {
            foreach ((array)$validation->errors() as $key => $value) {
                foreach ($value as $msg) {
                    return $this->apiResponse(null, $msg[0] , 400);
                }
            }
        }
        $publishers = publisher::whereHas('events', function($q) use($request) {
            return $q->where('event_id',$request->event_id);
        })->limit(request()->limit ? request()->limit : 10)->offset(request()->offset ? request()->offset:0)->get();

        $users =  UserResource::collection($publishers)->publisher($request->publisher_id);


        $msg ='';

        if($users) {
            return $this->apiResponse($users, $msg , 200);
        } else {
            $msg =  "event has no users ";
            $msg = $request['lang'] == 'ar' ? 'ليس هناك أشخاص في الايفنت' : 'event has no users ';

            return response()->json(['status' => true, 'data' => '', 'msg' => $msg]);
        }


    } // end get_event_users



}
