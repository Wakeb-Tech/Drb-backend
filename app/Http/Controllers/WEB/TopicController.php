<?php

namespace App\Http\Controllers\WEB;

use App\Models\Topic;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TopicController extends Controller
{
  public function index()
    {
        return view('topics.index')->with('topics', Topic::orderby('created_at','DESC')->paginate(10))
            ->with('topics_count',Topic::count());
        // return view('topics.index')->with('places',Suggest::orderby('created_at','DESC')->paginate(10));
    }

    
    public function create()
    {
         return view('topics.add');
    }

  
    public function store(Request $request)
    {
        $this->validate($request,[

           'name_ar'       => 'required|string|unique:topics',
           'name_en'       => 'required|string|unique:topics'
        ]);
        $topic = new Topic;
        $topic->name_ar = $request['name_ar'];
        $topic->name_en = $request['name_en'];
        $topic->save();
        session()->flash('success', 'Category added successfully');
        return redirect()->route('topics.index');
        
    }

  

    public function edit($id)
    {

         $topics = Topic::find($id);
        return view('topics.edit')->with('topics',$topics);
    }

   
    public function update(Request $request, $id)
    {
          $this->validate($request,[
           'name_ar'       => 'required|string',
           'name_en'       => 'required|string'
        ]);
      
        $topic = Topic::find($id);

        $topic->name_ar = $request['name_ar'];
        $topic->name_en = $request['name_en'];


        $topic->update();
        session()->flash('success', 'Category Updated successfully');
        return redirect()->route('topics.index');
        
        
    }

    
    public function destroy($id)
    {
        $topic= Topic::find($id);
        $topic->delete();
        session()->flash('success','Category Removed successfully');
        return redirect()->route('topics.index');
    }
}
