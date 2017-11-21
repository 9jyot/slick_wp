<?php
include_once("user_class.php");
session_start();
$errors = array();
//print_r($_POST);die;
//echo $_SESSION['rand_code'];die;
if ($_POST['captcha_entered']!=$_SESSION['rand_code']) {
    $errors['msg'] = 'Not Match';
    $errors['code'] = 0;
}
else{
	$errors['msg'] = 'Match';
	$errors['code'] = 1;
	$obj = new user_class();	
	$data['ip_address'] = $_SERVER['REMOTE_ADDR'];;
	$data['time'] = date("Y-m-d H:i:s");
	$data['count'] = 1;
	$res = $obj->update_data("wp_ip_check",$data);
	//print_r($res);die;
}


print_r(json_encode($errors));

?>