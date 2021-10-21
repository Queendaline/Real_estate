<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/6/2020
 *Time: 12:24 AM
 */

namespace Zikzay\core;


class Cookie
{

    private static function name($name) : string {
        return COOKIE_PREFIX . $name;
    }

    public static function set($name, $value, $days = null, $destroy = false)
    {
        $time = $days == null ?
            strtotime("+" . COOKIE_LIFETIME . "days") :
            strtotime("+{$days} hours");

        if($destroy === true) {$time = 1; $value = FALSE; }

        return setcookie(self::name($name), $value, $time, '/', $_SERVER['HTTP_HOST'], false, true);
    }

    public static function has($name) : bool
    {
        return isset($_COOKIE[self::name($name)]);
    }

    public static function get($name) : string
    {
            return self::has($name) ? $_COOKIE[self::name($name)] : '';
    }

    public static function all() : array
    {
        return (isset($_COOKIE) && count($_COOKIE)) ? $_COOKIE : [];
    }

    public static function pull($name) : string
    {
        $cookie = '';
        if (isset($_COOKIE[self::name($name)])) {
            $cookie = self::get($name);
            self::destroy($name);
        }

        return $cookie;
    }

    public static function destroy($name) : bool
    {
        return isset($_COOKIE[self::name($name)]) ?
            self::set($name, '', 1 , true) : false;
    }

    public static function unset($name) : bool
    {
        return isset($_COOKIE[self::name($name)]) ?
            self::set($name, '', 1 , true) : false;
    }

    public static function destroyAll() : bool
    {
        if (count($_COOKIE) > 0) {
            foreach ($_COOKIE as $name => $value) {
                self::destroy($name);
            }
            return true;
        }
        return false;
    }

}