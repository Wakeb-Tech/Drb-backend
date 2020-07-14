<?php
$lat = !empty(old('lat'))?old('lat'):'30.034024628931657';
$lng = !empty(old('lng'))?old('lng'):'31.24238681793213';

?>
@extends('admin.index')
@section('cs')

@endsection
@section('bread')
    <li><a href="{{route('events.index')}}" style="color: white">Manage Events</a></li>
    <li class="active" style="color: white;font-size: larger"> Add New Event </li>
@endsection

@section('content')

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Add New Event </h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="{{route('events.store')}}" method="post" enctype="multipart/form-data">
                    @csrf

                    <input type="hidden" value="{{ $lat }}" id="lat" name="lat">
                    <input type="hidden" value="{{ $lng }}" id="lng" name="lng">

                    <div class="box-body">
                        <div class="form-group">
                            <label for="name_ar">Enter Arabic Name</label>
                            <input type="text" name="name_ar" class="form-control" id="name_ar"
                                   placeholder="Arabic Event Name" value="{{old('name_ar')}}">
                        </div>

                        <div class="form-group">
                            <label for="name_en">Enter English Event Name</label>
                            <input type="text" name="name_en" class="form-control" id="name_en"
                                   placeholder=" English Event Name " value="{{old('name_en')}}">
                        </div>

                        <div class="form-group">
                            <label>Categories</label>
                            <select name="category_id" class="form-control">
                                <option value="">All Categories</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>{{ $category->name_ar }}</option>
                                @endforeach
                            </select>
                        </div>



                        <div class="form-group">
                            <label for="desc_ar">Enter Arabic Event Description</label>
                            <input type="text" name="desc_ar" class="form-control" id="desc_ar"
                                   placeholder="Arabic Event Description" value="{{old('desc_ar')}}">
                        </div>
                        <div class="form-group">
                            <label for="desc_en">Enter English Event Description</label>
                            <input type="text" name="desc_en" class="form-control" id="desc_en"
                                   placeholder="English Event Description" value="{{old('desc_en')}}">
                        </div>

                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" name="address" class="form-control" id="address"
                                   placeholder="Adress" value="{{old('address')}}">
                        </div>

                        <div class="form-group">

                            <div id="us1" style="width:100%; height: 400px;"></div>
                        </div>

                        <div class="form-group">
                            <label>Topics</label>
                            <select name = 'topic_id[]' multiple >
                                @foreach ($topics as $topic)
                                    <option value="{{ $topic->id }}" {{ old('topic_id') == $topic->id ? 'selected' : '' }}>{{ $topic->name_ar }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Country</label>
                            <select name="country" id="country" class="form-control">
                                <option value="">All Countries</option>
                                @foreach ($countries as $country)
                                    <option value="{{ $country->id }}" {{ old('country_id') == $country->id ? 'selected' : '' }}>{{ $country->name_ar }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label>City</label>
                            <select name="city" id="city" class="form-control">
                                <option value="">All Cities</option>

                            </select>
                        </div>



                        <div class="form-group">
                            <label for="tags">HashTags</label>
                            <input type="text" class="form-control" name="tags"  value="{{old('tags')}}" >
                        </div>


                        <div class="form-group">
                            <label for="start_date">Start At</label>
                            <input type="text" name="start_date" value="{{old('start_date')}}" id="datetimepicker">
                            <label for="end_date">End At</label>
                            <input type="text" name="end_date" value="{{old('end_date')}}" id="datetimepicker1">
                        </div>



                        <div class="form-group">
                            <label for="start_hour">Start Hour</label>
                            <input type="text" name="start_hour" value="{{old('start_hour')}}" id="datetimepicker2">
                            <label for="end_hour">End Hour</label>
                            <input type="text" name="end_hour" value="{{old('end_hour')}}" id="datetimepicker3">
                        </div>

                        <div class="form-group">
                            <label for="cost">Cost</label>
                            <input type="text" name="cost" class="form-control" id="cost"
                                   placeholder=" ex : 300.50" value="{{old('cost')}}">
                        </div>
                        <div class="form-group">
                            <label for="url">link</label>
                            <input type="text" name="url" class="form-control" id="url"
                                   placeholder="link to event" value="{{old('url')}}">
                        </div

                        <div class="form-group">
                            <label for="image">Event Images</label>
                            <input type="file" name="files[]" multiple="multiple" class="form-control" id="image"
                                   value="">
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
@section('js')

    <script type="text/javascript">
        $('#datetimepicker').datetimepicker({
            format: 'yyyy-mm-dd hh:ii'
        });
        $('#datetimepicker1').datetimepicker({
            format: 'yyyy-mm-dd hh:ii'
        });

        $('#datetimepicker2').datetimepicker({
            format: 'hh:ii'
        });

        $('#datetimepicker3').datetimepicker({
            format: 'hh:ii'
        });



        $(document).ready(function() {

            $('select[name="country"]').on('change', function() {
                var country_id = $(this).val();
                if(country_id) {
                    $.ajax({
                        url : '{{url("getStates")}}' + '/' + country_id,
                        type: 'GET' ,
                        dataType: 'json',
                        success: function(data){
                            $('select[name="city"]').empty();
                            $.each(data, function (key, value) {
                                $('select[name="city"]').append('<option value="'+key+'">' +value+'</option>');
                            });
                        }

                    });
                } else {
                    $('select[name="city"]').empty();
                }
            });

        });
    </script>



    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyCNeP4vlmQ8y_Sq7EtKk8_mEN47PapWIuI'></script>
    <script type="text/javascript" src='{{ url("design/adminlte/dist/js/locationpicker.jquery.js") }}'></script>

    <script>
        $('#us1').locationpicker({
            location: {
                latitude: {{ $lat }},
                longitude:{{ $lng }}
            } ,
            radius: 300,
            markerIcon: '{{ url('design/adminlte/dist/img/map-marker.png') }}',
            inputBinding: {
                latitudeInput: $('#lat'),
                longitudeInput: $('#lng'),
                radiusInput: $('#us2-radius'),
                locationNameInput: $('#address')
            },
            enableAutocomplete: true

        });
    </script>




@endsection

