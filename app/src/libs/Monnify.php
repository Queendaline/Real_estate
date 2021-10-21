<?php
/**
 *Description => ...
 *Created by => Isaac
 *Date => 2/4/2021
 *Time => 2 =>11 PM
 */

namespace Zikzay\libs;


use stdClass;
use Zikzay\http\Request;
use Zikzay\Lib\Util;
use Zikzay\Model\Banks;

class Monnify
{
    private $accessToken;
    private $contractCode;
    private $apiKey;
    private $secretKey;
    private $base16Code;


    public function __construct()
    {
        $this->secretKey = Hash::decrypt(MONIFY_SECRET_KEY);
        $this->contractCode = Hash::decrypt(MONIFY_CONTRACT_CODE);
        $this->apiKey = Hash::decrypt(MONIFY_API_KEY);
        $this->base16Code = base64_encode("{$this->apiKey}:{$this->secretKey}");
        $this->accessToken = $this->getAccessToken();
//        dnd($this->accessToken);
        return $this->accessToken != null ? $this : null;
    }

    private function getAccessToken() {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://sandbox.monnify.com/api/v1/auth/login");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Basic $this->base16Code" ]
        );
        $response = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($response);

        return (is_object($response) and isset($response->responseBody->accessToken))
            ? $response->responseBody->accessToken : null;
    }

    public static function getBanks()
    {
        $new = new self();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://sandbox.monnify.com/api/v1/banks");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, ["Authorization: Bearer $new->accessToken"]
        );
        $response = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($response);

        foreach ($response->responseBody as $bank) {
            $banks = Banks::search('code', $bank->code);
            if($banks == false) $banks = new Banks();
            $banks->name = $bank->name;
            $banks->code = $bank->code;
            $banks->save();
        }
        return $response;
    }

    public static function verifyBankAccount($accountNumber, $bankCode, $bank = null) {
        $bankResult = Banks::search('code', $bankCode);
        if($bankResult == false) $bankResult = Banks::search('name', $bank);

        $new = new self();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL,
            "https://sandbox.monnify.com/api/v1/disbursements/account/validate?accountNumber={$accountNumber}&bankCode=$bankResult->code");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Basic $new->base16Code" ]
        );
        $response = curl_exec($ch);
        curl_close($ch);
        $response = json_decode($response);

        if (is_object($response) and isset($response->responseBody)) {
            $response->responseBody->bank_name = $bankResult->name;
            $response->responseBody->bank_code = $bankResult->code;
        } else {
            $response->responseBody = null;
        }
        return $response->responseBody;
    }
    public function createAccount($accountName, $emailAddress, $bvn) {

        $reference = Util::reference(6, 'MFA');

        $postData = [
            "accountReference" => $reference,
            "accountName" => "Isaac",
            "currencyCode" => "NGN",
            "contractCode" => $this->contractCode,
            "customerEmail" => $emailAddress,
//            "customerBvn" => $bvn,
            "customerName" => $accountName
        ];

        $url = 'https://sandbox.monnify.com/api/v1/bank-transfer/reserved-accounts';
//        $response = Request::curlPostRequest($url, $postData, $this->accessToken);

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Bearer $this->accessToken", "Content-Type: application/json" ]
        );
        $response = curl_exec($ch); dnd($response);
        curl_close($ch);
        $response = json_decode($response);

        dnd($response);
    }

    public function accountDetails() {
        $url = 'https://sandbox.monnify.com/api/v1/bank-transfer/reserved-accounts/{accountReference}';
        $response = Request::curlGetRequest($url, $this->accessToken);
    }

    public function accountTransactions() {
        $url = 'https://sandbox.monnify.com/api/v1/bank-transfer/reserved-accounts/transactions?accountReference={accountReference}&page=0&size=10';
        $response = Request::curlGetRequest($url, $this->accessToken);
    }

    public function initPayment($amount, $reference, $description, $name, $email) {

        $postData = [
            "amount" => $amount,
            "paymentReference" => $reference,
            "currencyCode" => "NGN",
            "contractCode" => $this->contractCode,
            "paymentDescription" => $description,
            "customerEmail" => $email,
            "customerName" => $name,
            "redirectUrl" => 'http://localhost/mabro/fund-account/verify-monnify',
            "paymentMethods" => ["CARD","ACCOUNT_TRANSFER"]
        ];

        $url = "https://sandbox.monnify.com/api/v1/merchant/transactions/init-transaction";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Basic $this->base16Code", "Content-Type: application/json" ]
        );
        $response = curl_exec($ch);
        curl_close($ch);

        $response = json_decode($response);

        $responseBody = (is_object($response) and isset($response->responseBody)) ? $response->responseBody : null;
        if($responseBody == null)  return null;
        return isset($responseBody->checkoutUrl) ? $responseBody : null;
    }

    public static function transfer($amount, $reference, $description, $bankCode, $accountNumber) {
        $new = new self();
        $postData = [
            "amount" => $amount,
            "reference" => $reference,
            "narration" => $description,
            "destinationBankCode" => $bankCode,
            "destinationAccountNumber" => $accountNumber,
            "currency" => "NGN",
            "sourceAccountNumber" => '4692864178'
        ];

        $url = "https://sandbox.monnify.com/api/v2/disbursements/single";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($postData));
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Basic $new->base16Code", "Content-Type: application/json" ]
        );
        $response = curl_exec($ch);
        curl_close($ch);

        $response = json_decode($response);

        return  (is_object($response) and isset($response->responseBody)) ? $response->responseBody : null;
//        $responseBody = (is_object($response) and isset($response->responseBody)) ? $response->responseBody : null;
//        if($responseBody == null)  return null;
//        return isset($responseBody->staus) ? $responseBody : null;
    }

    public static function transferDetails($reference) {
        $new = new self();
        $url = "https://sandbox.monnify.com/api/v2/disbursements/single/summary?reference={$reference}";
        
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Basic $new->base16Code"]
        );
        $response = curl_exec($ch);
        curl_close($ch);

        $response = json_decode($response);

        return (is_object($response) and isset($response->responseBody)) ? $response->responseBody : null;
//        $responseBody = (is_object($response) and isset($response->responseBody)) ? $response->responseBody : null;
//        if($responseBody == null)  return null;
//        return (isset($responseBody->paymentStatus)) ? $responseBody : null;
    }

    public function transactionStatus($reference) {
        $reference = urlencode($reference);
        $url = "https://sandbox.monnify.com/api/v2/transactions/{$reference}";

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Bearer $this->accessToken"]
        );
        $response = curl_exec($ch);
        curl_close($ch);

        $response = json_decode($response);

        $responseBody = (is_object($response) and isset($response->responseBody)) ? $response->responseBody : null;
        if($responseBody == null)  return null;
        return (isset($responseBody->paymentStatus)) ? $responseBody : null;
    }

}