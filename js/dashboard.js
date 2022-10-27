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
        addPergunta: () => {
            $("#pergunta_titulo").val("");
            $("#pergunta_tipo").val('1').trigger('change');
            $("#pergunta_contabiliza_grupo").val('1').trigger('change');
            $("#modalAddPergunta").modal('show');
        },
        editPergunta: (pergunta) => {
            $("#pergunta_titulo_edit").val(pergunta.pergunta_titulo);
            $("#pergunta_id_edit").val(pergunta.pergunta_id);
            $("#pergunta_tipo_edit").val(pergunta.pergunta_tipo).trigger('change');
            $("#pergunta_contabiliza_grupo_edit").val(pergunta.pergunta_contabiliza_grupo).trigger('change');
            $("#modalEditPergunta").modal('show');
        },
        editaPergunta: () => {
            let titulo = $("#pergunta_titulo_edit").val();
            let tipo = $("#pergunta_tipo_edit").val();
            let id = $("#pergunta_id_edit").val();
            let contabiliza_grupo = $("#pergunta_contabiliza_grupo_edit").val();
            let data = {
                'action': 'editaPergunta',
                'tipo': tipo,
                'titulo': titulo,
                'contabiliza_grupo': contabiliza_grupo,
                'id': id,
                'pasta': $("#pasta_id").val()
            };

            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                console.log(res);
                res = JSON.parse(res);

                if (res.status == undefined) {
                    $.toast("Não foi possível se conectar ao servidor!");
                    console.log('erro na requisição');
                    return false;
                }

                $("#modalEditPergunta").modal('hide');
                if (res.status == 200) {
                    $.toast("Pergunta editada com sucesso!");
                    vm.listarPerguntas();
                } else {
                    $.toast("Não foi possível editar a pergunta!");
                }
            })
        },
        salvaPergunta: () => {
            let titulo = $("#pergunta_titulo").val();
            let tipo = $("#pergunta_tipo").val();
            let contabiliza_grupo = $("#pergunta_contabiliza_grupo").val();
            let data = {
                'action': 'salvaPergunta',
                'titulo': titulo,
                'tipo': tipo,
                'contabiliza_grupo': contabiliza_grupo,
                'pasta': $("#pasta_id").val()
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

                $("#modalAddPergunta").modal('hide');
                if (res.status == 200) {
                    $.toast("Pergunta cadastrada com sucesso!");
                    vm.listarPerguntas();
                } else {
                    $.toast("Não foi possível cadastrar a pergunta!");
                }
            })
        },
        prepareRemovePergunta: (id) => {
            vm.remove = id;
            $("#modalRemovePergunta").modal('show');
        },
        removePergunta: () => {
            if (vm.remove == null) {
                $.toast("Não foi possível remover a pergunta!");
                return false;
            }
            let data = {
                'action': 'removePergunta',
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

                $("#modalRemovePergunta").modal('hide');
                if (res.status == 200) {
                    $.toast("Pergunta removida com sucesso!");
                    vm.listarPerguntas();
                } else {
                    $.toast("Não foi possível remover a pergunta!");
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