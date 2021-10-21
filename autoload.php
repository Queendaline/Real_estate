<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 7/23/2020
 *Time: 11:47 AM
 */

use Zikzay\Database\Migration;

require_once 'vendor/autoload.php';
//define('DS', DIRECTORY_SEPARATOR);
//define('ROOT', dirname(__FILE__));
//$root_path = ROOT . DS;
//function autoload ($className) { global $root_path;
//    $dirs = scandir(ROOT);
//    foreach ($dirs as $dir) {   if(notFile($dir))  {  continue; }
//        $root = ROOT . DS . $dir . DS;
//        $path =  $root . $className . ".php";
//        if (is_readable($path)) require_once $path;
//
//        $root_path = ROOT . DS . $dir . DS;
//        $step1_dirs = checkInsideDir($root, $className);
//        foreach ($step1_dirs as $step1_dir) {  if(notFile($step1_dir)) {  continue; }
//
//            $step2_dirs = checkInsideDir($root . $step1_dir . DS, $className);
//            foreach ($step2_dirs as $step2_dir) {   if(notFile($step2_dir)) continue;
//
//                $step3_dirs = checkInsideDir($root . $step1_dir . DS .$step2_dir . DS, $className);
//                foreach ($step3_dirs as $step3_dir) {    if(notFile($step3_dir)) continue;
//
//                    $step4_dirs = checkInsideDir($root . $step1_dir . DS .$step2_dir . DS . $step3_dir . DS, $className);
//                    foreach ($step4_dirs as $step4_dir) {   if(notFile($step4_dir)) continue;
//
//                        $step5_dirs = checkInsideDir($root . $step1_dir . DS .$step2_dir . DS . $step3_dir . DS . $step4_dir . DS, $className);
//
//                        foreach ($step5_dirs as $step5_dir) {   if(notFile($step5_dir)) continue;
//
//                            $step6_dirs = checkInsideDir($root . $step1_dir . DS .$step2_dir . DS . $step3_dir . DS . $step4_dir . DS . $step5_dir . DS, $className);
//                            echo $root . $step1_dir . DS .$step2_dir . DS . $step3_dir . DS . $step4_dir . DS . $step5_dir . DS;
//                        }
//                    }
//                }
//            }
//        }
//
//    }
//}
//
//
//function checkInsideDir($dir, $className) : array {
//    if($dir == '.' || $dir == '..') return  [];
//    global $root_path;
//    $root_path = $dir;
//    return is_dir($dir) ? loopDir(scandir($dir), $className) : [];
//}
//
//
//function loopDir($dirs, $className){
//    global $root_path;
//    $rp = $root_path;
//    foreach ($dirs as $dir) { if($dir == '.' || $dir == '..') continue;
//        loadClasses($rp, $className);
//    }
//    return $dirs;
//}
//$count = 0;
//function loadClasses($rp, $className){
//    $path = $rp . $className . ".php";
//    $path = str_replace('\\','/',$path);
//    if (is_readable($path)) { require_once $path; }
//}
//
//function notFile($file) {
//    $files = [
//        '.',
//        '..',
//        '.css',
//        '.html',
//        '.php',
//        '.js',
//        '.sql',
//        '.idea',
//        '.json',
//        'public',
//        'test',
//        'res',
//        'views',
//        'autoload.php'
//    ];
//    return in_array($file, $files);
//}
//
//
//spl_autoload_register('autoload');

//echo count(explode(" ", "username = 'lucy'"));
//





