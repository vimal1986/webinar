Dear {{$buyer->first_name}} {{$buyer->last_name}} ,

<br><br>

Your Invoice has generated for the following product.
<br>

<table border="1">

    <tr>
        <th>Product</th>
        <th>Description</th>
        <th>Product Image</th>
        <th>Price</th>
        <th>Offer price</th>
        <th>Your Agreed Price</th>
    </tr>

    <tr>
        <td>{{$product->product_title}}</td>
        <td>{{$product->product_description}}</td>
        <td><img src="{{$product->img_url}}" width="100"></td>
        <td>{{$product->price}}</td>
        <td>{{$product->discount_price}}</td>
        <td>{{$invoice->agreed_price}}</td>
    </tr>

</table>

<br>
<span>***Please see your inbox in app to make the payment.**</span>


<br>
<br>

Thanks , <br>
The PLUG