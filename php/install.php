<?php
@session_start();
error_reporting(E_ALL);
ini_set("display_errors", 1);
require_once './GenericFuncions.php';
require_once "./DB.php";

$table_pasta = "CREATE TABLE `db_perguntas_qr`.`pasta` ( `pasta_id` INT NOT NULL AUTO_INCREMENT , `pasta_nome` INT NULL DEFAULT NULL , PRIMARY KEY (`pasta_id`)) ENGINE = InnoDB;";
$table_pasta_pergunta = "CREATE TABLE `db_perguntas_qr`.`pasta_pergunta` ( `pasta_pergunta_id` INT NOT NULL AUTO_INCREMENT , `pasta_pergunta_pasta_id` INT NULL DEFAULT NULL , `pasta_pergunta_pergunta_id` INT NULL DEFAULT NULL , PRIMARY KEY (`pasta_pergunta_id`)) ENGINE = InnoDB;";
$table_pasta_usuario = "CREATE TABLE `db_perguntas_qr`.`pasta_usuario` ( `pasta_usuario_id` INT NOT NULL AUTO_INCREMENT , `pasta_usuario_usuario_id` INT NULL DEFAULT NULL , `pasta_usuario_pasta_id` INT NULL DEFAULT NULL , PRIMARY KEY (`pasta_usuario_id`)) ENGINE = InnoDB;";

// $res = $db->prepare($table_pasta);
// $res->execute();
// $res = $db->prepare($table_pasta_pergunta);
// $res->execute();
// $res = $db->prepare($table_pasta_usuario);
// $res->execute();

$res = $db->prepare("desc usuario;");
$res->execute();
$row = $res->fetchAll();
pre($row, 1);
