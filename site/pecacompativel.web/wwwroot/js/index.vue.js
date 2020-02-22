var app = new Vue({
    el: '#app',
    data: {
        marcasPopulares: [],
        listaQuantidadePecas: [{ "contagemPecas": 0 }],
        itemAtual: [],
        decks: [{ start: 0, end: 3 }, { start: 3, end: 6 }]
    },
    methods: {
        pegaQuantidade: function (modelo) {
            //lista a quantidade de peças alternativas cadastradas para um
            //modelo de moto.
            if (modelo !== undefined && this.listaQuantidadePecas !== undefined) {
                let tmpItem = this.listaQuantidadePecas.filter(function (item) {
                    return item.modeloOrigem === modelo;
                });

                if (tmpItem !== undefined && tmpItem.length > 0 && tmpItem[0].contagemPecas !== undefined)
                    return tmpItem[0].contagemPecas;
                else
                    return 0;
            }
            else {
                return 0;
            }
        }
    },
    mounted() {
        axios.get(apiURL() + "marca/ListaPopulares")
            .then(response => (this.marcasPopulares = response.data));

        axios.get(apiURL() + "peca/ListarQuantidadePecasAlternativas")
            .then(response => {
                this.listaQuantidadePecas = response.data;
            });
    }
});