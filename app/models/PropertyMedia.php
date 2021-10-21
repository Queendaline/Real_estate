<?php
namespace Zikzay\Model;

use stdClass as std;
use Zikzay\Core\Model;

class PropertyMedia extends Model {

    public $property;
    public $media;
    public $type;

    public function __construct()
    {
        parent::__construct();
    }

    public static function define(std $field) : std
    {
        $field->id = self::primaryKey();
        $field->property = self::intField();
        $field->media = self::stringField(64);
        $field->type = self::stringField(16);
        $field->created_at = self::timestampField();
        $field->updated_at = self::timestampField(true);
        
        return $field;
    }
    
    
}