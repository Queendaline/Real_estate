<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/3/2020
 *Time: 9:06 AM
 */

namespace Zikzay\factory;


use Zikzay\Database\Database;
use Zikzay\Database\Migrate;
use Zikzay\Lib\Util;

class Migration
{
    public function __construct($args)
    {
        if(empty($args)) {
            echo EL;
            $line = readline("Enter Migration option (create/push): ");

            $this->make(strtolower($line));

        } else {
            $this->make(strtolower($args[0]));
        }
    }

    private function make($option)
    {
        if($option == 'create') {
            (new Migrate())->create();

        } else if($option == 'push') {
//            Database::dbInstance()
//                ->query();
            (new Migrate())->migrate();
        }

    }

}