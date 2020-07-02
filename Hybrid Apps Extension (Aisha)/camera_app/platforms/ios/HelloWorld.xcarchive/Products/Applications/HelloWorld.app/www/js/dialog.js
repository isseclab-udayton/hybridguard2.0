document.addEventListener("deviceready", onDeviceReady3, false);
function onDeviceReady3() 
{
    console.log("navigator.notification got deviceready");
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
}   