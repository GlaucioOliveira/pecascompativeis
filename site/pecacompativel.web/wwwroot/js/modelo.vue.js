var app = new Vue({
    el: '#app',
    data: {
        modelo: [],
        pecasAlternativas: [],
        filtroTabela: ''
    },

    mounted() {
        var id = IdPagina();
        axios.get("https://localhost:44300/modelo/" + id)
            .then(response => (this.modelo = response.data));

        axios.get("https://localhost:44300/peca/ListarPecasAlternativas/" + id)
            .then(response => (this.pecasAlternativas = response.data));
    }
});