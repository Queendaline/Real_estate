<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/24/2020
 *Time: 12:12 AM
 */

namespace Zikzay\Database;
//require_once ROOT . DS .'app' . DS . 'src' .DS . 'libs' . DS .'Util.php';
use Zikzay\Lib\Util;

abstract class Migration
{
    private $db;

    public function __construct()
    {
        if (php_sapi_name() != 'cli') {
            Util::cmdPrint(false, 'Access denied');
            die();
        }
        $this->db = Database::dbInstance();
    }

    abstract function up();
    abstract function down();

    protected function createTable($table, $id = 'id', $type = 'INT', $auto_inc = true){
        $res = $this->db->table($table)->create($id, $type, $auto_inc);

        $message = 'Creating table ' .  $table;
        Util::cmdPrint($message, 1);
        return $res;
    }

    protected function dropTable($table){
        $res = $this->db->table($table)->remove();

        $message = 'Deleting table' .  $table;
        Util::cmdPrint($message, 1);
        return $res;
    }

    protected function addColumn($table, $column, $attributes){
        $res = $this->db->table($table)->column($column, $attributes)->add();

        $message = 'Adding column ' . $column . ' to ' .  $table;
        Util::cmdPrint($message, 1);
        return $res;
    }

    protected function addColumnForeignKey($table, $column, $attributes, $referenceAttrs){
        $res = $this->db->table($table)->column($column, $attributes)->foreignKey($referenceAttrs)->add();

        $message = 'Creating foreign key  ' . $column . ' on ' .  $table;
        Util::cmdPrint($message, 1);
        return $res;
    }

    protected function removeColumn($table, $column){
        $res = $this->db->table($table)->column($column)->remove();

        $message = 'Deleting column ' . $column . ' from ' .  $table;
        Util::cmdPrint($message, 1);
        return $res;
    }

    protected function addIndex($table, $column){
        $res = $this->db->table($table)->index($column)->add();

        $message = 'Adding index ' . $column . ' from ' .  $table;
        Util::cmdPrint($message, 1);
        return $res;
    }

    protected function removeIndex($table, $column){
        $res = $this->db->table($table)->index($column)->remove();

        $message = 'Removing index ' . $column . ' from ' .  $table;
        Util::cmdPrint($message, 1);
        return $res;
    }


}


