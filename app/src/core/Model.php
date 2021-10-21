<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/24/2020
 *Time: 9:10 AM
 */

namespace Zikzay\Core;


use stdClass;
use Zikzay\Database\Database;
use Zikzay\Lib\Util;

abstract class Model
{
    use DatabaseFields;

    protected static $connection;

    protected static $table;

    private static $model;

    private static $data;

    public $id;

    protected static $primaryKey = 'id';

    protected static $keyType = 'int';

    public $created_at;

    public $updated_at;

    public function __construct()
    {
        self::$connection = Database::dbInstance();
        self::$model = get_class($this);
        self::$table[self::$model]  = $this->model();
        self::$data[self::$model] =  $this;
    }

    protected static function instance() {
        return Database::dbInstance();
    }

    private function model()
    {
        $model = get_class($this);

        return Util::objectToSnakeCase($model);
    }

    private static function table()
    {
        return Util::objectToSnakeCase(static::class);
    }

    private static function currentTable() {
        return self::$table[get_called_class()];
    }
    
    private static function columns($columns = null, $class = null)
    {
       if(empty($columns)) {
           $class = $class ?? (static::class);
           $obj = get_object_vars(new $class);
           $obj[self::$primaryKey] = null;

           $columns = array_keys($obj);
       }

       return $columns;
    }

    public static abstract function define(stdClass $field) : stdClass;

    public static function object($id)
    {
        return self::instance()
            ->table(self::currentTable())
            ->where(self::$primaryKey, $id)
            ->get('class', self::$model);
    }

    private static $where = null;
    public static function where($whereClause){
        self::$where = $whereClause;
        return new static;
    }

    private static $order = null;
    private static $direction = null;
    public static function order($descending = false, $columns = 'id'){
        self::$order = $columns;
        self::$direction = $descending ? 'DESC' : 'ASC';
        return new static;
    }

    private static $groupBy = null;
    public static function groupBy($columns){
        if(!is_array($columns)) {
            self::$groupBy = $columns;
        } else {
            self::$groupBy = implode(", ", $columns);
        }
        return new static;
    }

    private static $limitTo = null;
    private static $startAt = null;
    public static function limitTo($limitTo = null, $startAt = 0){
        self::$limitTo = $limitTo;
        self::$startAt = $startAt;
        return new static;
    }
    public static function all($columns = [])
    {
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->where(self::$where)
            ->groupBy(self::$groupBy)
            ->order(self::$order, self::$direction)
            ->limit(self::$limitTo, self::$startAt)
            ->getAll('class', static::class);
    }

    public static function first($columns = [])
    {
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->where(self::$where)
            ->groupBy(self::$groupBy)
            ->order(self::$order, self::$direction)
            ->get('class', static::class);
    }

    public static function last($columns = [])
    {
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->order(self::$primaryKey, 'DESC')
            ->get('class', static::class);
    }

    public static function search($filed, $search, $columns = [])
    {
        $search = is_array($search) ? $search[array_key_first($search)] : $search;
        $clause = "$filed = '{$search}'";
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->where($clause)
            ->order(self::$order, self::$direction)
            ->limit(self::$limitTo, self::$startAt)
            ->get('class', static::class);
    }

    public static function searchAll($where, $columns = [])
    {
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->whereString($where)
            ->order(self::$order, self::$direction)
            ->limit(self::$limitTo, self::$startAt)
            ->getAll('class', static::class);
    }

    public static function searchOR($filed, $search, $columns = [])
    {
        $search = is_array($search) ? $search[array_key_first($search)] : $search;
        $clause = is_array($filed) ? implode(" = '{$search}' OR ", $filed) . " = '{$search}'" : '';
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->where($clause)
            ->get('class', static::class);
    }

    public static function searchAnd($filed, $search, $columns = [])
    {
        if(is_array($filed) and is_array($search)) {
            $clause = '';
            for($i = 0; $i < count($filed); $i++) {
                $clause .= $filed[$i] . ' = '. $search[$i] . ' AND ';
            }
            $clause = rtrim($clause, ' AND ');
        } else {
            $search = is_array($search) ? $search[array_key_first($search)] : $search;
            $clause = is_array($filed) ? implode(" = '{$search}' AND ", $filed) . " = '{$search}'" : '';
        }

        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->where($clause)
            ->get('class', static::class);
    }

    public static function find($search, $columns = [])
    {
        $id = self::$primaryKey;
        $search = is_array($search) ? $search[array_key_first($search)] : $search;
        $clause = "{$id} = '{$search}'";
//        $clause .= ' OR ' .implode(" = '{$search}' OR ", self::columns('')) . " = '{$search}'";
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->where($clause)
            ->get('class', static::class);
    }

    public static function findLike($search, $columns = [])
    {
        $id = self::$primaryKey;
        $search = is_array($search) ? $search[array_key_first($search)] : $search;
//        $clause = "{$id} Like '{$search}'";
        $clause = implode(" Like '{$search}%' OR ", self::columns('')) . " Like '{$search}%'";
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->where($clause)
            ->getAll('class', static::class);
    }

    public static function findAll($search, $columns = [])
    {
//        $clause = is_array($search) ? $search :
//            implode(" = '{$search}' OR ", self::columns('')) . " = '{$search}'";
        $id = self::$primaryKey;
        $search = is_array($search) ? $search[array_key_first($search)] : $search;
        $clause = "{$id} = '{$search}'";
        return self::instance()
            ->table(self::table())
            ->select(self::columns($columns))
            ->where($clause)
            ->getAll('class', static::class);
    }

    public static function count($where = '')
    {
        return self::instance()
            ->table(self::table())
            ->where($where)
            ->count();
    }

    public function save() {
        if(isset($this->id)) {
            return $this->update(['id' => $this->id]);
        }
        return self::instance()
            ->table(self::currentTable())
            ->insert(self::getData());

    }

    protected function insert() {
        return self::instance()
            ->table(self::currentTable())
            ->insert(self::getData());
    }
    public function update(array $where)
    {
        $data = self::getData();

        if(isset($data['id'])) unset($data['id']);

        return self::instance()
            ->table(self::currentTable())
            ->where($where)
            ->update($data);
    }

    public function delete($where = null)
    {
        $where = (empty($where) and isset($this->id)) ? ['id' => $this->id] : $where;
        return self::instance()
            ->table(self::currentTable())
            ->where($where)
            ->delete();
    }

    public function createUser() {
        self::$data = $this;
        return self::instance()
            ->table(self::currentTable())
            ->insert(self::getData());
    }

    private static function selectedColumns($model, $columns = null) {
        $baseTable = TABLE_PREFIX.Util::objectToSnakeCase($model);
        $baseAlias = self::aliasCamel($model);
        $columns  = self::columns($columns, $model);
        $columnsAlias = '';
        foreach ($columns as $column) {
            $columnsAlias .= "$baseTable.$column AS {$baseAlias}_$column, ";
        }
        return rtrim($columnsAlias, ', ');
    }

    private static function relatedColumn(string $model){
        $column = Util::snakeCase($model);
        $column = (str_ends_with($column, 'ies')) ? substr($column, 0, -3).'y' : $column;
        $column = (str_ends_with($column, 'ses')) ? substr($column, 0, -2) : $column;
        $column = (str_ends_with($column, 's')) ? substr($column, 0, -1) : $column;
        return $column;
    }

    public static function relatedTo($model, $column = null) {
        $staticTable = static::table();
        $baseTable = TABLE_PREFIX. $staticTable;
        $column = (!empty($column)) ? $column : self::relatedColumn($staticTable);
        $table = TABLE_PREFIX.Util::objectToSnakeCase($model);
        $baseColumnsAlias = self::selectedColumns(static::class);
        $columnsAlias = self::selectedColumns($model);
        return self::instance()
            ->table($staticTable)
            ->selectBase("$baseColumnsAlias, $columnsAlias")
            ->joinLeft($baseTable, self::$primaryKey, $table, $column)
            ->where(self::$where)
            ->order(self::$order, self::$direction)
            ->limit(self::$limitTo, self::$startAt)
            ->joinAll();
    }

    public static function relatedToMany(array $models) {
        $staticTable = static::table();
        $baseTable = TABLE_PREFIX. $staticTable;
        $baseColumnsAlias = self::selectedColumns(static::class);
        $joins = '';
        $columnsAlias = '';
        foreach ($models as $key => $model) {
            $columnsAlias .= self::selectedColumns($model).', ';
            $table = TABLE_PREFIX.Util::objectToSnakeCase($model);
            $column = (!is_numeric($key)) ? $key : self::relatedColumn($staticTable);
            $joins .= self::instance()->openJoin($baseTable, self::$primaryKey, $table, $column);
        }
        $columnsAlias = rtrim($columnsAlias, ', ');

        return self::instance()
            ->table($staticTable)
            ->selectBase("$baseColumnsAlias, $columnsAlias")
            ->closeJoin($joins)
            ->where(self::$where)
            ->order(self::$order, self::$direction)
            ->limit(self::$limitTo, self::$startAt)
            ->joinAll();
    }

    public static function relatedToMe($model, $column = null) {
        $staticTable = TABLE_PREFIX.static::table();
        $objectToSnakeCase = Util::objectToSnakeCase($model);
        $table = TABLE_PREFIX. $objectToSnakeCase;
        $column = (!empty($column)) ? $column : self::relatedColumn($objectToSnakeCase);
        $baseColumnsAlias = self::selectedColumns(static::class);
        $columnsAlias = self::selectedColumns($model);

        return self::instance()
            ->table(static::table())
            ->selectBase("$baseColumnsAlias, $columnsAlias")
            ->joinLeft($staticTable, $column, $table, self::$primaryKey)
            ->where(self::$where)
            ->order(self::$order, self::$direction)
            ->limit(self::$limitTo, self::$startAt)
            ->joinAll();
    }

    public static function manyRelatedToMe($models) {
        $staticTable = TABLE_PREFIX.static::table();
        $baseColumnsAlias = self::selectedColumns(static::class);

        $joins = '';
        $columnsAlias = '';
        foreach ($models as $key => $model) {
            $columnsAlias .= self::selectedColumns($model).', ';
            $objectToSnakeCase = Util::objectToSnakeCase($model);
            $table = TABLE_PREFIX. $objectToSnakeCase;
            $column = (!is_numeric($key)) ? $key : self::relatedColumn($objectToSnakeCase);
            $joins .= self::instance()->openJoin($staticTable, $column, $table, self::$primaryKey);
        }

        $columnsAlias = rtrim($columnsAlias, ', ');
        return self::instance()
            ->table(static::table())
            ->selectBase("$baseColumnsAlias, $columnsAlias")
            ->closeJoin($joins)
            ->where(self::$where)
            ->order(self::$order, self::$direction)
            ->limit(self::$limitTo, self::$startAt)
            ->joinAll();
    }

    public static function relatedToMix($models) {
        $table1 = static::table();
        $staticTable = TABLE_PREFIX. $table1;
        $baseColumnsAlias = self::selectedColumns(static::class);

        $joins = '';
        $columnsAlias = '';
        foreach ($models as $key => $model) {
            $columnsAlias .= self::selectedColumns($model).', ';
            $objectToSnakeCase = Util::objectToSnakeCase($model);
            $table = TABLE_PREFIX. $objectToSnakeCase;
            if(str_contains($key, '-')) {
                $column = (!is_numeric($key) and $key != '-')
                    ? str_replace('-', '', $key)
                    : self::relatedColumn($objectToSnakeCase);
                $joins .= self::instance()->openJoin($staticTable, $column, $table, self::$primaryKey);
            }else {
                $column = (!is_numeric($key)) ? $key : self::relatedColumn($table1);
                $joins .= self::instance()->openJoin($staticTable, self::$primaryKey, $table, $column);
            }
        }

        $columnsAlias = rtrim($columnsAlias, ', ');
        return self::instance()
            ->table($table1)
            ->selectBase("$baseColumnsAlias, $columnsAlias")
            ->closeJoin($joins)
            ->where(self::$where)
            ->order(self::$order, self::$direction)
            ->limit(self::$limitTo, self::$startAt)
            ->joinAll();
    }

    public static function has($table2, $column, $where = null, $fetchedColumns = []) {

        $alias = strtolower(substr(explode('\\', $table2)[2], 0, 1));
        $table = TABLE_PREFIX.Util::objectToSnakeCase($table2);

        $baseColumns = self::columns(null, $table2);

        $baseColumnsString = '';
        foreach ($baseColumns as $baseColumn) {
            $baseColumnsString .= "$table.$baseColumn AS {$alias}_$baseColumn, ";
        }
        $baseColumnsString = rtrim($baseColumnsString, ", ");

        $fetchedColumns = implode(", $table.", $fetchedColumns);
        $baseTable = TABLE_PREFIX.self::table();


        return self::instance()
            ->table(self::table())
            ->selectBase("{$baseTable}.*, $baseColumnsString")
            ->inner($table, $column)
            ->join($where);
    }

    public static function alias($table, $length = 1) {
        return strtolower(substr(explode('\\', $table)[2], 0, $length));
    }
    public static function aliasCamel($table) {
        $camelArray = preg_split('/(?=[A-Z])/' , explode('\\', $table)[2], -1, PREG_SPLIT_NO_EMPTY );
        $alias = '';
        foreach ($camelArray as $item) {
            $alias .= strtolower(substr($item, 0, 1));
        }
        return $alias;
    }
    public static function hasInner($table2, $column, $where = null, $fetchedColumns = []) {
        $table = TABLE_PREFIX.Util::objectToSnakeCase($table2);
        $baseColumns = self::columns(null, $table2);

        $baseColumnsString = '';
        $alias = self::alias($table2);
        foreach ($baseColumns as $baseColumn) {
            $baseColumnsString .= "$table.$baseColumn AS {$alias}_$baseColumn, ";
        }
        $baseColumnsString = rtrim($baseColumnsString, ", ");

        $baseTable = TABLE_PREFIX.self::table();
        $fetchedColumns = implode(", $table.", $fetchedColumns);
        return self::instance()
            ->table(self::table())
            ->selectBase("{$baseTable}.*, $baseColumnsString")
            ->innerJoin($table, $column)
            ->join($where);
    }

    public static function hasInner2($table2, $column, $column2, $parent2, $where = null, $fetchedColumns = []) {
        $table = TABLE_PREFIX.Util::objectToSnakeCase($table2);

        $parent2Columns = self::columns(null, $parent2);
        $baseColumns = self::columns(null, $table2);
        $parent2 = TABLE_PREFIX.Util::objectToSnakeCase($parent2);

        $alias = self::alias($table2);
        $baseColumnsString = '';
        $parent2ColumnsString = '';

        foreach ($parent2Columns as $parent2Column) {
            $parent2ColumnsString .= "$parent2.$parent2Column AS p_$parent2Column, ";
        }
        foreach ($baseColumns as $baseColumn) {
            $baseColumnsString .= "$table.$baseColumn AS {$alias}_$baseColumn, ";
        }
        $parent2ColumnsString = rtrim($parent2ColumnsString, ", ");
        $baseColumnsString = rtrim($baseColumnsString, ", ");

        $parent1 = TABLE_PREFIX.self::table();
        $fetchedColumns = implode(", $table.", $fetchedColumns);
        return self::instance()
            ->table(self::table())
            ->selectBase("{$parent1}.*, $baseColumnsString, $parent2ColumnsString")
            ->innerJoin($table, $column)
            ->innerJoin($parent2, 'id', $table, $column2)
            ->join($where);
    }
    public static function join($table, $column, $leftTable, $rightColumn ) {
        $table = TABLE_PREFIX.Util::objectToSnakeCase($table);
        if($leftTable != null) $leftTable = TABLE_PREFIX.Util::objectToSnakeCase($leftTable);
        self::instance()
            ->inner($table, $column, $leftTable, $rightColumn );
    }

    public static function multiple($joins, $where = 1) {
        $db = self::instance()
            ->table(self::table())
            ->selectBase();
        $leftTable = null;
        foreach ($joins as $table => $column) {
            $columns = explode(',', $column);
            $leftColumn = $column;
            $rightColumn = null;
            if(isset($columns[1])) $leftColumn = $columns[1];
            if(isset($columns[0])) $rightColumn = $columns[0];
            self::join($table, $leftColumn, $leftTable, $rightColumn );
            $leftTable = $table;
        }
        return $db->join($where);
    }
    private static function leftJoin($db, $rightTable, $rightColumn, $leftTable = null, $leftColumn = null) {
        $rightTable = TABLE_PREFIX.Util::objectToSnakeCase($rightTable);
        if($leftTable != null) $leftTable = TABLE_PREFIX.Util::objectToSnakeCase($leftTable);
        $db->leftJoin($rightTable, $rightColumn, $leftTable, $leftColumn);
    }

    private static function inner($db, $rightTable, $rightColumn, $leftTable = null, $leftColumn = null) {
        $rightTable = TABLE_PREFIX.Util::objectToSnakeCase($rightTable);
        if($leftTable != null) $leftTable = TABLE_PREFIX.Util::objectToSnakeCase($leftTable);
        $db->inner($rightTable, $rightColumn, $leftTable, $leftColumn);
    }

    public static function inMultiple($joins, $where = 1) {

        $select = TABLE_PREFIX.self::table().'.*, ';

        foreach ($joins as $table => $columns) {
            $alias = self::aliasCamel($table);
            $pre = TABLE_PREFIX.Util::objectToSnakeCase($table);
            $joinColumns = self::columns(null, $table);
            foreach ($joinColumns as $column) {
                $select .= "$pre.$column AS {$alias}_$column, ";
            }
        }
        $select = rtrim($select, ', ');
        $db = self::instance()
            ->table(self::table())
            ->selectBase($select);
        foreach ($joins as $table => $column) {
            self::leftJoin($db, $table, $column);
        }
        return $db->join($where);
    }

    public static function hasMultiple($joins, $where = 1) {

        $select = TABLE_PREFIX.self::table().'.*, ';


        foreach ($joins as $table => $columns) {
            $alias = self::aliasCamel($table);
            $pre = TABLE_PREFIX.Util::objectToSnakeCase($table);
            $joinColumns = self::columns(null, $table);
            foreach ($joinColumns as $column) {
                $select .= "$pre.$column AS {$alias}_$column, ";
            }
        }
        $select = rtrim($select, ', ');

        $db = self::instance()
            ->table(self::table())
            ->selectBase($select);
        foreach ($joins as $table => $column) {
            self::inner($db, $table, 'id', self::table(), $column);
        }
        return $db->join($where);
    }

    public function hasMeany() {

    }


    public static function getData()
    {
        unset(self::$data[get_called_class()]->created_at);
        unset(self::$data[get_called_class()]->updated_at);
        $data = [];
        foreach (self::$data[get_called_class()] as $field => $entry) {
            if($entry === null) continue;
            $data[$field] = $entry;
        }
        return $data;
    }


}
