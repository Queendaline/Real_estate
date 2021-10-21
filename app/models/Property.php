<?php
namespace Zikzay\Model;

use stdClass as std;
use Zikzay\Core\Model;

class Property extends Model {

    public $propertyid;
    public $title;
    public $price;
    public $type;
    public $status;
    public $area;
    public $description;

    public function __construct()
    {
        parent::__construct();
    }

    public static function define(std $field) : std
    {
        $field->id = self::primaryKey();
        $field->propertyid = self::stringField(16);
        $field->title = self::stringField();
        $field->price = self::intField();
        $field->type = self::stringField();
        $field->status = self::stringField();
        $field->area = self::stringField();
        $field->description = self::textField();
        $field->created_at = self::timestampField();
        $field->updated_at = self::timestampField(true);
        
        return $field;
    }
    
    
}