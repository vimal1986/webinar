{{--@extends('adminlte::layouts.app')--}}
@extends('layouts.partials.dashboard')
@push('styles')
<link href="{{ asset('css/addleague.css') }}?4" rel="stylesheet" type="text/css">
@endpush
@section('content')
    <div id="page-wrapper" class="add-deal">
        <div class="container-fluid">
            <div class="add-leguage">
                <div class="row">
                    <div class="col-sm-12">
                        @if ($errors->any())
                            <div class="alert alert-danger hide-alert-message">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <label for="add-league">Add League</label>
                            </div>
                            <div class="panel-body">
                                <form action="{{ url('admin/set_league') }}" class="form-horizontal" method="post" id="leagueForm">
                                    <div class="center-align">
                                        <label class="control-label col-sm-2" for="email">League:</label>
                                        <div class="col-sm-10 padding-remove">
                                                    <div class="">
                                                        <input type="text" class="form-control" name="league" id="league">
                                                        <input type="hidden" name="_token" id="csrf_token" value="{{ csrf_token() }}">
                                                        <p class="error-msg"></p>
                                                    </div>
                                            <div class="add-league-btn">
                                                <button type="submit" class="btn btn-success btn-md btn-block">ADD LEAGUE</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="data-table">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <label for="add-league">Leagues List</label>
                    </div>
                    <div class="panel-body">
                        <div class="add-league-table">
                            @include('league/partials/dataTable')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @push('scripts')
    <script src="{{ asset('js/validation/common-script.js') }}"></script>
    <script src="{{ asset('js/validation/validate.js') }}"></script>
    @endpush
@endsection