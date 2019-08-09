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
	
/*	$('#campus').on("pagecreate", function(e) {
	   	if (DEBUG) console.log(this.id+" "+e.type);
	}).on('pagebeforeshow', function(e) {	
		 	if (DEBUG) console.log(this.id+" "+e.type);
			if(localStorage.getItem('login')=='' || localStorage.getItem('login')==null)
			{		
				if (DEBUG) console.log("no validado en el campus, error");
				$('#campus_frame').attr('src','');
			}
			else
			{
				if (DEBUG) console.log("Esta validado creo el iframe");	
				var aleatorio=1 + Math.floor(Math.random() * 999999999);// guardo un numero aleatorio porque sino hace cach� de llamadas
				$('#campus_frame').attr('src',URLCAMPUSMOBILE+"?app=true&username="+localStorage.getItem('login')+"&challenge="+localStorage.getItem('challenge')+"&response="+localStorage.getItem('response')+"&v="+aleatorio);				
			}
		 	if (DEBUG) console.log("url campus="+$('#campus_frame').attr('src'));			
        
	}).on('pagehide', function(e) {
		if (DEBUG) console.log(this.id+" "+e.type);
		   $('#campus_frame').attr('src','');
	});
	*/
  
	
	}
});