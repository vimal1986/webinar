@extends('layouts.partials.base')
@push('styles')
<link href="{{ asset('css/login-style.css') }}?4" rel="stylesheet" type="text/css">
@endpush
@section('content')
    <div id="app" class="outer reset">
        <div class="middle">
              <div class="middle-align">
            <div class="text-center logo">
                <img src="{{ asset('img/fanlyfe-logo-cms.jpg') }}" alt="PTS Logo">
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Reset Password</div>
                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" method="POST" action="{{ route('password.email') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="control-label">E-Mail Address</label>

                            <div class="">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="">
                                <button type="submit" class="btn btn-success btn-block btn-lg">
                                    Send Password Reset Link
                                </button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
    </div>
        </div>
    </div>
@endsection
