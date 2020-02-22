/* Função para controlar o #back-to-top*/

//Define a Raiz da API para ser consumida.
var apiURL = function () {
	return "https://goliveira.com/dev/"; //"https://localhost:44300/";
};

//obtem o id do registro na página atual.
var IdPagina = function () {
    var urlAddress = window.location.pathname;
    urlAddress = urlAddress.replace("/pecacompativel", ""); //ajuste temporário...
	var firstSlashPosition = urlAddress.indexOf("/");
	var secondSlashPosition = urlAddress.indexOf("/", firstSlashPosition + 1);
	var _id = urlAddress.substring(firstSlashPosition + 1 + 3, secondSlashPosition);
	return _id;
};

//ao carregar a ágina, adiciona event listner para o scroll
//se for maior que 50, exibe o botão 'back-to-top'
$(document).ready(function () {
	$(window).scroll(function () {
		if ($(this).scrollTop() > 50) {
			$('#back-to-top').fadeIn();
		} else {
			$('#back-to-top').fadeOut();
		}
	});
	// volta a barra de rolagem o topo
	$('#back-to-top').click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 400);
		return false;
	});
});

//Vue Global Filters
Vue.filter('friendlyURL', function (value) {
	if (!value) return '';

	value = value.toString().toLowerCase();

	value = value.replace(/\s/gi, '-'); //substituir espaços em branco por '-'
	//value = value.replace(/\//gi, '-'); //subsituir barras '/' por '-'
	//value = value.replace(/\\/gi, '-'); //subsituir barras '\' por '-'

	return value;
});
