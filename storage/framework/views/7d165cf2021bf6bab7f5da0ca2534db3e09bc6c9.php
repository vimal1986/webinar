<!DOCTYPE html>
<head>
    <title>Pusher Test</title>
    <script src="https://js.pusher.com/4.1/pusher.min.js"></script>
    <script>

        // Enable pusher logging - don't include this in production
        Pusher.logToConsole = true;

//        var pusher = new Pusher('f05414ba67239e5368a5', {
//            cluster: 'ap2',
//            encrypted: true
//        });
//
//        var channel = pusher.subscribe('my-channel');
//        channel.bind('my-event', function(data) {
//            alert(data.message);
//        });


        var pusher = new Pusher('f05414ba67239e5368a5', {
            cluster: 'ap2',
            encrypted: true
        });
        var channel = pusher.subscribe('my-channel');
        channel.bind('my-event', function(data) {
            var message = data.message;
            console.log(message);
//            $(".media-list li").first().remove();
//            $(".media-list").append('<li class="media"><div class="media-body"><div class="media"><div class="media-body">'
//                + message.message + '<br/><small class="text-muted">' + message.author + ' | ' + message.created_at + '</small><hr/></div></div></div></li>');
//

        });
    </script>
</head>