@extends('layouts.base')

@section('content')
    <div id="page-wrapper">
        <div class="container-fluid">
            <div><h3>Add League Name</h3></div>
            <form action="/action_page.php">
                League name:<br>
                <input type="text" name="firstname" value="Mickey">
                <br>
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>
@endsection