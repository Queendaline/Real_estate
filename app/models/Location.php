<?php
namespace Zikzay\Model;

use stdClass as std;
use Zikzay\Core\Model;

class Location extends Model {

    public $property;
    public $address;
    public $city;
    public $state;
    public $country;

    public function __construct()
    {
        parent::__construct();
    }

    public static function define(std $field) : std
    {
        $field->id = self::primaryKey();
        $field->property = self::intField();
        $field->address = self::stringField(255);
        $field->city = self::stringField(64);
        $field->state = self::stringField(64);
        $field->country = self::stringField(64);
        $field->created_at = self::timestampField();
        $field->updated_at = self::timestampField(true);
        
        return $field;
    }
    
    
}