document.addEventListener("deviceready", onDeviceReady44, false);
function onDeviceReady44() {
	document.getElementById("network").addEventListener("click", loadNetwork);
	function loadNetwork() {
    	var networkState = navigator.connection.type;
    	var states = {};
    	states[Connection.UNKNOWN]  = 'Unknown connection';
    	states[Connection.ETHERNET] = 'Ethernet connection';
    	states[Connection.WIFI]     = 'WiFi connection';
    	states[Connection.CELL_2G]  = 'Cell 2G connection';
    	states[Connection.CELL_3G]  = 'Cell 3G connection';
    	states[Connection.CELL_4G]  = 'Cell 4G connection';
    	states[Connection.CELL]     = 'Cell generic connection';
    	states[Connection.NONE]     = 'No network connection';
    	alert('Connection type: ' + states[networkState]);
    }
}
