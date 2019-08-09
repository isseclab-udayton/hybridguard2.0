// Wait for Cordova to load
if((localStorage['ID']=="")||(localStorage['ID']=="null")||(localStorage['ID']==null)||(localStorage['ID']=="undefined")){
	localStorage['ID']="";
}

$(document).ready(function(e) {
    //
    document.addEventListener("deviceready", onDeviceReady, false); 
	
    var watchID = null;

    // Cordova is ready
    //
    function onDeviceReady() {
		
        var options = { maximumAge: 20000, timeout: 30000, enableHighAccuracy: true };
        watchID = navigator.geolocation.watchPosition(onSuccess, onError, options);
    }

    // onSuccess Geolocation
    //
    function onSuccess(position) {
		
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
			
		  var myLatlng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		  //alert(position.coords.longitude+"/"+position.coords.latitude)
		  var mapOptions = {
			zoom: 14,
			center: myLatlng,
			zoomControl: true,
			mapTypeId: google.maps.MapTypeId.HYBRID
		  }
		  
		  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
		
		  var image = 'img/marker.png';
		  var myLatLng = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		  var beachMarker = new google.maps.Marker({
			  position: myLatLng,
			  map: map,
			  icon: image
		  });
    }

    // onError Callback receives a PositionError object
    //
    function onError(error) {
    }
});