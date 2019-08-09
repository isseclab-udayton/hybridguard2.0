document.addEventListener("deviceready", acceleratorDeviceReady, false);
function acceleratorDeviceReady()
{

    document.getElementById("getPosition").addEventListener("click", getCurPos);
	//console.log("after document.getElementById('getPosition')");
	//navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
	function onGeoError(err)
	{
		alert("Location not found!\n"+
			  'code: '    + err.code    + '\n' +
			  'message: ' + err.message + '\n');
	}
	function onGeoSuccess(position)
	{
		console.log("In onGeoSuccess(position)");
		x = ('Latitude: '          + position.coords.latitude          + '\n' +
			 'Longitude: '         + position.coords.longitude         + '\n' +
			 'Altitude: '          + position.coords.altitude          + '\n' +
			 'Accuracy: '          + position.coords.accuracy          + '\n' +
			 'Altitude Accuracy: ' + position.coords.altitudeAccuracy  + '\n' +
			 'Heading: '           + position.coords.heading           + '\n' +
			 'Speed: '             + position.coords.speed             + '\n' +
			 'Timestamp: '         + position.timestamp                + '\n');
		console.log("before getCurrentPosition alert");
		alert(x)
		console.log("after getCurrentPosition alert");
	}
	function getCurPos()
	{
		alert("in getCurPos");
		navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
		//console.log("after call to getCurrentPosition");
	}

	var watchID
    document.getElementById("watchPosition").addEventListener("click", loadExtWebPage);

    function onError(err)
    {
    	alert("Location not found!\n"+
              'code: '    + err.code    + '\n' +
              'message: ' + err.message + '\n');
    	}
	function onWatchSuccess(position)
    {
    	x = ('Latitude: '          + position.coords.latitude          + '<br>' +
             'Longitude: '         + position.coords.longitude         + '<br>');
        document.getElementById('watchlocation').innerHTML = x;
        //alert(x)
	}
    function loadExtWebPage()
    {
    	watchID = navigator.geolocation.watchPosition(onWatchSuccess, onError,{ maximumAge: 3600000, timeout: 30000, enableHighAccuracy: true });
    }
    function loadClearWatch(id)
    {
    	navigator.geolocation.clearWatch(id);
	}
    document.getElementById("accel").addEventListener("click", loadAccelerator);
	function onASuccess(acceleration)
	{
    	alert('Acceleration X: ' + acceleration.x + '\n' +
        	  'Acceleration Y: ' + acceleration.y + '\n' +
          	  'Acceleration Z: ' + acceleration.z + '\n' +
          	  'Timestamp: '      + acceleration.timestamp + '\n');
	}
	function onAError() {
    	alert('onError!');
	}
    function loadAccelerator()
    {
        navigator.accelerometer.getCurrentAcceleration(onASuccess, onAError);
    }

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

	document.getElementById("browser").addEventListener("click", createBrowser);
	function createBrowser()
	{
		var ref = cordova.InAppBrowser.open('https://www.google.com/', '_system', 'location=yes');
	}

	document.getElementById("createContact").addEventListener("click", createContact);
	function createContact()
	{
		var myContact = navigator.contacts.create({"displayName": "Test User"});
		alert("contact created");
	}

	document.getElementById("dialog").addEventListener("click", loadDialog);
    function dialogCallback() {

    }
    function loadDialog()
    {
    	navigator.notification.alert(
    		'This is an alert using navigator.notification.alert!',  // message
    		dialogCallback,         // callback
    		'ALERT!',            // title
    		'Done'                  // buttonName
		);
    }

	document.getElementById("heading").addEventListener("click", loadDirection);
	function onCompassError(error)
	{
    	alert('CompassError: ' + error.code);
	}
    function onCompassSuccess(heading)
    {
		alert('Heading: ' + heading.magneticHeading);
    }
    function loadDirection()
    {
    	navigator.compass.getCurrentHeading(onCompassSuccess, onCompassError);
	}

	document.getElementById("preflang").addEventListener("click", getPrefLang);
	document.getElementById("getlocale").addEventListener("click", getLocale);
	document.getElementById("getDate").addEventListener("click", getDate);
	document.getElementById("daySave").addEventListener("click", daySave);
	function getPrefLang()
	{
		navigator.globalization.getPreferredLanguage(prefLangSucc, prefLangFail);
	}
	function prefLangSucc(language)
	{
		console.log('language: ' + language.value + '\n');
		alert('language: ' + language.value + '\n');
	}
	function prefLangFail()
	{
		console.log('Error getting language\n');
		alert('Error getting language\n');
	}
	function getLocale()
	{
		navigator.globalization.getLocaleName(
    		function (locale) {console.log('locale: ' + locale.value + '\n'); alert('locale: ' + locale.value + '\n');},
    		function () {console.log('Error getting locale\n'); alert('Error getting locale\n');}
		);
	}
	function getDate()
	{
		navigator.globalization.dateToString(
    		new Date(),
    		function (date) {console.log('date: ' + date.value + '\n'); alert('date: ' + date.value + '\n'); },
    		function () {console.log('Error getting dateString\n'); alert('Error getting dateString\n'); },
    		{ formatLength: 'short', selector: 'date and time' }
		);
	}
	function daySave()
	{
		navigator.globalization.isDayLightSavingsTime(
    		new Date(),
    		function (date) {console.logalert('dst: ' + date.dst + '\n'); alert('dst: ' + date.dst + '\n');},
    		function () {console.log('Error getting names\n'); alert('Error getting names\n');}
		);
	}



}

document.getElementById("Scan_Barcode").addEventListener("click", scanbar);
function scanbar()
{
	console.log("in scanbar");
	scanner.startScanning();
}

document.getElementById("corbarscan").addEventListener("click", corbarscan);
function corbarscan ()
{
   cordova.plugins.barcodeScanner.scan(
      function (result) {
          alert("We got a barcode\n" +
                "Result: " + result.text + "\n" +
                "Format: " + result.format + "\n" +
                "Cancelled: " + result.cancelled);
      },
      function (error) {
          alert("Scanning failed: " + error);
      }
   );
}
