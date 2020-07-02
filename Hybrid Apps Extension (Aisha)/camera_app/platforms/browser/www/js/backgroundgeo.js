document.addEventListener('deviceready', onDeviceReady12, false);
function onDeviceReady12 () 
{
	//document.getElementById("getGeo").addEventListener("click", getGeo); 
    /**
    * This callback will be executed every time a geolocation is recorded in the background.
    */
    var callbackFn = function(location) {
    	console.log('[js] BackgroundGeolocation callback:  ' + location.latitude + ',' + location.longitude);
        alert('[js] BackgroundGeolocation callback:  ' + location.latitude + ',' + location.longitude);
 
        // Do your HTTP request here to POST location to your server. 
        // jQuery.post(url, JSON.stringify(location)); 
 
        /*
        IMPORTANT:  You must execute the finish method here to inform the native plugin that you're finished,
        and the background-task may be completed.  You must do this regardless if your HTTP request is successful or not.
        IF YOU DON'T, ios will CRASH YOUR APP for spending too much time in the background.
        */
        backgroundGeolocation.finish();
    };
    var failureFn = function(error) {
        console.log('BackgroundGeolocation error');
    };
 	//function getGeo() {
    // BackgroundGeolocation is highly configurable. See platform specific configuration options 
    backgroundGeolocation.configure(callbackFn, failureFn, {
        desiredAccuracy: 10,
        stationaryRadius: 20,
        distanceFilter: 30,
        interval: 60000
    });//}
    // Turn ON the background-geolocation system.  The user will be tracked whenever they suspend the app. 
    backgroundGeolocation.start();
    // If you wish to turn OFF background-tracking, call the #stop method. 
    // backgroundGeolocation.stop(); 
}