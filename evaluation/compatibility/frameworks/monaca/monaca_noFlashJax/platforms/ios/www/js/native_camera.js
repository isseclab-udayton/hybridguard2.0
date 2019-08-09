document.addEventListener("deviceready", onDeviceReady19, false);
function onDeviceReady19()
{
    //alert("device ready camera");
	document.getElementById("nativecam").addEventListener("click", c);
	function onNCamSuccess(imageData)
	{
    	var image = document.getElementById('myImage');
        image.src = "data:image/jpeg;base64," + imageData;
	}
	function onCamFail(message)
	{
    	alert('Failed because: ' + message);
    }
    function c()
    {
		cordova.plugin.NativeCamera.Position = { FRONT: 0, BACK: 1, UNSPECIFIED: 2};
		cordova.plugin.NativeCamera.showVideo = function(side){};
	}
}
