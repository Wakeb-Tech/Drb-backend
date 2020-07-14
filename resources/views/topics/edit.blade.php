@extends('admin.index')
@section('cs')

@endsection
@section('bread')
    <li><a href="{{route('topics.index')}}" style="color: white">Manage Event Topics</a></li>
    <li class="active" style="color: white;font-size: larger"> Edit  Event Topics </li>
@endsection

@section('content')

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Edit Event Topic</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="{{ route('topics.update', ['id'=>$topics->id]) }}" method="post" enctype="multipart/form-data">
                    
                    {{ csrf_field() }}
                    {{ method_field('put') }}

                    <div class="box-body">
                        <div class="form-group">
                            <label for="name_ar">Enter Arabic Event Topic Name</label>
                            <input type="text" name="name_ar" class="form-control" id="name_ar"
                                   placeholder="Description" value="{{$topics->name_ar}}">
                        </div>


                       <div class="form-group">
                            <label for="name_en">Enter English Event Topic Name</label>
                            <input type="text" name="name_en" class="form-control" id="name_en"
                                   placeholder=" English Event Topic Name " value="{{$topics->name_en}}">
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
