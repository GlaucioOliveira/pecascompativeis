var app = new Vue({
    el: '#app',
    data: function() {
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
    }
  },
  
    mounted () {
      let uri = window.location.search.substring(1); 
      let params = new URLSearchParams(uri);

      axios.get("https://localhost:44300/marca")
           .then(response => (this.marcas = response.data));

           axios.get("https://localhost:44300/modelo/" + params.get("id"))
           .then(response => (this.modelo = response.data));
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
         //enviar post passando como parâmetor o objeto this.novaPeca;
         //o axios converte o objeto para string (JSON.stringify) automaticamente.
         this.enviado = true;
         this.novaPeca.ModeloOrigem = this.modelo.id;
         axios.post("https://localhost:44300/peca", this.novaPeca)
        .then(response => {
          this.redirecionando = true;
          window.location.href = "http://127.0.0.1:5500/modelo.html?id=" + this.modelo.id;
        })
        .catch(e => {
          //this.errors.push(e)
        })

       }
    }

    ,computed: {
      modelos: function() {     
        return this.marcaSelecionada.modelo;
      }
    }
    
  })