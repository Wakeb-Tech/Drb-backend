@extends('admin.index')
@section('cs')
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="{{url('/design/adminlte')}}/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{url('/design/adminlte')}}/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="{{url('/design/adminlte')}}/bower_components/Ionicons/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet"
          href="{{url('/design/adminlte')}}/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{url('/design/adminlte')}}/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="{{url('/design/adminlte')}}/dist/css/skins/_all-skins.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"/>

    <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">

    <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>


    <style>
        /* The switch - the box around the slider */
        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        /* Hide default HTML checkbox */
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }
    </style>

@endsection
@section('bread')
    <li class="active" style="color: white;font-size: larger">Manage User</li>
@endsection
@section('content')
        <div class="box-header">
            <h1 style="color: blue;" class="box-title">Manage User</h1>
            <p>Total users : <span style="color: #1d68a7">{{$user_count}}</span></p>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>S.NO.</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Block</th>
                    <th>Verified</th>
                    <th>Show</th>
                </tr>
                </thead>
                <tbody>
                @foreach($users as $user)
                    <tr>
                        <td>{{$user->id}}</td>
                        <td>{{$user->username}}
                        </td>
                        <td>{{$user->email}}</td>
                        <td> {{$user->mobile}}</td>
                        <td>
                            <label class="switch">
                                <input data-id="{{$user->id}}"
                                       class="toggle-class" type="checkbox"
                                       data-status="{{$user->status}}"
                                       @if( $user->status == 0) checked @endif
                                >
                                <span class="slider round"></span>
                            </label>
                        </td>
                        <td>
                            <label class="switch">
                                <input data-id="{{$user->id}}"
                                       class="toggle" type="checkbox"

                                       data-status="{{$user->verified}}"
                                       @if( $user->verified == 1) checked @endif
                                >
                                <span class="slider round"></span>
                            </label>

                        </td>
                        <td>
                            <a href="{{route('user.show',['id'=>$user->id])}}"><i class="fa fa-eye"></i></a>

                        </td>
                    </tr>
                @endforeach


                </tbody>
            </table>
        </div>
        <!-- /.box-body -->



@endsection
@section('js')
    <script>

        $(function () {
            $('#example1').DataTable()
            $('#example2').DataTable({
                'paging': true,
                'lengthChange': false,
                'searching': false,
                'ordering': true,
                'info': true,
                'autoWidth': false
            })
        })

        //====================================================

            console.log('loaded');

            $(".box-body").on('change', ".toggle-class", function () {

                var status = $(this).data('status') === 1 ? 0 : 1;
                $(this).data('status', status)
                console.log(status);

                var user_id = $(this).data('id');


                $.ajax({

                    type: "GET",

                    dataType: "json",

                    url: '/user/changeStatus',

                    data: {'status': status, 'user_id': user_id},

                    success: function (data) {

                        console.log(data.success)

                    }

                });

            })



        //==================================

        $(function () {
            console.log('loaded');

            $(".box-body").on('change', ".toggle", function () {

                console.log('fun');

                var verified = $(this).data('status') == 1 ? 0 : 1;
                $(this).data('status', verified)
                console.log($(this).data('status'));
                var user_id = $(this).data('id');


                $.ajax({

                    type: "GET",

                    dataType: "json",

                    url: '/user/changeVerified',

                    data: {'verified': verified, 'user_id': user_id},

                    success: function (data) {

                        console.log(data.success)

                    }

                });

            })

        })


    </script>








@endsection
