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
                    <h2>Product Details</h2>
                </div>
                <div class="panel-body">
                    <section class="profile">
                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="email">Product Title:</label>
                                        <div class="col-sm-8">
                                            {{ $product->product_title }}
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="pwd">Published at:</label>
                                        <div class="col-sm-8">
                                            {{ $product->created_at }}
                                        </div>
                                    </div>


                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="pwd">Offer price:</label>
                                        <div class="col-sm-8">
                                            <span> {{ $product->discount_price }}</span>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="pwd">Retail price:</label>
                                        <div class="col-sm-8">
                                            {{ $product->price }}
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="pwd">Location:</label>
                                        <div class="col-sm-8">
                                            <span> {{ $formatted_address }}</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-sm-4" for="pwd">Location map:</label>
                                        <div class="col-sm-8">
                                            <a target="_blank" href="https://www.google.com/maps/?q={{$product->lat}},{{$product->lng}}">Find location on map</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr>

                            <div class="col-md-12">
                                <div class="form-horizontal">
                                    <h4>Descripiton</h4>
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            {{ $product->product_description }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </section>
                </div>
            </div>

            @php
                $user = $product->seller()->first();
            @endphp

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Seller Info</h2>
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
                                            {{ $user->handle_name }}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <a class="pull-right" href="{{Url('admin/user_profile/'.$user->id)}}"> seller profile >></a>
                            </div>
                    </section>
                </div>
            </div>


            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2>Products Images</h2>
                </div>


                <div class="panel-body">
                    <div class="clearfix"></div>
                    <section class="products-images">

                        @foreach($image_url as $url)
                            <div class="col-md-3">
                                <img class="img-bordered img-responsive" src="{{$url}}" />
                            </div>
                        @endforeach
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
