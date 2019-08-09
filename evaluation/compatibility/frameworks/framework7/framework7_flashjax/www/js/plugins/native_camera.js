document.addEventListener("deviceready", onDeviceReady19, false);
function onDeviceReady19()
{
    //alert("device ready camera");
	document.getElementById("nativecam").addEventListener("click", loadNCam);
	function onNCamSuccess(imageData) 
	{
    	var image = document.getElementById('myImage');
        image.src = "data:image/jpeg;base64," + imageData;
	}
	function onCamFail(message) 
	{
    	alert('Failed because: ' + message);
    }
    function loadNCam()
    {
    	//navigator.camera.getPicture(onCamSuccess, onCamFail, { quality: 50, destinationType: Camera.DestinationType.DATA_URL });
    	//cordova.plugin.NativeCamera.takePhoto(onNCamSuccess);
    	cordova.plugin.NativeCamera.Position = {
    		FRONT: 0,
    		BACK: 1,
    		UNSPECIFIED: 2
		};    	
    	cordova.plugin.NativeCamera.showVideo = function(side);

	}
}