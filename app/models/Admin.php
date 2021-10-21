<?php
namespace Zikzay\Model;

use stdClass as std;
use Zikzay\Core\Model;

class Admin extends Model {

    public $token;
    public $name;
    public $email;
    public $phone;
    public $password;

    public function __construct()
    {
        parent::__construct();
    }

    public static function define(std $field) : std
    {
        $field->id = self::primaryKey();
        $field->token = self::stringField(32);
        $field->name = self::nameField();
        $field->email = self::emailField();
        $field->phone = self::phoneField();
        $field->password = self::passwordField();
        $field->created_at = self::timestampField();
        $field->updated_at = self::timestampField(true);
        
        return $field;
    }
    
    
}