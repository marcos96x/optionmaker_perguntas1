<?php

    function connect() {
        $host = "rt_innovations.mysql.dbaas.com.br";
        $user = "rt_innovations";
        $pass = "P@ulO#675514!$";
        $db = "rt_innovations";

        // $host = "localhost";
        // $user = "root";
        // $pass = "root";
        // $db = "optionmaker_perguntas_1";
        // db_schindler, P@ulO#675514!$
        try {
            $con = new PDO('mysql:host=' . $host . ';dbname=' . $db, $user, $pass, array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''));
            $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $con;

        } catch(PDOException $e) {
            echo "Erro encontrado: " . $e->getMessage();
            exit;
        }
    }

    $db = connect();

