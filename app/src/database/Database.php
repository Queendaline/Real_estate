<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/23/2020
 *Time: 11:13 AM
 */
namespace Zikzay\Database;

use Mpdf\Barcode\Codabar;
use PDO;
use PDOException;

class Database extends DB
{
    private $db = null, $sql = null, $params = null, $limit = null;
    private $select = '';
    private $like = '';
    private $order = '';
    private $where = '';
    private $table = '';
    private $referenceAttrs = '';
    private $column = '';
    protected static $dbInstance = null;
    private $attributes = '';
    private $index = '';

    use DBInsert, DBDelete, DBSelect, DBUpdate, DBSchema, DBJoins;

    public function __construct()
    {
        parent::__construct();
        $this->db = $this->getDb();
        return $this;

    }

    public function table($table){
        $this->table = TABLE_PREFIX . $table;
        return $this;
    }

    public function column($column, $attributes = [])
    {
        $this->column = $column;
        $this->attributes =  $attributes;
        return $this;
    }

    public function query() {
//        dnd($this->sql);
        if($query = $this->db->prepare($this->sql)) {

            if($query->execute($this->params)) {
                return $query;
            }
        }
        return false;
    }
}

/**
 * ALTER TABLE `test_student` ADD INDEX(`subjects`);"?
 * `ALTER TABLE ``test_student`` DROP INDEX ``student_id``;`
 * ALTER TABLE `test_student` CHANGE `id` `user_id` VARCHAR(16) NOT NULL;
 * ALTER TABLE `test_student` CHANGE `id` `user_id` INT(11) NOT NULL AUTO_INCREMENT;
 *
 * ALTER TABLE `test_student` ADD `subjects` INT NOT NULL AFTER `student_id`, ADD PRIMARY KEY (`subjects`);
 * ALTER TABLE `test_student` ADD `subjects` INT NOT NULL AFTER `student_id`, ADD UNIQUE `unique` (`subjects`);
 * ALTER TABLE `test_student` ADD `subjects` INT NOT NULL AFTER `student_id`, ADD INDEX (`subjects`);
 * ALTER TABLE `test_student` ADD `subjects` INT NOT NULL AFTER `student_id`;
 * ALTER TABLE `test_student` ADD `subjects` VARCHAR(16) NOT NULL AFTER `student_id`;
 *
 * ALTER TABLE `test_student` ADD `subjects` INT NOT NULL AUTO_INCREMENT AFTER `student_id`, ADD PRIMARY KEY (`subjects`);
 */