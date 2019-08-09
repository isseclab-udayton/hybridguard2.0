this.openCamera = function() {
  		// event.preventDefault();
 		
 		navigator.camera.getPicture(function onSuccess(imageData) {
		console.log('success');
		var image = document.getElementById('myImage');
		image.src = imageData;
		console.log(imageData);
		}, function onFail(message) {
		alert('Failed because: ' + message);
		}, {
			quality: 50,
			sourceType: Camera.PictureSourceType.CAMERA,
			destinationType: Camera.DestinationType.FILE_URI
		});
  		// return false;
	};


	

	