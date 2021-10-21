<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/5/2020
 *Time: 12:13 PM
 */

namespace Zikzay\core;



class Session
{
    private static function name($name) : string {
        return SESSION_PREFIX . $name;
    }

    public static function setSessionParams() {
        $secure = false;
        $httponly = true;
        $samesite = 'lax'; // OR strict
        return (PHP_VERSION_ID < 70300) ?
            session_set_cookie_params(SESSION_LIFETIME, '/; samesite=' . $samesite, $_SERVER['HTTP_HOST'], $secure, $httponly) :
            session_set_cookie_params([
                'lifetime' => SESSION_LIFETIME,
                'path' => '/',
                'domain' => $_SERVER['HTTP_HOST'],
                'secure' => $secure,
                'httponly' => $httponly,
                'samesite' => $samesite
            ]);
    }

    public static function init() : bool
    {
        if (session_status() == PHP_SESSION_NONE) {
            self::setSessionParams();
            session_start();

            return  true;
        }
        return (session_status() == PHP_SESSION_ACTIVE) ? true : false;
    }

    public static function set($name, $value)
    {
        $_SESSION[self::name($name)] = $value;
    }

    public static function setArray(array $array) : bool
    {
        if (is_array($array)) {
            foreach ($array as $name => $value) {
                self::set($name, $value);
            }
        }
        return true;
    }

    public static function pull($name) : string
    {
        if (self::has($name)) {
            $value = self::get($name);
            self::unset($name);

            return $value;
        }

        return null;
    }

    public static function has($name) : bool
    {
        return isset($_SESSION[self::name($name)]);
    }

    public static function get($name)
    {
        return self::has($name) ? $_SESSION[self::name($name)] : null;
    }

    public static function getAll() : array
    {
        return isset($_SESSION) ? $_SESSION : null;
    }

    public static function getIndex($name, $index) : string
    {
        return (isset($_SESSION[self::name($name)][$index])) ?
            $_SESSION[self::name($name)][$index] : null;
    }

    public static function id()
    {
        return session_id();
    }

    public static function regenerate($keepOld = false)
    {
        session_regenerate_id(!$keepOld);

        return session_id();
    }

    public static function unset($name)
    {
        if (self::has($name)) {
            unset($_SESSION[self::name($name)]);
        }
    }

    public static function destroy()
    {
        if (session_status() == PHP_SESSION_ACTIVE) {
                session_unset();
                session_destroy();
        }

        return false;
    }
}