document.addEventListener("deviceready", onDeviceReady1, false);
	function onDeviceReady1() {
   		//alert("device ready position");
        console.log("navigator.geolocation.getCurrentPosition got deviceready");
        //console.log("before document.getElementById('getPosition')");
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
       		//console.log("before call to getCurrentPosition");
        	navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
        	//console.log("after call to getCurrentPosition");
       	}
}