var picture;

//--- Attente de la connexion au téléphone
document.addEventListener("deviceready",onDeviceReady,false);
//--- L'appareil est prêt à être utilisé
function onDeviceReady() {
	pictureSource=navigator.camera.PictureSourceType;
	destinationType=navigator.camera.DestinationType;
}

//--- Capture d'une photo depuis l'APN du téléphone
//------ Capture simple
function capturePhoto() {
	logCordova('CAPTURE');
	//--- Prend une photo et retourne l'image en base64-encoded
	navigator.camera.getPicture(onPhotoDataSuccess, onFail, { quality: 50,  destinationType: Camera.DestinationType.DATA_URL });
}

//--- Affiche la photo capturée
//------ Depuis la galerie du téléphone
function onPhotoDataSuccess(imageData) {
	picture = imageData;

	$('.step_1').hide();
	$('.step_2').show();

	var image = document.getElementById('picture_snap');
	image.src = "data:image/jpeg;base64," + imageData;
}

//--- Gestion d'erreurs
function onFail(message) {
	alert('Un problème est survenu : ' + message);
}

//--- Gestion du post
function send_email() {
	var commentaire = $('#textarea_picture').val();
	//--- URL d'envoi des données
	$('body').html('<div id="loader" style="position:fixed;top:0;left:0;background:#322C23;width:100%;min-height:2000px;color:#FF6A00;padding-top:150px;text-align:center;"><h4>Envoi de votre reportage<br />en cours<h4></div>');
	var url = 'http://ns354550.ovh.net/roi-mobile/send-email-alert.php';
	//var to = $('#email').val();

	/*var reg = new RegExp("^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$");
	if (!reg.test(to)){
		navigator.notification.alert('Email invalide');
	}else{*/
		//--- Données texte à envoyer
		var params = {	photo1: picture, texte: commentaire };
		// Envoi des données
		$.post(url, params, function(data) {
			//navigator.notification.alert('Message transmis.');
			$('#loader').hide();
			location.href = "index.html";
		});
	//}

}
