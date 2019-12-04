<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{{ route('admin') }}">
            <img src="{{ asset('img/pts-admin-logo.gif')}}" alt="PTS Logo">
        </a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-user"></i>
                &nbsp;Admin<b class="caret"></b></a>
            <ul class="dropdown-menu">
                {{--<li>--}}
                {{--<a href="javascript:void(0)"><i class="fa fa-fw fa-user"></i> Change Password</a>--}}
                {{--</li>--}}
                <li>
                    <a href="javascript:void(0)"
                       onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                        <i class="fa fa-fw fa-power-off"></i> Log Out</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li class="active">
                <a href="{{ route('admin') }}"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#request"><i
                            class="fa fa-fw fa-gear"></i> Service Request <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="request">
                    {{--<li
                            @if($current_status === 'Open')
                            class="active-tab-highlight"
                            @endif>
                        <a href="{{ route('admin') }}/Open">Open</a>
                    </li>
                    <li
                            @if($current_status === 'In Progress')
                            class="active-tab-highlight"
                            @endif>
                        <a href="{{ route('admin') }}/In Progress">In Progress</a>
                    </li>
                    <li
                            @if($current_status === 'Closed')
                            class="active-tab-highlight"
                            @endif>
                        <a href="{{ route('admin') }}/Closed">Closed</a>
                    </li>--}}
                </ul>
            </li>
            <li>
                <a href="{{ url('admin/add_league') }}"><i class="fa fa-fw fa-dashboard"></i> Add League</a>
            </li>
            <li>
                <a href="{{ url('admin/add_team') }}"><i class="fa fa-fw fa-dashboard"></i> Add Team</a>
            </li>
            <li>
                <a href="javascript:void(0)"
                   onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                    <i class="fa fa-fw fa-power-off"></i> Log Out</a>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>