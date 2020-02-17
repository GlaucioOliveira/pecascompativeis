var app = new Vue({
    el: '#app',
    data: {
        marca: [],
        filtroTabela: ''
    },

    mounted() {
        var id = IdPagina();
        axios.get("https://localhost:44300/marca/" + id)
            .then(response => (this.marca = response.data));
    },

    computed: {
        modeloFiltro() {
            if (this.marca.modelo !== undefined) {
                return this.marca.modelo.filter(x => {
                    return (
                        x.nome.toLowerCase().indexOf(this.filtroTabela.toLowerCase()) > -1
                    );
                });
            }
            else {
                return [];
            }
        }
    }
})