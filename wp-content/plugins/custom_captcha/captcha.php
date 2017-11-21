<?php
session_start();

$num1=rand(1,9); //Generate First number between 1 and 9  
$num2=rand(1,9); //Generate Second number between 1 and 9  
$captcha_total=$num1+$num2;  

$math = "$num1"." + "."$num2"." =";  

$_SESSION['rand_code'] = $captcha_total;

$my_img = imagecreate( 200, 80 );                             //width & height
$background  = imagecolorallocate( $my_img, 255,   255,   255 );
$text_colour = imagecolorallocate( $my_img, 0, 0, 0 );
$line_colour = imagecolorallocate( $my_img, 0, 0, 0 );
imagestring( $my_img, 4, 30, 25, $math, $text_colour );
imagefontheight(21);
imagefontwidth(21);
imagesetthickness ( $my_img, 5 );
imageline( $my_img, 30, 45, 70, 45, $line_colour );

header( "Content-type: image/png" );
imagepng( $my_img );
imagecolordeallocate( $line_color );
imagecolordeallocate( $text_color );
imagecolordeallocate( $background );
// $fill = imagecolorallocate($my_img, 0, 0, 0);
// $border = imagecolorallocate($im, 2, 11, 22);
// imagefilltoborder($im, 50, 50, $border, $fill);
imagedestroy( $my_img );
?>