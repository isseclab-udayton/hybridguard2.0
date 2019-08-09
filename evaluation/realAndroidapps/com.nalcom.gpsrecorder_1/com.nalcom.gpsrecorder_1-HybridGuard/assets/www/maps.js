/*
 * 
 * 
 */

function PintaMapa(verRuta){
	

	if(finalizado==true){
		$("#cargando").hide();
	}else{
		$("#cargando").show();
	}
	
	if(verRuta == "no pass"){
		$("#stopresearch").show();
		 $("#research").hide();
	}else{
		$("#stopresearch").hide();
		 $("#research").hide();
	}
	 
	
	$("#control_mapa").show();
	$("#map_canvas").show();
	$("#directionsPanel").show();
	$("#controles").hide();
	
	
	
	 var latlng = new google.maps.LatLng(xActual, yActual);
	 var latlngDestino = new google.maps.LatLng(x, y);
	 
	 
	 //alert(flecha);
	 

            var myOptions = {
                zoom: 17,
                center: latlngDestino,
                mapTypeId: google.maps.MapTypeId.SATELLITE
            };
           
	
	map= new google.maps.Map(document.getElementById('map_canvas'), myOptions);
	
	if(!flecha){
		flecha = "iconos/flechas/flecha_0.png";
	}
	
	
	Origen = new google.maps.Marker({
	    position: new google.maps.LatLng(xActual, yActual),
	    //icon: 'iconos/flecha.png',
	    icon: flecha,
	    map: map,	   
	    title: 'Aqui estoy'	
	});
	

	
	markers=[];
	markers.push(Origen);
	//alert(markers[0].icon);
	
	Destino = new google.maps.Marker({
	    position: new google.maps.LatLng(x, y),
	    //url: 'geo:'+x+','+y,
	    icon: destino,
	    map: map,	   
	    title: 'Destino'	
	});
	
	markers.push(Destino);
	
	var bounds = new google.maps.LatLngBounds();


    bounds.extend(markers[0].getPosition());
    bounds.extend(markers[1].getPosition());
    map.fitBounds(bounds);

   
	if(verRuta == "pass"){
		
		navigator.geolocation.clearWatch(timerInterval);
		clearTimeout(timerOut);$("#cargando").hide();
		
		$("input [type=checkbox]").removeAttr("checked");
		markers[0].setVisible(false);
		markers[1].setVisible(false);
		
		if($("#verOrigen").is(':checked')){
			markers[0].setVisible(true);
		}else{
			
		}
		
		if($("#verDestino").is(':checked')){
			markers[1].setVisible(true);
		}else{
			
		}
		
		
		$("#posiciones").show();
		$("#cargando").hide();
		
		var request = {
				  origin: latlng,
				  destination: latlngDestino,
				  travelMode: google.maps.TravelMode.WALKING
				};
		
		var directionsService = new google.maps.DirectionsService();
	    var directionsDisplay = new google.maps.DirectionsRenderer();

	    directionsDisplay.setMap(map);
	   
	    
	    directionsService.route(request, function(result, status) {
	        if (status == google.maps.DirectionsStatus.OK) {
	          directionsDisplay.setDirections(result);
	    
	        }
	      });
	    
	    $(':checkbox').change(function(){
			
			var posicion = $(this).attr("id");
			var valor = $(this).is(":checked");
			
			
			if(posicion=="verOrigen" && valor==true){
				markers[0].setVisible(true);
			}else if(posicion=="verOrigen" && valor==false){
				markers[0].setVisible(false);
			}
			
			if(posicion=="verDestino" && valor==true){
				markers[1].setVisible(true);
			}else if(posicion=="verDestino" && valor==false){
				markers[1].setVisible(false);
			}
		});//clear
	    
	
	    
	}else{
		$("#posiciones").hide();
		//$("#cargando").show();
	}
	
	
    
	unloadingScreen();
	
	var contenido = "</br><a href='geo:"+x+","+y+"?q=("+x+","+y+")&z=15'>Abrir dirección en el navegador</a>";
	var infowindow = new google.maps.InfoWindow({
	    content: contenido
	});
	
	google.maps.event.addListener(Destino, 'click', function() {
		
		var red=Redes();
		if(red==true){
			infowindow.open(map,Destino);
		}else{
			navigator.notification.alert("Conexión 3G no disponible en este momento", function(){}, "Error de red", "Aceptar");
		}
		  
	});
	
	google.maps.event.addListener(map, 'mousedown', function() {
	    tocado = true;
	});
	
	
	
}