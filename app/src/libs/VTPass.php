<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 2/13/2021
 *Time: 8:24 AM
 */

namespace Zikzay\libs;


use Zikzay\Lib\Util;
use Zikzay\Model\ApiMobileData;
use Zikzay\Model\ElectricityServices;
use Zikzay\Model\TvServices;

class VTPass
{
    private $username;
    private $password;
    private $baseUrl;
    private $accessToken;

    public function __construct()
    {
        $this->username = Hash::decrypt(VTPASS_USERNAME);
        $this->password = Hash::decrypt(VTPASS_PASSWORD);
        $this->accessToken = base64_encode("{$this->username}:{$this->password}");
//        $this->accessToken = "dev.iceztech@gmail.com:NewPassword@123";
//        $this->accessToken = "billing9ja@gmail.com:billing@@9ja@@2020";
        $this->baseUrl = "https://sandbox.vtpass.com/api/";
    }

    private function getRequest($url, $jsonHeader = true, $jsonResult = true) {

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,  "{$this->baseUrl}{$url}");
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);

        return $this->executeCurl($curl, $jsonHeader, $jsonResult);
    }

    private function postRequest($url, $data, $jsonHeader = true, $jsonResult = true) {

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL, "{$this->baseUrl}{$url}");
        curl_setopt($curl, CURLOPT_POST, TRUE);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));
        return $this->executeCurl($curl, $jsonHeader, $jsonResult);
    }

    private function executeCurl($curl, $jsonHeader, $jsonResult) {
        $header = $jsonHeader
            ? [ "Authorization: Basic $this->accessToken", "Content-Type: application/json"]
            : [ "Authorization: Basic $this->accessToken"];

        curl_setopt($curl, CURLOPT_HTTPHEADER, $header);
        $response = curl_exec($curl);

        curl_close($curl);

        if($response === FALSE){
            return curl_error($curl);
        }

        return $jsonResult ? json_decode($response) : $response;
    }

    public function electricityCustomer($meterNumber, $service, $type = null) {
        $data = [
            'billersCode' =>  $meterNumber,
            'serviceID' => $service
        ];
        if($type != null) $data['type'] = $type;

        $response = $this->postRequest('merchant-verify', $data);
        return (is_object($response) and isset($response->content)) ? $response->content : null;
    }

    public function electricity() {
        $response = $this->getRequest("services?identifier=electricity-bill");
//                header('content-type: application/json');
//                echo json_encode($response);
//                die();
        if(!is_object($response) or !isset($response->content)) return null;

        foreach ($response->content as $data) {
            $bills = ElectricityServices::search('service_id', $data->serviceID);
            if($bills == false)
                $bills = new ElectricityServices();
            $bills->name = $data->name;
            $bills->service_id = $data->serviceID;
            $bills->min_amount = (int) $data->minimium_amount;
            $bills->max_amount = (int) $data->maximum_amount;
            $bills->service_fee = (isset(explode('N', $data->convinience_fee)[1]))
                ? (int) explode('N', $data->convinience_fee)[1] : 0;
            $bills->api_source = "VTPass";
            $bills->api_active = 1;
            $bills->active = 1;
            $bills->bill_code = $data->serviceID;
            $bills->save();
        }
    }

    public function services($service) {
        $response = $this->getRequest("service-variations?serviceID={$service}");
//                header('content-type: application/json');
//                echo json_encode($response);
//                die();
        $content = (is_object($response) and isset($response->content)) ? $response->content : null;
        if($content == null)  return null;
        return isset($content->varations) ? $content->varations : null;
    }

    public function subscribeTv($service, $cardNumber, $billCode, $phone, $amount = null) {
        $data = [
            'request_id' => Util::reference(12, 'tv'),
            'serviceID' => $service,
            'billersCode' => $cardNumber,
            'variation_code' => $billCode,
            'phone' => $phone
        ];
        if($amount != null) $data['amount'] = $amount;
        $response = $this->postRequest('pay', $data);
        return (is_object($response) and isset($response->content)) ? $response : null;
    }

    public function electricityBill($service, $cardNumber, $billCode, $phone, $amount = null) {
        $data = [
            'request_id' => Util::reference(12, 'ele'),
            'serviceID' => $service,
            'billersCode' => $cardNumber,
            'variation_code' => $billCode,
            'amount' => $amount,
            'phone' => $phone
        ];
        $response = $this->postRequest('pay', $data);
        return (is_object($response) and isset($response->content)) ? $response : null;
    }

    public function tvPackages($tv) {
        $tv = strtolower(trim($tv));
        $dataArray = $this->services($tv);

        if(!is_object($dataArray) and !is_array($dataArray))  return null;

        foreach ($dataArray as $data) {
            $bills = TvServices::search('bill_code', $data->variation_code);
            if($bills == false)
                $bills = new TvServices();
            $bills->name = strtoupper($tv);
            $bills->service_id = $tv;
            $bills->package = explode('N', $data->name)[0];
            if($tv == 'startimes') {
                $nameArray = explode('-', $data->name);
                $bills->package = (count($nameArray) < 2) ? $data->name : "{$nameArray[0]} - {$nameArray[2]}";
            }
            $bills->price = (int) $data->variation_amount;
            $bills->api_price = (int) $data->variation_amount;
            $bills->api_source = "VTPass";
            $bills->api_active = 1;
            $bills->active = 1;
            $bills->bill_code = $data->variation_code;
            $bills->save();
        }
    }

    public function postMobileData($network) {
        $network = (strtoupper($network) == '9MOBILE') ? 'etisalat' : strtoupper($network);
        $network = strtolower(trim($network));
        $dataArray = $this->services("{$network}-data");
        if(!is_object($dataArray) and !is_array($dataArray)) return null;

        $network = ($network == 'etisalat') ? '9MOBILE' : strtoupper($network);
       foreach ($dataArray as $data) {
           $dataName = explode('-', $data->name);
           $apiData = ApiMobileData::search('data_id', $data->variation_code);
           if($apiData == false)
               $apiData = new ApiMobileData();
           $apiData->network = $network;
           $apiData->network_id = MOBILE_NETWORKS[$network];
           $apiData->data_id = $data->variation_code;
           $apiData->name = $data->name;
           $apiData->price = (int) $data->variation_amount;
           $apiData->api_price = (int) $data->variation_amount;
           $apiData->api_source = "VTPass";
           $apiData->api_active = 1;
           $apiData->active = 1;
           $apiData->bonus_size = '';
           $apiData->size = trim(explode(' ', $dataName[count($dataName) - 2])[1]);
           if(trim($apiData->size) == '') $apiData->size = trim(explode(' ', $dataName[count($dataName) - 2])[2]);
           if(trim($apiData->size) == '') $apiData->size = trim(explode(' ', $dataName[count($dataName) - 2])[3]);
           $apiData->duration = trim($dataName[count($dataName) - 1]);
           $apiData->save();
       }

    }

    public function buyMobileData($network, $phoneNumber, $dataId, $senderPhoneNumber) {
        $data = [
            'request_id' => Util::reference(12, 'dt'),
            'serviceID' => "{$network}-data",
            'billersCode' => $phoneNumber,
            'variation_code' => $dataId,
            'phone' => $senderPhoneNumber
        ];
        $response = $this->postRequest('pay', $data);
        return (is_object($response) and isset($response->content)) ? $response : null;
    }

    public function buyAirtime($network, $phoneNumber, $amount) {
        $data = [
            'request_id' => Util::reference(12, 'at'),
            'serviceID' => $network,
            'phone' => $phoneNumber,
            'amount' => $amount
        ];
        $response = $this->postRequest('pay', $data);
        return (is_object($response) and isset($response->content)) ? $response : null;
    }

}