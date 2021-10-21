<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/5/2020
 *Time: 10:31 AM
 */

namespace Zikzay\core\abstracts;


use Zikzay\core\Session;

abstract class Display
{

    protected static function formError($valid = true) {

        if(Session::has('formIdsError')) {
            foreach (Session::get('formIdsError') as $id => $errorMsg) { ?>
                <script>
                    document.getElementById("<?=$id?>").style.border = "1px solid red";
                    document.getElementById("<?=$id?>-e").style.color = 'red';
                    document.getElementById("<?=$id?>-e").innerText = '<?=$errorMsg?>';
                </script>
            <?php
            }
            Session::unset('formIdsError');
        }
        if(Session::has('validValues') and $valid) {
            foreach (Session::get('validValues') as $id => $value) { ?>
                <script>
                    document.getElementById("<?=$id?>").value = '<?=$value?>';
                </script>
            <?php
            }
            Session::unset('validValues');
        }
    }

    protected function phpInHtml($view) {
        $viewPath = explode('/', $view);
        $view = implode(DS, $viewPath);

        $filePath = ROOT . DS . 'app' . DS . 'views';
        $viewFile = $filePath . DS . $view . '.html';
        $tmpFile = $filePath . DS . 'tmp' . DS . $view . '.php';
        if(file_exists($viewFile)){
            $file =  fopen($viewFile, 'r');
            $file =  fread($file, 99999999);
            $file = str_replace('{{', '<?= ', $file);
            $file = str_replace('({', '<?php ', $file);
            $file = str_replace('}}', ' ?>', $file);
            $file = str_replace('})', ' ?>', $file);

            if(!file_exists($tmpFile)) {
                $path1 = $filePath . DS . 'tmp' . DS . $viewPath[0];
                if(!is_dir($path1)) mkdir($path1);
            }
            $handler = fopen($tmpFile, 'w');

            fwrite($handler, $file);
            include($tmpFile);


        } else {
            dnd($viewFile);
            die('The view: ' . $view . ' Does not exist');
        }
    }



    public static function extend() {

    }

    public static function start() {
        ob_start();
    }

    public static function end() {
        $content = ob_get_clean();
        include VIEWS_PATH . DS . 'templates' . DS . 'app.php';
    }
}