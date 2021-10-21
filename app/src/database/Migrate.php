<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/23/2020
 *Time: 11:47 PM
 */

namespace Zikzay\Database;

use Zikzay\Lib\Util;


class Migrate extends Migration
{
    public function __construct()
    {
        if (php_sapi_name() != 'cli') {
            Util::cmdPrint(false, 'Access denied');
            exit();
        }
        Util::autoload();
    }

    public function create() {

        // TODO : Most importantly, arrange the migration class to look organised for easy management purpose
        // TODO : Allow migration also on browser
        // TODO : Add to config file - protect migration with a password, (Default value: FALSE)
        // TODO : Add to config file - allow automatic migration when model class change
        // TODO : Create a migration table and add generated migration to the database
        // TODO : Generate a rollback migration too
        // TODO : Fetch existing model structure and compare with last generated migration
        // TODO : Generate a migration that apply to only changed model structure with current database structure

        $fileName = "Migration_".date('ymd_His', time());
        $path = MIGRATIONS_PATH . DS . $fileName . '.php';

        $models = scandir(MODELS_PATH);

        require_once ROOT . DS . 'app' . DS . 'src' . DS .'core'. DS . 'Model.php';
        $up = '';
        $foreignKeyModels = array();
        foreach ($models as $model) {
            if($model == '..' || $model == '.') continue;
            $ret =  $this->singleModel($model, $foreignKeyModels);
            $up .= $ret[0];
            $foreignKeyModels = $ret[1];

        }
        $up .= $this->singleModelForeignKey($foreignKeyModels);
        $classFrame = $this->generateClass($fileName);
        $content = sprintf($classFrame, "$up", '');
        $resp = file_put_contents($path, $content);

        $message = $resp ? 'Generating migration file ' : 'An error occur while generating migration file';
        Util::cmdPrint($message, 1);
    }

    private function singleModel($model, $foreignKeyModels)
    {

        $std = new \stdClass();
        $model = str_replace('.php', '', $model);
        $class = 'Zikzay\Model\\' . $model;
        $model = new $class;
        $std = ($model)->define($std);
        $table = (Util::objectToSnakeCase($model));
        $up  = '        ' . $this->table($std, $table) .';'.EL;
        $foreignKeyModel = array();
        foreach ($std as $key => $values) {
            if(is_array($values)) {
                if (array_key_exists('primaryKey', $values)) continue;
                if (array_key_exists('foreignKey', $values)) {
                    $foreignKeyModel[$key] = $values;
                    $foreignKeyModels[$table] = $foreignKeyModel;
                }else {
                    $up .= '        $' . 'this->addColumn("' . $table . '", "' . $key . '", "' . implode(' ', $values) . '");' . EL;
                }
            }
        }
        $up .= EL;
        return [$up, $foreignKeyModels];
    }

    private function singleModelForeignKey($foreignKeyModels)
    {
        $up  = '' ;

        foreach ($foreignKeyModels as $table => $columns) {
            foreach ($columns as $key => $values) {
                if (is_array($values)) {
                    $up .= '        $' . 'this->addColumnForeignKey("' . $table . '", "' . $key . '", "' .
                        $values['type'] . '", "' . $values['reference'] . '");' . EL;
                }
            }
        }

        return $up .= EL;
    }

    private function table($std, $table) : string
    {
        foreach ($std as $key => $values) {
            if(array_key_exists('primaryKey', $values)){
                $field = $key;
                $type = $values['type'];
                $auto_increment = $values['auto_increment'];
                return '$this->createTable("'.$table .'", "' . $field .'", "' . $type . '", " ' .  $auto_increment .'")';
            }
        }
        return '$this->createTable("'.$table .'")';
    }

    public function migrate() {
        Util::autoload();
        $migrations = scandir(MIGRATIONS_PATH);
        $migration = $migrations[array_key_last($migrations)];
        $path =  MIGRATIONS_PATH . DS . $migration;

        if(count($migrations) > 2) {
            require_once $path;
            $class = 'Zikzay\Database\\' . str_replace('.php', '', $migration);
            $obj = new $class;
            $obj->up();
        } else {
            Util::cmdPrint('No migration file found', -1);
        }

    }

    private function generateClass($fileName){
        return (
            '<?php
namespace Zikzay\Database;


class '.$fileName.' extends Migration {

    public function up() { 
%s
    }
    
    public function down() { 
        %s
    }
}');
    }

    function up()
    {
        // TODO: Implement up() method.
    }

    function down()
    {
        // TODO: Implement down() method.
    }
}







//            else
//                $up .= '        $'.'this->addColumn("'.$table .'", "'.$key .'", "'. $values .'");'.EL;
//            $up .= '        $'.'this->addIndex("'.$table .'", "'.$key .'");'.EL;