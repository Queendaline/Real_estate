<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/4/2020
 *Time: 4:22 PM
 */

namespace Zikzay\factory;



use Zikzay\Lib\Util;

class Model
{
    public function __construct($args)
    {
        if(empty($args)) {
            echo EL;
            echo "Enter Model option (create/push):".EL.">> ";
            $line = fgets(STDIN, 32);

            $this->make($line);

        } else {
            $this->make($args);
        }

        Util::autoload();
    }

    private function make($options)
    {

        if(!is_array($options)) {
            $options = explode(' ', $options);
        }
        if(trim($options[0]) == 'create') {

            if(isset($options[1])) {
                $this->create(ucwords(trim($options[1])));
            }else {
                echo EL;
                echo "Enter the name of the Model to create:".EL.">> ";
                $line = fgets(STDIN, 32);

                $this->create(ucwords(trim($line)));
            }

        } else if($options[0] == 'push') {

            echo EL;
            echo "Enter Model option (create/push)2:".EL.">> ";
            $line = fgets(STDIN, 32);
        }

    }



    public function create($name) {
        $path = MODELS_PATH . DS . $name . '.php';

        echo EL;
        echo "Enter model properties ane types separated by comma:".EL.">> ";
        $line = fgets(STDIN, 1000);

        $properties = $this->modelProperties($line);

        $resp = file_put_contents($path, $this->modelFrame($name, $properties[0], $properties[1]));

        $message = $resp ? 'Creating Model ' : 'An error occur while creating Model: ' . $name;
        Util::cmdPrint($message, 1);
    }

    private function modelFrame($name, $properties, $propertyTypes){
        return (
            '<?php
namespace Zikzay\Model;

use stdClass as std;
use Zikzay\Core\Model;

class '.$name.' extends Model {
'.$properties.'

    public function __construct()
    {
        parent::__construct();
    }

    public static function define(std $field) : std
    {
        $field->id = self::primaryKey();'.$propertyTypes.'
        $field->created_at = self::timestampField();
        $field->updated_at = self::timestampField(true);
        
        return $field;
    }
    
    
}');
    }

    private function modelProperties(string $line)
    {
        $fields = explode(',', $line);
        if(count($fields) == 1) {
            return ['', '        //Enter more fields here'];
        }else {
            $stringProperties = '';
            $stringFields = '';
            foreach ($fields as $field) {
                $property = '';
                $type = '';
                $length = '';
                $var = explode('/', $field);
                if(isset($var[0])) $property = strtolower(str_replace(' ', '_', trim($var[0])));
                if(isset($var[1])) $type = trim(strtolower($var[1]));
                if(isset($var[2])) $length = trim($var[2]);

                $stringProperties .= '
    public $'.$property.';';
                $stringFields .= '
        $field->'.$property.' = self::'.$type.'Field('.$length.');';
            }
        }
        return [$stringProperties, $stringFields];
        //day string 40, age int
    }
}