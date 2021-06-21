var vm = new Vue({
    el: '#app',
    data: {
        token: null,
        pergunta_titulo: null,
        alternativas: null,
    },
    methods: {
        getToken: function () {
            const urlParams = new URLSearchParams(window.location.search);

            var token = urlParams.get('token');

            if (token == null) {
                window.location.href = __BASE_URI__ + "index.html";
                return false;
            }

            this.token = token;
            this.keyLS = "pergunta_" + token;            
            this.showResultados();
        },
        showResultados: function () {
            this.endQuiz = true;
            // mostra o dashboard          

            setInterval(() => {   
                renderizaGrafico();                  
            }, 1000);
        },
    },
    // LifeCicle
    created: function () {
        this.getToken();
    }
})

function renderizaGrafico() {
    let data = {
        'action': 'getPerguntaForGrafico',
        'token': vm.token
    };
    $.ajax({
        url: __BASE_API__,
        type: 'POST',
        data: data
    }).done(res => {
        res = JSON.parse(res);
        console.log(res)
        if (res.status == undefined) {
            console.log('erro na requisição');
            return false;
        }

        if (res.status == 200) {
            // request
            vm.pergunta_titulo = res.pergunta.pergunta_titulo;
            let alternativas = res.pergunta.alternativas;
            vm.alternativas = alternativas;
           
            // request
        }
    })
  
}