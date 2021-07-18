<?php
@session_start();
error_reporting(E_ALL);
ini_set("display_errors", 1);
require_once './GenericFuncions.php';
require_once './post_qr_code/qrlib.php';



if (!isset($_POST['action'])) {
    echo 'Requisição Inválida';
    exit;
}

$acao = $_POST['action'];
if (function_exists($acao)) {
    $acao();
} else {
    echo 'Requisição Inválida';
}

function loginAdmin()
{
    if (isset($_POST['login']) && !empty($_POST['login']) && isset($_POST['senha']) && !empty($_POST['senha'])) {
        $login = addslashes(strip_tags($_POST['login']));
        $senha = addslashes(strip_tags($_POST['senha']));

        $senha = md5($senha);
        require_once "./DB.php";
        $res = $db->prepare("SELECT usuario_id, usuario_status, usuario_login FROM usuario WHERE usuario_login = :user AND usuario_senha = :pass");
        $res->bindParam(":user", $login, PDO::PARAM_STR);
        $res->bindParam(":pass", $senha, PDO::PARAM_STR);
        $res->execute();

        $row = $res->fetch();
        if (isset($row[0])) {
            $usuario = [
                "id" => $row['usuario_id'],
                "status" => $row['usuario_status'],
            ];
            $_SESSION['__USER__'] = $usuario;
            echo json_encode(['status' => 200, 'usuario_status' => $row['usuario_status'], 'usuario_login' => $row['usuario_login']]);
        } else {
            echo json_encode(['status' => 401]);
        }

        unset($db);
        exit;
    }
}

function logoutAdmin()
{
    unset($_SESSION['__USER__']);
    echo json_encode(['status' => 200]);
}

function autenticacao()
{
    if (!isset($_SESSION['__USER__'])) {
        echo json_encode(['status' => 401]);
    } else {
        echo json_encode(['status' => 200]);
    }
    exit;
}
function autenticaAdmin()
{
    if (!isset($_SESSION['__USER__'])) {
        echo json_encode(['status' => 401]);
    } else {
        echo json_encode(['status' => 200]);
    }
    exit;
}

function getNextPrev() {
    require_once "./DB.php";
    $token = strip_tags(addslashes($_POST['token']));
    // next select * from foo where id = (select min(id) from foo where id > 4)
    // prev select * from foo where id = (select max(id) from foo where id < 4)

    $tokenNext = null;
    $tokenPrev = null;
    // next
    $res = $db->prepare("SELECT pergunta_url FROM pergunta WHERE pergunta_id > (SELECT pergunta_id FROM pergunta WHERE pergunta_url = :token) ORDER BY pergunta_id ASC LIMIT 1");
    $res->bindParam(":token", $token, PDO::PARAM_STR);
    $res->execute();
    $row = $res->fetchAll();
    if(isset($row[0])) {
        $tokenNext = $row[0];
    }
    // prev
    $res = $db->prepare("SELECT pergunta_url FROM pergunta WHERE pergunta_id < (SELECT pergunta_id FROM pergunta WHERE pergunta_url = :token) ORDER BY pergunta_id DESC LIMIT 1");
    $res->bindParam(":token", $token, PDO::PARAM_STR);
    $res->execute();
    $row = $res->fetchAll();
    if(isset($row[0])) {
        $tokenPrev = $row[0];
    }
    echo json_encode(['status' => 200, 'tokenPrev' => $tokenPrev, 'tokenNext' => $tokenNext]);
}

function getPerguntaForGrafico()
{
    // captura a pergunta com o token chamada no front
    require_once "./DB.php";
    $token = strip_tags(addslashes($_POST['token']));
    $res = $db->prepare("SELECT * FROM pergunta WHERE pergunta_url = :token");
    $res->bindParam(":token", $token, PDO::PARAM_STR);
    $res->execute();

    $row = $res->fetchAll();
    if (isset($row[0])) {

        $pergunta = $row[0];
        $res = $db->prepare("SELECT *, (SELECT SUM(alternativa_escolhas) FROM alternativa WHERE alternativa_pergunta = :pergunta) AS alternativa_total FROM alternativa WHERE alternativa_pergunta = :pergunta");
        $res->bindParam(":pergunta", $pergunta['pergunta_id'], PDO::PARAM_STR);
        $res->execute();

        $row = $res->fetchAll();
        $pergunta['alternativas'] = $row;

        echo json_encode(['status' => 200, 'pergunta' => $pergunta]);
    } else {
        echo json_encode(['status' => 401]);
    }
}

function getPergunta()
{
    // captura a pergunta com o token chamada no front
    require_once "./DB.php";
    $token = strip_tags(addslashes($_POST['token']));
    $res = $db->prepare("SELECT * FROM pergunta WHERE pergunta_url = :token");
    $res->bindParam(":token", $token, PDO::PARAM_STR);
    $res->execute();

    $row = $res->fetchAll();
    if (isset($row[0])) {

        $pergunta = $row[0];
        $res = $db->prepare("SELECT * FROM alternativa WHERE alternativa_pergunta = :pergunta");
        $res->bindParam(":pergunta", $pergunta['pergunta_id'], PDO::PARAM_STR);
        $res->execute();

        $row = $res->fetchAll();
        $pergunta['alternativas'] = $row;
        echo json_encode(['status' => 200, 'pergunta' => $pergunta]);
    } else {
        echo json_encode(['status' => 401]);
    }
}

function confirmaAlternativa()
{
    require_once "./DB.php";
    $alternativa = strip_tags(addslashes($_POST['alternativa']));

    if (isset($alternativa) && !empty($alternativa)) {
        $res = $db->prepare("UPDATE alternativa SET alternativa_escolhas = alternativa_escolhas + 1 WHERE alternativa_id = :alternativa");
        $res->bindParam(":alternativa", $alternativa, PDO::PARAM_STR);
        $res->execute();
        echo json_encode(['status' => 200]);
    } else {
        echo json_encode(['status' => 400]);
    }
}

function getPerguntas()
{
    // Captura todas as perguntas
    require_once "./DB.php";
    $res = $db->prepare("SELECT * FROM pergunta");
    $res->execute();

    $row = $res->fetchAll();
    if (isset($row[0])) {

        $perguntas = [];
        foreach ($row as $k => $v) {
            $perguntas[$k]['pergunta_id'] = $row[$k]['pergunta_id'];
            $perguntas[$k]['pergunta_texto'] = $row[$k]['pergunta_texto'];

            // Captura as alternativas
            $res = $db->prepare("SELECT *, 'nao-selecionada' AS alternativa_class FROM alternativa WHERE alternativa_pergunta = " . $row[$k]['pergunta_id']);
            $res->execute();

            $rowAlternativa = $res->fetchAll();
            $perguntas[$k]['pergunta_alternativas'] = $rowAlternativa;
        }

        echo json_encode(['status' => 200, 'perguntas' => $perguntas]);
    } else {
        echo json_encode(['status' => 401]);
    }
}

function finalizaQuiz()
{
    if (isset($_POST['quiz']) && !empty($_POST['quiz'])) {
        $quiz = $_POST['quiz'];
        $usuario_id = intval($_SESSION['quiz_usuario']['id']);
        $usuario_grupo = intval($_SESSION['quiz_usuario']['grupo']);
        require_once "./DB.php";
        foreach ($quiz as $k => $v) {
            $pergunta = intval($quiz[$k]['alternativa_pergunta']);
            $resposta = intval($quiz[$k]['alternativa_id']);
            $certa = intval($quiz[$k]['alternativa_correta']);
            $data = [
                'usuario' => $usuario_id,
                'grupo' => $usuario_grupo,
                'pergunta' => $pergunta,
                'resposta' => $resposta,
                'certa' => $certa
            ];
            // Salva questionário            
            $res = $db->prepare("INSERT INTO usuario_resposta (usuario_resposta_usuario, usuario_resposta_grupo, usuario_resposta_pergunta, usuario_resposta_resposta, usuario_resposta_certa) VALUES (:usuario, :grupo, :pergunta, :resposta, :certa)");
            $res->execute($data);
        }
        // Seta o usuário como respondido
        $res = $db->prepare("UPDATE usuario SET usuario_status = 2 WHERE usuario_id = :usuario");
        $res->bindParam(":usuario", $usuario_id, PDO::PARAM_STR);
        $res->execute();
        unset($db);
        unset($_SESSION['quiz_usuario']);
        echo json_encode(['status' => 200]);
    } else {
        echo json_encode(['status' => 401]);
    }
    exit;
}

function finalizaQuizPorTempo()
{
    $usuario_id = intval($_SESSION['quiz_usuario']['id']);
    // Seta o usuário como respondido
    require_once "./DB.php";
    $res = $db->prepare("UPDATE usuario SET usuario_status = 2 WHERE usuario_id = :usuario");
    $res->bindParam(":usuario", $usuario_id, PDO::PARAM_STR);
    $res->execute();
    unset($db);
    unset($_SESSION['quiz_usuario']);
    echo json_encode(['status' => 200]);
    exit;
}

// novo sistema

function listaUsuarios()
{
    require_once "./DB.php";
    $res = $db->prepare("SELECT 
        usuario_id, usuario_login, usuario_status
        FROM usuario ORDER BY usuario_id ASC");
    $res->execute();

    $row = $res->fetchAll();

    unset($db);
    if (isset($row[0])) {
        echo json_encode(['status' => 200, 'usuarios' => $row]);
    } else {
        echo json_encode(['status' => 404]);
    }
    exit;
}

function salvaUsuario()
{
    require_once "./DB.php";
    $login = addslashes(strip_tags($_POST['login']));
    $senha = addslashes(strip_tags($_POST['senha']));
    $status = addslashes(strip_tags($_POST['status']));
    if (empty($login) || empty($senha)) {
        echo json_encode(['status' => 400]);
        exit;
    }

    $verify = $db->prepare("SELECT * FROM usuario WHERE usuario_login = :login");
    $verify->bindParam(":login", $login, PDO::PARAM_STR);
    $verify->execute();
    $verifyResult = $verify->fetchAll();
    if (isset($verifyResult[0])) {
        echo json_encode(['status' => 401]);
        exit;
    }
    $senha = md5($senha);
    $data = [
        'login' => $login,
        'senha' => $senha,
        'status' => $status
    ];
    // Salva pergunta            
    $res = $db->prepare("INSERT INTO usuario (usuario_login, usuario_senha, usuario_status) VALUES (:login, :senha, :status)");
    $res->execute($data);
    unset($db);
    echo json_encode(['status' => 200]);
    exit;
}

function editaUsuario()
{
    require_once "./DB.php";
    $id = intval(addslashes(strip_tags($_POST['id'])));
    $login = addslashes(strip_tags($_POST['login']));
    $senha = addslashes(strip_tags($_POST['senha']));
    $status = addslashes(strip_tags($_POST['status']));
    if (empty($login) || $id == 0) {
        echo json_encode(['status' => 400]);
        exit;
    }

    $verify = $db->prepare("SELECT * FROM usuario WHERE usuario_login = :login AND usuario_id <> :id");
    $verify->bindParam(":login", $login, PDO::PARAM_STR);
    $verify->bindParam(":id", $id, PDO::PARAM_STR);
    $verify->execute();
    $verifyResult = $verify->fetchAll();
    if (isset($verifyResult[0])) {
        echo json_encode(['status' => 401]);
        exit;
    }
    if (!empty($senha)) {
        $senha = md5($senha);
        $res = $db->prepare("UPDATE usuario SET usuario_login = :login, usuario_senha = :senha, usuario_status = :status WHERE usuario_id = :id");
        $res->bindParam(":senha", $senha, PDO::PARAM_STR);
    } else {
        $res = $db->prepare("UPDATE usuario SET usuario_login = :login, usuario_status = :status WHERE usuario_id = :id");
    }
    $res->bindParam(":login", $login, PDO::PARAM_STR);
    $res->bindParam(":status", $status, PDO::PARAM_STR);
    $res->bindParam(":id", $id, PDO::PARAM_STR);
    $res->execute();

    unset($db);
    echo json_encode(['status' => 200]);
    exit;
}

function removeUsuario()
{
    require_once "./DB.php";
    $id = intval($_POST['id']);
    if ($id == 0) {
        echo json_encode(['status' => 400]);
        exit;
    }
    // edita pergunta            
    $res = $db->prepare("DELETE FROM usuario WHERE usuario_id = :id");
    $res->bindParam(":id", $id, PDO::PARAM_STR);
    $res->execute();
    unset($db);
    echo json_encode(['status' => 200]);
    exit;
}


function listaPerguntasPrint()
{
    require_once "./DB.php";
    $res = $db->prepare("SELECT 
        pergunta_id, pergunta_titulo, pergunta_url
        FROM pergunta ORDER BY pergunta_id ASC");
    $res->execute();

    $perguntas = $res->fetchAll();

    if (isset($perguntas[0])) {
        foreach ($perguntas as $k => $v) {
            // $perguntas['alternativas'] = 
            $res = $db->prepare("SELECT *, (SELECT SUM(alternativa_escolhas) FROM alternativa WHERE alternativa_pergunta = :pergunta) AS alternativa_total FROM alternativa WHERE alternativa_pergunta = :pergunta");
            $res->bindParam(":pergunta", $perguntas[$k]['pergunta_id'], PDO::PARAM_STR);
            $res->execute();

            $row = $res->fetchAll();
            $perguntas[$k]['alternativas'] = $row;
        }
        echo json_encode(['status' => 200, 'perguntas' => $perguntas]);
    } else {
        echo json_encode(['status' => 404]);
    }
    unset($db);
    exit;
}



function listaPerguntas()
{
    require_once "./DB.php";
    $res = $db->prepare("SELECT 
        pergunta_id, pergunta_titulo, pergunta_url
        FROM pergunta ORDER BY pergunta_id ASC");
    $res->execute();

    $row = $res->fetchAll();

    unset($db);
    if (isset($row[0])) {
        echo json_encode(['status' => 200, 'perguntas' => $row]);
    } else {
        echo json_encode(['status' => 404]);
    }
    exit;
}

function salvaPergunta()
{
    require_once "./DB.php";
    $titulo = addslashes(strip_tags($_POST['titulo']));
    if (empty($titulo)) {
        echo json_encode(['status' => 400]);
        exit;
    }
    $token = md5(time(uniqid()));
    $data = [
        'titulo' => $titulo,
        'url' => $token
    ];
    // Salva pergunta            
    $res = $db->prepare("INSERT INTO pergunta (pergunta_titulo, pergunta_url) VALUES (:titulo, :url)");
    $res->execute($data);
    unset($db);
    $baseUri = "localhost/base_option/"; // link para acesso
    // $baseUri = "https://optionmaker.com.br/teste_qrcode/"; // link para acesso
    $qrCodeName = $baseUri . '/pergunta.html?token=' . $token;
    $dir = dirname(__FILE__);
    $dir = explode(DIRECTORY_SEPARATOR . "php" . DIRECTORY_SEPARATOR, $dir);
    $dir = explode(DIRECTORY_SEPARATOR . "php", $dir[0]);
    $base = $dir[0] . DIRECTORY_SEPARATOR . 'qrcodes';

    @system("sudo chmod -R 777 $base");
    QRcode::png($qrCodeName, $base . DIRECTORY_SEPARATOR . $token . '.png', QR_ECLEVEL_L, 10);
    echo json_encode(['status' => 200]);
    exit;
}

function editaPergunta()
{
    require_once "./DB.php";
    $titulo = addslashes(strip_tags($_POST['titulo']));
    $id = intval($_POST['id']);
    if (empty($titulo) || $id == 0) {
        echo json_encode(['status' => 400]);
        exit;
    }
    // edita pergunta            
    $res = $db->prepare("UPDATE pergunta SET pergunta_titulo = :titulo WHERE pergunta_id = :id");
    $res->bindParam(":titulo", $titulo, PDO::PARAM_STR);
    $res->bindParam(":id", $id, PDO::PARAM_STR);
    $res->execute();


    unset($db);
    echo json_encode(['status' => 200]);
    exit;
}

function removePergunta()
{
    require_once "./DB.php";
    $id = intval($_POST['id']);
    if ($id == 0) {
        echo json_encode(['status' => 400]);
        exit;
    }
    // remove pergunta   
    // faltando deletar qrcode
    $res = $db->prepare("DELETE FROM alternativa WHERE alternativa_pergunta = :id");
    $res->bindParam(":id", $id, PDO::PARAM_STR);
    $res->execute();
    $res = $db->prepare("DELETE FROM pergunta WHERE pergunta_id = :id");
    $res->bindParam(":id", $id, PDO::PARAM_STR);
    $res->execute();
    unset($db);
    echo json_encode(['status' => 200]);
    exit;
}

function salvaAlternativa()
{
    require_once "./DB.php";
    $titulo = addslashes(strip_tags($_POST['titulo']));
    $cor = addslashes(strip_tags($_POST['cor']));
    $pergunta = intval($_POST['pergunta']);
    if (empty($titulo) || empty($cor) || $pergunta == 0) {
        echo json_encode(['status' => 400]);
        exit;
    }
    $data = [
        'titulo' => $titulo,
        'cor' => $cor,
        'pergunta' => $pergunta,
    ];
    // Salva pergunta            
    $res = $db->prepare("INSERT INTO alternativa (alternativa_titulo, alternativa_cor, alternativa_pergunta) VALUES (:titulo, :cor, :pergunta)");
    $res->execute($data);
    unset($db);
    echo json_encode(['status' => 200]);
    exit;
}

function listarAlternativas()
{
    require_once "./DB.php";
    $pergunta = intval($_POST['pergunta']);
    if ($pergunta == 0) {
        echo json_encode(['status' => 400]);
        exit;
    }

    $res = $db->prepare("SELECT alternativa_id, alternativa_titulo, alternativa_cor FROM alternativa WHERE alternativa_pergunta = :pergunta");
    $res->bindParam(":pergunta", $pergunta, PDO::PARAM_STR);
    $res->execute();
    $row = $res->fetchAll();

    unset($db);
    if (isset($row[0])) {
        echo json_encode(['status' => 200, 'alternativas' => $row]);
    } else {
        echo json_encode(['status' => 404]);
    }
    exit;
}

function editaAlternativa()
{
    require_once "./DB.php";
    $titulo = addslashes(strip_tags($_POST['titulo']));
    $cor = addslashes(strip_tags($_POST['cor']));
    $id = intval($_POST['id']);
    if (empty($titulo) || $id == 0) {
        echo json_encode(['status' => 400]);
        exit;
    }
    // edita pergunta            
    $res = $db->prepare("UPDATE alternativa SET alternativa_titulo = :titulo, alternativa_cor = :cor WHERE alternativa_id = :id");
    $res->bindParam(":titulo", $titulo, PDO::PARAM_STR);
    $res->bindParam(":cor", $cor, PDO::PARAM_STR);
    $res->bindParam(":id", $id, PDO::PARAM_STR);
    $res->execute();


    unset($db);
    echo json_encode(['status' => 200]);
    exit;
}

function removeAlternativa()
{
    require_once "./DB.php";
    $id = intval($_POST['id']);
    if ($id == 0) {
        echo json_encode(['status' => 400]);
        exit;
    }
    // edita pergunta            
    $res = $db->prepare("DELETE FROM alternativa WHERE alternativa_id = :id");
    $res->bindParam(":id", $id, PDO::PARAM_STR);
    $res->execute();
    unset($db);
    echo json_encode(['status' => 200]);
    exit;
}
