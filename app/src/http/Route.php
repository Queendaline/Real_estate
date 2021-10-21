<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/28/2020
 *Time: 11:45 PM
 */

namespace Zikzay\http;


use Zikzay\Core\View;

class Route
{
    /**
     * The application instance being facaded.
     *
     * @var \Illuminate\Contracts\Foundation\Application
     */
    protected static $app;
    protected $url;
    protected $controller;
    protected $method;
    protected $params;

    /**
     * The resolved object instances.
     *
     * @var array
     */
    protected static $resolvedInstance;

    public function __construct($controller, $method)
    {
        $this->controller = $controller;
        $this->method = $method;
        $this->getUrl();

    }


    public static function get($url, $controller = 'Home', $method = 'index') {

        (new self($controller, $method))->resolve($url);
    }

    /**
     * @return mixed
     */
    public function getUrl() : array
    {
        $url = isset($_GET['url']) ? trim($_GET['url']) : null;
        $url = rtrim($url, '/');
//        $url = filter_var($url, FILTER_SANITIZE_URL);
        $this->url = explode('/', $url);
        return $this->url;
    }


    private function resolve($url) {

        $urlArray = explode('/', $url);

        if(isset($this->url[0])) {
            if (isset($urlArray[1]) && isset($this->url[1])) {
                if ($urlArray[1] == $this->url[1]) {
                    array_shift($this->url);
                    array_shift($this->url);
                    $this->params = ($this->url) ?: [];
                    $this->callController();
                }
            } else if ($urlArray[0] == $this->url[0]) {
                array_shift($this->url);
                $this->params = ($this->url) ?: [];
                $this->callController();

            }

        }
    }

    public function callController () {
        $this->sanitiseUrl();
        $controller =  !empty($this->url[0]) ? 'Zikzay\Controller\\'.ucwords($this->url[0]).'Controller' : 'Zikzay\Controller\\HomeController';
        $method = !empty($this->url[1]) ? $this->url[1] : 'index';

        if(!class_exists($controller)) {
            View::render('guest/error-404', null, false, false, false);
            exit();
//            die("Class : {$controller} does not exist");

        } else if (!method_exists($controller, $method)) {
            View::render('guest/error-404', null, false, false, false);
            exit();
//            die("Method  : '{$this->method}' does not exist in  '{$controller}' ");

        }else {
            $params = null;
            if(count($this->url) > 2) {
                array_shift($this->url);
                array_shift($this->url);
                $params = $this->url;
            }

            $dispatch = new $controller();
            $params = !empty($params) && !isset($params[1]) ? $params[0] : $params;

            $dispatch->$method($params);

            exit();
        }
        
    }

    private function sanitiseUrl()
    {
        $this->capitalizeWords(0);
        $this->capitalizeWords(1);
    }

    private function capitalizeWords($word) {
        $value = null;
        if(empty($this->url[$word])) {
            return null;
        } else if(str_contains($this->url[$word], '-')) {
            $controllerArray = explode('-', $this->url[$word]);
            $controller = '';
            foreach ($controllerArray as $item) {
                if($controllerArray[0] == $item)
                    $controller .= $item;
                else
                    $controller .= ucwords($item);
            }
            $this->url[$word] = $controller;
        }
    }
}