<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/28/2020
 *Time: 5:13 AM
 */

namespace Zikzay\Database;


use PDO;
use PDOException;

abstract class DB
{
    private $db;
    protected function __construct()
    {
        try {
            $options = [
                PDO::ATTR_CASE => PDO::CASE_NATURAL,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_ORACLE_NULLS => PDO::NULL_NATURAL,
                PDO::ATTR_STRINGIFY_FETCHES => false,
                PDO::ATTR_EMULATE_PREPARES => false,
            ];
            $this->db = new PDO(DB_DRIVER . ':host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASSWORD, $options);
        } catch (PDOException $e) {
            return $e->getMessage();
        }
        return false;
    }

    /**
     * @return PDO
     */
    public function getDb(): PDO
    {
        return $this->db;
    }


    public static function dbInstance()
    {
        return (static::$dbInstance == null)
            ? new Database()
            : static::$dbInstance;
    }


    public function createDatabase()
    {
//        $this->sql = "CREATE DATABASE IF NOT EXISTS " . DB_NAME;
//        if (!isset(self::$dbInstance)) {
//            self::$dbInstance = (new self());
//        }
//        return self::$dbInstance;
    }
}