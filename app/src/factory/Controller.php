<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/4/2020
 *Time: 4:22 PM
 */

namespace Zikzay\factory;



use Zikzay\Lib\Util;

class Controller
{
    public function __construct($args)
    {
        if(empty($args)) {
            echo EL;
            echo "Enter Controller option (create/push):".EL.">> ";
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
                $this->create(ucwords(trim($options[1])).'Controller');
            }else {
                echo EL;
                echo "Enter the name of the Controller to create:".EL.">> ";
                $line = fgets(STDIN, 32);

                $this->create(ucwords(trim($line)).'Controller');
            }

        } else if($options[0] == 'push') {

            echo EL;
            echo "Enter Model option (create/push)2:".EL.">> ";
            $line = fgets(STDIN, 32);
        }

    }



    public function create($name) {
        $path = CONTROLLERS_PATH . DS . $name . '.php';
        $model = str_replace('Controller', '', $name);
        $resp = file_put_contents($path, $this->modelFrame($name, $model));

        $message = $resp ? 'Creating Controller - '. $name : 'An error occur while creating Model: ' . $name;
        Util::cmdPrint($message, 1);
    }

    private function modelFrame($name, $model){
        return (
            '<?php
namespace Zikzay\Controller;


use Zikzay\Core\Controller;
use Zikzay\Lib\Util;
use Zikzay\Model\\' .$model.';

class ' .$name.' extends Controller
{

    public function __construct()
    {
    }

    public function index () 
    {
        $this->render("index");
    }

    public function create () 
    {
        $this->render("'.strtolower($model).'.create");
    }
    
    public function details($id) 
    {
        $'.strtolower($model).' = '.$model.'::find($id);
        $this->render("'.strtolower($model).'.details", ["'.strtolower($model).'"=>$'.strtolower($model).']);
    }
    
    public function store() 
    {
        $' .strtolower($model).' = new ' .$model.'();
        $this->request($' .strtolower($model).');
        $'.strtolower($model).'->save();
        Util::redirect("'.strtolower($model).'/create");
    }
    
    public function edit($id) 
    {
        $'.strtolower($model).' = '.$model.'::find($id);
        $this->render("'.strtolower($model).'.edit", ["'.strtolower($model).'"=>$'.strtolower($model).']);
    }
    
    public function update($id) 
    {        
        $'.strtolower($model).' = (object) '.$model.'::find($id);
        $this->request($'.strtolower($model).', false);
        $'.strtolower($model).'->save();
        Util::redirect("'.strtolower($model).'/edit/$id");
    }

    public function delete($id)
    {
        $'.strtolower($model).' = (object) '.$model.'::find($id);
        $'.strtolower($model).'->delete();
        Util::redirect("'.strtolower($model).'");
    }

    public function active($params)
    {
        if(count($params) == 2) {
            $'.strtolower($model).' = (object) '.$model.'::find($params[0]);
            $'.strtolower($model).'->active = $params[1];
            $'.strtolower($model).'->save();
        }
        Util::redirect("'.strtolower($model).'");
    }

}');
    }
}