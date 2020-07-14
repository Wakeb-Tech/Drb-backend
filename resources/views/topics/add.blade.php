@extends('admin.index')
@section('cs')

@endsection
@section('bread')
    <li><a href="{{route('topics.index')}}" style="color: white">Manage Event Topics</a></li>
    <li class="active" style="color: white;font-size: larger"> Add Event Topic </li>
@endsection

@section('content')

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Add New Event Topic</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="{{route('topics.store')}}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="box-body">
                        <div class="form-group">
                            <label for="name_ar">Enter Arabic Event Topic Name</label>
                            <input type="text" name="name_ar" class="form-control" id="name_ar"
                                   placeholder="Arabic Category Name" value="{{old('name_ar')}}">
                        </div>

                        <div class="form-group">
                            <label for="name_en">Enter English Event Topic Name</label>
                            <input type="text" name="name_en" class="form-control" id="name_en"
                                   placeholder=" English Category Name " value="{{old('name_en')}}">
                        </div>

                 
                    </div>
                    <!-- /.box-body -->

                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection

