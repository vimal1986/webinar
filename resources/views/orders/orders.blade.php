@extends('layouts.partials.dashboard')

@push('styles')
    <!-- Bootstrap CSS -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('css/user-list.css') }}">
    <link rel="stylesheet" href="{{URL('plugins/datepicker/datepicker3.css')}}">
@endpush

@section('content')
    <div id="page-wrapper" class="list-blade">
        <div class="container-fluid">
            <div class="user-list">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h2>Orders Lists</h2>
                    </div>


                    <div class="panel-body">

                        <div class="clearfix"></div>

                        <form class="form-inline">
                            <div class="form-group">
                                <label>From</label>
                                <input type="text" name="from_date" class="form-control datepicker" >
                            </div>
                            <div class="form-group">
                                <label>To</label>
                                <input type="text" name="to_date" class="form-control datepicker" >
                            </div>
                            <div class="form-group">
                                <input type="submit" value="FILTER" class="btn btn-success" />
                            </div>
                        </form>

                        <br>

                        <div class="clearfix"></div>

                        <div class="table-responsive">
                            <table class="table table-bordered" id="example">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Product Image</th>
                                    <th>Product Title</th>
                                    <th>Purchase date</th>
                                    <th>Buyer</th>
                                    <th>Seller</th>
                                    <th>Amount</th>
                                    <th>Details</th>
                                </tr>
                                </thead>
                                <tbody>

                                @foreach($orders as $list)
                                    <tr>
                                        <td>{{ $list->id }}</td>
                                        <td><img src="{{ $list->img_url }}" width="100" class="img-responsive" /></td>
                                        <td>{{ $list->product_title }}</td>
                                        <td>{{ date('d/m/Y' , strtotime($list->purchase_date)) }}</td>
                                        <td><a href="{{URL('admin/user_profile/'.$list->buyer_id)}}">{{ $list->buyer_name }}</a></td>
                                        <td><a href="{{URL('admin/user_profile/'.$list->seller_id)}}">{{ $list->seller_name }}</a></td>
                                        <td>{{$list->order_amount}}</td>
                                        <td><a href="{{ url('admin/order_view/' . $list->id) }}" > View Order </a></td>
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>

                        </div>
                    </div>
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
    <script src="{{url('plugins/datepicker/bootstrap-datepicker.js')}}"></script>

    <script>
        $(document).ready(function() {
            $('#example').DataTable();
        } );

        $('.datepicker').datepicker({
            format : 'dd-mm-yyyy'
        });
    </script>
@endpush