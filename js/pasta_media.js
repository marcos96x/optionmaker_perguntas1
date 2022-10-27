var vm = new Vue({
    el: '#app',
    data: {
        perguntas: null,
        remove: null,
        pasta_id: null,
        usuario_status_optionmaker: localStorage.getItem('usuario_status_optionmaker'),
    },
    methods: {
        listarPerguntas: () => {
            show_loading();
            let data = {
                'action': 'listaPerguntas',
                'pasta': $("#pasta_id").val()
            };
            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                res = JSON.parse(res);
                hide_loading();
                if (res.status == undefined) {
                    console.log('erro na requisição');
                    return false;
                }

                if (res.status == 200) {
                    vm.perguntas = res.perguntas;
                   
                    if(vm.usuario_status_optionmaker > 1 && vm.perguntas.length > 0) {
                        window.location.href = __BASE_URI__ + "grafico.html?token=" + vm.perguntas[0].pergunta_url + "&pasta=" + vm.pasta_id;
                    }
                } else {
                    vm.perguntas = null;
                }
            })
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
        const urlParams = new URLSearchParams(window.location.search);

        var pasta = urlParams.get('pasta');

        if (pasta == null) {
            window.location.href = __BASE_URI__ + "pastas.html";
        }
        $("#pasta_id").val(pasta);
        this.pasta_id = pasta;
        $("#btn-print").attr('href', 'print-resultados.html?pasta=' + pasta)
        autenticaAdmin();

        this.listarPerguntas();
    }
})