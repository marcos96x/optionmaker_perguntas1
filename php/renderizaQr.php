<?php

error_reporting(E_ALL);
ini_set("display_errors", 1);
require_once './GenericFuncions.php';

$token = addslashes(strip_tags($_GET['qrcode']));
if (isset($token) && !empty($token)) {
    $file = "./../qrcodes/" . $token . ".png";
    if(is_file($file)) {
        $im = imagecreatefrompng("./../qrcodes/" . $token . ".png");
        header('Content-Type: image/png');
        imagepng($im);
        imagedestroy($im);
    } else {
        echo 'Imagem não encontrada';
    }
}
