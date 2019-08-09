document.addEventListener("deviceready", watchPositionDeviceReady, false);
function watchPositionDeviceReady()
{
	//alert("device ready watch position");
    console.log("navigator.geolocation.watchPosition got deviceready");
    //alert("Geo!!");
    //console.log("before document.getElementById('watchPosition')");
    var watchID
    document.getElementById("watchPosition").addEventListener("click", loadExtWebPage);
    document.getElementById("clearWatch").addEventListener("click", loadClearWatch);
    //console.log("after document.getElementById('watchPosition')");
    //navigator.geolocation.watchPosition(onSuccess, onError,{ maximumAge: 3600000, timeout: 30000, enableHighAccuracy: true });
    function onError(err)
    {
    	alert("Location not found!\n"+
              'code: '    + err.code    + '\n' +
              'message: ' + err.message + '\n');
    	}
	function onSuccess(position)
    {
    	x = ('Latitude: '          + position.coords.latitude          + '<br>' +
             'Longitude: '         + position.coords.longitude         + '<br>');
        document.getElementById('watchlocation').innerHTML = x;
        //alert(x)
	}
    function loadExtWebPage()
    {
    	watchID = navigator.geolocation.watchPosition(onSuccess, onError,{ maximumAge: 3600000, timeout: 30000, enableHighAccuracy: true });
    }
    function loadClearWatch(id)
    {
    	navigator.geolocation.clearWatch(id);
	}
}
