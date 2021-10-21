<?php
namespace Zikzay\lib;

use Zikzay\libs\Hash;
use Zikzay\Model\Banks;
use Zikzay\Model\PaystackModel;

/**
 *Description: ...
 *Created by: Isaac
 *Date: 6/21/2020
 *Time: 12:23 AM
 */

class Paystack{
    public $reference;
    public $amount;
    public $errorMsg;
    public $status;
    public $oldTransaction;
    protected $paystackModel;

    public function __construct($reference){
        $this->paystackModel = new PaystackModel();
        $this->reference = $reference;
        $this->status = false;
        $this->verifyReference();
    }

    public static function initPayment($amount, $emailAddress, $reference, $des = '', $name = '') {
        $url = "https://api.paystack.co/transaction/initialize";
        $fields = [
            'email' => $emailAddress,
            'amount' => $amount,
            'reference' => $reference,
            'callback_url' => 'http://localhost/mabro/fund-account/verifyPaystack'
        ];

        $fields_string = http_build_query($fields);
        //open connection
        $ch = curl_init();

        //set the url, number of POST vars, POST data
        curl_setopt($ch,CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_POST, true);
        curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            "Authorization: Bearer sk_test_5031aae886b430022c410efb43b64b6f3f1a764d",
            "Cache-Control: no-cache",
        ));

        //So that curl_exec returns the contents of the cURL; rather than echoing it
        curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);

        //execute post
        $result = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($result);

        return (is_object($response) and $response->status)? $response->data : null;
    }

    public static function init($reference) {
        return new self($reference);
    }
    protected function verifyReference()
    {
        $response = $this->queryPaystack();

        if($response->status)
            $this->amount = $response->data->amount/100;

        if (!$response->status) {
            $this->errorMsg = $response->message;

        } else if ($this->isConfirmedRequest()) {
            $this->errorMsg = "This payment has already been credited";
            $this->oldTransaction = true;
        } else if ($response->data->status != 'success') {
            $this->errorMsg = "Transaction was not successful";

        } else {
            $this->successResponse($response);
        }
    }

    protected function isConfirmedRequest() {

        $refObj = PaystackModel::search('reference', $this->reference);

        if($refObj !== false){
            return $refObj->confirm;
        }else {

            $this->paystackModel = new PaystackModel();
            $this->paystackModel->reference = $this->reference;
            $this->paystackModel->amount = 0;
            $this->paystackModel->confirm = 0;
            $this->paystackModel->save();


        }
        return false;
    }

    private function queryPaystack()
    {
        $url = 'https://api.paystack.co/transaction/verify/' . $this->reference;
        return self::curlRequest($url);
    }

    private static function curlRequest($url) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Bearer sk_test_5031aae886b430022c410efb43b64b6f3f1a764d" ]
        );
        $response = curl_exec($ch);
        curl_close($ch);
        return json_decode($response);
    }

    protected function successResponse($response){

        $amount = $response->data->amount/100;
        if(USER_PAY_CARD_TRANSACTION_CHARGE) {
            $this->amount = round($amount - ($amount * 0.0147783251231527), 2);
        }
        $this->paystackModel = (object) PaystackModel::search('reference', $this->reference);

        $this->paystackModel->amount = $amount;
        $this->paystackModel->confirm = 1;
        $update = $this->paystackModel->save();

        if($update) {
            $this->status = true;
        } else {
            $this->errorMsg = "An error occur while updating transaction status";
        }
    }

    public static function verifyBVN($bvn)
    {
//        $url = 'https://api.paystack.co/bank/resolve_bvn/' . $bvn;
//        $response = self::curlResponse($url);
//
//        if (is_string($response)) {
//            return $response;
//        }

        $data = new \stdClass();
        $data->first_name = "Chisom";//$response['first_name'];
        $data->last_name = "Ebere";//$response['last_name'];
        $data->dob = "";//$response['dob'];
        $data->phone = "";//$response['mobile'];

        return $data;
    }

    public static function verifyAccountNumber($accountNumber, $bank) {
        $bankResult = Banks::search('code', $bank);
        if($bankResult == false) $bankResult = Banks::search('name', 'First bank');

        if($bankResult == false) {
            return 'Bank not found';
        }
        $code = $bankResult->code;
        $url = 'https://api.paystack.co/bank/resolve?account_number=' . $accountNumber . '&bank_code=' . $code;
        $response = self::curlResponse($url);

        if(is_string($response)) {
            return $response;
        }

//        $date = new \stdClass();
//        $date->account_number = $accountNumber;//$response['account_number'];
//        $date->account_name = 'Agbo Chinaza';//$response['account_name'];
//        $date->bank_name = $bank;

//        return $date;
        return $response;
    }


    private static function curlResponse($url)
    {
        $response = self::curlRequest($url);
        if (!$response) {
            return 'An error occur';
        }

        if (!$response->status) {
            return $response->message;
        }
        return $response->data;
    }

    public function verifyTransaction(){

    }
}