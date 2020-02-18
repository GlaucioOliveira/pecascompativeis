var app = new Vue({
    el: '#app',
    data: {
      marca: [],
      filtroTabela: ''
    },
  
    mounted () {
      let uri = window.location.search.substring(1); 
      let params = new URLSearchParams(uri);
      //console.log(params.get("id"));

      axios.get("https://localhost:44300/marca/" + params.get("id"))
           .then(response => (this.marca = response.data))
    },

    computed: {
      modeloFiltro() {
        if(this.marca.modelo != undefined) {
        return this.marca.modelo.filter( x => {
          return (
                x.nome.toLowerCase().indexOf(this.filtroTabela.toLowerCase()) > -1
          )
        })
      }
      else{
        return [];
      }
      }
    }
  })