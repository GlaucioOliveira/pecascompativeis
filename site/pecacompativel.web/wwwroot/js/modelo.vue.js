var app = new Vue({
    el: '#app',
    data: {
        modelo: [],
        pecasAlternativas: [],
        filtroTabela: '',
        id: ''
    },

    methods: {
        atualizaListaPecasAlternativas: function () {
            axios.get("https://localhost:44300/peca/ListarPecasAlternativas/" + this.id)
                .then(response => {
                    this.pecasAlternativas = response.data;
                    let x = this.computed.listaPecasAlternativasFiltro();
                });
        },

        removerPecaAlternativa: function (idPeca) {
            axios.delete("https://localhost:44300/peca/" + idPeca)
                .then(response => {
                    this.pecasAlternativas = response.data;
                    this.atualizaListaPecasAlternativas();
                });
        }
    },

    mounted() {
        var Id = IdPagina();
        this.id = Id;
        axios.get("https://localhost:44300/modelo/" + Id)
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
        axios.get("https://localhost:44300/modelo/" + id)
            .then(response => (this.modelo = response.data));
    }
});