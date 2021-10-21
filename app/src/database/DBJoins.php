<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 9/3/2020
 *Time: 10:00 AM
 */

namespace Zikzay\Database;


use PDO;
use function GuzzleHttp\Promise\queue;

trait DBJoins
{


    public function left($table, $column, $select=[])
    {
        $this->sql = "SELECT * FROM {$table} LEFT JOIN {$this->table} ON {$this->table}.id={$table}.{$column}";
    }

    public function selectBase($select = "*")
    {
        $this->sql = "SELECT {$select} FROM {$this->table} ";
        return $this;
    }

    public function innerJoin($table, $column, $leftTable = null, $leftColumn = null)
    {
        if(empty($leftTable)) $leftTable = $this->table;
        if(empty($leftColumn)) $leftColumn = 'id';
        $this->sql .= " INNER JOIN {$table} ON {$leftTable}.{$leftColumn}={$table}.{$column} ";
        return $this;
    }

    public function inner($table, $column, $leftTable = null, $leftColumn = null)
    {
        if(empty($leftTable)) $leftTable = $this->table;
        if(empty($leftColumn)) $leftColumn = 'id';
        $this->sql .= " LEFT JOIN {$table} ON {$leftTable}.{$leftColumn}={$table}.{$column} ";
        return $this;
    }

    public function leftJoin($rightTable, $rightColumn, $leftTable = null, $leftColumn = null)
    {
        if(empty($leftTable)) $leftTable = $this->table;
        if(empty($leftColumn)) $leftColumn = 'id';
        $this->sql .= " INNER JOIN {$rightTable} ON {$leftTable}.{$leftColumn}={$rightTable}.{$rightColumn} ";
        return $this;
    }

    public function join($where, $class = false, $classes = null) {
        if(!empty($where))$this->sql .= " WHERE $where";
//        dnd($this->sql);
        return $this->query()->fetchAll(PDO::FETCH_OBJ);
    }

    public function joinLeft($leftTable, $leftColumn, $rightTable, $rightColumn)
    {
        $this->sql .= " LEFT JOIN {$rightTable} ON {$leftTable}.{$leftColumn}={$rightTable}.{$rightColumn} ";
        return $this;
    }

    public function openJoin($leftTable, $leftColumn, $rightTable, $rightColumn)
    {
        return " LEFT JOIN {$rightTable} ON {$leftTable}.{$leftColumn}={$rightTable}.{$rightColumn} ";
    }

    public function closeJoin($joinStatement)
    {
        $this->sql .= " $joinStatement ";
        return $this;
    }

    public function joinRight($leftTable, $leftColumn, $rightTable, $rightColumn)
    {
        $this->sql .= " RIGHT JOIN {$rightTable} ON {$leftTable}.{$leftColumn}={$rightTable}.{$rightColumn} ";
        return $this;
    }

    public function joinAll() {
        if ($this->where != '' || $this->like != '') {
            $this->sql .= " WHERE ";
            $this->sql .= $this->where;
            $this->sql .= $this->like;
        }else{
            $this->params = null;
        }
        if ($this->order != '') $this->sql .= " ORDER BY " . $this->order;
        if ($this->limit != null) $this->sql .= " LIMIT " . $this->limit;
//        dnd($this->sql);
        return $this->query()->fetchAll(PDO::FETCH_OBJ);
    }
}