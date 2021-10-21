<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/6/2020
 *Time: 3:40 PM
 */

namespace Zikzay\Core;

use Zikzay\core\abstracts\Display;

class View extends Display
{
    protected $_site_title = SITE_TITLE, $_layout = DEFAULT_LAYOUT;

    public function __construct()
    {

    }

    public static function render($view, $data, $sidebar = true, $header = true, $footer = true) {
        global $user_first_name, $user_surname, $user_email_address, $user_phone_number,
               $user_naira_balance, $user_bitcoin_balance, $show_bank_account;

        if(is_array($data) || is_object($data)){
            foreach ($data as $key => $datum) {
                $$key = $datum;
            }
        } else {
            $$data = $data;
        }
        $viewPath = explode('/', $view);
        $view = implode(DS, $viewPath);
        ob_start();
        include VIEWS_PATH . DS . $view . '.php';
        $body = ob_get_clean();

        if($viewPath[0] == 'admin') {
            include VIEWS_PATH . DS .'admin/base/app.php';
        }else if($viewPath[0] == 'guest') {
            include VIEWS_PATH . DS .'guest/base/app.php';
        }
        parent::formError(false);

    }



}