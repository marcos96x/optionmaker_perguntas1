function login() {
    let email = $("#usuario_email").val().trim();

    if(email == "") {
        $("#usuario_email").attr('placeholder', 'INSIRA SEU EMAIL').focus();
        return false;
    }
    let data = {
        'action': 'login',
        'email': email
    };
    $.ajax({
        url: __BASE_API__,
        type: 'POST',
        data: data
    }).done(res => {
        res = JSON.parse(res);

        if(res.status == undefined) {
            console.log('erro na requisição');
            return false;
        }

        if(res.status == 200) {
            window.location.href = __BASE_URI__ + "quiz.html";
            localStorage.setItem("grupo_nome", res.nome_grupo);
            localStorage.setItem("minuto", 19);
            localStorage.setItem("segundo", 59);
        } else if(res.status == 402) {
            $.toast("Vocè já preencheu este questionario");
        } else {
            $.toast("Usuário não encontrado");
        }
    })
}

$(document).ready(function() {
    if(window.location.href.indexOf('?autenticacao=false') != -1) {
        $.toast("Área acessível apenas para pessoas autenticadas!")
    }
    localStorage.removeItem("grupo_nome");

    let data = {
        'action': 'getFirstPergunta'
    };
    $.ajax({
        url: __BASE_API__,
        type: 'POST',
        data: data
    }).done(res => {
        res = JSON.parse(res);

        if(res.status == undefined) {
            console.log('erro na requisição');
            return false;
        }

        if(res.status == 200) {
            window.location.href = __BASE_URI__ + "pergunta.html?token=" + res.pergunta.pergunta_url;

        } else if(res.status == 402) {
            $.toast("Vocè já preencheu este questionario");
        } else {
            $.toast("Usuário não encontrado");
        }
    })
})

$("#usuario_email").keyup(function(e) {
    if(e.keyCode == 13) {
        login();
    }
})