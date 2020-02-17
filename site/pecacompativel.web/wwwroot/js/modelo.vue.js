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
                .then(response => (this.pecasAlternativas = response.data));
        }
    },

    mounted() {
        var Id = IdPagina();
        this.id = Id;
        axios.get("https://localhost:44300/modelo/" + Id)
            .then(response => (this.modelo = response.data));        

        this.atualizaListaPecasAlternativas();
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