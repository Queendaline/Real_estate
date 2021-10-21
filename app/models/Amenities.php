<?php
namespace Zikzay\Model;

use stdClass as std;
use Zikzay\Core\Model;

class Amenities extends Model {

    public $property;
    public $amenity;

    public function __construct()
    {
        parent::__construct();
    }

    public static function define(std $field) : std
    {
        $field->id = self::primaryKey();
        $field->property = self::intField();
        $field->amenity = self::stringField(255);
        $field->created_at = self::timestampField();
        $field->updated_at = self::timestampField(true);
        
        return $field;
    }
    
    
}