<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 2/28/2021
 *Time: 3:17 PM
 */

namespace Zikzay\libs;


class SMS
{
    private static $phoneNumber;
    private static $message;

    public function __construct(){

    }


    public static function send($phoneNumber, $message) {

       self::$phoneNumber = $phoneNumber;
       self::$message = $message;

        $response = self::curlRequest();
        $code = $response->code;
        $message = null;
        if ($code == 1000) {
            return true;

        } else  {
            if ($code == 1008) {
                $message = 'Sender ID Cannot be used';

            } else if ($code == 1003) {
                $message = 'Error sending SMS';

            } else {
                $message = $response->comment;
            }
        }
        return $message;
    }

    private static function curlRequest() {
        $sms_array = array(
            'sender' => 'Mabro',
            'to' => self::$phoneNumber,
            'message' => self::$message,
            'type' => '0',
            'routing' => '3',
            'token' => Hash::decrypt(SMART_SMS_TOKEN)//ref_id
        );

        $params = http_build_query($sms_array);
        $url = 'https://smartsmssolutions.com/api/json.php?';
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $params);

        $output = curl_exec($ch);
        curl_close($ch);
        return json_decode($output);
    }

}