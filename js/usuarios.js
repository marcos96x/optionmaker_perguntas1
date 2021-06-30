var vm = new Vue({
    el: '#app',
    data: {
        usuarios: null,
        remove: null,
    },
    methods: {
        lista: () => {
            let data = {
                'action': 'listaUsuarios',
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
                    vm.usuarios = res.usuarios;
                } else {
                    vm.usuarios = null;
                }
            })
        },
        addUsuario: () => {
            $("#usuario_login").val("");
            $("#usuario_senha").val("");
            $("#usuario_confirma_senha").val("");
            $("#usuario_status").val("1").trigger('change');
            $("#modalAddUsuario").modal('show');
        },
        editUsuario: (usuario) => {
            $("#usuario_id_edit").val(usuario.usuario_id);
            $("#usuario_status_edit").val(usuario.usuario_status).trigger('change');
            $("#usuario_login_edit").val(usuario.usuario_login);
            $("#usuario_senha_edit").val("");
            $("#usuario_confirma_senha_edit").val("");
            $("#modalEditUsuario").modal('show');
        },
        editaUsuario: () => {
            if ($("#usuario_senha_edit").val().trim() != $("#usuario_confirma_senha_edit").val().trim()) {
                $.toast("As senhas não são iguais!");
                return false;
            }
            let id = $("#usuario_id_edit").val();
            let login = $("#usuario_login_edit").val();
            let senha = $("#usuario_senha_edit").val();
            let status = $("#usuario_status_edit").val();
            let data = {
                'action': 'editaUsuario',
                'id': id,
                'login': login,
                'senha': senha,
                'status': status,
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

                if (res.status == 200) {
                    $.toast("Usuário editado com sucesso!");
                    $("#usuario_id_edit").val("");
                    $("#usuario_status_edit").val("1").trigger('change');
                    $("#usuario_login_edit").val("");
                    $("#usuario_senha_edit").val("");
                    $("#usuario_confirma_senha_edit").val("");
                    $("#modalEditUsuario").modal('hide');
                    vm.lista();
                } else if (res.status == 401) {
                    $.toast("Login Indisponível");
                } else {
                    console.log(res);
                    $.toast("Não foi possível editar o usuario!");
                }
            })
        },
        salvaUsuario: () => {
            if ($("#usuario_senha").val().trim() != $("#usuario_confirma_senha").val().trim()) {
                $.toast("As senhas não são iguais!");
                return false;
            }
            let login = $("#usuario_login").val();
            let senha = $("#usuario_senha").val();
            let status = $("#usuario_status").val();
            let data = {
                'action': 'salvaUsuario',
                'login': login,
                'senha': senha,
                'status': status,
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

                if (res.status == 200) {
                    $.toast("Usuário cadastrado com sucesso!");
                    vm.lista();
                    $("#usuario_login").val("");
                    $("#usuario_senha").val("");
                    $("#usuario_confirma_senha").val("");
                    $("#usuario_status").val("1").trigger('change');
                    $("#modalAddUsuario").modal('hide');
                } else if (res.status == 401) {
                    $.toast("Login Indisponível");
                } else {
                    $.toast("Não foi possível cadastrar o usuario!");
                }
            })
        },
        prepareRemoveUsuario: (id) => {
            vm.remove = id;
            $("#modalRemoveUsuario").modal('show');
        },
        removeUsuário: () => {
            if (vm.remove == null) {
                $.toast("Não foi possível remover o usuário!");
                return false;
            }
            let data = {
                'action': 'removeUsuario',
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

                $("#modalRemoveUsuario").modal('hide');
                if (res.status == 200) {
                    $.toast("Usuário removido com sucesso!");
                    vm.lista();
                } else {
                    $.toast("Não foi possível remover o usuário!");
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

        if (localStorage.getItem('usuario_status_optionmaker') > 1) {
            window.location.href = __BASE_URI__ + "dashboard.html";
        }

        this.lista();
    }
})