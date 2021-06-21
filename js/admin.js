function login() {
    let login = $("#login").val().trim();
    let senha = $("#senha").val().trim();

    if(login == "") {
        $("#login").attr('placeholder', 'INSIRA SEU LOGIN').focus();
        return false;
    }
    if(senha == "") {
        $("#senha").attr('placeholder', 'INSIRA SUA SENHA').focus();
        return false;
    }


    let data = {
        'action': 'loginAdmin',
        'login': login,
        'senha': senha
    };

    $.ajax({
        url: __BASE_API__,
        type: 'POST',
        data: data
    }).done(res => {
        console.log(res);
        res = JSON.parse(res);

        if(res.status == undefined) {
            $.toast("Não foi possível se conectar ao servidor");
            console.log('erro na requisição');
            return false;
        }

        if(res.status == 200) {
            window.location.href = __BASE_URI__ + "dashboard.html";
        } else {
            $.toast("Usuário não encontrado");
        }
    })
}

$(document).ready(function() {    
    if(window.location.href.indexOf('?autenticacao=false') != -1) {
        $.toast("Área acessível apenas para pessoas autenticadas!")
    }
    localStorage.clear();
})

$("#senha, #login").keyup(function(e) {    
    if(e.keyCode == 13) {
        login();
    }
}) 