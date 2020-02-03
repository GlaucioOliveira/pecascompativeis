var app = new Vue({
    el: '#app',
    data: function() {
      return {
      marcaSelecionada: [],
      modeloSelecionado: [],
      marcas: null,
      AnosModeloSelecionado: [],
      anoSelecionado: null,
      saida: '',
      novaPeca: {
        Marca: '',
        Modelo: '',
        Ano: '',
        PecaNome: '',
        NecessitaAdaptacao: false,
        Observacao: ''
      }
    }
  },
  
    mounted () {
      axios.get("https://localhost:44300/marca")
           .then(response => (this.marcas = response.data))
    },
    
    methods: {
      atualizaReferencias: function() {
        this.AnosModeloSelecionado = [];
        this.novaPeca.Marca = this.marcaSelecionada.nome;
      },
      atualizaReferenciasAnos: function() {
         //atualiza o modelo selecionado;
         this.novaPeca.Modelo = this.modeloSelecionado.nome;        
         this.AnosModeloSelecionado = this.modeloSelecionado.ano;
       },

       atualizaAnoSelecionado: function() {
        this.novaPeca.Ano = this.anoSelecionado; 
       },

       enviarPecaAlternativa: function() {
        alert('teste');
        this.saida = JSON.stringify(this.novaPeca);
       
        //  axios.post("https://localhost:44300/peca", {
        //   body: JSON.stringify(this.novaPeca)
        // })
        // .then(response => {})
        // .catch(e => {
        //   //this.errors.push(e)
        // })

       }
    }

    ,computed: {
      modelos: function() {     
        return this.marcaSelecionada.modelo;
      }
    }
    
  })