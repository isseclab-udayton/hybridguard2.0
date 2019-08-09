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
	
	$('#qrcode').on('pagebeforeshow', function(e) {		
		  if (DEBUG) console.log(this.id+" "+e.type);		
			// si he hecho logout desde esta página te envia a la home
		  if (DEBUG) console.log("Id_usuari="+localStorage.getItem('id_usuari')+"|");	
			if(localStorage.getItem('id_usuari')==null)
			{
				  if (DEBUG) console.log("Reenvio a la home--> no validado");		
				$.mobile.changePage('#home',{transition:'none'});
			}
			  $('#loading').show();
	   		//$('#qrcode').qrcode({width: 64,height: 64,text: "size doesn't matter"});
              $('#qrcode_container').html( $._('text_presencia')+"<br\><br\>");			
		 	  $('#qrcode_container').qrcode("FPC_834#"+localStorage.getItem('id_usuari')+"#12345678A#");				
	   }).on('pageshow', function(e) {
		   $('#loading').hide(); 
	   }).on('pagehide', function(e) {
		   $('#loading').hide();
	   });
  
	
	}
});