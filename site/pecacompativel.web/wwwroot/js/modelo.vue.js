var app = new Vue({
    el: '#app',
    data: {
        modelo: [],
        pecasAlternativas: [],
        filtroTabela: '',
        id: '',
        pecaAlternativaParaRemover: ''
    },

    methods: {
        atualizaListaPecasAlternativas: function () {
            axios.get(apiURL() + "peca/ListarPecasAlternativas/" + this.id)
                .then(response => {
                    this.pecasAlternativas = response.data;
                });
        },

        escolherPecaAlternativaParaRemover: function (idPeca) {
            this.pecaAlternativaParaRemover = idPeca;
        },

        removerPecaAlternativa: function () {
            axios.delete(apiURL() + "peca/" + this.pecaAlternativaParaRemover)
                .then(response => {
                    this.atualizaListaPecasAlternativas();
                    $('#modalPromptExclusao').modal('hide');
                });
        }
    },

    mounted() {
        var Id = IdPagina();
        this.id = Id;
        axios.get(apiURL() + "modelo/" + Id)
            .then(response => (this.modelo = response.data));

        this.atualizaListaPecasAlternativas();
    },

    computed: {
        listaPecasAlternativasFiltro() {
            if (this.pecasAlternativas !== undefined) {
                return this.pecasAlternativas.filter(x => {
                    return (
                        x.pecaNome.toLowerCase().indexOf(this.filtroTabela.toLowerCase()) > -1
                    );
                });
            }
            else {
                return [];
            }
        }
    }
});

//TODO: refatorar essa parte do código... duas requisções na mesma API...
var appBreadcrumb = new Vue({
    el: '#breadcrumb',
    data: {
        modelo: []
    },

    mounted() {
        var id = IdPagina();
        axios.get(apiURL() + "modelo/" + id)
            .then(response => (this.modelo = response.data));
    }
});