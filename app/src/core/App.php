<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/28/2020
 *Time: 1:37 PM
 */

namespace Zikzay\Core;


use Zikzay\http\Route;
use Zikzay\core\Session;

class App
{
    public function __construct()
    {
        Session::init();
    }

    public static function route() {
        new self();
        (new Route('', ''))->callController();
//        Route::get('', 'Home', 'index');
//        Route::get('users', 'Users', 'index');
//        Route::get('home/index', 'Home', 'index');
//        Route::get('home/create', 'Home', 'create');
//        Route::get('register', 'RegisterController', 'index');
//        Route::get('register/create', 'RegisterController', 'register');
    }

}