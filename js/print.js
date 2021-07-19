var vm = new Vue({
    el: '#app',
    data: {
        perguntas: null
    },
    methods: {
        listarPerguntas: () => {
            const urlParams = new URLSearchParams(window.location.search);

            var pasta = urlParams.get('pasta');
            let data = {
                'action': 'listaPerguntasPrint',
                'pasta': pasta
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
                setTimeout(() => {
                    window.print();
                }, 500);
            })
        },
    },
    // LifeCicle
    created: function() {
        this.listarPerguntas();
    }
})