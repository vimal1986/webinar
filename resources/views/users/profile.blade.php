@extends('layouts.partials.dashboard')

@push('styles')
    <!-- Bootstrap CSS -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('css/user-list.css') }}">
@endpush

@section('content')
    <div id="page-wrapper" class="profile-info">
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Profile Info</h2>
                </div>
                <div class="panel-body">
                    <section class="profile">
                        <div class="row">
                            <div class="col-md-3">
                                <dl class="profile-img">
                                    <div class="middle">
                                    @if($user->profile_image)
                                        <img src="{{url('uploads/profile_image/'.$user->profile_image)}}" alt="profile image" />
                                    @else
                                        <img  src="{{url('image/user_image.png')}}" alt="profile image"/>
                                    @endif
                                    </div>
                                </dl>
                            </div>
                            <div class="col-md-4">
                                        <div class="form-horizontal">
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="email">Firstname:</label>
                                                <div class="col-sm-8">
                                                    {{ $user->first_name }}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="pwd">Lastname:</label>
                                                <div class="col-sm-8">
                                                    {{ $user->last_name }}
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="control-label col-sm-4" for="pwd">Registeration Date:</label>
                                                <div class="col-sm-8">
                                                    {{ $user->created_at }}
                                                </div>
                                            </div>
                                        </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="control-label col-sm-4" for="pwd">Email:</label>
                                            <div class="col-sm-8">
                                                <span>{{ $user->email }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label col-sm-4" for="pwd">Handle:</label>
                                            <div class="col-sm-8">
                                                {{ '@'.$user->handle_name }}
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <form method="post" action="{{url('admin/delete_user')}}" >
                                                <input type="hidden" name="_token" value="{{csrf_token()}}">
                                                <input type="hidden" name="user_id" value="{{$user->id}}" />
                                                <button value="MOVE TO TRASH" class="btn btn-danger"><i class="fa fa-fw fa-trash"></i>MOVE TO TRASH</button>
                                            </form>
                                        </div>

                                </div>
                            </div>
                        </div>

                    </section>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Products</h2>
                </div>

                <div class="panel-body">
                    <div class="clearfix"></div>
                    <section class="products">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="example">
                                <thead>
                                <tr>
                                    <th>Product Id</th>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Discounted price</th>
                                    <th>View</th>
                                </tr>
                                </thead>
                                <tbody>

                                    <?php
                                       $i=1;
                                       $products = $user->products()->get();
                                    ?>

                                    @foreach($products as $list)
                                        <tr>
                                            <td>{{$i++}}</td>
                                            <td>{{$list->product_title}}</td>
                                            <td>{{$list->product_description}}</td>
                                            <td>{{$list->price}}</td>
                                            <td>{{$list->discount_price}}</td>
                                            <td> <a href="{{URL::to('admin/product_details/' . $list->id)}}">View</a> </td>
                                        </tr>
                                    @endforeach

                                </tbody>
                            </table>
                        </div>
                    </section>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <!-- DataTables -->
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
    <!-- App scripts -->
    <script>
        $(document).ready(function() {
            $('#example').DataTable();
        } );
    </script>
@endpush
