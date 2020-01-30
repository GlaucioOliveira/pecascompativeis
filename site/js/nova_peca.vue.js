var app = new Vue({
    el: '#app',
    data: function() {
      return {
      marcaSelecionada: [],
      modeloSelecionado: [],
      marcasPopulares: null,
      AnosModeloSelecionado: [],
      //modelos: [],
      decks: [{start: 0, end: 3}, {start: 3, end: 6}]
    }
  },
  
    mounted () {
      axios.get("https://localhost:44300/marca")
           .then(response => (this.marcasPopulares = response.data))
    },
    
    methods: {
      atualizaReferencias: function() {
        this.AnosModeloSelecionado = [];
      },
      atualizaReferenciasAnos: function() {
         this.AnosModeloSelecionado = this.modeloSelecionado.ano;
       }
    }

    ,computed: {
      modelos: function() {     
        return this.marcaSelecionada.modelo;
      }
    }
    
  })