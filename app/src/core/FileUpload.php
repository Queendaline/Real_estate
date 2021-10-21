<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 8/6/2020
 *Time: 10:01 AM
 */

namespace Zikzay\core;


use Zikzay\core\abstracts\FileFactory;
use Zikzay\Lib\Util;

class FileUpload extends FileFactory
{
    public function __construct($file, $lang = 'en_GB')
    {
        parent::__construct($file, $lang);

    }

    public static function image($file, $path, $prefix = null, $optional = false){
        $names = [];
        if(is_array($_FILES[$file]['name'])) {
            $image = null;
            for ($i = 0; $i < count($_FILES[$file]['name']); $i++) {
                if(empty($_FILES[$file]['name'][$i])) continue;
                    foreach ($_FILES[$file] as $k => $val) {
                    $image[$k] = $val[$i];
                }
                $result = self::uploadImage($image, $path, $prefix);
                if(is_array($result)) return $result;
                $names[] = $result;
            }
        }else {
            return self::uploadImage($_FILES[$file], $path, $prefix);
        }
        return empty($names) ? [false] : $names;
    }

    private static function uploadImage($uploadFile, $path, $prefix = null) {
        $dir_dest =  $path;
        $error = '';
        $handle = new self($uploadFile);

        $handle->file_new_name_body = empty($prefix) ? Util::reference(12) : $prefix.'_'.Util::reference(12);

        if ($handle->uploaded) {

            $handle->file_overwrite = true;
            $handle->allowed = array('image/*');

            $handle->process($dir_dest);
            if ($handle->processed) {

                return $handle->file_dst_name;
                // $handle->file_dst_pathname;
            }
            $error = $handle->error;
        }

        return [false, $error];
    }

    public static function handleEdit($file, $path, $action = 'image'){
//        dnd($path);
//        dnd($_FILES[$file])
        $log = '';
        // set variables
        $dir_dest = (isset($_GET['dir']) ? $_GET['dir'] : $path);
        $dir_pics = (isset($_GET['pics']) ? $_GET['pics'] : $dir_dest);
        if ($action == 'image') {

            // ---------- IMAGE UPLOAD ----------

            // we create an instance of the class, giving as argument the PHP object
            // corresponding to the file field from the form
            // All the uploads are accessible from the PHP object $_FILES
            $handle = new self($_FILES[$file]);

            // then we check if the file has been uploaded properly
            // in its *temporary* location in the server (often, it is /tmp)
            if ($handle->uploaded) {

                // yes, the file is on the server
                // below are some example settings which can be used if the uploaded file is an image.
                $handle->image_resize            = true;
                $handle->image_ratio_y           = true;
                $handle->image_x                 = 300;

                // now, we start the upload 'process'. That is, to copy the uploaded file
                // from its temporary location to the wanted location
                // It could be something like $handle->process('/home/www/my_uploads/');
                $handle->process($dir_dest);

                // we check if everything went OK
                if ($handle->processed) {
                    // everything was fine !
                    echo '<p class="result">';
                    echo '  <b>File uploaded with success</b><br />';
                    echo '  <img src="'.$dir_pics.'/' . $handle->file_dst_name . '" />';
                    $info = getimagesize($handle->file_dst_pathname);
                    echo '  File: <a href="'.$dir_pics.'/' . $handle->file_dst_name . '">' . $handle->file_dst_name . '</a><br/>';
                    echo '   (' . $info['mime'] . ' - ' . $info[0] . ' x ' . $info[1] .' -  ' . round(filesize($handle->file_dst_pathname)/256)/4 . 'KB)';
                    echo '</p>';
                } else {
                    // one error occured
                    echo '<p class="result">';
                    echo '  <b>File not uploaded to the wanted location</b><br />';
                    echo '  Error: ' . $handle->error . '';
                    echo '</p>';
                }

                // we now process the image a second time, with some other settings
                $handle->image_resize            = true;
                $handle->image_ratio_y           = true;
                $handle->image_x                 = 300;
                $handle->image_reflection_height = '25%';
                $handle->image_contrast          = 50;

                $handle->process($dir_dest);

                // we check if everything went OK
                if ($handle->processed) {
                    // everything was fine !
                    echo '<p class="result">';
                    echo '  <b>File uploaded with success</b><br />';
                    echo '  <img src="'.$dir_pics.'/' . $handle->file_dst_name . '" />';
                    $info = getimagesize($handle->file_dst_pathname);
                    echo '  File: <a href="'.$dir_pics.'/' . $handle->file_dst_name . '">' . $handle->file_dst_name . '</a><br/>';
                    echo '   (' . $info['mime'] . ' - ' . $info[0] . ' x ' . $info[1] .' - ' . round(filesize($handle->file_dst_pathname)/256)/4 . 'KB)';
                    echo '</p>';
                } else {
                    // one error occured
                    echo '<p class="result">';
                    echo '  <b>File not uploaded to the wanted location</b><br />';
                    echo '  Error: ' . $handle->error . '';
                    echo '</p>';
                }

                // we delete the temporary files
                $handle-> clean();

            } else {
                // if we're here, the upload file failed for some reasons
                // i.e. the server didn't receive the file
                echo '<p class="result">';
                echo '  <b>File not uploaded on the server</b><br />';
                echo '  Error: ' . $handle->error . '';
                echo '</p>';
            }

            $log .= $handle->log . '<br />';

        }
        if ($log) echo '<pre>' . $log . '</pre>';
    }
}