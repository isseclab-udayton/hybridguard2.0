  $( document ).bind( 'mobileinit', function(){
	  	$.mobile.buttonMarkup.hoverDelay=100;
//		$.mobile.defaultPageTransition  = 'none'; 
		// DESHABILITO LAS TRANSICIONES PORQUE SI NO HACE EFECTO DE FLICKEO SOLO PARA ANDROID
		// aparece un momento la página nueva vuelve a aprecer la vieja y entonces aparece correctamente la nueva	  		  	
	    if (navigator.userAgent.indexOf("Android") != -1) // ANDROID
	    {    	
	    	// deshabilito transiciones porque hace muchos rebotes
	        $.mobile.defaultPageTransition   = 'none';
	        $.mobile.defaultDialogTransition = 'none';	        
	        localStorage.setItem('UtilitzarCalendari', 'SI'); // los booleanos no funcionan, hacerlo con string
	    }
	    else // IOS
	    {
	    	//$.mobile.defaultPageTransition = 'slide';    	
	    	//$.mobile.defaultPageTransition = 'none';
	    	localStorage.setItem('UtilitzarCalendari','SI');// los booleanos no funcionan, hacerlo con string
	    }
	    
	    
	    $.extend($.mobile.zoom, {locked:true,enabled:false}); // para evitar zoom
	    
	    
    	  /*$.mobile.loader.prototype.options.text = "loading";
    	  $.mobile.loader.prototype.options.textVisible = false;
    	  $.mobile.loader.prototype.options.theme = "z";
    	  $.mobile.loader.prototype.options.html = "";
    	  $.mobile.page.prototype.options.addBackBtn = false;*/    	  
    });     