var vm = new Vue({
    el: '#app',
    data: {
        alternativas: null,
        remove: null,
        pergunta_id: null,
    },
    methods: {
        setPergunta: (id) => {
            alert(id)
            vm.pergunta_id = id;
        },
        listarAlternativas: () => {
            show_loading();
            let data = {
                'action': 'listarAlternativas',
                'pergunta': $("#pergunta_id").val()
            };
            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                hide_loading();
                res = JSON.parse(res);

                if (res.status == undefined) {
                    console.log('erro na requisição');
                    return false;
                }

                if (res.status == 200) {
                    vm.alternativas = res.alternativas;
                } else {
                    vm.alternativas = null;
                }
            })
        },
        addAlternativa: () => {
            $("#alternativa_titulo").val("");
            $("#alternativa_peso").val("");
            $("#alternativa_cor").val("");
            $("#modalAddalternativa").modal('show');
        },
        editAlternativa: (alternativa) => {
            $("#alternativa_titulo_edit").val(alternativa.alternativa_titulo);
            $("#alternativa_cor_edit").val(alternativa.alternativa_cor);
            $("#alternativa_id_edit").val(alternativa.alternativa_id);
            $("#alternativa_peso_edit").val(alternativa.alternativa_peso);
            $("#modalEditalternativa").modal('show');
        },
        editaAlternativa: () => {
            let titulo = $("#alternativa_titulo_edit").val();
            let cor = $("#alternativa_cor_edit").val();
            let id = $("#alternativa_id_edit").val();
            let peso = $("#alternativa_peso_edit").val();
            let data = {
                'action': 'editaAlternativa',
                'titulo': titulo,
                'cor': cor,
                'id': id,
                'peso': peso,
            };

            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                res = JSON.parse(res);

                if (res.status == undefined) {
                    $.toast("Não foi possível se conectar ao servidor!");
                    console.log('erro na requisição');
                    return false;
                }

                $("#modalEditalternativa").modal('hide');
                if (res.status == 200) {
                    $.toast("Alternativa editada com sucesso!");
                    vm.listarAlternativas();
                } else {
                    $.toast("Não foi possível editar a alternativa!");
                }
            })
        },
        salvaAlternativa: () => {
            let titulo = $("#alternativa_titulo").val();
            let cor = $("#alternativa_cor").val();
            let peso = $("#alternativa_peso").val();
            let data = {
                'action': 'salvaAlternativa',
                'titulo': titulo,
                'cor': cor,
                'peso': peso,
                'pergunta': $("#pergunta_id").val()
            };
            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                res = JSON.parse(res);

                if (res.status == undefined) {
                    $.toast("Não foi possível se conectar ao servidor!");
                    console.log('erro na requisição');
                    return false;
                }

                $("#modalAddalternativa").modal('hide');
                if (res.status == 200) {
                    $.toast("Alternativa cadastrada com sucesso!");
                    vm.listarAlternativas();
                } else {
                    $.toast("Não foi possível cadastrar a alternativa!");
                }
            })
        },
        prepareRemovealternativa: (id) => {
            vm.remove = id;
            $("#modalRemovealternativa").modal('show');
        },
        removealternativa: () => {
            if (vm.remove == null) {
                $.toast("Não foi possível remover a alternativa!");
                return false;
            }
            let data = {
                'action': 'removeAlternativa',
                'id': vm.remove
            };

            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                res = JSON.parse(res);

                if (res.status == undefined) {
                    $.toast("Não foi possível se conectar ao servidor!");
                    console.log('erro na requisição');
                    return false;
                }

                $("#modalRemovealternativa").modal('hide');
                if (res.status == 200) {
                    $.toast("alternativa removida com sucesso!");
                    vm.listarAlternativas();
                } else {
                    $.toast("Não foi possível remover a alternativa!");
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

        var pergunta = urlParams.get('pergunta');

        if (pergunta == null) {
            window.location.href = __BASE_URI__ + "dashboard.html";
        }
        $("#pergunta_id").val(pergunta);
        autenticaAdmin();
        this.listarAlternativas();

        if (localStorage.getItem('usuario_status_optionmaker') > 1) {
            window.location.href = __BASE_URI__ + "dashboard.html";
        }

        var pasta = urlParams.get('pasta');
        $("#btn_voltar").attr('href', 'dashboard.html?pasta=' + pasta);

    }
})