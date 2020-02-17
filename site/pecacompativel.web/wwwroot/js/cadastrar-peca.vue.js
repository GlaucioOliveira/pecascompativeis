var appCadastro = new Vue({
    el: '#cadastro',
    data: function () {
        return {
            enviado: false,
            redirecionando: false,
            marcaSelecionada: [],
            modeloSelecionado: [],
            modelo: [],
            marcas: null,
            AnosModeloSelecionado: [],
            anoSelecionado: null,
            saida: '',
            novaPeca: {
                Marca: '',
                Modelo: '',
                ModeloOrigem: '',
                Ano: '',
                PecaNome: '',
                NecessitaAdaptacao: false,
                Observacao: ''
            }
        };
    },

    mounted() {
        var id = IdPagina();

        axios.get("https://localhost:44300/marca")
            .then(response => (this.marcas = response.data));

        axios.get("https://localhost:44300/modelo/" + id)
            .then(response => (this.modelo = response.data));
    },

    methods: {
        atualizaReferencias: function () {
            this.AnosModeloSelecionado = [];
            this.novaPeca.Marca = this.marcaSelecionada.nome;
        },
        atualizaReferenciasAnos: function () {
            //atualiza o modelo selecionado;
            this.novaPeca.Modelo = this.modeloSelecionado.nome;
            this.AnosModeloSelecionado = this.modeloSelecionado.ano;
        },

        atualizaAnoSelecionado: function () {
            this.novaPeca.Ano = this.anoSelecionado;
        },

        limpaFormulario: function () {
            this.marcaSelecionada = [];
            this.modeloSelecionado = [];
            this.anoSelecionado = null;

            this.novaPeca = {
                Marca: '',
                Modelo: '',
                ModeloOrigem: '',
                Ano: '',
                PecaNome: '',
                NecessitaAdaptacao: false,
                Observacao: ''
            };

            this.enviado = false;
            this.redirecionando = false;
            $('#modalCadastro').modal('hide');
        },
        enviarPecaAlternativa: function () {
            //enviar post passando como parâmetor o objeto this.novaPeca;
            //o axios converte o objeto para string (JSON.stringify) automaticamente.
            this.enviado = true;
            this.novaPeca.ModeloOrigem = this.modelo.id;
            axios.post("https://localhost:44300/peca", this.novaPeca)
                .then(response => {
                    this.redirecionando = true;
                    //window.location.href = "http://127.0.0.1:5500/modelo.html?id=" + this.modelo.id;
                    app.atualizaListaPecasAlternativas();

                    this.limpaFormulario();
                })
                .catch(e => {
                    //this.errors.push(e)
                });
        }
    }

    , computed: {
        modelos: function () {
            return this.marcaSelecionada.modelo;
        }
    }
});


////TODO: refatorar essa parte do código... duas requisções na mesma API...
//var appBreadcrumb = new Vue({
//    el: '#breadcrumb',
//    data: {
//        modelo: []
//    },

//    mounted() {
//        var id = IdPagina();
//        axios.get("https://localhost:44300/modelo/" + id)
//            .then(response => (this.modelo = response.data));
//    }
//});
