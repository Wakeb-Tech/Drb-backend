<?php

namespace App\Http\Controllers\WEB;

use App\Models\Event;
use App\Models\Location;
use App\Models\Topic;
use App\Models\Hash;
use App\Models\Event_file;
use App\Http\Controllers\Controller;
use App\Models\EventCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Str;



class EventController extends Controller
{
    public function index()
    {

        return view('events.index')->with('events', Event::orderby('created_at','DESC')->paginate(10))
            ->with('events_count',Event::count());
        // return view('events.index')->with('places',Suggest::orderby('created_at','DESC')->paginate(10));
    }



    public function create()
    {
        $countries =  Location::whereNull('parent_id')->get();
        $topics = Topic::orderby('created_at','DESC')->get();
        $categories = EventCategory::all();
        return view('events.add',compact('categories','topics','countries'));
    }

    public function getstates( $id )
    {

        $cities =  Location::where('parent_id', $id)->pluck('name_ar','id');

        return json_encode($cities);
    }


    public function store(Request $request)
    {
        $this->validate($request,[
            'end_date'         => 'required',
            'start_date'       => 'required',
            'start_hour'       => 'required',
            'end_hour'         => 'required',
            'cost'             => 'nullable',
            'url'              => 'nullable|string',
            'address'          => 'required|string',
            'city'             => 'required',
            'tags'             => 'nullable',
            'topic_id.*'       => 'required',
            'name_ar'          => 'required|string|unique:events',
            'desc_ar'          => 'required|string|unique:events',
            'name_en'          => 'required|string|unique:events',
            'desc_en'          => 'required|string|unique:events',
            'files'            => 'required|array',
            'files.*'          => 'required|file|max:25000|mimes:jpeg,png,jpg,gif,svg,mpeg,ogg,mp4,webm,3gp,mov,flv,avi,wmv,ts',
            'category_id'      => 'required|numeric'
        ]);

        $event = new Event;

        $event->category_id = $request['category_id'];
        $event->name_ar = $request['name_ar'];
        $event->name_en = $request['name_en'];
        $event->startAt = $request['start_date'];
        $event->endAt = $request['end_date'];
        $event->startHour = $request['start_hour'];
        $event->endHour = $request['end_hour'];
        $event->desc_ar = $request['desc_ar'];
        $event->desc_en = $request['desc_en'];
        if($request->has('url')) {
            $event->url = $request['url'];
        }
        $event->address = $request['address'];
        if($request->has('cost')) {
            $event->cost = $request['cost'];
        }
        $event->place_id = $request['city'];
        $event->lat = $request['lat'];
        $event->lng = $request['lng'];
        $event->save();

        $event->topics()->sync($request['topic_id']);

        if ($request->tags) {

            preg_match_all('/#([^\s]+)/', $request->tags , $matches);
            $hashs = [];
            foreach ($matches[0] as $hashtag){
                $hashs[] = $hashtag;
            }

            foreach ($hashs as $tag) {
                $tag_found = Hash::where('hashtag', $tag)->first();
                if (!$tag_found) {
                    $newTag = Hash::create([
                        'hashtag' => $tag
                    ]);
                    $event->hashs()->attach($newTag->id);
                } else {
                    $event->hashs()->attach($tag_found->id);
                }
            }
        }


        $imageExtensions = ['jpg', 'jpeg', 'gif', 'png', 'PNG', 'bmp', 'svg'];
        $videoExtensions = ['mpeg', 'ogg', 'mp4', 'webm', '3gp', 'mov', 'flv', 'avi', 'wmv', 'ts'];

        if($request->has('files')) {
            foreach ($request->file('files') as $file) {

                if (in_array($file->getClientOriginalExtension(), $imageExtensions)) {

                    $basename = Str::random();
                    $original = $basename . "." . $file->getClientOriginalExtension();

                    $file->move("uploads/events", $original);

                    $event->files()->create([
                        "file" => "uploads/events/" . $original,
                        "type" => "image",
                        "event_id" => $event->id,
                    ]);


                } else if (in_array($file->getClientOriginalExtension(), $videoExtensions)) {

                    $basename = Str::random();
                    $original = $basename . "." . $file->getClientOriginalExtension();
                    $file->move("uploads/events", $original);

                    $event->files()->create([
                        "file" => "uploads/events/" . $original,
                        "type" => "video",
                        "event_id" => $event->id,
                    ]);

                }
            }

        }

        session()->flash('success', 'Category added successfully');
        return redirect()->route('events.index');

    }



    public function edit($id)
    {
        $categories = EventCategory::all();
        $event = Event::find($id);
        $topic = $event->topics;
        $hashs = $event->hashs;
        $topics = Topic::get();
        $countries =  Location::whereNull('parent_id')->get();
        $city = Location::where('id', $event->place_id)->first();
        $country =  Location::where('id', $city->parent_id)->first();
        $cities = Location::where('parent_id', $country->id)->get();



        return view('events.edit',compact('categories','event','hashs','city','country','countries','cities','topics','topic'));

    }


    public function update(Request $request, $id)
    {

        $this->validate($request,[
            'end_date'         => 'date',
            'start_date'       => 'date',
            'start_hour'       => 'required',
            'end_hour'         => 'required',
            'cost'             => 'required',
            'tags'             => 'nullable',
            'url'              => 'required|string',
            'address'          => 'required|string',
            'city'             => 'required',
            'topic_id.*'       => 'required',
            'name_ar'          => 'required|string',
            'desc_ar'          => 'required|string',
            'name_en'          => 'required|string',
            'desc_en'          => 'required|string',
            'files'            => 'nullable|array',
            'files.*'          => 'nullable|file|max:25000|mimes:jpeg,png,jpg,gif,svg,mpeg,ogg,mp4,webm,3gp,mov,flv,avi,wmv,ts',
            'category_id'      => 'required|numeric'
        ]);

        $event = Event::find($id);

        $event->name_ar = $request['name_ar'];
        $event->name_en = $request['name_en'];
        $event->startAt = $request['start_date'];
        $event->endAt = $request['end_date'];
        $event->startHour = $request['start_hour'];
        $event->endHour = $request['end_hour'];
        $event->desc_ar = $request['desc_ar'];
        $event->desc_en = $request['desc_en'];
        $event->url = $request['url'];
        $event->address = $request['address'];
        $event->cost = $request['cost'];
        $event->place_id = $request['city'];
        $event->lat = $request['lat'];
        $event->lng = $request['lng'];

        $event->update();

        $event->topics()->sync($request['topic_id']);
        if ($request->tags) {

            preg_match_all('/#([^\s]+)/', $request->tags , $matches);
            $hashs = [];
            foreach ($matches[0] as $hashtag){
                $hashs[] = $hashtag;
            }

            foreach ($hashs as $tag) {
                $tag_found = Hash::where('hashtag', $tag)->first();
                if (!$tag_found) {
                    $newTag = Hash::create([
                        'hashtag' => $tag
                    ]);
                    $event->hashs()->attach($newTag->id);
                } else {
                    $event->hashs()->detach($tag_found->id);
                    $event->hashs()->attach($tag_found->id);
                }
            }
        }

        $imageExtensions = ['jpg', 'jpeg', 'gif', 'png', 'PNG', 'bmp', 'svg'];
        $videoExtensions = ['mpeg', 'ogg', 'mp4', 'webm', '3gp', 'mov', 'flv', 'avi', 'wmv', 'ts'];

        if($request->file('files')) {
            foreach ($request->file('files') as $file) {

                if (in_array($file->getClientOriginalExtension(), $imageExtensions)) {

                    $basename = Str::random();
                    $original = $basename . "." . $file->getClientOriginalExtension();
                    $file->move("uploads/events", $original);


                    //logic update file

                    $files = $event->files;

                    foreach($files as $file) {
                        $file->delete();
                    }

                    Event_file::create([
                        "file" => "uploads/events/" . $original,
                        "type" => "image",
                        "event_id" => $event->id,
                    ]);



                } else if (in_array($file->getClientOriginalExtension(), $videoExtensions)) {

                    $basename = Str::random();
                    $original = $basename . "." . $file->getClientOriginalExtension();
                    $file->move("uploads/events", $original);

                    $files = $event->files;

                    foreach($files as $file) {
                        $file->delete();
                    }

                    Event_file::create([
                        "file" => "uploads/events/" . $original,
                        "type" => "video",
                        "event_id" => $event->id,
                    ]);


                }
            }

        }

        session()->flash('success', 'Category Updated successfully');
        return redirect()->route('events.index');


    }


    public function destroy($id)
    {
        $event= Event::find($id);
        $event->delete();
        $event->topics()->detach();

        session()->flash('success','Category Removed successfully');
        return redirect()->route('events.index');
    }
}
