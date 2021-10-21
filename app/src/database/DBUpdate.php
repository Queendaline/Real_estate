<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 9/3/2020
 *Time: 9:15 AM
 */

namespace Zikzay\Database;


trait DBUpdate
{

    public function update(array $data) {
        $rowCount = null;
        $query = $this->performUpdate($this->table, $data);
        $rowCount = $query->rowCount();

        return $rowCount;
    }

    private function performUpdate(string $table, array $data) {
        $attributes = '';
        $where = null;
        $params = [];
        foreach($data as $column => $value) {
            $attributes .= '`' . $column . '` = ?, ';
            $params[] = $value;
        }
        if($this->where == '') {
            $where = 0;
        }else {
            foreach ($this->params as $param) {
                $params[] = $param;
                $where = $this->where;
            }
        }
        $attributes = rtrim($attributes, ', ');
        $this->params = $params;

        $this->sql = "UPDATE {$table} SET {$attributes} WHERE {$where}";

        return $this->query();
    }
}