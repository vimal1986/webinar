<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PaymentsController extends Controller
{
    //
    public function createCustomer()
    {
        $customer_firstname = 'Shahil';
        $customer_lastname = 'Nissam';
        $customer_phonenumber = '9562012701';
        $customer_email = 'shahil.nissam@brtindia.com';

        $firstname = $customer_firstname;
        $lastname = $customer_lastname;

        $exp_date[0] = '12';
        $exp_date[1] = '21';
        $cvv = '234';

        $postcode = '673121';
        $address1 = '288-Miami';
        $address2 = '3rd cross';
        $city = 'New york city';
        $state = 'New york';
        $country = 'US';


        $result = \Braintree_Customer::create(array(
            'firstName' => $customer_firstname,
            'lastName'  => $customer_lastname,
            'phone'     => $customer_phonenumber,
            'email'     => $customer_email,
            'creditCard' => array(
                'number'          => '4111111111111111',
                'cardholderName'  => $firstname . " " . $lastname,
                'expirationMonth' => $exp_date[0],
                'expirationYear'  => $exp_date[1],
                'cvv'             => $cvv,
                'billingAddress' => array(
                    'postalCode'        => $postcode,
                    'streetAddress'     => $address1,
                    'extendedAddress'   => $address2,
                    'locality'          => $city,
                    'region'            => $state,
                    'countryCodeAlpha2' => $country
                )
            )
        ));

        if ($result->success) {
            // Save this Braintree_cust_id in DB and use for future transactions too
            $braintree_cust_id = $result->customer->id;
            dump($braintree_cust_id);
        } else {
            dd("Error : ".$result->message);
        }



    }

    public function verifyCardDetails(){
        $customer_id = '222055419';

        $collection = \Braintree_CreditCardVerification::search([
            \Braintree_CreditCardVerificationSearch::customerId()->is($customer_id)
        ]);

        dump($collection);
    }

    public function createSale(){

        $braintree_cust_id = "222055419";
        $amount = 10;
        $invoice_id = '001';

        $sale = array(
            'customerId' => $braintree_cust_id,
            'amount'   => $amount,
            'orderId'  => $invoice_id,
            'options' => array('submitForSettlement'   => true)
        );

        $result = \Braintree_Transaction::sale($sale);

        if ($result->success)
        {
            dump($result);
        }
        else
        {
            echo "Error : ".$result->_attributes['message'];
        }

    }

    /**
     * MERCHANTS & SUB-MERCHANT ACCOUNTS -> WITH ESCROW
     */

    public function createMerchantAccount(){

        $merchantAccountParams = [
            'individual' => [
                'firstName' => 'Jane',
                'lastName' => 'Doe',
                'email' => 'jane@14ladders.com',
                'phone' => '5553334444',
                'dateOfBirth' => '1981-11-19',
                'ssn' => '456-45-4567',
                'address' => [
                    'streetAddress' => '111 Main St',
                    'locality' => 'Chicago',
                    'region' => 'IL',
                    'postalCode' => '60622'
                ]
            ],
            'funding' => [
                'descriptor' => 'Blue Ladders',
                'destination' => \Braintree_MerchantAccount::FUNDING_DESTINATION_BANK,
                'email' => 'funding@blueladders.com',
                'mobilePhone' => '5555555555',
                'accountNumber' => '1123581321',
                'routingNumber' => '071101307'
            ],
            'tosAccepted' => true,
            'masterMerchantAccountId' => "bluerose",
            'id' => "blue_ladders_store"

        ];

        $result = \Braintree_MerchantAccount::create($merchantAccountParams);

        if($result->success){
            dump($result);
        }
        else{
            dump($result->errors->deepAll());
        }
    }

    public function webHook(Request $request){
        $sub_merchant_account = 'blue_ladders_store';
        $btSignature = '';
        $btPayload = '';

        $notification = \Braintree_WebhookNotification::parse(
            $btSignature,
            $btPayload
        );
    }

    public function merchantAccountStatus(){

        $merchantAccount = \Braintree_MerchantAccount::find('blue_ladders_store');

        dump($merchantAccount);

    }

    public function merchantTransaction(){

//        $result = \Braintree_PaymentMethodNonce::create('A_PAYMENT_METHOD_TOKEN');
//        $nonce = $result->paymentMethodNonce->nonce;

        $result = \Braintree_Transaction::sale([
            'merchantAccountId' => 'blue_ladders_store',
            'amount' => '10.00',
            'paymentMethodNonce' => '5ee64537-1187-0d34-2664-e2b3b69244d6',
            'serviceFeeAmount' => "1.00"
        ]);

        dump($result);
    }
}
