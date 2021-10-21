<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/26/2020
 *Time: 2:58 PM
 */

namespace Zikzay\Lib;


use Exception;
use stdClass;


class Util
{
    public static $message;
    public static $status;
    public static $data;

    public static function dnd($data) {
        echo '<pre>';
        var_dump($data);
        echo '</pre>';
        die();
    }

    public static function currentPage() {
        $currentPage = $_SERVER['REQUEST_URI'];
        if($currentPage == PROOT || $currentPage == PROOT. strtolower(DEFAULT_CONTROLLER) .'/index') {
            $currentPage = PROOT . strtolower(DEFAULT_CONTROLLER);
        }
        return $currentPage;
    }

    public static function getObjectProperties($obj){
        return get_object_vars($obj);
    }

    public static function snakeCase($value)
    {
        $string = preg_replace('/([A-Z])/', ' $1', $value);

        return str_replace(' ', '_', trim(strtolower($string)));
    }

    public static function objectToSnakeCase($object)
    {
        $obj = is_object($object) ? get_class($object) : $object;
        $objArray = explode('\\', $obj);
        $string = $objArray[array_key_last($objArray)];

        return self::snakeCase($string);
    }
//    public static function cmdPrint($res, $msg) {
//        $title = ($res)? "  SUCCESS: " : "  FAIL: ";
//        // TODO : printing on cmd to be professional
////        if($res){
//        $color = ($res)? "\e[0;32;40m" : "\e[1;31;40m";
//        echo $color.$title.$msg."\e[0m" . EL;
////        } else {
////            $color = ($res)? "#006600" : "#CC0000";
////            echo '<p style="color:'.$color.'">'.$title.$msg.'</p>';
////        }
//
//    }
    public static function cmdPrint($msg, $state = 0) {
        $color = '';
        $title = '';
        if($state === 0){
            $color = "\e[37;1m";

        } else if($state == -1) {
            $title = "FAIL: ";
            $color = "\e[31;1m";

        }else if($state == 1) {
            $title = "SUCCESS: ";
            $color = "\e[32;1m";

        } else {
            $color = "\e[37;4m";
        }

        echo $color.$title.$msg."\e[0m" . EL;

    }


    public static function type($type, $char_length = CHAR_LENGTH) {
        $column_type = [
            'i' => 'INT',
            'int' => 'INT',
            'number' => 'INT',
            'integer' => 'INT',
            'float' => 'FLOAT',
            'double' => 'DOUBLE',
            'decimal' => 'DECIMAL(16, 4)',
            'date' => 'DATE',
            'time' => 'TIME',
            'year' => 'YEAR(4)',
            'datetime' => 'DATETIME',
            'timestamp' => 'TIMESTAMP',
            's' => "VARCHAR({$char_length})",
            'char' => "VARCHAR({$char_length})",
            'string' => "VARCHAR({$char_length})",
            'varchar' => "VARCHAR({$char_length})",
            'text' => 'TEXT'
        ];
        return $column_type[$type];
    }

    public static function sanitize($data) {
        return htmlentities($data, ENT_QUOTES, 'UTF-8');
    }
    
    public static function modelProperty($model, $property) {
        $std = $model::define(new \stdClass());

        return property_exists($std, $property) ? $std->$property : [];
    }

    public static function realIp()
    {
        $ip = $_SERVER['REMOTE_ADDR'];
        if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && preg_match_all('#\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}#s', $_SERVER['HTTP_X_FORWARDED_FOR'], $matches)) {
            foreach ($matches[0] AS $xip) {
                if (!preg_match('#^(10|172\.16|192\.168)\.#', $xip)) {
                    $ip = $xip;
                    break;
                }
            }
        } elseif (isset($_SERVER['HTTP_CLIENT_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (isset($_SERVER['HTTP_CF_CONNECTING_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_CF_CONNECTING_IP'])) {
            $ip = $_SERVER['HTTP_CF_CONNECTING_IP'];
        } elseif (isset($_SERVER['HTTP_X_REAL_IP']) && preg_match('/^([0-9]{1,3}\.){3}[0-9]{1,3}$/', $_SERVER['HTTP_X_REAL_IP'])) {
            $ip = $_SERVER['HTTP_X_REAL_IP'];
        }
        return $ip;
    }

    public static function autoload()
    {
        Util::cmdPrint('initializing... ');
        exec('composer dump-autoload -o');
    }

    public static function userAgent() {
        $uagent = $_SERVER['HTTP_USER_AGENT'];
        $regx = '/\/[a-zA-Z0-9.]+/';
        $newString = preg_replace($regx, '', $uagent);
        return $newString;
    }

    public static function object_result($class_object){
        $all_variables = get_object_vars($class_object);
        $object = new stdClass();
        foreach ($all_variables as $key => $value) {
            if(self::has_attr($class_object, $key)) {
                if ($key !== 'data' and $key !== 'status' and $key !== 'message' and $value !== null) {
                    $object->$key = $value;
                }
            }
        }
        self::$data = $object;
        self::process_result();
    }



    public static function has_attr($class_object, $key) {
        $all_variables = get_object_vars($class_object);
        return array_key_exists($key, $all_variables);
    }

    public static function process_result() {
        if(!self::$status) self::$status = false;
        $object['message'] = self::$message;
        $object['status'] = self::$status;
        $object['data'] = self::$data;

        header("Content-Type: application/json");

        echo json_encode($object);
        exit();
    }

    public static function randomInt(int $length, $prefix = '')
    {
        $code = '';
        $up = ceil($length/2);
        $down = floor($length/2);
        for($i = 0; $i < $down; $i++) {
            try {
                $code .= random_int(0, 9);
            } catch (Exception $e) {
                $code .= mt_rand(0, 9);
            }
        }
        $int = $length - 3;
        return $prefix . substr(time(), -$up, $up).$code;
//        $random = microtime(false);
//        $random = microtime();
    }

    public static function randomString(int $length, $prefix = '', $mix = false)
    {
        $strings = str_shuffle('abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789');
        $int = $length - 2;
        $code = '';
        for($i = 0; $i < 2; $i++) {
            try {
                $code .= random_int(0, 9);
            } catch (Exception $e) {
                $code .= mt_rand(0, 9);
            }
        }
        $string = md5($code);

        return $mix ?
            $prefix . substr($strings, -$int, $int).substr($string, -3, 3) :
            $prefix . strtolower(substr($strings, 0, $int) . substr($string, -3, 3));
    }

    public static function randomLetters(int $length, $prefix = '', $mix = false)
    {
        $strings = str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');
        return $mix ?
            $prefix . substr($strings, -$length, $length) :
            $prefix . strtolower(substr($strings, -$length, $length));
    }

    public static function randomUpper(int $length, $prefix = '', $mix = false)
    {
        $strings = str_shuffle('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ');
        return $prefix . strtoupper(substr($strings, -$length, $length));
    }

    public static function randomHex(int $length, $prefix = '')
    {
        if (function_exists("random_bytes")) {
            try {
                $bytes = random_bytes(ceil($length / 2));
            } catch (Exception $e) {
//                $bytes = random(ceil($length / 2));
            }
        } elseif (function_exists("openssl_random_pseudo_bytes")) {
            $bytes = openssl_random_pseudo_bytes(ceil($length/ 2));
        } else {
//            $bytes = randombytes_buf(ceil($length / 2));
        }
        return $prefix . substr(bin2hex($bytes), 0, $length);
    }

    public static function reference(int $length = 12, $prefix = null, $split = null){
        //60*60*24*365*12.72825 = 401398092
        $micro = explode(' ', microtime());
        $string = ($micro[1]+401398080).explode('.', $micro[0])[1];
        $string = substr($string, 1);
        $extraLength = $length - 17;
        $prefix = !empty($prefix) ? $prefix.$split : '';
        return $length < 18 ?
            $prefix.implode($split, str_split(substr($string, 0, $length), 4)) :
            $string.substr(str_shuffle($string), 0, $extraLength);

    }

    public static function redirect(string $page, $ext = false)
    {
        if(!$ext) $page = SR.'/'.$page;
        header("location: $page");
    }

    public static function naira($amount)
    {

        return '₦' . number_format($amount, 2);
    }

    public static function btc($amount)
    {
//        self::dnd($amount);
//        return number_format($amount, 8). 'BTC';
        return $amount == 0 ? '0.00 BTC' : $amount . 'BTC';
    }

    public static function usd($amount)
    {

        return '$' . number_format($amount, 2);
    }

    public static function amount($amount)
    {

        return number_format($amount, 2);
    }

    public static function datetime($string)
    {
        $datetime = date_create($string);
        return date_format($datetime, 'd:m:y H:i');
    }

    public static function datetimeString($string)
    {
        $datetime = date_create($string);
        return date_format($datetime, 'M d, y, h:iA');
    }
}