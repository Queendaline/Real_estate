<?php
/**
 *Description: ...
 *Created by: Isaac
 *Date: 9/4/2020
 *Time: 8:25 PM
 */

require 'head.php';
if($header) require 'header.php';
if($sidebar) require 'sidebar.php';
echo $body;
if($footer) require 'footer.php';
require 'foot.php';
