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
		 Page: Preferences
		 ===============
		 Show Preferences
		*/
		$('#preferences').on("pageinit", function(e) {				
			var hoy = new Date();      
            $('#preferences #copy_year').html(hoy.getFullYear()); // pongo el año del copyright
	   	    if (DEBUG) console.log(this.id+" "+e.type);			   
			$('.changelanguageitem').on('change', function(event) {				
				
				var value = event.target.value;				
				if (DEBUG) console.log(event.target.value);
				$._.setLocale(event.target.value);
	            changeLanguage();
	            init_variables();// despues de cambiar el idioma inicializo todas las variables para que vuelva a cargar los datos
                // ahora borro todos los listados y los items individuales (eventos, actividades noticias etc..) para que las vuelva a cargar en su idioma
               // $('.item_list').remove(); // borro el listado LO HE QUITADO PORQUE BORRABA LAS PREFERENCIAS 
                $('.item_info').html(''); // borro el item individual                   
			});									
		}).on('pagebeforeshow', function(e) {
			 if (DEBUG) console.log(this.id+" "+e.type);			
			/*var networkAvailable=true;
			if(!DESKTOP_NAVIGATOR)			
				networkAvailable=checkNetwork();
			if(networkAvailable) //
			{
				// si hay conexiï¿½n
			}*/
			// pongo el tamaño de los videos estáticos correctamente
			if(localStorage.getItem('deviceType')=='iPad')
			{							
				$('#video_about').attr('width',400);
				$('#video_about').attr('height',225);	
			} 
			
            if (DEBUG) console.log(this.id+" "+e.type);
            $('input:radio[value='+$._.getLocale()+']').attr('checked', true).checkboxradio("refresh"); // hay que hacer refresh sino no se ve						
            
	   });
		
		$('#preferences_privacy').on("pagebeforeshow", function(e) {	
			 	if (DEBUG) console.log(this.id+" "+e.type);
			 	$('#preferences_privacy .content_privacy').html('');
			 	$('#preferences_privacy .content_privacy').load('locale/privacitat_'+localStorage.getItem('idioma')+'.html').trigger("create");
			 	// refresco el scrollview porque pongo el contenido después de cargar la página
			 	  setTimeout(function(){	        					        			
			 		 $('#preferences_privacy .ui-content').iscrollview("refresh");  	  
    					},500);
			 	
		 });	
	}
});		