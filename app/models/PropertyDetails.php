<?php
namespace Zikzay\Model;

use stdClass as std;
use Zikzay\Core\Model;

class PropertyDetails extends Model {

    public $label;
    public $detail;
    public $property;

    public function __construct()
    {
        parent::__construct();
    }

    public static function define(std $field) : std
    {
        $field->id = self::primaryKey();
        $field->label = self::stringField(255);
        $field->detail = self::stringField(255);
        $field->property = self::intField();
        $field->created_at = self::timestampField();
        $field->updated_at = self::timestampField(true);
        
        return $field;
    }
    
    
}