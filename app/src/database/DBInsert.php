<?php


namespace Zikzay\Database;


trait DBInsert
{

    public function insert(array $data) {
        $query = $lastId = null;
        if(isset($data[0])) {
            foreach ($data as $datum) {
                $query[] = $this->performInsert($this->table, $datum);
                $lastId[] = $this->db->lastInsertId();
            }
        }else {
            $query = $this->performInsert($this->table, $data);
            $lastId = $this->db->lastInsertId();
        }
        return $lastId ? $lastId : null;
    }

    private function performInsert(string $table, array $data) {

        $sqlArray = $this->performBinding($data);

        $attributes = $sqlArray['attributes'];
        $params = $sqlArray['params'];
        $this->params = $sqlArray['values'];

        $this->sql = "INSERT INTO {$table} ({$attributes}) VALUES ({$params})";
        return $this->query();
    }

    private function performBinding(array $data) : array {
        $attributes = '';
        $params = '';
        $values = [];

        foreach($data as $column => $value) {
            $attributes .= '`' . $column . '`, ';
            $params .= '?, ';
            $values[] = $value;
        }
        $attributes = rtrim($attributes, ', ');
        $params = rtrim($params, ', ');


        return ['attributes' => $attributes, 'params' => $params, 'values' => $values];
    }
}