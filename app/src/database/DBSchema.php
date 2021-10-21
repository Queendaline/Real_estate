<?php


namespace Zikzay\Database;


use PDO;
use PDOException;

trait DBSchema
{

    public function getPrimaryKey()
    {
        $this->sql = "SELECT GROUP_CONCAT(COLUMN_NAME) AS primary_key FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA = '".
            DB_NAME .
            "' AND CONSTRAINT_NAME='PRIMARY' AND TABLE_NAME = '"
            . $this->table. "'";

        return $this->query()->fetch(PDO::FETCH_OBJ)->primary_key;
    }

    public function create($id = 'id', $type = 'INT', $auto = true)
    {
        try {
            $auto_inc = (trim($type) == 'INT NOT NULL' && $auto) ? $auto_inc = 'AUTO_INCREMENT' : '';
            $this->sql = "CREATE TABLE IF NOT EXISTS " .
                "{$this->table} ({$id} {$type} {$auto_inc} , "
                . "PRIMARY KEY ({$id}))  ENGINE=INNODB;";
            $this->query();
        } catch (PDOException $e) {
            return false;
        }
        return true;
    }

    public function remove()
    {
        if($this->index != '') {
            $this->sql = "ALTER TABLE {$this->table} DROP INDEX {$this->index};";

        }else if($this->column != '') {
            $this->sql = "ALTER TABLE {$this->table} DROP COLUMN {$this->column};";

        } else {
            $this->sql = "DROP TABLE IF EXISTS {$this->table}";
        }
        return $this->query();
    }

    public function add()
    {
        $this->sql = "ALTER TABLE {$this->table} ";
        if($this->referenceAttrs != ''){
            $this->sql = "ALTER TABLE {$this->table}  ADD {$this->column} {$this->attributes},  ADD INDEX (`{$this->column}`);";
            $this->query();
            $this->sql = "ALTER TABLE {$this->table}  ADD FOREIGN KEY ({$this->column}) {$this->referenceAttrs};";
        }else {
            $both = ($this->attributes != '' & $this->index != '') ? $both = ',' : '';
            if ($this->attributes != '') {
                $this->sql .= " ADD `{$this->column}` {$this->attributes}" . $both;
            }
            if ($this->index != '') {
                $this->sql .= " ADD INDEX (`{$this->index}`)";
            }
        }
        return $this->query();
    }

    public function index($column)
    {
        $this->index = $column;
        return $this;
    }

    public function foreignKey($referenceAttrs)
    {
        $this->referenceAttrs = $referenceAttrs;
        return $this;
    }

}