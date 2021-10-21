<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/24/2020
 *Time: 3:29 PM
 */

namespace Zikzay\Lib;

 /**
     * Abstract class that serves as the Model in the MVC framework.
     *
     * A Model is a representation of the information in the application. A Model's
     * data is saved in the database and the class is used to handle all the
     * business logics. This class handles the standard create, read, update
     * and delete operations. It must be extended to create the concrete
     * implementation of a Model, and handle any other business logics specific to
     * that Model.
     *
     * The name of the extended class must correlate directly to the name of the
     * database table it is saving it's data into. The name of the class will be
     * [table_name]_model. So, for example to represent a user in the application,
     * there needs to be a class called "user_model" and a database table called
     * "user". If a different table name is needed, it can be specified in
     * self::$table_name.
     *
     * The Model's data is represented in the class as an element in the
     * self::$properties array. The index of the array is the Model's property name
     * and must translate directly to a column with the same name in the database
     * table. There can only be one Primary Key in the table, and is in the format
     * [table_name]_id. If a different Primary Key name is needed, it can be
     * specified in self::$primary_key_name.
     *
     * @package Framework
     */
 class Model
{
    protected $table_name = '';
    protected $primary_key_name = '';
    protected $properties = array();
    protected $indexes = array();
    protected $parent_objects = array();
    protected $conditions = array();


    protected function __construct()
    {
        $this->table_name = $this->get_table_name();
        $this->primary_key_name = $this->get_primary_key_name();

        $this->add_property($this->primary_key_name, 'INT', '11', 'Primary Key', 1, '', '', '', 1);

        $system = system::get_instance();
        $schema_file = $system->schemas_path . '/' . get_class($this) . '.schema.php';
        $default_schema_file = $system->default_schemas_path . '/' . get_class($this) . '.schema.php';

        if (file_exists($schema_file)) {
            include $schema_file;
        } elseif (file_exists($default_schema_file)) {
            include $default_schema_file;
        } else {
            throw new Exception('Schema file for ' . get_class($this) . ' does not exist');
        }

        $this->add_property('created_date_time', 'DATETIME', '', 'Date/Time the record was created');
        $this->add_property('created_by', 'INT', '11', 'user_id of user who created the record');
        $this->add_property('updated_date_time', 'DATETIME', '', 'Date/Time the record was last updated');
        $this->add_property('updated_by', 'INT', '11', 'user_id of user who last updated the record');

        foreach ($this->properties as $name => $properties) {
            if (strlen($properties['foreign_key_parent']) > 0) {
                $fk_parts = $this->parse_foreign_key_parent($properties['foreign_key_parent']);
                $this->parent_objects[$fk_parts['class_name']] = new $fk_parts['class_name'];
            }
        }
    }


    /**
     * Overrides the default __get() and returns the value of the Model's
     * property, or the related object of a parent class, in that precedence
     * order. A special property name "primary_key" will return the value of
     * the object's Primary Key.
     *
     * @param string $property_or_class_name
     * @return mixed
     */
    protected final function __get($property_or_class_name)
    {
        if ($property_or_class_name == 'primary_key') {
            return $this->properties[$this->primary_key_name]['value'];
        } elseif (array_key_exists($property_or_class_name, $this->properties)) {
            return $this->properties[$property_or_class_name]['value'];
        } elseif (array_key_exists($property_or_class_name, $this->parent_objects)) {
            return $this->parent_objects[$property_or_class_name];
        } else {
            throw new Exception(get_class($this) . ' property/parent_object ' . $property_or_class_name . ' does not exist');
            return '';
        }
    }


    /**
     * Overrides the default __set() and sets the value of the Model's property,
     * if it exists.
     *
     * @param string $property_name
     * @param string $property_value
     * @return boolean
     */
    protected final function __set($property_name, $property_value)
    {
        if (array_key_exists($property_name, $this->properties)) {
            if ($this->properties[$property_name]['is_protected']) {
                throw new Exception('Cannot set value of protected property');
                return false;
            } else {
                $this->properties[$property_name]['value'] = $property_value;
            }
        } else {
            throw new Exception(get_class($this) . ' property ' . $property_name . ' does not exist');
            return false;
        }

        return true;
    }


    /**
     * Returns the table name associated to this Model. If self::$table_name is
     * empty, it will deduce the table name from the class name.
     *
     * @return string
     */
    public final function get_table_name()
    {
        $result = '';

        if ($this->table_name == '') {
            $result = str_replace('_model', '', get_class($this));
        } else {
            $result = $this->table_name;
        }

        return $result;
    }


    /**
     * Returns the primary key name associated to this Model. If
     * self::$primary_key_name is empty, it will deduce the primary key name
     * from the table name.
     *
     * @return string
     */
    protected final function get_primary_key_name()
    {
        $result = '';

        if ($this->primary_key_name == '') {
            $result = $this->get_table_name() . '_id';
        } else {
            $result = $this->primary_key_name;
        }

        return $result;
    }


    /**
     * Adds a model property by adding an element to the self::$properties array.
     *
     * @param string $property_name
     * @param string $data_type
     * @param string $data_length
     * @param string $description
     * @param boolean $is_protected
     * @param string $foreign_key_parent Either '' to indicate non-foreign_key, or e.g. 'user.user_id' to indicate foreign key and it's parent property.
     * @param string $delete_action Will be used if property is a foreign_key; possible values are 'restrict', 'cascade', 'none'.
     * @param string $update_action Will be used if property is a foreign_key; possible values are 'restrict', 'cascade', 'none'.
     * @param boolean $is_primary_key
     * @return boolean
     * @todo   Add code to verify the parameters e.g. property_name, data_type/length.
     */
    protected final function add_property($property_name, $data_type, $data_length = '', $description = '', $is_protected = 0, $foreign_key_parent = '', $delete_action = 'restrict', $update_action = 'none', $is_primary_key = 0)
    {
        $this->properties[$property_name] = array(

            'value' => '',
            'data_type' => $data_type,
            'data_length' => $data_length,
            'description' => $description,
            'is_protected' => $is_protected,
            'foreign_key_parent' => $foreign_key_parent,
            'delete_action' => $delete_action,
            'update_action' => $update_action,
            'is_primary_key' => $is_primary_key,

        );

        return true;
    }


    /**
     * Adds an index to the model by adding an element to the self::$indexes
     * array.
     *
     * @param string $index_name
     * @param mixed $index_fields If string, it's a one column index; If array, it's a multiple column index.
     * @param boolean $is_unique_index
     * @return boolean
     * @todo   Add code to verify the parameters e.g. index_name/fields.
     */
    protected final function add_index($index_name, $index_fields, $is_unique_index = 0)
    {
        $this->indexes[$index_name] = array(

            'fields' => $index_fields,
            'is_unique' => $is_unique_index,

        );

        return true;
    }


    /**
     * Returns an array of the parent class name and the corresponding property
     * from the foreign_key_parent name.
     *
     * @param string $foreign_key_parent_name
     * @return array
     */
    protected function parse_foreign_key_parent($foreign_key_parent_name)
    {
        $result = array();

        $fk_parts = explode('.', $foreign_key_parent_name);
        if (count($fk_parts) != 2) throw new Exception('Invalid foreign_key_parent value ' . $foreign_key_parent_name);

        $result['class_name'] = $fk_parts[0];
        $result['property_name'] = $fk_parts[1];

        return $result;
    }


    /**
     * Returns an array of the class's properties' names.
     *
     * @return array
     */
    public function get_property_names()
    {
        $result = array_keys($this->properties);
        return $result;
    }


    /**
     * Adds a condition that makes up the WHERE clause(s) when doing a load().
     *
     * @param string $left
     * @param string $right
     * @param string $operator
     * @param boolean $is_value
     * @return boolean
     */
    public function add_condition($left, $right, $operator, $is_value = true)
    {
        $database = database::get_instance();
        $this->conditions[] = $left . " " . $operator . " " . ($is_value ? "'" : "") . $database->escape_string($right) . ($is_value ? "'" : "");
        return true;
    }


    /**
     * Automatically called before self::load(), so can be overriden to add any
     * operations to be done before loading data.
     *
     * @return boolean
     */
    protected function preload()
    {
        return true;
    }


    /**
     * Loads data from database and populates self::$properties based on
     * self::$conditions which builds the WHERE clause. If a $results array is
     * passed in by reference, then it will be populated with an object (of this
     * class) for each matching record found. Elements are added at the end of
     * the $results array, so existing elements are not affected.
     *
     * @param array $results
     * @param string $group_by
     * @param string $order_by
     * @param integer $start_row
     * @param integer $limit
     * @return boolean
     */
    protected function load(&$results = array(), $group_by = '', $order_by = '', $start_row = 0, $limit = 1)
    {
        if (!is_array($results)) {
            throw new Exception('$results must be an array');
            return false;
        }

        if (!$this->preload()) {
            throw new Exception('preload() on ' . get_class($this) . ' failed');
            return false;
        }

        $database = database::get_instance();
        $primary_key_name = $this->primary_key_name;

        $sql = "SELECT ";

        foreach ($this->properties as $name => $detail) {
            $sql .= "`" . $this->table_name . "`.`" . $name . "` AS `" . $this->table_name . "_" . $name . "`, ";
        }

        foreach ($this->parent_objects as $parent_object) {
            foreach ($parent_object->get_property_names() as $property_name) {
                $sql .= "`" . $parent_object->get_table_name() . "`.`" . $property_name . "` AS `" . $parent_object->get_table_name() . "_" . $property_name . "`, ";
            }
        }

        $sql = substr($sql, 0, -2) . " ";
        $sql .= "FROM `" . $this->table_name . "`, ";

        foreach ($this->parent_objects as $parent_object) {
            $sql .= "`" . $parent_object->get_table_name() . "`, ";
        }

        $sql = substr($sql, 0, -2) . " ";
        $sql .= "WHERE 1 ";

        foreach ($this->properties as $name => $properties) {
            if (strlen($properties['foreign_key_parent']) > 0) {
                $fk_parts = $this->parse_foreign_key_parent($properties['foreign_key_parent']);
                $tmp_object = new $fk_parts['class_name'];
                $sql .= "AND `" . $this->table_name . "`.`" . $name . "` = `" . $tmp_object->get_table_name() . "`.`" . $fk_parts['property_name'] . "` ";
                unset($tmp_object);
            }
        }

        foreach ($this->conditions as $condition) {
            $sql .= "AND " . $condition . " ";
        }

        if (strlen($group_by) > 0) {
            $sql .= "GROUP BY " . $group_by . " ";
        }

        if (strlen($order_by) > 0) {
            $sql .= "ORDER BY " . $order_by . " ";
        }

        if ($limit > 0) {
            $sql .= "LIMIT " . $start_row . ", " . $limit;
        }

        $sql .= ";";

        try {
            $result_id = $database->query($sql);
        } catch (Exception $e) {
            $this->synchronise_database();
            $result_id = $database->query($sql);
        }

        while ($row = $database->fetch_object($result_id)) {
            foreach ($this->properties as $property_name => $property_value) {
                $column_name = $this->table_name . '_' . $property_name;
                $this->properties[$property_name]['value'] = $row->$column_name;
            }

            foreach ($this->parent_objects as $class_name => $parent_object) {
                $property_names = $parent_object->get_property_names();

                foreach ($property_names as $property_name) {
                    $column_name = $parent_object->get_table_name() . '_' . $property_name;

                    try {
                        $this->parent_objects[$class_name]->$property_name = $row->$column_name;
                    } catch (Exception $e) {
                        // Cannot set a "protected" property of parent object, so just ignore it
                    }
                }
            }

            if (is_array($results)) {
                $results[] = clone $this;
            } else {
                break;
            }
        }

        if (!$this->postload()) {
            throw new Exception('postload() on ' . get_class($this) . ' failed');
            return false;
        }

        return true;
    }


    /**
     * Automatically called after self::load(), so can be overriden to add any
     * operations to be done after loading data.
     *
     * @return boolean
     */
    protected function postload()
    {
        return true;
    }


    /**
     * Automatically called before self::save(), so can be overriden to add any
     * operations to be done before saving data.
     *
     * @return boolean
     */
    protected function presave()
    {
        return true;
    }


    /**
     * Saves data from self::$properties values into database. If Primary Key
     * value is not already set, a unique Primary Key is generated and a new
     * record in the database is created.
     *
     * @return boolean
     */
    public function save()
    {
        if (!$this->presave()) {
            throw new Exception('presave() on ' . get_class($this) . ' failed');
            return false;
        }

        $session = session::get_instance();
        $database = database::get_instance();

        $primary_key_name = $this->primary_key_name;
        $date_time_now = date('Y-m-d H:i:s');
        $this->updated_date_time = $date_time_now;
        $this->updated_by = $session->user_id;

        foreach ($this->properties as $name => $detail) {
            $value = $detail['value'];
            if ($detail['data_type'] == 'INT' && $value == '') $this->properties[$name]['value'] = '0';
        }

        if (!$this->$primary_key_name) {
            $this->properties[$primary_key_name]['value'] = $this->get_next_id();
            $this->created_date_time = $date_time_now;
            $this->created_by = $session->user_id == '' ? '0' : $session->user_id;

            $sql = "INSERT INTO `" . $this->table_name . "` (
                 `" . implode('`, `', array_keys($this->properties)) . "`
               ) VALUES (
                 ";

            foreach ($this->properties as $name => $detail) {
                $sql .= "'" . $database->escape_string($detail['value']) . "', ";
            }

            $sql = substr($sql, 0, -2);
            $sql .= "
               );";
        } else {
            $sql = "UPDATE `" . $this->table_name . "`
               SET    ";

            foreach ($this->properties as $name => $detail) {
                $sql .= "`" . $name . "` = '" . $database->escape_string($detail['value']) . "', ";
            }

            $sql = substr($sql, 0, -2);
            $sql .= "
               WHERE  `" . $primary_key_name . "` = '" . $this->$primary_key_name . "';";
        }

        try {
            $database->query($sql);
        } catch (Exception $e) {
            $this->synchronise_database();
            $database->query($sql);
        }

        if (!$this->postsave()) {
            throw new Exception('postsave() on ' . get_class($this) . ' failed');
            return false;
        }

        return true;
    }


    /**
     * Automatically called after self::save(), so can be overriden to add any
     * operations to be done after saving data.
     *
     * @return boolean
     */
    protected function postsave()
    {
        return true;
    }


    /**
     * Automatically called before self::delete(), so can be overriden to add any
     * operations to be done before deleting data.
     *
     * @return boolean
     */
    protected function predelete()
    {
        return true;
    }


    /**
     * Deletes record in database and empties self::$properties values.
     *
     * @return boolean
     */
    public function delete()
    {
        if (!$this->predelete()) {
            throw new Exception('predelete() on ' . get_class($this) . ' failed');
            return false;
        }

        $primary_key_name = $this->primary_key_name;
        $database = database::get_instance();

        $sql = "DELETE FROM `" . $this->table_name . "`
            WHERE  `" . $primary_key_name . "` = '" . $database->escape_string($this->$primary_key_name) . "'";

        try {
            $database->query($sql);
        } catch (Exception $e) {
            $this->synchronise_database();
            $database->query($sql);
        }

        if (!$this->postdelete()) {
            throw new Exception('postdelete() on ' . get_class($this) . ' failed');
            return false;
        }

        return true;
    }


    /**
     * Automatically called after self::delete(), so can be overriden to add any
     * operations to be done after deleting data.
     *
     * @return boolean
     */
    protected function postdelete()
    {
        return true;
    }


    /**
     * Generates and returns the next available primary key value.
     *
     * @return integer
     */
    protected function get_next_id()
    {
        $result = 0;

        $database = database::get_instance();

        $sql = "UPDATE `counter`
            SET    `counter`      = LAST_INSERT_ID(`counter` + 1)
            WHERE  `counter_name` = '" . $this->primary_key_name . "';";

        try {
            $result_id = $database->query($sql);

            if ($database->affected_rows($result_id) == 0) {
                $this->synchronise_database();
                $sql = "SELECT MAX(`" . $this->primary_key_name . "`) + 1 FROM `" . $this->table_name . "`;";
                $current_id_value = $database->get_value($sql);

                $sql = "INSERT INTO `counter` (
                  `counter_name`,
                  `counter`
                ) VALUES (
                  '" . $database->escape_string($this->primary_key_name) . "',
                  '" . $database->escape_string($current_id_value) . "');";

                $database->query($sql);
                $result = $current_id_value;
            } else {
                $sql = "SELECT LAST_INSERT_ID();";
                $result = $database->get_value($sql);
            }
        } catch (Exception $e) {
            $sql = "SHOW TABLES LIKE 'counter';";

            if ($database->get_value($sql) != 'counter') {
                $sql = "CREATE TABLE `counter` (
                  `counter_name` varchar(64) NOT NULL default '',
                  `counter` int(11) NOT NULL default '0',
                  PRIMARY KEY  (`counter_name`)
                ) ENGINE=InnoDB DEFAULT CHARSET=latin1;";

                $database->query($sql);
            }

            $this->synchronise_database();
            $sql = "SELECT MAX(`" . $this->primary_key_name . "`) + 1 FROM `" . $this->table_name . "`;";
            $current_id_value = $database->get_value($sql);

            $sql = "INSERT INTO `counter` (
                `counter_name`,
                `counter`
              ) VALUES (
                '" . $database->escape_string($this->primary_key_name) . "',
                '" . $database->escape_string($current_id_value) . "');";

            $database->query($sql);
            $result = $current_id_value;
        }

        return $result;
    }


    /**
     * Checks that there is a database table with all the relevant columns
     * correlating to this class. If something is out of synch, a table CREATE
     * or ALTER is carried out.
     *
     * @return boolean
     */
    public function synchronise_database()
    {
        foreach ($this->parent_objects as $parent_object) {
            $parent_object->synchronise_database();
        }

        $database = database::get_instance();

        //$sql = "SET FOREIGN_KEY_CHECKS = '0';";
        //$database->query($sql);

        $sql = "SHOW TABLES LIKE '" . $database->escape_string($this->table_name) . "';";
        $table_name = $database->get_value($sql);

        if ($table_name != $this->table_name) {
            $sql = "CREATE TABLE `" . $this->table_name . "` (\n";

            foreach ($this->properties as $name => $detail) {
                $sql .= "  `" . $name . "` " . $detail['data_type'] . ($detail['data_length'] != '' ? "(" . $detail['data_length'] . ")" : "") . " NOT NULL,\n";
            }

            $sql .= "  PRIMARY KEY  (`" . $this->primary_key_name . "`)\n";
            $sql .= ") ENGINE=InnoDB DEFAULT CHARSET=latin1;";

            $database->query($sql);
        } else {
            $sql = "SHOW CREATE TABLE `" . $this->table_name . "`;";
            $result_id = $database->query($sql);
            $row = $database->fetch_object($result_id);
            $create_table_column = 'Create Table';
            $create_table_sql = $row->$create_table_column;
            $string_to_find = 'CONSTRAINT `';
            $position_of_fk_name = 0;

            while (($position_of_fk_name = strpos($create_table_sql, $string_to_find, $position_of_fk_name)) !== false) {
                $position_of_fk_name += strlen($string_to_find);
                $position_of_backtick = strpos($create_table_sql, '`', $position_of_fk_name);
                $fk_name = substr($create_table_sql, $position_of_fk_name, $position_of_backtick - $position_of_fk_name);

                $sql = "ALTER TABLE `" . $this->table_name . "` DROP FOREIGN KEY `" . $fk_name . "`;";
                $database->query($sql);
            }

            $sql = "SHOW INDEX FROM `" . $this->table_name . "`;";
            $result_id = $database->query($sql);

            while ($row = $database->fetch_object($result_id)) {
                if ($row->Key_name != 'PRIMARY' && $row->Seq_in_index == '1') {
                    $sql = "DROP  INDEX `" . $row->Key_name . "` ON `" . $this->table_name . "`;";
                    $database->query($sql);
                }
            }

            $sql = "SHOW COLUMNS FROM `" . $this->table_name . "`;";
            $result_id = $database->query($sql);
            $database_columns = array();

            while ($row = $database->fetch_object($result_id)) {
                $type = $row->Type;
                $type_parts = explode('(', $type);
                $data_type = $type_parts[0];
                $data_length = count($type_parts) == 2 ? str_replace(')', '', $type_parts[1]) : '';

                $database_columns[$row->Field] = array(

                    'data_type' => strtoupper($data_type),
                    'data_length' => $data_length,
                    'is_primary_key' => ($row->Key == 'PRI' ? 1 : 0),

                );
            }

            $sql = "ALTER TABLE `" . $this->table_name . "`\n";

            foreach ($this->properties as $name => $detail) {
                if (!array_key_exists($name, $database_columns)) {
                    $sql .= "ADD COLUMN `" . $name . "` " . $detail['data_type'] . ($detail['data_length'] != '' ? "(" . $detail['data_length'] . ")" : "") . " NOT NULL,\n";
                } elseif (strtoupper($detail['data_type']) != $database_columns[$name]['data_type'] || $detail['data_length'] != $database_columns[$name]['data_length']) {
                    $sql .= "MODIFY COLUMN `" . $name . "` " . $detail['data_type'] . ($detail['data_length'] != '' ? "(" . $detail['data_length'] . ")" : "") . " NOT NULL,\n";
                }
            }

            foreach ($database_columns as $name => $detail) {
                if (!array_key_exists($name, $this->properties)) {
                    $sql .= "DROP COLUMN `" . $name . "`,\n";
                }
            }

            $sql = (substr($sql, -2) == "`\n" ? substr($sql, 0, -1) . ";" : substr($sql, 0, -2) . ";");
            $database->query($sql);
        }

        foreach ($this->indexes as $name => $properties) {
            $sql = "CREATE " . ($properties['is_unique'] ? "UNIQUE " : "") . "INDEX `" . $name . "`
              ON     `" . $this->table_name . "`
                     (`" . (is_array($properties['fields']) ? implode('`, `', $properties['fields']) : $properties['fields']) . "`);";
            $database->query($sql);
        }

        foreach ($this->properties as $name => $detail) {
            if ($detail['foreign_key_parent'] != '') {
                $fk_parts = $this->parse_foreign_key_parent($detail['foreign_key_parent']);

                $sql = "ALTER TABLE    `" . $this->table_name . "`
                 ADD CONSTRAINT `" . $fk_parts['class_name'] . "_fk`
                 FOREIGN KEY    `" . $fk_parts['class_name'] . "_fk_index` (`" . $fk_parts['property_name'] . "`)
                 REFERENCES     `" . $fk_parts['class_name'] . "` (`" . $fk_parts['property_name'] . "`)
                 ON DELETE ";

                if ($detail['delete_action'] == 'none') $sql .= "NO_ACTION ";
                elseif ($detail['delete_action'] == 'cascade') $sql .= "CASCADE ";
                else                                            $sql .= "RESTRICT ";

                $sql .= "ON UPDATE ";

                if ($detail['update_action'] == 'restrict') $sql .= "RESTRICT;";
                elseif ($detail['update_action'] == 'cascade') $sql .= "CASCADE;";
                else                                            $sql .= "NO ACTION;";

                $database->query($sql);
            }
        }

        //$sql = "SET FOREIGN_KEY_CHECKS = '1';";
        //$database->query($sql);

        return true;
    }


    /**
     * Loads object by a given primary key value.
     *
     * @param integer $primary_key_value
     * @return boolean
     */
    public function load_by_primary_key($primary_key_value)
    {
        $this->conditions = array();
        $this->add_condition('`' . $this->table_name . '`.`' . $this->primary_key_name . '`', $primary_key_value, '=');
        $this->load();
        return true;
    }


    /**
     * Returns an array of this class's objects; one object per matching record.
     *
     * @param string $group_by
     * @param string $order_by
     * @param integer $start_row
     * @param string $limit If <1, then will return all results
     * @return array Array of objects
     */
    public function get_many($group_by = '', $order_by = '', $start_row = 0, $limit = 0)
    {
        $result = array();
        $this->load($result, $group_by, $order_by, $start_row, $limit);

        return $result;
    }
}