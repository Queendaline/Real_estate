<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/23/2020
 *Time: 11:44 PM
 */

namespace Zikzay\Database;


class CreateMigration {
    public static function migrationBuilder() {
        $fileName = "Migration".time();
        $ext = ".php";
        $fullPath = ROOT.DS.'migrations'.DS.$fileName.$ext;
        $content = '<?php
          namespace Migrations;
          use Core\Migration;
        
          class '.$fileName.' extends Migration {
            public function up() {
        
            }
          }
          ';
        return $resp = file_put_contents($fullPath, $content);
    }

}