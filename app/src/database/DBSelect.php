<?php


namespace Zikzay\Database;


use PDO;

trait DBSelect
{


    private $groupBy = null;
    public function select($field1, $field2 = null, $field3 = null, $field4 = null, $field5 = null,
                           $field6 = null, $field7 = null, $field8 = null, $field9 = null, $field10 = null) {
        $this->select = '';
        if(is_array($field1)) {
            foreach ($field1 as $key => $field) {
                $this->select .= $field;
                if(array_key_last($field1) != $key) $this->select .= ', ';
            }
        } else {
            if(isset($field1)) $this->select .= $field1;
            if(isset($field2)) $this->select .= ', ' . $field2;
            if(isset($field3)) $this->select .= ', ' . $field3;
            if(isset($field4)) $this->select .= ', ' . $field4;
            if(isset($field5)) $this->select .= ', ' . $field5;
            if(isset($field6)) $this->select .= ', ' . $field6;
            if(isset($field7)) $this->select .= ', ' . $field7;
            if(isset($field8)) $this->select .= ', ' . $field8;
            if(isset($field9)) $this->select .= ', ' . $field9;
            if(isset($field10)) $this->select .= ', ' . $field10;
        }

        return $this;
    }

    public function get($resultMode = null, $class = null) {
        return $this->execute('single', $resultMode, $class);
    }

    public function getAll($resultMode = null, $class = null){
        return $this->execute('all', $resultMode, $class);
    }

    public function next($resultMode = null, $class = null){
        return $this->execute(null, $resultMode, $class);
    }

    public function count(){
        return $this->execute('count', null, null);
    }

    private function execute($type, $resultMode = null, $class = null) {
        $this->prepareSelectQuery();
        $query = $this->query();
        $mode = $this->resultMode($resultMode);
        if($class){
            $query->setFetchMode($mode, $class);
        }else {
            $query->setFetchMode($mode);
        }
        switch ($type) {
            case 'all':
                return $query->fetchAll();
                break;
            case 'single':
                return $query->fetch();
                break;
            case 'count':
                return $query->rowCount();
            default:
                return $query->nextRowset();
        }
    }

    private function prepareSelectQuery(){
        //        if($this->sql == null) {
        $this->sql = "SELECT ";
        if ($this->select != '') $this->sql .= $this->select; else $this->sql .= " * ";

        $this->sql .= " FROM " . $this->table;

        if ($this->where != '' || $this->like != '') {
            $this->sql .= " WHERE ";
            $this->sql .= $this->where;
            $this->sql .= $this->like;
        }else{
            $this->params = null;
        }
        if($this->groupBy != null) $this->sql .= "GROUP BY $this->groupBy";
        if ($this->order != '') $this->sql .= " ORDER BY " . $this->order;

        if ($this->limit != null) $this->sql .= " LIMIT " . $this->limit;

        //        }
    }

    public function groupBy($groupBy) {
        $this->groupBy = $groupBy;
        return $this;
    }
    private function resultMode($resultMode)
    {
        $mode = null;
        switch ($resultMode) {
            case 'array':
                $mode = PDO::FETCH_ASSOC;
                break;

            case 'object':
                $mode = PDO::FETCH_OBJ;
                break;

            case 'index':
                $mode = PDO::FETCH_NUM;
                break;

            case 'both':
                $mode = PDO::FETCH_BOTH;
                break;

            case 'class':
                $mode = PDO::FETCH_CLASS;
                break;

            default:
                $mode = PDO::FETCH_OBJ;
        }
        return $mode;
    }
    public function whereArray(array $paramsPair, array $operators, array $conditions = [])
    {
        $i = 0;
        foreach ($paramsPair as $key => $value) {
            if ($i > 0) $this->where .= " {$conditions[$i - 1]} ";
            $this->where .= "{$key} ";
            $this->where .= "{$operators[$i]} ?";
            $this->params[] = $value;
            $i++;
        }
    }

    public function whereString($clause)
    {
        $this->where = $clause;
        return $this;
    }

    public function where($clause, string $arg1 = null, string $arg2 = null)
    {
        $this->params = null;
        $this->where = '';
        $this->analyseWhere ($clause,  $arg1, $arg2);
        return $this;
    }

    public function orWhere($clause, string $arg1 = null, string $arg2 = null)
    {
        $this->analyseWhere ($clause,  $arg1, $arg2, 'OR');
        return $this;
    }

    public function andWhere($clause, string $arg1 = null, string $arg2 = null)
    {
        $this->analyseWhere ($clause,  $arg1, $arg2, 'AND');
        return $this;
    }

    private function analyseWhere ($clause, string $arg1 = null, string $arg2 = null, $condition = null) {
        $this->where .= $condition != null ? " {$condition} " : '';
        if(is_array($clause)){
            foreach ($clause as $key => $value) {
                $this->where .= "{$key} = ? ";
                $this->params[] = $value;
            }
        } else {
            if($arg1 && $arg2) {
                $this->where = "{$clause} {$arg1} ? ";
                $this->params[] = $arg2;

            } else if($arg1) {
                $this->where = "{$clause} = ? ";
                $this->params[] = $arg1;

            } else {
                $hasQuotes = explode("'", $clause);
                $noQuotes = explode(" ", $clause);

                if(count($hasQuotes) > 2) {
                    $this->whereHasQuote($hasQuotes);

                }else if(count($noQuotes) > 2) {
                    $this->whereNoQuote($noQuotes);
                }
            }
        }
    }

    private function whereHasQuote($hasQuotes) {
        foreach ($hasQuotes as $key => $hasQuote) {
            if($key % 2 == 0) {
                if(array_key_last($hasQuotes) != $key) {
                    $this->where .= $hasQuote . ' ? ';
                }
            } else {
                $this->params[] = trim($hasQuote);
            }
        }
        if(count(explode('(', $this->where)) > count(explode(')', $this->where))) {
            $this->where .= ')';
        }
    }

    private function whereNoQuote($noQuotes) {
        $e = 1;
        for ($i = 0; $i < count($noQuotes); $i++) {

            if($i == (($e * 4) - 2)) {
                $this->where .= ' ? ';
                $this->params[] = $noQuotes[$i];
                $e++;

            } else $this->where .= ' ' . $noQuotes[$i];
        }

        if(count(explode('(', $this->where)) > count(explode(')', $this->where))) {
            $this->where .= ')';
        }
    }

    public function order($fields, $direction = null) {
        if(is_array($fields)) {
            foreach ($fields as $key => $field) {
                $this->order .= $field;
                if(is_array($direction)) {
                    $this->order .= isset($direction[$key]) ? ' ' . $direction[$key] . ', ' : ', ';

                } else $this->order .= isset($direction) ? ' ' . $direction . ', ' : ', ';
            }
        } else {
            $this->order .= $fields;
            $this->order .= isset($direction) ? ' ' . $direction . ', ' : ', ';
        }
        $this->order = rtrim($this->order, ', ');

        return $this;
    }

    public function limit($limit, $offset = 0) {

        $this->limit = empty($limit) ? null : "{$offset}, {$limit}";
        return $this;
    }

    public function like($field, $value) {
        $this->params[]  = $value;
        if($this->where == '' && $this->like == ''){
            $this->like .= "{$field} LIKE %?%";
        }else {
            $this->like .= ", {$field} LIKE  %?%";
        }
        return $this;
    }

    public function likeStart($field, $value) {
        $this->params[]  = $value;
        if($this->where == '' && $this->like == ''){
            $this->like .= "{$field} LIKE ?%";
        }else {
            $this->like .= ", {$field} LIKE  ?%";
        }
    }

    public function likeEnd($field, $value) {
        $this->params[]  = $value;
        if($this->where == '' && $this->like == ''){
            $this->like .= "{$field} LIKE %?";
        }else {
            $this->like .= ", {$field} LIKE  %?";
        }
    }

}