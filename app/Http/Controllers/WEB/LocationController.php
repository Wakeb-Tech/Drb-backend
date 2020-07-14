<?php

namespace App\Http\Controllers\WEB;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Location;

class LocationController extends Controller
{
     public function index()
    {
       $countries =  Location::whereNull('parent_id')->orderby('created_at','DESC')->paginate(10);
      
        return view('locations.index', compact('countries'))->with('locations_count',Location::whereNull('parent_id')->count());
 
    }

    
    public function create()
    {
         return view('locations.add');
    }

  
    public function store(Request $request)
    {
         $this->validate($request,[

           'name_ar'       => 'required|string|unique:locations',
           'name_en'       => 'required|string|unique:locations'
          
        ]);
        
        $location = new Location;
        $location->name_ar = $request['name_ar'];
        $location->name_en = $request['name_en'];
        $location->save();

        // $city = new Location;
        // $city->parent_id = $location->id;
        // $city->name_ar = $request['name_ar1'];
        // $city->name_en = $request['name_en1'];
        // $city->save();

        session()->flash('success', 'Category added successfully');
        return redirect()->route('locations.index');
        
    }

  

    public function edit($id)
    {

         $location = Location::find($id);
        return view('locations.edit')->with('location',$location);
    }

   
    public function update(Request $request, $id)
    {
          $this->validate($request,[
           'name_ar'       => 'required|string',
           'name_en'       => 'required|string'
        ]);
      
        $location = Location::find($id);

        $location->name_ar = $request['name_ar'];
        $location->name_en = $request['name_en'];


        $location->update();
        session()->flash('success', 'Category Updated successfully');
        return redirect()->route('locations.index');
        
        
    }

    
    public function destroy($id)
    {
    

        $location= Location::find($id);
        $location->delete();
       
        session()->flash('success','Category Removed successfully');
        return redirect()->route('locations.index');
    }
}
