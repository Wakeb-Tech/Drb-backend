<?php
$lat = !empty($event->lat)?$event->lat:'30.034024628931657';
$lng = !empty($event->lng)?$event->lng:'31.24238681793213';


?>
@extends('admin.index')
@section('cs')

@endsection
@section('bread')
    <li><a href="{{route('events.index')}}" style="color: white">Manage Event</a></li>
    <li class="active" style="color: white;font-size: larger"> Edit  Event </li>
@endsection

@section('content')

    <div class="row">
        <!-- left column -->
        <div class="col-md-12">
            <!-- general form elements -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Edit Event</h3>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form role="form" action="{{ route('events.update', ['id'=>$event->id]) }}" method="post" enctype="multipart/form-data">

                    {{ csrf_field() }}
                    {{ method_field('put') }}

                    <input type="hidden" value="{{ $lat }}" id="lat" name="lat">
                    <input type="hidden" value="{{ $lng }}" id="lng" name="lng">

                    <div class="box-body">
                        <div class="form-group">
                            <label for="name_ar">Enter Arabic Event Name</label>
                            <input type="text" name="name_ar" class="form-control" id="name_ar"
                                   placeholder="Description" value="{{$event->name_ar}}">
                        </div>


                        <div class="form-group">
                            <label for="name_en">Enter English Event Name</label>
                            <input type="text" name="name_en" class="form-control" id="name_en"
                                   placeholder=" English Event Name " value="{{$event->name_en}}">
                        </div>

                        <div class="form-group">
                            <label>Categories</label>
                            <select name="category_id" class="form-control">
                                <option value="">All Categories</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}" {{ $event->category_id == $category->id ? 'selected' : '' }}>{{ $category->name_ar }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="tags">HashTags</label>
                            <?php
                            $tags=[];
                            foreach ($hashs as  $tag) {
                                $tags[] = $tag->hashtag;
                            }
                            $old = implode(" ", $tags);

                            ?>

                            <input type="text" class="form-control" name="tags"  value="{{ $old }}" >
                        </div>


                        <div class="form-group">
                            <label for="desc_ar">Enter Arabic Event Description</label>
                            <input type="text" name="desc_ar" class="form-control" id="desc_ar"
                                   placeholder="Arabic Event Description" value="{{$event->desc_ar}}">
                        </div>
                        <div class="form-group">
                            <label for="desc_en">Enter English Event Description</label>
                            <input type="text" name="desc_en" class="form-control" id="desc_en"
                                   placeholder="English Event Description" value="{{$event->desc_en}}">
                        </div>

                        {{--  <div class="form-group">
                            <label for="store">Enter Address Location</label>
                            <div id="map" style="width:100%;height:300px;margin-top:15px;text-align: center">
                            </div>

                            <input type="text" name="address" value="{{$event->address}}" class="form-control" placeholder="address">
                            <input type="hidden" id="lat" value="{{$event->lat}}" name="lat">
                            <input type="hidden" id="lng" value="{{$event->lng}}" name="lng">
                        </div> --}}

                        <div class="form-group">
                            <label for="address">Address</label>
                            <input type="text" name="address" class="form-control" id="address"
                                   placeholder="Adress" value="{{$event->address}}">
                        </div>

                        <div class="form-group">

                            <div id="us1" style="width:100%; height: 400px;"></div>
                        </div>


                        <div class="form-group">
                            <label>Topics</label>
                            <?php
                            $array = [];
                            foreach ($topic as $k) {
                                $array[]= $k->id;
                            }

                            ?>
                            <select name = 'topic_id[]' multiple >
                                @foreach ($topics as $topic)
                                    <option value="{{ $topic->id }}" {{  in_array( $topic->id, $array ) ? 'selected' : '' }}>{{ $topic->name_ar }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Country</label>
                            <select name="country" id="country" class="form-control">
                                <option value="">All Countries</option>
                                @foreach ($countries as $co)
                                    <option value="{{ $co->id }}" {{ $co->id == $country->id ? 'selected' : '' }}>{{ $co->name_ar }}</option>
                                @endforeach

                            </select>
                        </div>

                        <div class="form-group">
                            <label>City</label>
                            <select name="city" id="city" class="form-control">
                                <option value="">All Cities</option>
                                @foreach ($cities as $ci)
                                    <option value="{{ $ci->id }}" {{ $ci->id == $city->id ? 'selected' : '' }}>{{ $ci->name_ar }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="cost">Cost</label>
                            <input type="text" name="cost" class="form-control" id="cost"
                                   placeholder=" ex : 300.50" value="{{$event->cost}}">
                        </div>
                        <div class="form-group">
                            <label for="url">link</label>
                            <input type="text" name="url" class="form-control" id="url"
                                   placeholder="link to event" value="{{$event->url}}">
                        </div>

                        <div class="form-group">
                            <label for="start_date">Start At</label>
                            <input type="text" name="start_date" value="{{$event->startAt}}" id="datetimepicker">
                            <label for="end_date">End At</label>
                            <input type="text" name="end_date" value="{{$event->endAt}}" id="datetimepicker1">
                        </div>



                        <div class="form-group">
                            <label for="start_hour">Start Hour</label>
                            <input type="text" name="start_hour" value="{{$event->startHour}}" id="datetimepicker2">
                            <label for="end_hour">End Hour</label>
                            <input type="text" name="end_hour" value="{{$event->endHour}}" id="datetimepicker3">
                        </div>

                        <div class="form-group">
                            <label for="image">Event Images</label>
                            <input type="file" name="files[]"  multiple="multiple" class="form-control" id="image"
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
