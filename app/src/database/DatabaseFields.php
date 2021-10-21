<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/25/2020
 *Time: 10:50 AM
 */

namespace Zikzay\Core;


use Zikzay\Database\Database;
use Zikzay\Lib\Util;
use Zikzay\Model\Users;

trait DatabaseFields
{

    private static function null($null) {
        return ($null == null) ? 'NULL' : 'NOT NULL';
    }
    private static function default($defaultValue){

        return $defaultValue == null ? '' : "DEFAULT '" . $defaultValue . "'";
    }
    public static function primaryKey($field = 'id', $columnType = null, $auto_increment = true) : array {
        $type = $columnType != null ? Util::type($columnType) : 'INT';
        $ai = $auto_increment ? 'AUTO_INCREMENT' : '';

        return ['type' => $type . ' NOT NULL ',
            'auto_increment' => $ai,
            'primary_key' => "PRIMARY KEY (`{$field}`)",
            'primaryKey' => ''
        ];
    }

    public static function foreignKey($model, $column, $attrs = [])
    {
        $model = 'Zikzay\Model\\' . ucwords($model);
        $fieldType = $model::define(new \stdClass())->$column;
        $table = TABLE_PREFIX.(Util::objectToSnakeCase($model));
        $attributes = $attrs == [] ? 'ON DELETE CASCADE ON UPDATE CASCADE' : implode(' ', $attrs);
        $column = $column != null ? $column : Database::dbInstance()->table($table)->getPrimaryKey();
        return [
            'reference' => "REFERENCES `{$table}`(`$column`) {$attributes}",
            'type' => $fieldType['type'],
            'foreignKey' => ''
        ];
    }

    public static function usernameField(int $length = USERNAME_LENGTH) : array {
        $attributes = [
            'type' => "VARCHAR({$length})",
            'null' => self::null(false),
            'unique' => '',
            'username' => ''
        ];
        return $attributes;
    }

    public static function passwordField(int $length = DB_PASSWORD_LENGTH) : array {
        $attributes =   [
            'type' => "VARCHAR({$length})",
            'null' => self::null(false),
            'password' => ''
        ];
        return $attributes;
    }

    public static function emailField(bool $null = false, bool $unique = true, int $length = EMAIL_LENGTH) : array {
        $attributes = [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'email' => ''
        ];
        if($unique) $attributes['unique'] = '';
        return $attributes;
    }

    public static function phoneField(bool $null = false, bool $unique = true, int $length = PHONE_LENGTH) : array {
        $attributes =  [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'phone' => ''
        ];
        if($unique) $attributes['unique'] = '';
        return $attributes;
    }

    public static function booleanField($defaultValue = 0, $null = false, $signed = false, bool $unique = false) : array {
       $sign = $signed ? '' : 'UNSIGNED';
        $attributes =   [
            'type' => "TINYINT(1) {$sign}",
            'null' => self::null($null),
            'default' => self::default($defaultValue)
        ];
        if($unique) $attributes['unique'] = '';
        return $attributes;
    }

    public static function numberField($null = false, $defaultValue = null, $signed = false, bool $unique = false) : array {
       $sign = $signed ? '' : 'UNSIGNED';
        $attributes =   [
            'type' => "INT {$sign}",
            'null' => self::null($null),
            'default' => self::default($defaultValue)
        ];
        if($unique) $attributes['unique'] = '';
        return $attributes;
    }

    public static function intField($null = false, $defaultValue = null, $signed = false, bool $unique = false) : array {
        $sign = $signed ? '' : 'UNSIGNED';
        $attributes = [
            'type' => "INT {$sign}",
            'null' => self::null($null),
            'default' => self::default($defaultValue)
        ];
        if($unique) $attributes['unique'] = '';
        return $attributes;
    }

    public static function uniqueIntField($null = false, $signed = false) : array {
        $sign = $signed ? '' : 'UNSIGNED';
        $attributes =   [
            'type' => "INT {$sign}",
            'null' => self::null($null),
            'unique' => ''
        ];
        return $attributes;
    }

    public static function floatField($null = false, $defaultValue = null) : array {
        $attributes =   [
            'type' => 'FLOAT',
            'null' => self::null($null),
            'default' => self::default($defaultValue)
        ];
        return $attributes;
    }

    public static function uniqueFloatField($null = false) : array {
        $attributes = [
            'type' => 'FLOAT',
            'null' => self::null($null),
            'unique' => ''
        ];
        return $attributes;
    }

    public static function timestampField($onUpdate = false, $null = false, $defaultValue = 'CURRENT_TIMESTAMP') : array {
        $onUpdate = $onUpdate ? 'on update CURRENT_TIMESTAMP' : '';
        $attributes =   [
            'type' => 'TIMESTAMP',
            'onUpdate' => $onUpdate,
            'null' => self::null($null),
            'default' => 'DEFAULT ' . $defaultValue
        ];
        return $attributes;
    }

    public static function datetimeField($onUpdate = false, $null = false, $defaultValue = 'CURRENT_TIMESTAMP') : array {
        $onUpdate = $onUpdate ? 'on update CURRENT_TIMESTAMP' : '';
        $attributes =   [
            'type' => 'DATETIME',
            'null' => self::null($null),
            'default' => 'DEFAULT ' . $defaultValue
        ];
        return $attributes;
    }

    public static function timeField($onUpdate = false, $null = false, $defaultValue = null) : array {
        $onUpdate = $onUpdate ? 'on update CURRENT_TIMESTAMP' : '';
        $attributes =   [
            'type' => 'TIME',
            'null' => self::null($null),
            'default' => self::default($defaultValue),
            'time' => ''
        ];
        return $attributes;
    }

    public static function dateField($onUpdate = false, $null = false, $defaultValue = null) : array {
        $onUpdate = $onUpdate ? 'on update CURRENT_TIMESTAMP' : '';
        $attributes =   [
            'type' => 'DATE',
            'null' => self::null($null),
            'default' => self::default($defaultValue),
            'date' => ''
        ];
        return $attributes;
    }

    public static function yearField($onUpdate = false, $null = false, $defaultValue = null) : array {
        $onUpdate = $onUpdate ? 'on update CURRENT_TIMESTAMP' : '';
        $attributes =   [
            'type' => 'YEAR',
            'null' => self::null($null),
            'default' => self::default($defaultValue),
            'year' => ''
        ];
        return $attributes;
    }

    public static function monthField(int $length = CHAR_LENGTH_X3 + 1, $null = false, $defaultValue = null) : array {
        $attributes =   [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'default' => self::default($defaultValue),
            'month' => ''
        ];
        return $attributes;
    }

    public static function monthNumberField(int $length = CHAR_LENGTH_X1, $null = false, $defaultValue = null) : array {
        $attributes =   [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'default' => self::default($defaultValue),
            'monthNumber' => ''
        ];
        return $attributes;
    }

    public static function dayField(int $length = CHAR_LENGTH_X3 + 1, $null = false, $defaultValue = null) : array {
        $attributes =   [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'default' => self::default($defaultValue),
            'day' => ''
        ];
        return $attributes;
    }

    public static function textField($null = false, $defaultValue = null) : array {
        $attributes =   [
            'type' => 'TEXT',
            'null' => self::null($null),
            'default' => self::default($defaultValue)
        ];
        return $attributes;
    }

    public static function uniqueStringField(int $length = CHAR_LENGTH_X5, $null = false, $defaultValue = null) : array {
        $attributes =   [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'default' => self::default($defaultValue),
            'unique' => ''
        ];
        return $attributes;
    }

    public static function stringField(int $length = CHAR_LENGTH_X8, $null = false, $defaultValue = null, $unique = false) : array {
        $attributes =  [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'default' => self::default($defaultValue)
        ];
        if($unique) $attributes['unique'] = '';
        return $attributes;
    }

    public static function charField(int $length = CHAR_LENGTH_X5, $null = false, $defaultValue = null, $unique = false) : array {
        $attributes = [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'default' => self::default($defaultValue)
        ];
        if($unique) $attributes['unique'] = '';
        return $attributes;
    }

    public static function nameField(int $length = CHAR_LENGTH_X6, $null = false, $defaultValue = null, $unique = false) : array {
        $attributes =  [
            'type' => "VARCHAR({$length})",
            'null' => self::null($null),
            'default' => self::default($defaultValue),
            'name' => ''
        ];
        if($unique) $attributes['unique'] = '';
        return $attributes;
    }
}
/**
 * CREATE TABLE `app_man`.
 * ( `id` INT NOT NULL AUTO_INCREMENT ,
 * `student_class` VARCHAR(255) NOT NULL ,
 * `student_id` INT NOT NULL ,
 * PRIMARY KEY (`id`)) ENGINE = InnoDB;
 *
 *ALTER TABLE `test_student` ADD FOREIGN KEY (`student_id`) REFERENCES `uni_student`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
 */