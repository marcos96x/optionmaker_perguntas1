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

        if(res.status == undefined) {
            console.log('erro na requisição');
            return false;
        }

        if(res.status == 401) {
            window.location.href = __BASE_URI__ + "?autenticacao=false" ;
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

        if(res.status == undefined) {
            console.log('erro na requisição');
            return false;
        }

        if(res.status == 401) {
            window.location.href = __BASE_URI__ + "painel-admin.html?autenticacao=false" ;
        } 
    })
}