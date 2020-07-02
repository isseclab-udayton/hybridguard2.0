document.addEventListener("deviceready", onDeviceReady5, false);
function onDeviceReady5() 
{
	console.log("navigator.accelerometer.getCurrentAcceleration got deviceready");
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
}  