Dear Admin,

<br>

{{$user->first_name}} {{$user->last_name}} has raised a complaint for the product. please see the details below.

<br><br>
[Order Deails]<br>
Order : {{$complaint->order_id}}<br>
Order Amount : {{$complaint->order->amount}}<br>
Product Title : {{$complaint->order->product->product_title}}<br>
Product Description : {{$complaint->order->product->product_description}}<br>

<br>

[Complaint Details]<br>
subject : {{$complaint->subject}}<br>
Message : {{ $complaint->message }}<br>



<br>
<br>

Thanks , <br>
The PLUG