var vm = new Vue({
    el: '#app',
    data: {
        pastas: null,
        pasta_atual: null,
        remove: null,
        usuario_status_optionmaker: localStorage.getItem('usuario_status_optionmaker'),
        usuarios_nao_vinculados: null,
        usuarios_vinculados: null,
    },
    methods: {
        listarPastas: () => {
            show_loading();
            let data = {
                'action': 'listaPastas',
            };
            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                res = JSON.parse(res);
                if (localStorage.getItem('usuario_status_optionmaker') > 1) {
                    $(".hide-usuario").hide();
                }
                if (res.status == undefined) {
                    console.log('erro na requisição');
                    return false;
                }
                
                if (res.status == 200) {
                    vm.pastas = res.pastas;
                } else {
                    vm.pastas = null;
                }
                hide_loading();
            })
        },
        addPasta: () => {
            $("#Pasta_titulo").val("");
            $("#modalAddPasta").modal('show');
        },
        editPasta: (Pasta) => {
            $("#Pasta_titulo_edit").val(Pasta.pasta_nome);
            $("#Pasta_id_edit").val(Pasta.pasta_id);
            $("#modalEditPasta").modal('show');
        },
        editaPasta: () => {
            let titulo = $("#Pasta_titulo_edit").val();
            let id = $("#Pasta_id_edit").val();
            let data = {
                'action': 'editaPasta',
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

                $("#modalEditPasta").modal('hide');
                if (res.status == 200) {
                    $.toast("Pasta editada com sucesso!");
                    vm.listarPastas();
                } else {
                    $.toast("Não foi possível editar a Pasta!");
                }
            })
        },
        salvaPasta: () => {
            let titulo = $("#Pasta_titulo").val();
            let data = {
                'action': 'salvaPasta',
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

                $("#modalAddPasta").modal('hide');
                if (res.status == 200) {
                    $.toast("Pasta cadastrada com sucesso!");
                    vm.listarPastas();
                } else {
                    $.toast("Não foi possível cadastrar a Pasta!");
                }
            })
        },
        prepareRemovePasta: (id) => {
            vm.remove = id;
            $("#modalRemovePasta").modal('show');
        },
        removePasta: () => {
            if (vm.remove == null) {
                $.toast("Não foi possível remover a Pasta!");
                return false;
            }
            let data = {
                'action': 'removePasta',
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

                $("#modalRemovePasta").modal('hide');
                if (res.status == 200) {
                    $.toast("Pasta removida com sucesso!");
                    vm.listarPastas();
                } else {
                    $.toast("Não foi possível remover a Pasta!");
                }
            })
        },

        modalUsuario: (pasta) => {            
            vm.pasta_atual = pasta;

            show_loading();
            let data = {
                'action': 'listaUsuariosPasta',
                'pasta': pasta.pasta_id
            };
            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                res = JSON.parse(res);
                console.log(res)
                hide_loading();
                if (res.status == undefined) {
                    console.log('erro na requisição');
                    return false;
                }

                if (res.status == 200) {
                    vm.usuarios_nao_vinculados = res.usuarios_nao_vinculados;
                    vm.usuarios_vinculados = res.usuarios_vinculados;
                } else {
                    vm.usuarios_nao_vinculados = null;
                    vm.usuarios_vinculados = null;
                }
                $("#modalUsuario").modal('show');
            })

        },
        vincula_usuario: () => {
            let data = {
                'action': 'vinculaUsuariosPasta',
                'pasta': vm.pasta_atual.pasta_id,
                'usuario': $("#usuarios_nao_vinculado").val()
            };
            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                console.log(res);
                res = JSON.parse(res);
                if (res.status == undefined) {
                    console.log('erro na requisição');
                    return false;
                }
                $.toast("Usuário vinculado com sucesso");
                
                $("#modalUsuario").modal('hide');
            })
        },
        remove_usuario: (id) => {
            let data = {
                'action': 'removeUsuariosPasta',
                'id': id
            };
            $.ajax({
                url: __BASE_API__,
                type: 'POST',
                data: data
            }).done(res => {
                console.log(res);
                res = JSON.parse(res);
                if (res.status == undefined) {
                    console.log('erro na requisição');
                    return false;
                }
                $.toast("Usuário desvinculado com sucesso");
                
                $("#modalUsuario").modal('hide');
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
    created: function () {

        autenticaAdmin();

        this.listarPastas();
    }
})