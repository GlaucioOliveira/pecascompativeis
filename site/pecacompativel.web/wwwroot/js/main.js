/* Função para controlar o #back-to-top*/

//Define the Root of the API to be consumed;
var apiURL = function () {
	return "https://localhost:44300/";
};

var IdPagina = function () {
	var urlAddress = window.location.pathname;
	var firstSlashPosition = urlAddress.indexOf("/");
	var secondSlashPosition = urlAddress.indexOf("/", firstSlashPosition + 1);
	var _id = urlAddress.substring(firstSlashPosition + 1 + 3, secondSlashPosition);
	return _id;
};

$(document).ready(function () {
	$(window).scroll(function () {
		if ($(this).scrollTop() > 50) {
			$('#back-to-top').fadeIn();
		} else {
			$('#back-to-top').fadeOut();
		}
	});
	// scroll body to 0px on click
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
