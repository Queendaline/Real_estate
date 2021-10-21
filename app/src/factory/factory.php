<?php

use Zikzay\factory\Builder;
use Zikzay\Lib\Util;

if(class_exists('\Zikzay\factory\Builder')){

    if(count($argv) > 1 && trim(strtolower($argv[1])) == 'autoload'){
        Util::autoload();

    }else {
        Builder::make($argv);
    }


}else {
    exec('composer dump-autoload -o');
//    Util::autoload();
//    Util::cmdPrint('Repeat the command');

}