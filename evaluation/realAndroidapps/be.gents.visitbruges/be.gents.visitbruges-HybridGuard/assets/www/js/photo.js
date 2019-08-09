function Photo(){
 
	var pictureSource;   // picture source
    var destinationType; // sets the format of returned value 

	this.takePhoto = function()
	{
		
		pictureSource = navigator.camera.PictureSourceType;
        destinationType = navigator.camera.DestinationType;
        
		navigator.camera.getPicture(onPhotoDataSuccess, onFail, { quality: 100, destinationType: destinationType.DATA_URL, targetWidth: 1000, targetHeight: 1000, saveToPhotoAlbum: true, popoverOptions: CameraPopoverOptions  });

	}
	
	function onPhotoDataSuccess(imageData) 
	{
    	var photo = document.getElementById('takenPhoto');
    	photo.style.display = 'block';
    	
    	$("#photoresult").removeClass("hidden");

      	$("#takePhoto").hide();
      	
      	photo.src = "data:image/jpeg;base64," + imageData;
      	
      	/*var canvas = document.getElementById('photoCanvas');
      	var context = canvas.getContext('2d');
      	var imageObj = new Image();

      	imageObj.onload = function() 
      	{
	        // draw cropped image
	        var sourceX = 0;
	        var sourceY = 0;
	        var sourceWidth = 150;
	        var sourceHeight = 150;
	        var destWidth = canvas.width;
	        var destHeight = canvas.height;
	        var destX = canvas.width / 2 - destWidth / 2;
	        var destY = canvas.height / 2 - destHeight / 2;
	
	        context.drawImage(imageObj, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight);
      	};
      	
      	imageObj.src = "data:image/jpeg;base64," + imageData;*/
      	
	}
	
	function onFail(message) 
	{
	    // alert('Failed because: ' + message);
	}

}


