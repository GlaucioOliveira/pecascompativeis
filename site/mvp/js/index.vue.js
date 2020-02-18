var app = new Vue({
    el: '#app',
    data: {
      marcasPopulares: [],
      decks: [{start: 0, end: 3}, {start: 3, end: 6}]
    },
  
    mounted () {
      axios.get("https://localhost:44300/marca/ListaPopulares")
           .then(response => (this.marcasPopulares = response.data))
    }

  })