var vm = new Vue({
    el: '#app',
    data: {
        token: null,
        pergunta_titulo: null,
        alternativas: null,
        tokenNext: null,
        tokenPrev: null,
    },
    methods: {
        getPrevNext: function() {
            let data = {
                'action': 'getNextPrev',
                'token': this.token
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
                console.log(res);
                if (res.status == 200) {
                    // request
                    if (res.tokenPrev != null) {
                        vm.tokenPrev = res.tokenPrev;
                    }
                    if (res.tokenNext != null) {
                        vm.tokenNext = res.tokenNext;
                    }
                    // request
                }
            })
        },
        getToken: function() {
            const urlParams = new URLSearchParams(window.location.search);

            var token = urlParams.get('token');

            if (token == null) {
                window.location.href = __BASE_URI__ + "index.html";
                return false;
            }

            this.token = token;
            this.keyLS = "pergunta_" + token;
            this.getPrevNext();
            this.showResultados();
        },
        showResultados: function() {
            this.endQuiz = true;
            // mostra o dashboard          
            show_loading();
            setInterval(() => {
                renderizaGrafico();
            }, 1000);
            setTimeout(() => {
                hide_loading();
            }, 2000);
        },
        logout: () => {
            let data = {
                'action': 'logoutAdmin',
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

                if (res.status == 200) {
                    window.location.href = __BASE_URI__ + "painel-admin.html";
                }
            })
        }
    },
    // LifeCicle
    created: function() {
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