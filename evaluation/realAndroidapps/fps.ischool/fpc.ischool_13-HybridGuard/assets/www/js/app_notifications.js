$(function() {		
	if( !DESKTOP_NAVIGATOR)
    	document.addEventListener("deviceready", onDeviceReady, false);    
    else
    {    	
    	window.setTimeout(function() {
    		onDeviceReady();
    	}, 100);   
    }
    
    function onDeviceReady() {      
		/*
		 Page: Notifications
		 ===============
		 Show Notifications
		*/
		$('#notificationsfooter').live("vclick", function(e) {
			$.mobile.changePage($("#notifications"),{ transition: "slideup"});
		});
    }
});		