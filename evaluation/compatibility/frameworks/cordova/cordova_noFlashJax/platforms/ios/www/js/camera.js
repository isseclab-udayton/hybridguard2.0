document.addEventListener("deviceready", cameraDeviceReady, false);
function cameraDeviceReady())
{
	document.getElementById("cameraTakePicture").addEventListener("click", loadCam);
	function onCamSuccess(imageData)
	{
    	var image = document.getElementById('myImage');
        image.src = "data:image/jpeg;base64," + imageData;
	}
	function onCamFail(message)
	{
    	alert('Failed because: ' + message);
    }
    function loadCam()
    {
    	navigator.camera.getPicture(onCamSuccess, onCamFail, { quality: 50, destinationType: Camera.DestinationType.DATA_URL });
	}
}
