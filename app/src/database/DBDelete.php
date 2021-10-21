<?php


namespace Zikzay\Database;


trait DBDelete
{

    public function delete() {
        $rowCount = null;
        $query = $this->performDelete($this->table);
        $rowCount = $query->rowCount();

        return $rowCount;
    }

    private function performDelete(string $table) {
        $where = null;
        $params = [];
        if($this->where == '') {
            $where = 0;
        }else {
            foreach ($this->params as $param) {
                $params[] = $param;
                $where = $this->where;
            }
        }
        $this->params = $params;

        $this->sql = "DELETE FROM {$table} WHERE {$where}";

        return $this->query();
    }

}