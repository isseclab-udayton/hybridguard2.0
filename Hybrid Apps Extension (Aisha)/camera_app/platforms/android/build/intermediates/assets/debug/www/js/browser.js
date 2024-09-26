document.addEventListener("deviceready", onDeviceReady15, false);
function onDeviceReady15() 
{
	document.getElementById("browser").addEventListener("click", createBrowser);
	function createBrowser()
	{
		var ref = cordova.InAppBrowser.open('https://www.google.com/', '_system', 'location=yes');
	}
}