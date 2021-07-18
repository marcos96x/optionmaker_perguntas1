function autentica() {
    let data = {
        'action': 'autenticacao'
    };
    $.ajax({
        url: __BASE_API__,
        type: 'POST',
        data: data
    }).done(res => {
        res = JSON.parse(res);

        if (res.status == undefined) {
            console.log('erro na requisição');
            return false;
        }

        if (res.status == 401) {
            window.location.href = __BASE_URI__ + "?autenticacao=false";
        }
    })
}

function autenticaAdmin() {
    let data = {
        action: 'autenticaAdmin'
    };
    $.ajax({
        url: __BASE_API__,
        type: 'POST',
        data: data
    }).done(res => {
        res = JSON.parse(res);

        if (res.status == undefined) {
            console.log('erro na requisição');
            return false;
        }

        if (res.status == 401) {
            window.location.href = __BASE_URI__ + "painel-admin.html?autenticacao=false";
        }
    })
}

$("#nome_usuario").html(localStorage.getItem('usuario_login_optionmaker'));

function show_loading() {
    $("#loading").removeClass('d-none');
    $("#no-loading").addClass('d-none');
}

function hide_loading() {
    $("#loading").addClass('d-none');
    $("#no-loading").removeClass('d-none');
}