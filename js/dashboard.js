var vm = new Vue({
    el: '#app',
    data: {
        perguntas: null,
        remove: null,
        usuario_status_optionmaker: localStorage.getItem('usuario_status_optionmaker'),
    },
    methods: {
        listarPerguntas: () => {
            let data = {
                'action': 'listaPerguntas',
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
                    vm.perguntas = res.perguntas;
                } else {
                    vm.perguntas = null;
                }
            })
        },
        addPergunta: () => {
            $("#pergunta_titulo").val("");
            $("#modalAddPergunta").modal('show');
        },
        editPergunta: (pergunta) => {
            $("#pergunta_titulo_edit").val(pergunta.pergunta_titulo);
            $("#pergunta_id_edit").val(pergunta.pergunta_id);
            $("#modalEditPergunta").modal('show');
        },
        editaPergunta: () => {
            let titulo = $("#pergunta_titulo_edit").val();
            let id = $("#pergunta_id_edit").val();
            let data = {
                'action': 'editaPergunta',
                'titulo': titulo,
                'id': id,
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
            let data = {
                'action': 'salvaPergunta',
                'titulo': titulo
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

        autenticaAdmin();

        this.listarPerguntas();
    }
})