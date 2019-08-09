this.openGallery = function() {
  		// event.preventDefault();
 		alert('in openGallery');	
 		navigator.camera.getPicture(function onSuccess(imageData) {
		console.log('success');
		var image = document.getElementById('myImage');
		image.src = imageData;
		console.log(imageData);
		}, function onFail(message) {
		alert('Failed because: ' + message);
		}, {
			 destinationType: Camera.DestinationType.FILE_URI,
    		 sourceType: Camera.PictureSourceType.SAVEDPHOTOALBUM,
		});
  		// return false;
	};


	

	