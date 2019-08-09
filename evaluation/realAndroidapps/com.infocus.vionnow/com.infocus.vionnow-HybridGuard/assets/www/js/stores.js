/* ------------------------ Geolocation ----------------------- */
var map;
var geocoder;
var marker = [];
var marker_home;
var infowindow = [];
var watchID;
var glob_position;
var mapHeightSet = 0;


$(document).delegate('#stores', 'pageinit', function(){
	//$(window).unbind();
    //$(window).bind('pageshow resize orientationchange', function(e){
    max_height();
    $('#select-km').on('change', function () {
        var km = $(this).val(); // get selected value
        if(!$('#map_plz').val() || $('#map_plz').val()== "Standort"){
        	setMap(km);
        }
        else{
        	setAddress($('#map_plz').val());
        }
        return false;
    });
	/*$('#map_plz').on('change', function () {
	    var plz = $(this).val(); // get selected value
	    //alert(plz);
	    setAddress(plz);
	    return false;
	});*/
	$('#list_button').on('click', function () {
		toggleVidView();
		return false;
	});
	$('#geopos').on('click', function () {
		$('#select-km :nth-child(1)').attr('selected', 'selected')
		showPosition();
		return false;
	});
	    
    //});
    //google.load("maps", "3.0", {"callback": map, other_params: "sensor=true&language=de"});
}); 
$('#stores').live('pageshow',function(event){
	/*if (navigator.network.connection.type == Connection.NONE || navigator.network.connection.type == Connection.UNKNOWN){
		openPopupInfo('Fehler!', 'kein Internet :(');
	}
	else{*/
		$('#list_button .ui-btn-text').text("Liste");
		$("#map_wrapper").show();
		$("#content_stores").hide();
		google.load("maps", "3.9", {"callback": map, other_params: "sensor=true&language=de"});
            
        // Setting new width and height to show google-Logo
        if(mapHeightSet == 0){
            var mapHeight = $('body').height() - 140;
            var mapWidth = $('body').width();
            $('#map').height(mapHeight);
            $('#map').width(mapWidth);
            mapHeightSet = 1;
        }
	//}
});

function showPosition(){
	$('#map_plz').val("Standort");
	navigator.geolocation.getCurrentPosition(geo_success, geo_error, { maximumAge: 5000, timeout: 10000, enableHighAccuracy: true });
}
function toggleVidView(){
	//alert($('#list_button .ui-btn-text').text());
	if($('#list_button .ui-btn-text').text()=="Liste"){
		$("#content_stores").show();
		$("#map_wrapper").hide();
		$('#list_button .ui-btn-text').text("Map");
		//alert("Hallo");
	}
	else{
		$('#list_button .ui-btn-text').text("Liste");
		$("#map_wrapper").show();
		$("#content_stores").hide();
	}
}


function max_height(){
    var h = $('div[data-role="header"]').outerHeight(true);
    var f = $('div[data-role="footer"]').outerHeight(true);
    var w = $(window).height();
    var c = $('#map_wrapper');
    var c_h = c.height();
    var c_oh = c.outerHeight(true);
    var c_new = w - h - f - c_oh + c_h;
    var total = h + f + c_oh;
    if(c_h<c.get(0).scrollHeight){
        c.height(c.get(0).scrollHeight);
    }else{
        c.height(c_new);
    }
}
function map(){
    var latlng = new google.maps.LatLng(53.57, 10.02);
    var myOptions = {
      zoom: 4,
      tileSize: new google.maps.Size(50, 50),
      center: latlng,
      streetViewControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      zoomControl: false
    };
    map = new google.maps.Map(document.getElementById("map"), myOptions);
     
    google.maps.event.addListenerOnce(map, 'tilesloaded', function(){
        //get geoposition once
        navigator.geolocation.getCurrentPosition(geo_success, geo_error, { maximumAge: 5000, timeout: 10000, enableHighAccuracy: true });
        //watch for geoposition change
        //watchID = navigator.geolocation.watchPosition(geo_success, geo_error, { maximumAge: 5000, timeout: 5000, enableHighAccuracy: true });  
    });
}
function geo_success(position) {
	//if(checkGoogleMapsAvailability() == ""){
		glob_position = position;
		map.setCenter(new google.maps.LatLng(position.coords.latitude, position.coords.longitude));
	    map.setZoom(8);
	    var info =
	    ('Latitude: '         + position.coords.latitude          + '<br>' +
	    'Longitude: '         + position.coords.longitude         + '<br>' +
	    'Altitude: '          + position.coords.altitude          + '<br>' +
	    'Accuracy: '          + position.coords.accuracy          + '<br>' +
	    'Altitude Accuracy: ' + position.coords.altitudeAccuracy  + '<br>' +
	    'Heading: '           + position.coords.heading           + '<br>' +
	    'Speed: '             + position.coords.speed             + '<br>' +
	    'Timestamp: '         + new Date(position.timestamp));
	 
	    var point = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
	    if(!marker_home){
	        //create marker
	        var pinNum = "o";
	        var pinColor = "00ff00";
	        var pinTextColor = "000000";
	        var image = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld="+pinNum+"|"+pinColor+"|"+pinTextColor; 
	        marker_home = new google.maps.Marker({
	            position: point,
	            map: map,
	            icon: image
	        });
	    }else{
	        //move marker to new position
	        marker_home.setPosition(point);
	    }
	    /*if(!infowindow){
	        infowindow = new google.maps.InfoWindow({
	            content: info
	        });
	    }else{
	        infowindow.setContent(info);
	    }
	    google.maps.event.addListener(marker, 'click', function() {
	      infowindow.open(map,marker);
	    });*/
	    setMap(5);
	/*}
	else{
		alert(checkGoogleMapsAvailability());
	}*/
}

function checkGoogleMapsAvailability() {
    var connectionState = navigator.network.connection.type;
    if (connectionState == Connection.NONE || connectionState == Connection.UNKNOWN) {
        return "kein Internet :(";
    }
 
    return "";
}

function setMap(km){ 
	if(marker){
		for (var i = 0; i < marker.length; i++) {
	        marker[i].setMap(null);
	    }
	}
    var output_stores = $('#content_stores');	
	output_stores.empty();
	//alert('http://www.vionnow.de/json/listStores/lat/'+glob_position.coords.latitude+'/lng/'+glob_position.coords.longitude+'/km/200');
    $.ajax({
	    	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
	    	complete: function() { $.mobile.hidePageLoadingMsg() },
 			url: 'http://www.vionnow.de/json/listStores/lat/'+glob_position.coords.latitude+'/lng/'+glob_position.coords.longitude+'/km/'+km,
 			dataType: 'jsonp',
 			jsonp: 'jsoncallback',
 			timeout: 10000,
 			success: function(data){
 				if(data){
 					var store = '<nav><ul data-role="listview" data-theme="a">';
		    		$.each(data, function(i,item){
                           if(item.ip_wws){
                        	if(android == 1) {  
                           		store += '<li><a href="#" onclick="showExternalWebPage(\''+item.ip_wws+'\')"><h3>'+(i+1)+': '+item.name+' <small>('+Math.round(item.distance*10)/10+'km)</small></h3>';
                           	}
                           	else{
                           		store += '<li><a rel="external" href="'+item.ip_wws+'" target="_blank"><h3>'+(i+1)+': '+item.name+' <small>('+Math.round(item.distance*10)/10+'km)</small></h3>';
                           	}	
                           store += '<p><span style="float: right;">'+item.phone+'</span>'+item.street+'</p>';
                           store += '<p><span style="float: right;">'+item.email+'</span>'+item.zip+' '+item.city+'</p>';
                           store += '</a></li>';
                           }else{
                           store += '<li><h3>'+(i+1)+': '+item.name+' <small>('+Math.round(item.distance*10)/10+'km)</small></h3>';
                           store += '<p><span style="float: right;">'+item.phone+'</span>'+item.street+'</p>';
                           store += '<p><span style="float: right;">'+item.email+'</span>'+item.zip+' '+item.city+'</p>';
                           store += '</li>';
                           }
		    			  
		    			  var point = new google.maps.LatLng(item.lat, item.lng);
		    			  //create marker
		    			  var pinNum = i+1;
		    			  var pinColor = "FF0000";
	        			  var pinTextColor = "000000";
	        			  var image = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld="+pinNum+"|"+pinColor+"|"+pinTextColor;
		    			  marker[i] = new google.maps.Marker({
		    			  	  position: point,
		    			      map: map,
		    			      icon:image 
		    			  });
		    			  if(item.ip_wws){
		    				if(android == 1) {  
		    					var info = '<a href="#" onclick="showExternalWebPage(\''+item.ip_wws+'\')"><h3>'+(i+1)+': '+item.name+' <small>('+Math.round(item.distance*10)/10+'km)</small></h3>';
                          	    
                          	}
                          	else{  
                          		var info = '<a href="'+item.ip_wws+'" rel="external" target="_blank">'+item.name+' ('+Math.round(item.distance*10)/10+'km)</a><br>';
                          	}	
		    			  }
		    			  else{
		    				  var info = item.name + '<br>';  
		    			  }
		    			  info += item.street + '<br>';
		    			  info += item.zip + ' ' +item.city+'<br>';
		    			  info += item.content + '<br>';
		    			  infowindow[i] = new google.maps.InfoWindow({
		    		          content: info,
		    		          
		    		      });
		    			  google.maps.event.addListener(marker[i], 'click', function() {
		    			      infowindow[i].open(map,marker[i]);
		    			  });
		    			  if(i==0){// geringste Distanz
		    				  //alert(Math.round(item.distance*10)/10);
		    				  map.setCenter(new google.maps.LatLng(item.lat, item.lng));
		    				  if(km == 5){
		    					  map.setZoom(12);
		    				  }
		    				  else if(km == 10){
		    					  map.setZoom(11);
		    				  }
		    				  else if(km == 20){
		    					  map.setZoom(10);
		    			      }		  
		    			  }
		    		});
		    		store += "</ul></nav>"
		    		output_stores.html(store).trigger('create');
 			    }	
		    	else{
		    		//alert("keine Videothek gefunden");
		    		openPopupInfo('Videotheken', 'keine Videothek gefunden'); 
		    	}	
 				
 			},
 			error: function(){
                //output_stores.text('There was an error loading the data.');
                setMap(km) ;
 			}
    });
    
};

function setAddress(address){
	if(marker){
		for (var i = 0; i < marker.length; i++) {
	        marker[i].setMap(null);
	    }
	}
	marker = [];
	var km = $('#select-km').val();
	geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var pinNum = "o";
        var pinColor = "00ff00";
        var pinTextColor = "000000";
        var image = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld="+pinNum+"|"+pinColor+"|"+pinTextColor;
        if(!marker_home){
	        marker_home = new google.maps.Marker({
	            map: map,
	            position: results[0].geometry.location,
	            icon: image
	        });
        }
        else{
        	marker_home.setPosition(results[0].geometry.location);
        }
        
        var lat = results[0].geometry.location.lat();
        var lng = results[0].geometry.location.lng();
        //alert(glob_position.coords.latitude);
        var output_stores = $('#content_stores');	
    	output_stores.empty();
    	//alert('http://www.vionnow.de/json/listStores/lat/'+lat+'/lng/'+lng+'/km/200');
        $.ajax({
    	    	beforeSend: function() { $.mobile.showPageLoadingMsg(); },
    	    	complete: function() { $.mobile.hidePageLoadingMsg() },
     			url: 'http://www.vionnow.de/json/listStores/lat/'+lat+'/lng/'+lng+'/km/'+km,
     			dataType: 'jsonp',
     			jsonp: 'jsoncallback',
     			timeout: 10000,
     			success: function(data){
     				if(data){
     					var store = '<nav><ul data-role="listview" data-theme="a">';
    		    		$.each(data, function(i,item){
                              if(item.ip_wws){
                            	if(android == 1) {  
                            		store += '<li><a href="#" onclick="showExternalWebPage(\''+item.ip_wws+'\')"><h3>'+(i+1)+': '+item.name+' <small>('+Math.round(item.distance*10)/10+'km)</small></h3>';
                            	    
                            	}
                            	else{
                            		store += '<li><a rel="external" href="'+item.ip_wws+'" target="_blank"><h3>'+(i+1)+': '+item.name+' <small>('+Math.round(item.distance*10)/10+'km)</small></h3>';
                            	}	
                                store += '<p><span style="float: right;">'+item.phone+'</span>'+item.street+'</p>';
                                store += '<p><span style="float: right;">'+item.email+'</span>'+item.zip+' '+item.city+'</p>';
                                store += '</a></li>';
                               }else{
                                store += '<li><h3>'+(i+1)+': '+item.name+' <small>('+Math.round(item.distance*10)/10+'km)</small></h3>';
                               store += '<p><span style="float: right;">'+item.phone+'</span>'+item.street+'</p>';
                               store += '<p><span style="float: right;">'+item.email+'</span>'+item.zip+' '+item.city+'</p>';
                                store += '</li>';
                               }
                               
    		    			  
    		    			  var point = new google.maps.LatLng(item.lat, item.lng);
    		    			  //create marker
    		    			  var pinNum = i+1;
    		    			  var pinColor = "FF0000";
    	        			  var pinTextColor = "000000";
    	        			  var image = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld="+pinNum+"|"+pinColor+"|"+pinTextColor;
    		    			  marker[i] = new google.maps.Marker({
    		    			  	  position: point,
    		    			      map: map,
    		    			      icon:image
    		    			  });
    		    			  if(item.ip_wws){
    		    				if(android == 1) {  
    		    					var info = '<a href="#" onclick="showExternalWebPage(\''+item.ip_wws+'\')"><h3>'+(i+1)+': '+item.name+' <small>('+Math.round(item.distance*10)/10+'km)</small></h3>';
                              	    
                              	}
                              	else{
                              		var info = '<a href="'+item.ip_wws+'" rel="external" target="_blank">'+item.name+' ('+Math.round(item.distance*10)/10+'km)</a><br>';
                              	}	
    		    			  }
    		    			  else{
    		    				  var info = item.name + '<br>';  
    		    			  }
    		    			  info += item.street + '<br>';
    		    			  info += item.zip + ' ' +item.city+'<br>';
    		    			  info += item.content + '<br>';
    		    			  infowindow[i] = new google.maps.InfoWindow({
    		    		          content: info,
    		    		          
    		    		      });
    		    			  google.maps.event.addListener(marker[i], 'click', function() {
    		    			      infowindow[i].open(map,marker[i]);
    		    			  });
    		    			  if(i==0){// geringste Distanz
    		    				  //alert(Math.round(item.distance*10)/10);
    		    				  map.setCenter(new google.maps.LatLng(item.lat, item.lng));
    		    				  if(km == 5){
    		    					  map.setZoom(12);
    		    				  }
    		    				  else if(km == 10){
    		    					  map.setZoom(11);
    		    				  }
    		    				  else if(km == 20){
    		    					  map.setZoom(10);
    		    			      }		  
    		    			  }
    		    		});
    		    		store += "</ul></nav>"
    		    		output_stores.html(store).trigger('create');
     			    }	
    		    	else{
    		    		//alert("keine Videothek gefunden");
    		    		openPopupInfo('Videotheken', 'keine Videothek gefunden'); 
    		    	}	
     				
     			},
     			error: function(){
     				output_stores.text('There was an error loading the data.');
                    setMap(km)
     			}
        });
      } else {
    	 openPopupInfo('Geocode Fehler!', status); 
        //alert("Geocode was not successful for the following reason: " + status);
      }
    });
}

function geo_error(error){
	var message = "";
	switch (error.code) {
    case "0": message = "";
                   break;
    case "1": message = "Bitte Überprüfe deine GPS-Berechtigungen. Du kannst die Erlaubnis in den Datenschutzeinstellungen erteilen.";
    break;
    
    case "2": message = "Der Service ist momentan nicht erreichbar. Bitte versuche es später noch mal.";
    break;
    
    case "3": message = "Der Service brauchte zu lange um zu antworten. Bitte versuche es später noch mal.";
    break;
    
    default: message = ""; 
  }
    //alert('Du konntest leider nicht lokalisiert werden.\n' + message);
	openPopupInfo('Fehler!', 'Du konntest leider nicht lokalisiert werden.\n' + message);
          
}

function showExternalWebPage(page){
	//alert(page);
	window.plugins.childBrowser.showWebPage(page, { showLocationBar: true });
}


/* country */
function codeLatLng(coords) { 
	alert("Hallo");
    var geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(coords.latitude, coords.longitude);
      geocoder.geocode({'latLng': latlng}, function(results, status) { 
        if (status == google.maps.GeocoderStatus.OK) { 
          var country = "";	
          if (results[1]) { 
        	  for (i=0;i<results[0].address_components.length;i++){
        		    for (j=0;j<results[0].address_components[i].types.length;j++){
        		       if(results[0].address_components[i].types[j]=="country"){
        		          country = results[0].address_components[i].long_name;
        		          //alert(country);
        		          sessionStorage.setItem("country", country);
        		       }   
        		    }
        	  }
          } else { 
            alert("No results found"); 
          } 
        } else { 
          alert("Geocoder failed due to: " + status); 
        } 
      }); 

} 

function suggest_geo(){
	if($('#map_plz').val().length >= 4){
        $('#suggest_geo').show();
		var geo_suggest = $('#map_plz').val();
		var geocoder = new google.maps.Geocoder();
		var ne = new google.maps.LatLng(56.316537,0.351563);
		var sw = new google.maps.LatLng(45.828799,17.563475);
		//alert(geo_suggest);
		geocoder.geocode({'address': geo_suggest, 'bounds':  new google.maps.LatLngBounds(sw, ne)}, function(results, status) { 
	        if (status == google.maps.GeocoderStatus.OK) { 
	          if (results[0]) {
	        	  var places = "<ul>";
	        	  for(i=0;i<5;i++){
	        		  if(results[i]){
	        			  //alert(results[i].formatted_address);
	        			  places += '<li><a href="#" onClick="setAddress(\''+results[i].formatted_address+'\')">'+results[i].formatted_address+'</li>';
	        		  }
	        	  }
	        	  places += '</ul>';
	        	  $('#suggest_geo').html(places);
	          } else { 
	            //alert("No results found"); 
	          } 
	        } else { 
	          //alert("Geocoder failed due to: " + status); 
	        } 
	      }); 
	}	
	
}

