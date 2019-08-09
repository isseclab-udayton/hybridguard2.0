document.addEventListener("deviceready", directionOnDeviceReady, false);
function directionOnDeviceReady()
{

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
}
