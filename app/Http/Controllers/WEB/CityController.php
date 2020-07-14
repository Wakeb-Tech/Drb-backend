<?php

namespace App\Http\Controllers\WEB;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Location;

class CityController extends Controller
{
     public function index()
    {
       $cities =  Location::whereNotNull('parent_id')->orderby('created_at','DESC')->paginate(10);
      
        return view('cities.index', compact('cities'))->with('cities_count', Location::whereNotNull('parent_id')->count());
 
    }

    
    public function create()
    {
         $countries =  Location::whereNull('parent_id')->orderby('created_at','DESC')->paginate(10);
         return view('cities.add', compact('countries'));
    }

  
    public function store(Request $request)
    {
         $this->validate($request,[

           'name_ar'       => 'required|string|unique:locations',
           'name_en'       => 'required|string|unique:locations'
          
        ]);

        $city = new Location;
        $city->parent_id = $request['country_id'];
        $city->name_ar = $request['name_ar'];
        $city->name_en = $request['name_en'];
        $city->save();

        session()->flash('success', 'City added successfully');
        return redirect()->route('cities.index');
        
    }

  

    public function edit($id)
    {

        $city = Location::find($id);
        $countries =  Location::whereNull('parent_id')->orderby('created_at','DESC')->paginate(10);

        return view('cities.edit', compact('city','countries'));
    }

   
    public function update(Request $request, $id)
    {
          $this->validate($request,[
           'name_ar'       => 'required|string',
           'name_en'       => 'required|string'
        ]);
      
        $city = Location::find($id);
        $city->parent_id = $request['country_id'];
        $city->name_ar = $request['name_ar'];
        $city->name_en = $request['name_en'];


        $city->update();
        session()->flash('success', 'City Updated successfully');
        return redirect()->route('cities.index');
        
        
    }

    
    public function destroy($id)
    {
    

        $city= Location::find($id);
        $city->delete();
       
        session()->flash('success','Category Removed successfully');
        return redirect()->route('cities.index');
    }
}
