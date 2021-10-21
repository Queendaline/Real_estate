<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/31/2020
 *Time: 9:00 PM
 */

$url = isset($_REQUEST['url']) ? $_REQUEST['url'] : null;
$url = rtrim($url, '/');
$url = filter_var($url, FILTER_SANITIZE_URL);
$url = explode('/', $url);
print_r($url);
echo 'hhh';

