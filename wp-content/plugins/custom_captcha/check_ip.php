<?php 
include_once("user_class.php");

$obj = new user_class();
print_r(json_encode($obj->check_ip()));

//$client_ip = $_SERVER['REMOTE_ADDR'];

//

?>