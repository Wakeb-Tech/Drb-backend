<?php

namespace App\Http\Controllers\WEB;

use App\Models\EventCategory;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    
    public function index()
    {
        return view('categories.index')->with('categories', EventCategory::orderby('created_at','DESC')->paginate(10))
            ->with('categories_count',EventCategory::count());
        // return view('categories.index')->with('places',Suggest::orderby('created_at','DESC')->paginate(10));
    }

    
    public function create()
    {
         return view('categories.add');
    }

  
    public function store(Request $request)
    {
        $this->validate($request,[
           'desc_ar'       => 'required|string|unique:event_categories',
           'desc_en'       => 'required|string|unique:event_categories',
           'name_ar'       => 'required|string|unique:event_categories',
           'name_en'       => 'required|string|unique:event_categories'
        ]);
        $category = new EventCategory;
        $category->name_ar = $request['name_ar'];
        $category->name_en = $request['name_en'];
        $category->desc_ar = $request['desc_ar'];
        $category->desc_en = $request['desc_en'];
        $category->save();
        session()->flash('success', 'Category added successfully');
        return redirect()->route('categories.index');
        
    }

  

    public function edit($id)
    {

         $categories = EventCategory::find($id);
        return view('categories.edit')->with('categories',$categories);
    }

   
    public function update(Request $request, $id)
    {
          $this->validate($request,[
           'desc_ar'       => 'required|string',
           'desc_en'       => 'required|string',
           'name_ar'       => 'required|string',
           'name_en'       => 'required|string'
        ]);
      
        $category = EventCategory::find($id);

        $category->name_ar = $request['name_ar'];
        $category->name_en = $request['name_en'];
        $category->desc_ar = $request['desc_ar'];
        $category->desc_en = $request['desc_en'];

        $category->update();
        session()->flash('success', 'Category Updated successfully');
        return redirect()->route('categories.index');
        
        
    }

    
    public function destroy($id)
    {
        $category= EventCategory::find($id);
        $category->delete();
        session()->flash('success','Category Removed successfully');
        return redirect()->route('categories.index');
    }
}
