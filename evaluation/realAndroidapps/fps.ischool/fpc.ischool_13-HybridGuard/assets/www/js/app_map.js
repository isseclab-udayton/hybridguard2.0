$(function() {		

	if( !DESKTOP_NAVIGATOR)
    	document.addEventListener("deviceready", onDeviceReady, false);    
    else
    {    	
    	window.setTimeout(function() {
    		onDeviceReady();
    	}, 100);   
    }
	
	
	/**********************************************
	 * 
	 *   ON DEVICE READY
	 * 
	 ***********************************************/
	var centermap = { destination: new google.maps.LatLng(41.39957997974095,2.196493148803711) };
	//var techtalent = { destination: new google.maps.LatLng(41.3978711,2.1964127) };
	var techtalent = { destination: new google.maps.LatLng(41.39754383655758, 2.1961283683776855) }; 
    function onDeviceReady() {
    	$('#where').on("pageinit", function(e) {
    		if (DEBUG) console.log(this.id+" "+e.type);
    		$('.route_type').click( function(event) {    			 
    			 localStorage.setItem('route_type',$(this).attr("rel"));
			});            
    	
    	}).on("pageshow", function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);
			// EJEMPLOS EN https://code.google.com/p/jquery-ui-map/
			
			$('#map_square').gmap( {'zoom':16,'center':centermap.destination,'mapTypeControl' : false, 'navigationControl' : false,'streetViewControl' : false}).bind('init', function(ev, map) {
				var direccion='<div id="contentMap"><h1>TECHTALENTCENTER</h1><p>Carrer Badajoz 73-77 <br>08005 Barcelona<br>Tel: 93 112 08 08 <br></p></div>';
				var marker=$('#map_square').gmap('addMarker', {'position': techtalent.destination, 'bounds': false,'icon': './img/icono_upc.gif'}).click(function() {
					$('#map_square').gmap('openInfoWindow', {'content': direccion}, this);
				});				
				$('#map_square').gmap('openInfoWindow', {'content': direccion}, marker);
				;
			});
			
		 /*   $('#map_square').click( function() {
		        $.mobile.changePage($('#where_ride'), {});
		    });*/
			
			// RECALCULO LA ALTURA PARA QUE ME OCUPE EL 100% (sino no se ve el mapa)	
			var the_height = ($(window).height() - $(this).find('[data-role="header"]').height() - $(this).find('[data-role="footer"]').height());
			 $(this).height($(window).height()).find('[data-role="content"]').height(the_height);						
		}).on('pagehide', function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);			
		});  
    	
    	
        $('#refreshroute').on('click', function(event) {
            getRoute();
        });
    	
    	
    	
    	
    	$('#where_ride').on("pageinit", function(e) {    		
			if (DEBUG) console.log(this.id+" "+e.type);			
			if (DEBUG) console.log($('#map_canvas'));			
			$('#map_canvas').gmap({'center' : techtalent.destination, 
		        'mapTypeControl' : true, 
		        'navigationControl' : true,
		        'navigationControlOptions' : {'position':google.maps.ControlPosition.LEFT_TOP}
		        })
		    .bind('init', function() {
		        $('.refresh').trigger('tap');        
		    });
			$('#map_canvas').gmap('addMarker', {'position': techtalent.destination, 'bounds': false,'icon': './img/icono_upc.gif'});
		}).on('pagebeforeshow', function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);
			// getRoute();
		}).on('pageshow', function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);
			// al cargar la pagina recalculo la altura
			var the_height = ($(window).height() - $(this).find('[data-role="header"]').height() - $(this).find('[data-role="footer"]').height());
			  $(this).height($(window).height()).find('[data-role="content"]').height(the_height);	
			  getRoute();
		}).on('pagehide', function(e) {
			if (DEBUG) console.log(this.id+" "+e.type);
			
		});  
    	
    	    	    	       
    	function getRoute(){
    	    
    		var route_type= localStorage.getItem('route_type');
    		var travel_mode= google.maps.DirectionsTravelMode.DRIVING;
    		if(route_type=="BICYCLING")
    			travel_mode= google.maps.DirectionsTravelMode.BICYCLING;
    		else if (route_type=="WALKING")
    			travel_mode= google.maps.DirectionsTravelMode.WALKING;
    		else	
    			travel_mode= google.maps.DirectionsTravelMode.DRIVING;
    		if(!DESKTOP_NAVIGATOR) // Si es un mobil activo la geolocalizacion
    		{
    			 	
    	            // START: Tracking location with device geolocation
    	            if ( navigator.geolocation ) { 
    	                navigator.geolocation.getCurrentPosition (     	                		
    	                    function(position) {    	                    	
    	                        $('#map_canvas').gmap('displayDirections', 
    	                        { 'origin' : new google.maps.LatLng(position.coords.latitude, position.coords.longitude), 
    	                          'destination' : techtalent.destination, 'travelMode' : travel_mode},
    	                        { 'panel' : document.getElementById('dir_panel')},
    	                              function (result, status) {
    	                                  if (status === 'OK') {
    	                                      var center = result.routes[0].bounds.getCenter();
    	                                      $('#map_canvas').gmap('option', 'center', center);
    	                                      $('#map_canvas').gmap('refresh');
    	                                  } else {
    	                                    doAlert($._('no_route'));
    	                                    $.mobile.changePage($('#where'), {}); 
    	                                  }
    	                              }
    	                           );         
    	                    }, 
    	                    function(error){ 
    	                    	doAlert($._('no_location')+". "+String(error.message));
    	                        $.mobile.changePage($('#where'), {}); 
    	                    },{timeout: 15000}); 
    	                } else {
    	                	doAlert($._('no_location'));
    	                	 $.mobile.changePage($('#where'), {}); 
    	                }            
    	            // END: Tracking location with device geolocation
    		}
    		else
    		{
    	            // START: Tracking location with test lat/long coordinates
    	            // Toggle between two origins to test refresh, force new route to be calculated
    	            var position = {};    	            
    	                position = { coords: { latitude: 41.387128, longitude: 2.168565 } }; // Pla�a catalunya
    	           
    	            $('#map_canvas').gmap('displayDirections', 
    	                { 'origin' : new google.maps.LatLng(position.coords.latitude, position.coords.longitude), 
    	                  'destination' : techtalent.destination, 
    	                  'travelMode' : travel_mode },
    	                  { 'panel' : document.getElementById('dir_panel') },
    	                    function (result, status) {
    	                        if (status === 'OK') {
    	                            var center = result.routes[0].bounds.getCenter();
    	                            $('#map_canvas').gmap('option', 'center', center);
    	                            $('#map_canvas').gmap('refresh');
    	                        } else {
    	                        	doAlert('Unable to get route');
    	                        }
    	                    }); 
    	            // END: Tracking location with test lat/long coordinates
    		}        
    	    $(this).removeClass($.mobile.activeBtnClass);
    	    return false;
    	}
    	
    	
    }
});		