{{--@extends('adminlte::layouts.auth')--}}
@extends('layouts.partials.base')
@push('styles')
    <link href="{{ asset('css/login-style.css') }}?4" rel="stylesheet" type="text/css">
@endpush
@section('htmlheader_title')
    Log in
@endsection
@section('content')
    <div id="app" class="outer">
        <div class="middle">
            <div class="middle-align">
            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <strong>Whoops!</strong>
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            <div class="text-center logo">
                <img style="width: 50%" src="{{ asset('image/theplug-logo-cms.png') }}" alt="The Plug Logo">
            </div>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Please Sign In</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="{{ route('login') }}">
                    {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">

                            <div class="col-md-12">
                                <input class="form-control" placeholder="E-mail" name="email" type="email"
                                       autofocus>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                            <strong>{{ $errors->first('email') }}</strong>
                                        </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">

                            <div class="col-md-12">
                                <input id="password" type="password" class="form-control" name="password"
                                       placeholder="Password" required>

                                @if ($errors->has('password'))
                                    <span class="help-block">
                                            <strong>{{ $errors->first('password') }}</strong>
                                        </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"
                                               name="remember" {{ old('remember') ? 'checked' : '' }}> Remember
                                        Me
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-success btn-block btn-lg">
                                    Login
                                </button>

                                <a class="btn btn-link pull-left"
                                   href="{{ route('password.request') }}">
                                    Forgot Your Password?
                                </a>

                                {{--<a class="btn btn-link pull-right"--}}
                                   {{--href="{{ route('register') }}">--}}
                                    {{--Register--}}
                                {{--</a>--}}
                            </div>
                        </div>
                     </form>
                </div>
            </div>

        </div>
        </div>
    </div>

    @push('scripts')
        <script>
            $(function () {
                $('input').iCheck({
                    checkboxClass: 'icheckbox_square-blue',
                    radioClass: 'iradio_square-blue',
                    increaseArea: '20%' // optional
                });
            });
        </script>
    @endpush
    </body>
@endsection
