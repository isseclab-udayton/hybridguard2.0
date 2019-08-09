document.addEventListener("deviceready", browserDeviceReady, false);
function browserDeviceReady() 
{
	document.getElementById("browser").addEventListener("click", createBrowser);
	function createBrowser()
	{
		var ref = cordova.InAppBrowser.open('https://www.google.com/', '_system', 'location=yes');
	}
}
