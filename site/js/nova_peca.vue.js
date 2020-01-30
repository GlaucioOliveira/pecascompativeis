var app = new Vue({
    el: '#app',
    data: function() {
      return {
      marcaSelecionada: [],
      modeloSelecionado: [],
      marcas: null,
      AnosModeloSelecionado: [],
      anoSelecionado: null,
    }
  },
  
    mounted () {
      axios.get("https://localhost:44300/marca")
           .then(response => (this.marcas = response.data))
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