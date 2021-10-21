<?php
namespace Zikzay\Model;

use stdClass as std;
use Zikzay\Core\Model;

class Token extends Model {

    public $token;
    public $admin;
    public $phone;

    public function __construct()
    {
        parent::__construct();
    }

    public static function define(std $field) : std
    {
        $field->id = self::primaryKey();
        $field->token = self::stringField(32);
        $field->admin = self::nameField();
        $field->phone = self::phoneField();
        $field->created_at = self::timestampField();
        $field->updated_at = self::timestampField(true);
        
        return $field;
    }
    
    
}