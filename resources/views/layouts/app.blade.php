<!DOCTYPE html>
<html lang="en">
<head>

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="{{ asset("/bootstrap/js/bootstrap.min.js") }}"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>

@include('partials.header')
<div id="wrapper">
    @yield('content')
</div>
@include('layouts.partials.footer')
<!-- Scripts -->
{{--<script src="{{ asset('js/app.js') }}"></script>--}}
{{-- Data Table JS --}}
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    });
</script>

@yield('script')

</body>
</html>