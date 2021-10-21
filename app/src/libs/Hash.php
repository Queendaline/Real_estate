<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/5/2020
 *Time: 2:50 PM
 */

namespace Zikzay\libs;


class Hash
{

    /**
     * decrypt AES 256
     *
     * param data $edata
     * param string $password
     * return decrypted data
     */
    public static function decrypt(string $string) {
        $data = base64_decode($string);
        $salt = substr($data, 0, 16);
        $ct = substr($data, 16);

        $rounds = 3; // depends on key length
        $data00 = HASH_KEY.$salt;
        $hash = array();
        $hash[0] = hash('sha256', $data00, true);
        $result = $hash[0];
        for ($i = 1; $i < $rounds; $i++) {
            $hash[$i] = hash('sha256', $hash[$i - 1].$data00, true);
            $result .= $hash[$i];
        }
        $key = substr($result, 0, 32);
        $iv  = substr($result, 32,16);

        return openssl_decrypt($ct, 'AES-256-CBC', $key, true, $iv);
    }

    /**
     * crypt AES 256
     *
     * param data $data
     * param string $password
     * return base64 encrypted data
     */
    public static function encrypt(string $string) {
        // Set a random salt
        $salt = openssl_random_pseudo_bytes(16);

        $salted = '';
        $dx = '';
        // Salt the key(32) and iv(16) = 48
        while (strlen($salted) < 48) {
            $dx = hash('sha256', $dx.HASH_KEY.$salt, true);
            $salted .= $dx;
        }

        $key = substr($salted, 0, 32);
        $iv  = substr($salted, 32,16);

        $encrypted_data = openssl_encrypt($string, 'AES-256-CBC', $key, true, $iv);
        return base64_encode($salt . $encrypted_data);
    }

    public static function password(string $string){
        return password_hash($string, PASSWORD_DEFAULT);
    }

    public static function validate(string $string, string $hash)
    {
        return password_verify($string, $hash);
    }

    public static function sha56(string $string)
    {
        $context = hash_init('sha256', HASH_HMAC, HASH_KEY);
        hash_update($context, $string);

        return hash_final($context);
    }

    public static function md5(string $string)
    {
        $context = hash_init('md5', HASH_HMAC, HASH_KEY);
        hash_update($context, $string);

        return hash_final($context);
    }

    public static function token(){
        return base64_encode(openssl_random_pseudo_bytes(68));
    }

    public static function csrf() {
        $token = self::token();
//        Session::set('csrf_token',$token);
        return $token;
    }
}