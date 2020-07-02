document.addEventListener("deviceready", onDeviceReady9, false);
function onDeviceReady9()
{
	console.log("navigator.compass.getCurrentHeading works well");
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