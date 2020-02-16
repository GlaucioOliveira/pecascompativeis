var app = new Vue({
    el: '#breadcrumb',
    data: {
      modelo: [],
      pecasAlternativas: [],
      filtroTabela: ''
    },
  
    mounted () {
      let uri = window.location.search.substring(1); 
      let params = new URLSearchParams(uri);

      axios.get("https://localhost:44300/modelo/" + params.get("id"))
           .then(response => (this.modelo = response.data));

      axios.get("https://localhost:44300/peca/ListarPecasAlternativas/" + params.get("id"))
          .then(response => (this.pecasAlternativas = response.data));
    }
  })