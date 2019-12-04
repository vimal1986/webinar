<!-- Main Header -->
<header class="main-header fanlyfe">

    <!-- Logo -->
    <a href="#" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini">
            {{--<img src="{{ asset('img/plug.png') }}" alt="brand logo">--}}
        </span>
        <!-- logo for regular state and mobile devices -->
        <img src="{{ asset('image/theplug-logo-cms.png') }}" class="class-logo" alt="brand logo">
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">
                {{--{{ trans('adminlte_lang::message.togglenav') }}--}}
            </span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Notifications Menu -->
                {{--<li class="dropdown notifications-menu">
                    <!-- Menu toggle button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">10</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">--}}{{--{{ trans('adminlte_lang::message.notifications') }}--}}{{--</li>
                        <li>
                            <!-- Inner Menu: contains the notifications -->
                            <ul class="menu">
                                <li><!-- start notification -->
                                    <a href="#">
                                        <i class="fa fa-users text-aqua"></i> --}}{{--{{ trans('adminlte_lang::message.newmembers') }}--}}{{--
                                    </a>
                                </li><!-- end notification -->
                            </ul>
                        </li>
                        <li class="footer"><a href="#">--}}{{--{{ trans('adminlte_lang::message.viewall') }}--}}{{--</a></li>
                    </ul>
                </li>--}}
                <!-- Tasks Menu -->
                @if (Auth::guest())
                    <li><a href="{{ url('/register') }}">{{--{{ trans('adminlte_lang::message.register') }}--}}</a></li>
                    <li><a href="{{ url('/login') }}">{{--{{ trans('adminlte_lang::message.login') }}--}}</a></li>
                @else
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu" id="user_menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="{{ asset('img/avatar5.png') }}{{--{{ Gravatar::get($user->email) }}--}}" class="user-image" alt="User Image"/>
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">admin{{--{{ Auth::user()->name }}--}}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div>
                                    <div>
{{--                                        <div class="setting">
                                            <i class="fa fa-cog" aria-hidden="true"></i>
                                            <a href="{{ url('/settings') }}" class="btn btn-default btn-flat btn-width">Setting
                                                {{ trans('adminlte_lang::message.profile') }}
                                            </a>
                                        </div>--}}
                                        <div class="logout">
                                            <i class="fa fa-sign-out" aria-hidden="true"></i>
                                            <a href="{{ url('/logout') }}" class="btn btn-default btn-flat btn-width" id="logout"
                                               >
                                                {{--{{ trans('adminlte_lang::message.signout') }}--}}

                                                Logout
                                            </a>

                                        </div>
                                    </div>
{{--                                    <div>
                                    <i class="fa fa-cog" aria-hidden="true"></i>
                                    <a href="{{ url('/settings') }}" class="btn btn-default btn-flat">Setting
{{ trans('adminlte_lang::message.profile') }}
</a>
                                    </div>
                                    <div>
                                            <i class="fa fa-sign-out" aria-hidden="true"></i>
                                            <a href="{{ url('/logout') }}" class="btn btn-default btn-flat" id="logout"
                                               onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();">
        {{ trans('adminlte_lang::message.signout') }}

                                                Logout
                                            </a>
                                    </div>--}}

{{--                                    <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
{{ csrf_field() }}

                                        <input type="submit" value="logout" style="display: none;">
                                    </form>--}}

                                </div>
                            </li>
                        </ul>
                    </li>
                @endif

                <!-- Control Sidebar Toggle Button -->
{{--                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li>--}}
            </ul>
        </div>
    </nav>
</header>
