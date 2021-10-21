<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/23/2020
 *Time: 11:15 AM
 */
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();
define('ROOT', dirname( __DIR__));
if(!isset($_SERVER['HTTP_HOST'])) {
    define('SR',  '');
} else {
    define('SR', 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['SCRIPT_NAME']));
}

define('VERSION',  $_SERVER['VERSION']);
define('DEBUG',  $_SERVER['DEBUG']);
const


EL = PHP_EOL ,


DS = DIRECTORY_SEPARATOR,
PUBLIC_PATH = ROOT . DS . 'public',

USER_CSS = SR .'/public/themes/css/app.css',
USER_ASSET_PATH = SR .'/public/assets/user/',
GUEST_ASSET_PATH = SR .'/public/assets/guest/',
GUEST_THEMES_PATH = SR .'/public/themes/guest/',

USER_THEMES_PATH = SR .'/public/themes/user/',


THEMES_PATH = SR .'/public/themes/',
ADMIN_JS = SR .'/public/assets/admin/js/',
ADMIN_PLUGINS = SR .'/public/assets/admin/plugins/',
ADMIN_IMG = SR .'/public/assets/admin/img/',
ADMIN_CSS_APP = SR .'/public/themes/css/admin-app.css',
ADMIN_JS_APP = SR .'/public/themes/js/admin-app.js',

ADMIN_ASSET_PATH = SR .'/public/assets/admin/',
ADMIN_THEMES_PATH = SR .'/public/themes/admin/',

FRONT_JS = SR .'/public/assets/user/js/',
FRONT_PLUGINS = SR .'/public/assets/user/plugins/',
FRONT_STATIC_IMG = SR .'/public/assets/user/images/',
FRONT_CSS = SR .'/public/themes/css/app.css',


IMG_PATH = SR .'/public/res/img/',
IMG_UPLOAD_PATH = PUBLIC_PATH . DS .'res' . DS . 'img' .DS,
IMG_PLACEHOLDER = SR .'/public/assets/admin/img/placeholder.jpg',
IMG_PLACEHOLDER_USER = SR .'/public/assets/admin/img/user.jpg',
CSS_PATH = PUBLIC_PATH . DS. 'themes' . DS . 'css' . DS . 'app.css',
VIDEO_PATH = PUBLIC_PATH . DS .'res' . DS . 'video',


MODELS_PATH = ROOT . DS . 'app' . DS .'models',
VIEWS_PATH = ROOT . DS . 'app' . DS .'views',
FORM_ERROR = VIEWS_PATH . DS .'templates' . DS . 'util' . DS . 'form-error.php',
CONTROLLERS_PATH = ROOT . DS . 'app' . DS .'controllers',
MIGRATIONS_PATH = ROOT.DS.'app'.DS.'src'.DS.'database'.DS.'migrations',



DEFAULT_METHOD = 'index',
DEFAULT_CONTROLLER = 'Home',
DEFAULT_LAYOUT = 'default',

MOBILE_NETWORKS = ['MTN' => 1, 'AIRTEL' => 2, 'GLO' => 3, '9MOBILE' => 4],

    NAIRA = '₦',

SITE_TITLE = 'ZIKZAY Framework',
MENU_BRAND = 'ZIKZAY',



REMEMBER_ME_COOKIE_EXPIRY = 2592000,
COOKIE_LIFETIME = 36*5,
SESSION_LIFETIME = 3600 * 24,
SESSION_PREFIX = 'zik_',
COOKIE_PREFIX = 'zik_',

HASH_KEY = '$2y$10$hxsezYF6/nLrqzO7NXQLiOnbSFe16jgJaBoQpERY5ZdTTwlt0RHlu',

EMAIL_ID  = "CuI5PbNSOZvxw7U4rCMUTAiJPSMlaThEQRc654l4tw8=",
EMAIL_PASSWORD  = "G0JjZXWkmEwtiVxijkndRJG0XmcKYcXTGXNbHyqTflaqLBxQJ95B3NXNOsIDkyXh",

USER_PAY_CARD_TRANSACTION_CHARGE = false;









if (!function_exists('is_countable')) {
    function is_countable($var) { return is_array($var) || $var instanceof Countable || $var instanceof ResourceBundle || $var instanceof SimpleXmlElement; }
}
if (!function_exists('array_key_first')) {
    function array_key_first(array $array) { foreach ($array as $key => $value) { return $key; } }
}
if (!function_exists('array_key_last')) {
    function array_key_last(array $array) { end($array); return key($array); }
}
function dnd($data) {
    echo '<pre>';
    var_dump($data);
    echo '</pre>';
    die();
}


require_once ROOT . DS .'config' . DS . 'lang.php';


$user_first_name = null;
$user_surname = null;
$user_email_address = null;
$user_phone_number = null;
$show_bank_account = false;

