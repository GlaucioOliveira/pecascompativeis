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