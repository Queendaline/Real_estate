<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/1/2020
 *Time: 6:53 AM
 */

namespace Zikzay\http;


use Zikzay\core\Session;
use Zikzay\core\Validation;
use Zikzay\Lib\Util;
use Zikzay\libs\Hash;

class Request
{
    protected static $model;
    protected static $rules;

    public static function post($requestType, $model, $unique, $array) : array
    {
        $params = [];
        $errors = new \stdClass();
        $errorMobile = array();
        $errorIds = new \stdClass();
        $count = 0;
        if(isset($requestType)){
            foreach ($requestType as $key => $value) {
                if(is_array($value)) {
                    if($array) {
                        $model->$key = $value;
                        $params[$key] = $value;
                    }
                    continue;
                }
                $validatedValue = Validation::make($key, $value, $model, $unique);
                if(is_array($validatedValue)){
                    $errors->$count = $validatedValue;
                    $errorIds->$key = $validatedValue['message'];
                    $errorMobile[] = $validatedValue['message'];
                    $count++;
                }else if($validatedValue != null) {
                    $model->$key = $validatedValue;
                    $params[$key] = $validatedValue;
                }
            }
        }

        $count = 0;
        Session::set('validValues', $params);
        if (isset($errors->$count)){
            Session::set('formError', json_decode(json_encode($errors)));
            Session::set('formIdsError', $errorIds);
//            Util::$data = $errorIds;//Session::get('formError');
//            Util::$message = $errorMobile[0];
//            Util::process_result();
//            exit();
//            dnd(Session::get('formIdsError'));
            ?><script>
                window.location.href = document.referrer
            </script><?php

            exit();
          };
        return  $params;
    }

    public static function request($model, $unique, $array = true) : array
    {
        $requestType = (new self)->httpMethod();
        return self::post($requestType, $model, $unique, $array);
    }

    private function httpMethod() : array
    {
        return ($_SERVER['REQUEST_METHOD'] == 'POST') ? $_POST : $_GET;
    }

    public static function curlPostRequest(string $url, array $postData, string $authToken) {

        $ch = curl_init($url);
        curl_setopt_array($ch, array(
            CURLOPT_POST => TRUE,
            CURLOPT_RETURNTRANSFER => TRUE,
            CURLOPT_HTTPHEADER => array(
                "Authorization: Bearer $authToken",
                "Content-Type: application/json"

            ),
            CURLOPT_POSTFIELDS => json_encode($postData)
        ));

        // Send the request
        $response = curl_exec($ch);

        // Check for errors
        if($response === FALSE){
            return curl_error($ch);
        }

        return json_decode($response, TRUE);
    }

    public static function curlGetRequest($url, $authToken) {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt(
            $ch, CURLOPT_HTTPHEADER, [ "Authorization: Bearer $authToken" ]
        );
        $response = curl_exec($ch); dnd($response);
        curl_close($ch);
        return json_decode($response);
    }
}