var vm = new Vue({
    el: '#app',
    data: {
        endQuiz: false,
        token: null,
        pergunta: null,
        perguntaSelecionada: null,
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
            this.getPergunta();
            // if (localStorage.getItem(this.keyLS) == null || localStorage.getItem(this.keyLS) == false) {
            //     this.getPergunta();
            // } else {
            //     this.showResultados();
            // }
        },
        getPergunta: function () {
            if (this.token != null) {
                let data = {
                    'action': 'getPergunta',
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
                        vm.pergunta = res.pergunta;
                    } else {
                        window.location.href = __BASE_URI__ + "index.html";
                        return false;
                    }
                })
            }
        },
        selecionaQuestao: function (id) {
            this.perguntaSelecionada = id;
            let field = "#alternativa_" + id;
            $(".alternativa").removeClass('selecionada');
            $(field).addClass('selecionada');
        },
        confirma: function () {
            if (this.perguntaSelecionada == null) {
                $.toast("Selecione uma alternativa!");
            } else {
                let data = {
                    'action': 'confirmaAlternativa',
                    'alternativa': this.perguntaSelecionada
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
                        let keyLS = "pergunta_" + vm.token;
                        localStorage.setItem(keyLS, true);
                        vm.showResultados();
                    }
                })
            }
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

//   cronometro
$(document).ready(function () {
    // localStorage.setItem('minuto', '0');
    // localStorage.setItem('segundo', '20');
    // cronometro();
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
            let alternativas = res.pergunta.alternativas;
            // prepara para exibição do chart.js
            let labels = [];
            let background = [];
            let dados = [];
            alternativas.map(alt => {
                labels.push(alt.alternativa_titulo);
                background.push(alt.alternativa_cor);
                dados.push(Number(alt.alternativa_escolhas) / Number(alt.alternativa_total) * 100);
            })
            let opcoes = {
                responsive: true,
                animation: false,
                minBarLength: 0,
                base: 0,
                indexAxis: 'y',
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 100
                        }
                    }]
                }
            };
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: '% das escolhas',
                        data: dados,
                        backgroundColor: background,
                    }]
                },
                options: opcoes
            });
            // request
        }
    })
  
}

function cronometro() {
    let minuto = localStorage.getItem('minuto');
    let segundo = localStorage.getItem('segundo');
    setTimeout(() => {
        if (minuto < 0 || (minuto <= 0 && segundo <= 0)) {
            // Tempo esgotado
            vm.tempoEsgotado = true;
            let keyLS = "pergunta_" + vm.token;
            localStorage.setItem(keyLS, true);
            if(vm.perguntaSelecionada != null) {
                vm.confirma();
            } else {
                vm.showResultados();
            }
        } else {
            segundo--;
            if (segundo < 0) {
                segundo = 59;
                minuto--;
            }
            localStorage.setItem("minuto", minuto);
            localStorage.setItem("segundo", segundo);
            if (minuto < 10)
                minuto = '0' + minuto;
            if (segundo < 10)
                segundo = '0' + segundo;
            $("#minuto").html(minuto);
            $("#segundo").html(segundo);
            cronometro();
        }
    }, 1000)
}