<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/1/2020
 *Time: 6:49 AM
 */

namespace Zikzay\core;


use Zikzay\Database\Database;
use Zikzay\Lib\Util;

class Validation
{
    protected $error;
    protected $message;
    protected $model;
    protected $paramKey;
    protected $paramValue;
    protected $unique;

    public function __construct()
    {
        $this->error = false;
        $this->message = null;
    }

    public static function make($key, $value, $model, $unique)
    {
        $self = new self();
        $self->model = $model;
        $self->paramKey = $key;
        $self->paramValue = $value;
        $self->unique = $unique;

        return $self->validatedValue();
    }

    private function validatedValue()
    {
        $value = Util::sanitize($this->paramValue);
        $modelRule = Util::modelProperty($this->model, $this->paramKey);

        return ($modelRule == []) ? null : $this->checker($modelRule, $value);
    }

    private function getTypeLength($type)
    {
        return explode('(', rtrim($type, ')'));
    }

    private function getType($type) {
        return explode(' ', $this->getTypeLength($type)[0])[0];
    }

    private function getLength($type) {
        return isset($this->getTypeLength($type)[1]) ? $this->getTypeLength($type)[1] : false;
    }

    public function checker($rules, $value) {

        $type = isset($rules['type']) ? $this->getType($rules['type']) : '';

        $isNull = isset($rules['null']) ? $rules['null'] == 'NULL' : false;

        $secondaryKey = isset($rules['foreignKey']);
        $unique = isset($rules['unique']);
        $value = ($value == '1' || $value == '0') ? (int) $value : $value;
        if(!$isNull) {
            if(is_array($this->notNull($value))) return $this->notNull($value);
        }
        if($secondaryKey) {
            if(is_array($this->notNull($value))) return $this->notNull($value);
        }
        $verifiedValue = $this->verifyType($rules, $type, $value);
        if(is_array($verifiedValue)){
            return $verifiedValue;
        }
        if($unique) {
            return $this->verifyUniqueness($verifiedValue);
        }

        return $verifiedValue;
    }

    private function assignErrors(string $string)
    {
        $this->error = true;
        $this->message = sprintf($string, str_replace('_', ' ', ucwords($this->paramKey)));

        return ['message' => $this->message];
    }

    private function notNull($value)
    {
        if(($value == null || $value == '') and $value != 0) {
            return $this->assignErrors(is_blank_error);
        }
        return $value;
    }

    private function verifyLength(int $length, $value)
    {
        return !(strlen($value) > $length);
    }

    private function verifyUniqueness($value)
    {
        if(!$this->unique) return $value;
        return Database::dbInstance()
            ->table(Util::objectToSnakeCase($this->model))
            ->select($this->paramKey)
            ->where("$this->paramKey = '$value'")
            ->count() > 0
            ? $this->assignErrors(is_not_unique_error)
            : $value;
    }

    private function verifyType($rules, string $type, $value)
    {
        if($type == 'INT') {
            return $this->verifyInt($value);

        } else if($type == 'FLOAT') {
            return $this->verifyFloat($value);

        } else if($type == 'VARCHAR') {
            return $this->verifyVarchar($rules, $value);

        } else if($type == 'TINYINT') {
            return $this->verifyTinyint($value);

        } else if($type == 'TIMESTAMP') {
            return $value;

        } else if($type == 'DATETIME') {
            return $this->verifyDatetime($value);

        } else if($type == 'DATE') {
           
            $date = self::verifyDate($value);

            return $date != false ? $date : $this->assignErrors(is_not_date_error);

        }else if($type == 'TIME') {
            return $this->verifyTimeOnly($value);

        } else if($type == 'YEAR') {
            return $this->verifyYear($value);

        } else if($type == 'TEXT') {
            return $value;
        }
        return false;
    }

    public static function verifyDate($value)
    {
        $dateArray = explode('-', $value);
        if(count($dateArray) < 3) $dateArray = explode('-', $value);

        if(count($dateArray) != 3) {
            return false;

        }else {
            $year = trim($dateArray[2]);
            $month = trim($dateArray[1]);
            $day = trim($dateArray[0]);
            if (!is_numeric($year) or !is_numeric($month) or !is_numeric($day)) {
                return false;

            } else if (($year < 1900 or $year > 2100) or ($month <= 0 or $month > 12) or
                ($day <= 0 or $day > 31)) {
                return false;

            } else if (($month == 4 or $month == 6 or $month == 9 or $month == 11) and
                ($day >= 31)) {
                return false;

            } else if ($year % 4 == 0 and $month == 2 and $day >= 30) {
                return false;

            } else if ($year % 4 != 0 and $month == 2 and $day >= 29) {
                return false;
            }
            return "$year-$month-$day";
        }
    }

    private function verifyTime($time, $meridiem = null)
    {
        $timeArray = explode(':', $time);
        if(count($timeArray) == 2 or count($timeArray) == 3) {
            $hour = trim($timeArray[0]);
            $minute = trim($timeArray[1]);
            if(is_numeric($hour) and is_numeric($minute)) {
                if($meridiem != null){
                    $meridiem = trim(strtolower($meridiem));
                    if($meridiem == 'pm') $hour += 12;
                }
                if($hour >= 0 and $hour <= 23 and $minute >= 0 and $minute <= 60) {
                    return "$hour:$minute:00";
                }
            }
        }
        return false;
    }

    private function verifyYear($value)
    {
        $year = trim($value);
        if(!is_numeric($year)) {
            return $this->assignErrors(is_not_year_error);

        }else if($year < 1900 or $year > 2100) {
            return $this->assignErrors(is_not_year_error);

        }
        return $year;
    }

    private function verifyTimeOnly($value)
    {
        $timeArray = explode(' ', trim($value));
        $time = false;
        if(count($timeArray) == 1) {
            $time = $this->verifyTime($timeArray[0]);

        } else if(count($timeArray) == 2) {
            $time = $this->verifyTime($timeArray[0], $timeArray[1]);
        }
        return $time ? $time : $this->assignErrors(is_not_time_error);
    }

    private function verifyDatetime($value)
    {
        $datetime = explode(' ', trim($value));
        $date = false;
        $time = false;

        if(count($datetime) == 2) {
            $time = $this->verifyTime($datetime[1]);

            $date = self::verifyDate($datetime[0]);

        } else if(count($datetime) == 3) {
            $time = $this->verifyTime($datetime[1], $datetime[2]);
            $date = self::verifyDate($datetime[0]);
        }
        return ($date !== false and $time !== false) ?
            "$date $time" : $this->assignErrors(is_not_datetime_error);
    }

    private function verifyTinyint($value)
    {
        if(!is_numeric($value)) {
            if(strtolower($value) == 'on') return 1;
            return $this->assignErrors(is_not_number_error);
        
        }else if(filter_var($value, FILTER_VALIDATE_INT) === false){

            return $this->assignErrors(is_not_number_error);

        }else if(isset($rules['auto_increment'])) {
            return $this->assignErrors(most_be_blank);

        }else {
            return filter_var($value, FILTER_SANITIZE_NUMBER_INT);
        }
    }

    private function verifyInt($value)
    {
        if(!is_numeric($value)) {
            return $this->assignErrors(is_not_number_error);

        }else if(filter_var($value, FILTER_VALIDATE_INT)  === false){
            return $this->assignErrors(is_not_number_error);

        }else if(isset($rules['auto_increment'])) {
            return $this->assignErrors(most_be_blank);

        }else {
            return filter_var($value, FILTER_SANITIZE_NUMBER_INT);
        }
    }

    private function verifyVarchar($rules, $value)
    {
        if(!is_string($value)) {
            return $this->assignErrors(is_not_string_error);
        }else {
            $length = isset($rules['type']) ? $this->getLength($rules['type']) : 0;

            $name = isset($rules['name']);
            $phone = isset($rules['phone']);
            $email = isset($rules['email']);
            $username = isset($rules['username']);
            $primaryKey = isset($rules['primaryKey']);

            if(!$this->verifyLength($length, $value)){
                return $this->assignErrors(is_too_long_error);
            }

            if ($primaryKey) {
                return $this->notNull($value); // not auto increment
            }

            if ($name) {
                if (preg_match("/^[a-zA-Z ]{3,64}$/", $value)) {
                    return $value;
                }
                return $this->assignErrors(is_not_name_error);
            }
            if ($phone) {
                $phoneTrim = str_replace(' ', '', $value);
                $phoneTrim = str_replace('-', '', $phoneTrim);
                if (preg_match("/^(([+]?[2][3][4])|[0])([2-9][01])([0-9]){8}$/", $phoneTrim) === 1) {
                    return $phoneTrim;
                }
                return $this->assignErrors(is_not_phone_error);

            }
            if ($email) {
                if(filter_var($value, FILTER_VALIDATE_EMAIL)) {
                    return filter_var($value, FILTER_SANITIZE_EMAIL);
                }
                return $this->assignErrors(is_not_email_error);
            }
            if ($username) {
                $username = trim($value);
                if(preg_match("/^[A-Za-z][A-Za-z0-9_]{2,31}$/", $username)){
                    return $username;
                }

                return $this->assignErrors(is_not_username_error);
            }
        }


        return filter_var($value, FILTER_DEFAULT);
    }

    private function verifyFloat($value)
    {

        if(!is_float($value) and !is_numeric($value)) {
            return $this->assignErrors(is_not_number_error);

        }else if(filter_var($value, FILTER_VALIDATE_FLOAT)  === false){
            return $this->assignErrors(is_not_number_error);

        }else {
            return filter_var($value, FILTER_VALIDATE_FLOAT);
        }
    }


}

/*
 * Some times a Hacker use a php file or shell as a image to hack your website. so if you try to use move_uploaded_file() function as in example to allow for users to upload files, you must check if this file contains a bad codes or not so we use this function. preg match

 in this function we use

 unlink() - http://php.net/unlink

 after you upload file check a file with below function.

<?php

/**
  * A simple function to check file from bad codes.
  *
  * @param (string) $file - file path.
  * @author Yousef Ismaeil - Cliprz[at]gmail[dot]com.
  * /
function is_clean_file ($file)
{
    if (file_exists($file))
    {
        $contents = file_get_contents($file);
    }
    else
    {
        exit($file." Not exists.");
    }

    if (preg_match('/(base64_|eval|system|shell_|exec|php_)/i',$contents))
    {
        return true;
    }
    else if (preg_match("#&\#x([0-9a-f]+);#i", $contents))
    {
        return true;
    }
    elseif (preg_match('#&\#([0-9]+);#i', $contents))
    {
        return true;
    }
    elseif (preg_match("#([a-z]*)=([\`\'\"]*)script:#iU", $contents))
    {
        return true;
    }
    elseif (preg_match("#([a-z]*)=([\`\'\"]*)javascript:#iU", $contents))
    {
        return true;
    }
    elseif (preg_match("#([a-z]*)=([\'\"]*)vbscript:#iU", $contents))
    {
        return true;
    }
    elseif (preg_match("#(<[^>]+)style=([\`\'\"]*).*expression\([^>]*>#iU", $contents))
    {
        return true;
    }
    elseif (preg_match("#(<[^>]+)style=([\`\'\"]*).*behaviour\([^>]*>#iU", $contents))
    {
        return true;
    }
    elseif (preg_match("#</*(applet|link|style|script|iframe|frame|frameset|html|body|title|div|p|form)[^>]*>#i", $contents))
    {
        return true;
    }
    else
    {
        return false;
    }
}


Use


// If image contains a bad codes
$image   = "simpleimage.png";

if (is_clean_file($image))
{
    echo "Bad codes this is not image";
    unlink($image);
}
else
{
    echo "This is a real image.";
}






    public static function displayError($errors) {
            $html = '<div class="alert alert-danger"><ul>';
            foreach ($errors as $key => $error) {
                $html .= '<li>' . $error['message'] . '</li><script>' .
                    '$.when($.ready).then(function() {jQuery("#' . $key . '").parent().closest("div").addClass("has-error"); });</script>';
            }
            $html .= '</ul></div>';

        return $html;
    }
*/