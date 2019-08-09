/*-----------------------------------------------------------------*/
/*-------------------------GEOLOCALISATION-------------------------*/
/*-----------------------------------------------------------------*/
var resume;
var restaurantsLoad = false;
document.addEventListener("deviceready", onDeviceReady, false);

function onDeviceReady() {
	startGeoLoc();
	dimCarte();
	
	// Dimension de la page
	$('body').height($(window).height()).width($(window).width());
	
	// Gestion de la nav active non active
	$('#footer a').click(function() {		
		$('#footer a').removeClass('ui-btn-active');
		$(this).addClass('ui-btn-active');
	});
                       
    jQuery('#map').live('pageshow', function() {
        dimCarte();
        affiche_map();
        jQuery('#map').unbind('pageshow');
        jQuery('#map').die('pageshow');
    });
                       
    jQuery('#map').live('pagehide', function() {
        jQuery('#map').unbind('pageshow');
        jQuery('#map').die('pageshow');
    });
    
    jQuery('#commentaire_photo').focus(function() {
        if (jQuery('#commentaire_photo').val() == 'Votre commentaire...') {
            jQuery('#commentaire_photo').val('');
        }
    });
}

// showAlert('Réseau Indisponible, veuillez réessayer plus tard.', 'Réseau Indisponible');


function checkConnection() {
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
    if (networkState == Connection.NONE) {
		return false;
    } else {
		return true;
    }
}

function startGeoLoc(){
    navigator.geolocation.getCurrentPosition(watchPosition, geolocationError, {enableHighAccuracy: true });
}

function watchPosition(){
    navigator.geolocation.watchPosition(geolocationSuccess,null,{ enableHighAccuracy: true });
   
   
}

function geolocationSuccess(position) {
    saveLocal('currentLatitude', position.coords.latitude  );
	saveLocal('currentLongitude',  position.coords.longitude);
	jQuery(document).trigger('changeLocation');
}

function geolocationError() {
    showAlert('Impossible de vous géolocaliser pour le moment.', 'Erreur');
}


function setCenterMapToMyLocation(map){
	logCordova(map);
	map.panTo(new google.maps.LatLng(getLocal('currentLatitude'), getLocal('currentLongitude')));
}

function logCordova(str){
	if(true){
		console.log(str);
	}
}


/* ************************************************************ */
/* ********************* DIMENSION CARTE ********************** */
/* ************************************************************ */
function dimCarte () {		
	// Dimension Carte
	var w_height = jQuery(window).height();
	var w_height_cal = w_height-90;
	var w_width = jQuery(window).width();
	jQuery('#carte_man').width(w_width);					
	jQuery('#carte_man').height(w_height_cal);					
	jQuery('#carte_man').css('position','absolute');
	
	watchPosition();
}


 /**********************************************************************************************/
 
		var carte = '';
		var direction;
		var marqueur = false;
		var info_marqueur = []; // Tableau qui stock les marqueurs 
		var ib = new InfoBox(); 
		var geoloc = ' '; // Stock les coordonnées de notre géolocalisation
		var point = ' '; // Stock les coordonnées du lieu recherché
		var i; // Stock le nombre de marqueur sur la map
		var NomPosition; // Stock le nom du lieu recherché
		var myPosMarker = '';

		/* fonction qui affiche la carte dans sa page */
		function affiche_map() {				
			
			geoloc = new google.maps.LatLng(getLocal('currentLatitude'), getLocal('currentLongitude'));

			var myStyles = [ { "stylers": [ { "hue": "#8F4D00" } ] } ];

			var customMapType = new google.maps.StyledMapType(myStyles, {name: "My styles"});

			var mesOptions = {
				zoom: 16,
				center: geoloc,
				mapTypeControl: false,
				streetViewControl: false,
			mapTypeId: google.maps.MapTypeId.ROADMAP
			};

			// création et affichage de la carte Google dans l'élément html d'id carte
			carte = new google.maps.Map(document.getElementById("carte_man"), mesOptions);

			// Appliquer les styles customises à la Google Map
			carte.mapTypes.set('customMap', customMapType);
			carte.setMapTypeId('customMap');

			//Ma position
			myPosMarker = new google.maps.Marker({
				position: new google.maps.LatLng(getLocal('currentLatitude'), getLocal('currentLongitude')),
				map: carte,
				icon: "images/mylocation.png"
			});

		}	

		jQuery(document).bind('changeLocation', function() {
			if (myPosMarker != '') {
				myPosMarker.setPosition(new google.maps.LatLng(getLocal('currentLatitude'), getLocal('currentLongitude')));
				geoloc = new google.maps.LatLng(getLocal('currentLatitude'), getLocal('currentLongitude'));
			}
		});


		/* fonction qui charge les markers sur la map */
		function charge_marker(num,nom,adresse,latitude,longitude,type) {

			jQuery('#map').live('pageshow', function() {
				var picto = "";	
                console.log(direction);
                if (direction != null) {
                    direction.setMap(null);
                    direction.setDirections({routes: []});
                }
				point = new google.maps.LatLng(latitude,longitude);
				
				if ( type == "auberges") { picto = "images/point-carte-auberge.png"; }
				if ( type == "restaurants") { picto = "images/point-carte-restaurateurs.png"; }
				if ( type == "camps") { picto = "images/point-carte-camps.png"; }
				if ( type == "infos") { picto = "images/point-carte-infos.png"; }
				if ( type == "lieux") { picto = "images/point-carte-lieux-sceniques.png"; }
				if ( type == "stationnements") { picto = "images/point-carte-stationnement.png"; }
				if ( type == "tavernes") { picto = "images/point-carte-tavernes.png"; }
					
				/*création des marqueurs*/
				marqueur = new google.maps.Marker({
					position: new google.maps.LatLng(latitude,longitude),
					map: carte,
					icon: picto
				});
				info_marqueur.push(marqueur);
				console.log('charge_marker');


				var boxText = document.createElement("div");  					
				boxText.style.cssText = "background:#563F39;";

				boxText.innerHTML = '<div class="infoBulle"> <h3 class="titleMap">'+nom+'</h3> <p>'+adresse+'</p> </div>'

				var infoBulle = {
					content:boxText,
					disableAutoPan: false,
					minWidth: 150,
					alignBottom: true,
					pixelOffset: new google.maps.Size(-130, -60),
					zIndex: null,
					closeBoxMargin: "10px",
					closeBoxURL: "images/close.png",
					infoBoxClearance: new google.maps.Size(1, 1),
					isHidden: false,
					pane: "floatPane",
					enableEventPropagation: false,
					position: point
				};
                if (ib) {
                    ib.close();
                }
				/* affichage de l'info-bulle sur la carte */
				google.maps.event.addListener(marqueur, 'click', function (event) {
                        ib.setOptions(infoBulle);
                        ib.open(carte, marqueur);
                });
				NomPosition = nom; 
				// Stock le nom de notre lieu dans une variable 
				// pour pouvir le récuperer dans la fonction trace 

				trace(); // Fonction qui lance le tracet sur la Map

			});
		}
	


		function charge_marker_all(num,nom,adresse,latitude,longitude,type) {	

			jQuery('#map').live('pageshow', function() {
				jQuery('#infoDistance').hide();
				var picto = "";
				var point = "";
				
				if ( type == "auberges") { picto = "images/point-carte-auberge.png"; }
				if ( type == "restaurants") { picto = "images/point-carte-restaurateurs.png"; }
				if ( type == "camps") { picto = "images/point-carte-camps.png"; }
				if ( type == "infos") { picto = "images/point-carte-infos.png"; }
				if ( type == "lieux") { picto = "images/point-carte-lieux-sceniques.png"; }
				if ( type == "stationnements") { picto = "images/point-carte-stationnement.png"; }
				if ( type == "tavernes") { picto = "images/point-carte-tavernes.png"; }
				
                point = new google.maps.LatLng(latitude,longitude);
				/*création des marqueurs*/
				marqueur = new google.maps.Marker({
					position: point,
					map: carte,
					icon: picto
				});
				info_marqueur.push(marqueur);
				console.log('charge_marker_all');

				var boxText = document.createElement("div");  					
				boxText.style.cssText = "background:#563F39;";

				boxText.innerHTML = '<div class="infoBulle"> <h3 class="titleMap">'+nom+'</h3> <p>'+adresse+'</p> </div>'

				var infoBulle = {
					content:boxText,
					disableAutoPan: false,
					minWidth: 150,
					alignBottom: true,
					pixelOffset: new google.maps.Size(-130, -60),
					zIndex: null,
					closeBoxMargin: "18px 10px 5px 5px",
					closeBoxURL: "images/close.png",
					infoBoxClearance: new google.maps.Size(1, 1),
					isHidden: false,
					pane: "floatPane",
					enableEventPropagation: false,
					position: point
				};
                if (ib) {
                    ib.close();
                }
                
				/* affichage de l'info-bulle sur la carte */
				google.maps.event.addListener(marqueur, 'click', (function (marqueur, i) {
                    return function() {
					    ib.setOptions(infoBulle);
                        //ib.setPosition(marqueur.getPosition())
                        if(ib.view){
                            ib.close();
                        } else {
                            ib.open(carte, marqueur);
                        }
                    }
				})(marqueur, i));

			});
		}
		
		/* fonction qui vide les markers sur la map */
		function remove_marker() {
			jQuery('#map').live('pageshow', function() {	
				if ( info_marqueur.length > 0 ) {
					for ( var i = 0; i  < info_marqueur.length; i++) {
						info_marqueur[i].setMap(null);
					}
				}
			});	
        }


		function trace() {
			// Custom tracé
			var polyOptions = {
			    strokeColor : '#ED583A',
			    strokeOpacity : 0.8,
			    strokeWeight : 5
			};

			direction = new google.maps.DirectionsRenderer({
			    map : carte, 
			    panel : panel,
			    polylineOptions: polyOptions
			   
			});		

			var request = {
	            origin      : geoloc,
	            destination : point,
	            durationInTraffic: true,
	            travelMode  : google.maps.DirectionsTravelMode.WALKING // Type de transport - DRIVING || WALKING
	        }           

       		var directionsService = new google.maps.DirectionsService(); // Service de calcul d'itinéraire
    		directionsService.route(request, function(response, status) { // Envoie de la requête pour calculer le parcours
	            if(status == google.maps.DirectionsStatus.OK){
	                direction.setDirections(response); // Trace l'itinéraire sur la carte et les différentes étapes du parcours
	                direction.setOptions({'suppressMarkers':true}); // Supprime les markers d'origine
	               // directionsDisplay.setDirections(response);
					var distance = response.routes[0].legs[0].distance.value;
					var duree = response.routes[0].legs[0].duration.value;
					document.getElementById('distance').innerHTML = "Situé 	&agrave; " +Math.round((duree/60))+ " minutes";
					/*document.getElementById('duration').innerHTML = "(" +Math.round((duree/60)) + " minutes) ";*/
					document.getElementById('name').innerHTML = NomPosition;
                    jQuery('#infoDistance').show();
	            }

	            /* LIENS UTILES */
	           // http://www.developpez.net/forums/d1287854/webmasters-developpement-web/javascript/bibliotheques-frameworks/apis-google/supprimer-marqueurs-service-itineraire-api-v3-resolu/
			}); /* END DIRECTIONSERVICE */
		}
		
		/* fonction qui vide les traces sur la map */
		function remove_trace() {
            jQuery('#map').bind('pageshow', function() {
                                console.log('remove_trace');
			 direction.setMap(null);
			 direction.setDirections({routes: []});
            });
        }

	
		// HEADER POUR 1 LIEU UNIQUE
		function charge_head_map(type) {
			jQuery('#map').bind('pageshow', function() {	

				$('#map #header-home').removeClass();
				$('#map #header-home a.menu').hide();
				$('#map #header-home a.carte').hide();
				$('#map #header-home a.retour').show();
				$('#map #header-home a.retour').removeAttr();

					jQuery('#map').unbind('pageshow');

					if ( type == 'restaurants' ) {
						$('#map #header-home').addClass('header-resto');
						$('#map #header-home h1').html('Restaurants');
						$('#map #header-home a.retour').attr('href','#resto');
					} else if ( type == 'camps') {
						$('#map #header-home').addClass('header-camps');
						$('#map #header-home h1').html('Camps de Toile');
						$('#map #header-home a.retour').attr('href','#'+type);
					} else if ( type == 'tavernes') {
						$('#map #header-home').addClass('header-tavernes');
						$('#map #header-home h1').html('Tavernes');
						$('#map #header-home a.retour').attr('href','#'+type);
					} else if ( type == 'auberges') {
						$('#map #header-home').addClass('header-auberges');
						$('#map #header-home h1').html('Auberges');
						$('#map #header-home a.retour').attr('href','#'+type);
					} else if ( type == 'lieux') {
						$('#map #header-home').addClass('header-lieux-spe');
						$('#map #header-home h1').html('Lieux Scéniques');
						$('#map #header-home a.retour').attr('href','#lieux-spe');
					} else if ( type == 'stationnements') {
						$('#map #header-home').addClass('header-stationnements');
						$('#map #header-home h1').html('Stationnements');
						$('#map #header-home a.retour').attr('href','#'+type);
					} else if ( type == 'infos') {
						$('#map #header-home').addClass('header-points-infos');
						$('#map #header-home h1').html('Points infos');
						$('#map #header-home a.retour').attr('href','#PointsInfos');
					} 
			});
		}	



		// HEADER POUR TOUS LES POINTS
		function charge_head_map_all(type) {
			jQuery('#map').bind('pageshow', function() {	

				$('#map #header-home').removeClass();
				$('#map #header-home a.menu').show();
				$('#map #header-home a.carte').show();
				$('#map #header-home a.menu').removeAttr();
				$('#map #header-home a.carte').removeAttr();
				$('#map #header-home a.retour').hide();

				$("#map #header-home a.menu").click(function(){
				  $(this).addClass("actif");
				});

					jQuery('#map').unbind('pageshow');

					if ( type == 'restaurants' ) {
						$('#map #header-home').addClass('header-resto');
						$('#map #header-home h1').html('Restaurants');
						$('#map #header-home a.menu').attr('href','#resto');
						$('#map #header-home a.carte').attr('onClick','marker_restaurants();');
					} else if ( type == 'camps') {
						$('#map #header-home').addClass('header-camps');
						$('#map #header-home h1').html('Camps de Toile');
						$('#map #header-home a.menu').attr('href','#'+type);
						$('#map #header-home a.carte').attr('onClick','marker_camps();');
					} else if ( type == 'tavernes') {
						$('#map #header-home').addClass('header-tavernes');
						$('#map #header-home h1').html('Tavernes');
						$('#map #header-home a.menu').attr('href','#'+type);
						$('#map #header-home a.carte').attr('onClick','marker_tavernes();');
					} else if ( type == 'auberges') {
						$('#map #header-home').addClass('header-auberges');
						$('#map #header-home h1').html('Auberges');
						$('#map #header-home a.menu').attr('href','#'+type);
						$('#map #header-home a.carte').attr('onClick','marker_auberges();');
					} else if ( type == 'lieux') {
						$('#map #header-home').addClass('header-lieux-spe');
						$('#map #header-home h1').html('Lieux Scéniques');
						$('#map #header-home a.menu').attr('href','#lieux-spe');
						$('#map #header-home a.carte').attr('onClick','marker_lieuxsceniques();');
					} else if ( type == 'stationnements') {
						$('#map #header-home').addClass('header-stationnements');
						$('#map #header-home h1').html('Stationnements');
						$('#map #header-home a.menu').attr('href','#'+type);
						$('#map #header-home a.carte').attr('onClick','marker_stationnements();');
					} else if ( type == 'infos') {
						$('#map #header-home').addClass('header-points-infos');
						$('#map #header-home h1').html('Points infos');
						$('#map #header-home a.menu').attr('href','#PointsInfos');
						$('#map #header-home a.carte').attr('onClick','marker_infos();');
					} 
			});
		}

/* resto */
function restaurants(){
    if (restaurantsLoad == false) {
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "xml/restaurants.xml",
		dataType: "xml",
		success: function(xml) {
           restaurantsLoad = true;
			$(xml).find('restaurant').each(function(){	
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				nom = nom.replace("'", '&apos;');
				var adresse = jQuery(this).find('adresse').text();
				adresse = adresse.replace("'", '&apos;');
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				content_html = content_html+"<a href='#map'><li class='content_"+num+"' onClick='remove_marker();charge_head_map(\"restaurants\");charge_marker(\""+num+"\",\""+nom+"\",\""+adresse+"\",\""+latitude+"\",\""+longitude+"\",\"restaurants\");'>";
					content_html = content_html+"<h3>"+nom+"</h3>";
					content_html = content_html+"<p>"+adresse+"</p>";
				content_html = content_html+"</li></a>";
				
			});
			//console.log(content_html);
            jQuery('#liste_resto ul').append(content_html);
		}
	});
    }
}
function marker_restaurants() {
	charge_head_map_all('restaurants');
	remove_marker();
	remove_trace();
	console.log('marker_restaurants');
	$.ajax({
		type: "GET",
		url: "xml/restaurants.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('restaurant').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				var adresse = jQuery(this).find('adresse').text();
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				charge_marker_all(num,nom,adresse,latitude,longitude,'restaurants');				
			});
			jQuery('#map').trigger('pageshow');
		}
	});
}


/* camps */
function camps(){
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "xml/camps.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('camp').each(function(){
				var num = jQuery(this).find('num').text();
				var blason = jQuery(this).find('blason').text();
				var nom = jQuery(this).find('nom').text();
				nom = nom.replace("'", '&apos;');
				var adresse = jQuery(this).find('adresse').text();
				adresse = adresse.replace("'", '&apos;');
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				content_html = content_html+"<a href='#map'>";
					content_html = content_html+"<li class='content_"+num+"' onClick='remove_marker();charge_head_map(\"camps\");charge_marker(\""+num+"\",\""+nom+"\",\""+adresse+"\",\""+latitude+"\",\""+longitude+"\",\"camps\");'>";
						content_html = content_html+"<span class='icon icon_"+blason+"'></span>";
						content_html = content_html+"<h3>"+nom+"</h3>";
						content_html = content_html+"<p>"+adresse+"</p>";
					content_html = content_html+"</li>";
				content_html = content_html+"</a>";
			});
           jQuery('#liste_camps ul').html(content_html);
		}
	});
}
function marker_camps(){
	charge_head_map_all('camps');
	remove_marker();
	remove_trace();
	$.ajax({
		type: "GET",
		url: "xml/camps.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('camp').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				var adresse = jQuery(this).find('adresse').text();
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				charge_marker_all(num,nom,adresse,latitude,longitude,"camps");
			});
			jQuery('#map').trigger('pageshow');
		}
	});
}

/* tavernes */
function tavernes(){
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "xml/tavernes.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('taverne').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				nom = nom.replace("'", '&apos;');
				var adresse = jQuery(this).find('adresse').text();
				adresse = adresse.replace("'", '&apos;');
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				content_html = content_html+"<a href='#map'><li class='content_"+num+"' onClick='remove_marker();charge_head_map(\"tavernes\");charge_marker(\""+num+"\",\""+nom+"\",\""+adresse+"\",\""+latitude+"\",\""+longitude+"\",\"tavernes\");'>";
					content_html = content_html+"<h3>"+nom+"</h3>";
					content_html = content_html+"<p>"+adresse+"</p>";
				content_html = content_html+"</li></a>";
				jQuery('#liste_tavernes ul').html(content_html);
			});
		}
	});
}
function marker_tavernes(){
	charge_head_map_all('tavernes');
	remove_marker();
	remove_trace();
	$.ajax({
		type: "GET",
		url: "xml/tavernes.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('taverne').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				var adresse = jQuery(this).find('adresse').text();
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				charge_marker_all(num,nom,adresse,latitude,longitude,"tavernes");
			});
			jQuery('#map').trigger('pageshow');
		}
	});
}


/* auberges */
function auberges(){
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "xml/auberges.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('auberge').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				nom = nom.replace("'", '&apos;');
				var adresse = jQuery(this).find('adresse').text();
				adresse = adresse.replace("'", '&apos;');
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				content_html = content_html+"<a href='#map'><li class='content_"+num+"' onClick='remove_marker();charge_head_map(\"auberges\");charge_marker(\""+num+"\",\""+nom+"\",\""+adresse+"\",\""+latitude+"\",\""+longitude+"\",\"auberges\");'>";
					content_html = content_html+"<h3>"+nom+"</h3>";
					content_html = content_html+"<p>"+adresse+"</p>";
				content_html = content_html+"</a></li>";
				jQuery('#liste_auberges ul').html(content_html);
			});
		}
	});
}
function marker_auberges(){
	charge_head_map_all('auberges');
	remove_marker();
	remove_trace();
	$.ajax({
		type: "GET",
		url: "xml/auberges.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('auberge').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				var adresse = jQuery(this).find('adresse').text();
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				charge_marker_all(num,nom,adresse,latitude,longitude,"auberges");
			});
			jQuery('#map').trigger('pageshow');
		}
	});
}


/* lieux SINIK */
function lieuxsceniques(){
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "xml/lieuxsceniques.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('lieuscenique').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				nom = nom.replace("'", '&apos;');
				var adresse = jQuery(this).find('adresse').text();
				adresse = adresse.replace("'", '&apos;');
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				content_html = content_html+"<a href='#map'><li class='content_"+num+"' onClick='remove_marker();charge_head_map(\"lieux\");charge_marker(\""+num+"\",\""+nom+"\",\""+adresse+"\",\""+latitude+"\",\""+longitude+"\",\"lieux\");'>";
					content_html = content_html+"<h3>"+nom+"</h3>";
					content_html = content_html+"<p>"+adresse+"</p>";
				content_html = content_html+"</li></a>";
				jQuery('#liste_lieux_spe ul').html(content_html);
			});
		}
	});
}
function marker_lieuxsceniques(){
	charge_head_map_all('lieux');
	remove_marker();
	remove_trace();
	$.ajax({
		type: "GET",
		url: "xml/lieuxsceniques.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('lieuscenique').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				var adresse = jQuery(this).find('adresse').text();
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				charge_marker_all(num,nom,adresse,latitude,longitude,"lieux");
			});
			jQuery('#map').trigger('pageshow');
		}
	});
}

/* parking */
function stationnements(){
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "xml/stationnements.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('stationnement').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				nom = nom.replace("'", '&apos;');
				var adresse = jQuery(this).find('adresse').text();
				adresse = adresse.replace("'", '&apos;');
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				content_html = content_html+"<a href='#map'><li class='content_"+num+"' onClick='remove_marker();charge_head_map(\"stationnements\");charge_marker(\""+num+"\",\""+nom+"\",\""+adresse+"\",\""+latitude+"\",\""+longitude+"\",\"stationnements\");'>";
					content_html = content_html+"<h3>"+nom+"</h3>";
					content_html = content_html+"<p>"+adresse+"</p>";
				content_html = content_html+"</li></a>";
				jQuery('#liste_stationnements ul').html(content_html);
			});
		}
	});
}
function marker_stationnements(){
	charge_head_map_all('stationnements');
	remove_marker();
	remove_trace();
	$.ajax({
		type: "GET",
		url: "xml/stationnements.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('stationnement').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				var adresse = jQuery(this).find('adresse').text();
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				charge_marker_all(num,nom,adresse,latitude,longitude,"stationnements");
			});
			jQuery('#map').trigger('pageshow');
		}
	});
}


/* point info */
function points_i(){
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "xml/points_i.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('point').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				nom = nom.replace("'", '&apos;');
				var adresse = jQuery(this).find('adresse').text();
				adresse = adresse.replace("'", '&apos;');
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				content_html = content_html+"<a href='#map'><li class='content_"+num+"' onClick='remove_marker();charge_head_map(\"infos\");charge_marker(\""+num+"\",\""+nom+"\",\""+adresse+"\",\""+latitude+"\",\""+longitude+"\",\"infos\");'>";
					content_html = content_html+"<h3>"+nom+"</h3>";
					content_html = content_html+"<p>"+adresse+"</p>";
				content_html = content_html+"</li></a>";
				jQuery('#liste_points_infos ul').html(content_html);
			});
		}
	});
}
function marker_points_i(){
	charge_head_map_all('infos');
	remove_marker();
	remove_trace();
	$.ajax({
		type: "GET",
		url: "xml/points_i.xml",
		dataType: "xml",
		success: function(xml) {
			$(xml).find('point').each(function(){
				var num = jQuery(this).find('num').text();
				var nom = jQuery(this).find('nom').text();
				var adresse = jQuery(this).find('adresse').text();
				var tel = jQuery(this).find('tel').text();
				var latitude = jQuery(this).find('latitude').text();
				var longitude = jQuery(this).find('longitude').text();
				charge_marker_all(num,nom,adresse,latitude,longitude,"infos");
			});
			jQuery('#map').trigger('pageshow');
		}
	});
}


/* actu */
function actu() {
    if (checkConnection() == true) {
	var content_html = "";
	var bloc_html = "";
	$.ajax({
		type: "GET",
		url: "http://www.roideloiseau.com/flux/?jsoncallback=?",
		dataType: "jsonp",
		cache : true,
		success: function(data) {
			$.each(data.POSTS, function(index, value){
				if( index < data.POSTS.length-1) {
					var item = data.POSTS[index];
					var id = item.ID;
					var title = item.TITLE;
					var link = item.LINK;
					var extrait = item.EXTRAIT;
					var description = item.DESCRIPTION;
					item.URLIMG;
					if (item.URLIMG != '') {
						var urlImg = item.URLIMG
					} else {
						var urlImg = 'images/img-actu.jpg';
					}
                    content_html = '';
					content_html = content_html+"<li onClick='UneActu(\""+id+"\");'><a href='#DetailActu' id='"+id+"'>";
						content_html = content_html+"<div class='img'><img src='"+urlImg+"' /></div>";
						content_html = content_html+"<div class='bloc_texte'>";
							content_html = content_html+"<h3>"+title+"</h3>";
							content_html = content_html+"<p class='extrait'>"+extrait+"</p>";
						content_html = content_html+'</div>';
					content_html = content_html+"</a></li>";
					jQuery('#news ul.ui-listview').append(content_html);
                   jQuery('#news ul.ui-listview').listview('refresh');
				}
			});
           
		}
	});
    } else {
       showAlert('Réseau Indisponible, veuillez réessayer plus tard.', 'Réseau Indisponible');
    }
}

function UneActu(aie) {
	var content_html = "";
	var bloc_html = "";
	$.ajax({
		type: "GET",
		url: "http://www.roideloiseau.com/flux/?jsoncallback=?",
		dataType: "jsonp",
		cache : true,
		success: function(data) {
			$.each(data.POSTS, function(index, value){
				if( index < data.POSTS.length-1) {
					var item = data.POSTS[index];
					if ( item.ID == aie) {
						var id = item.ID;
						var title = item.TITLE;
						var link = item.LINK;
						var extrait = item.EXTRAIT;
						var description = item.DESCRIPTION;
						item.URLIMG;
						if (item.URLIMG != '') {
							var urlImg = item.URLIMG
						} else {
							var urlImg = 'images/img-actu.jpg';
						}
						content_html = content_html+"<h3>"+title+"</h3>";
						content_html = content_html+"<div class='img'><img src='"+urlImg+"' /></div>";
						content_html = content_html+"<p class='extrait'>"+description+"</p><br />";
						jQuery('#detail').html(content_html);
					}
				}
			});
		}
	});	
}
/* ACTU */



/* infos */
function infos() {
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "http://www.roideloiseau.com/flux_pratique/?jsoncallback=?",
		dataType: "jsonp",
		cache : true,
		success: function(data) {
			$.each(data.PAGES, function(index, value){
				if( index < data.PAGES.length-1) {
					var item = data.PAGES[index];
					var id = item.ID;
					var title = item.TITLE;
					var link = item.LINK;
					var description = item.DESCRIPTION;
					content_html = content_html+"<li id='numero"+id+"' onClick='UneInfos(\""+id+"\");'><a href='#DetailInfos' >";
						content_html = content_html+"<h3>"+title+"</h3>";
					content_html = content_html+"</a></li>";
					jQuery('ul#bloc_infos').html(content_html);
				}
			});
		}
	});
}
function UneInfos(aieInfo) {
	var content_html = "";
	$.ajax({
		type: "GET",
		url: "http://www.roideloiseau.com/flux_pratique/?jsoncallback=?",
		dataType: "jsonp",
		cache : true,
		success: function(data) {
			$.each(data.PAGES, function(index, value){
				if( index < data.PAGES.length-1) {
					var item = data.PAGES[index];
					if ( item.ID == aieInfo) {
						var id = item.ID;
						var title = item.TITLE;
						var link = item.LINK;
						var description = item.DESCRIPTION;
						item.URLIMG;
						if (item.URLIMG != '') {
							var urlImg = item.URLIMG
						} else {
							var urlImg = 'images/img-actu.jpg';
						}
						content_html = content_html+"<h3>"+title+"</h3>";
						content_html = content_html+"<div class='img'><img src='"+urlImg+"' /></div>";
						content_html = content_html+"<p class='extrait'>"+description+"</p><br />";
						jQuery('#detailInfos').html(content_html);
					}
				}
			});
		}
	});
}
/* infos */


/**
 * Envoi de la photo
 **/
function showAlert(message, title, functionResult) {
    if(navigator.notification && navigator.notification.alert){
        
        if (functionResult == undefined) {
            
            functionResult = null;
        }
        
        navigator.notification.alert(
                                     message,  // message
                                     functionResult,         // callback
                                     title,            // title
                                     'Ok'                  // buttonName
                                     );
    } else {
        alert(message);
    }
}

function cameraOnSuccess(imageURI) {
    jQuery('#photo_to_send').attr('src', imageURI);
    setTimeout( function(){ $.mobile.changePage('#reporter_suite');}, 1000 );
}

function cameraOnFail(message) {
    
}

//Gestion photo
function takePicture() {
    navigator.camera.getPicture(cameraOnSuccess, cameraOnFail, { quality: 60,
				targetWidth:1224,
				targetHeight:1632,
				destinationType: Camera.DestinationType.FILE_URI});
    
}


function alertSuccess1(){
    $.mobile.hidePageLoadingMsg();
    $.mobile.changePage('#reporter');
}


function uploadSuccess(r) {
    var response = JSON.parse(r.response);
    showAlert(response.message, 'Envoi de votre photo', alertSuccess1);
}

function uploadFail(error) {
    showAlert('Une erreur s\'est produite lors de l\'upload de votre photo.', 'Erreur', alertSuccess1);
}

function sendPicture() {
    var urlToPost = 'http://www.roideloiseau.com/flux/';
    var imageURI = $('#photo_to_send').attr('src');
    var options = new FileUploadOptions();
    options.fileKey="file";
    options.fileName=imageURI.substr(imageURI.lastIndexOf('/')+1);
    options.mimeType="image/jpeg";
    options.chunkedMode = false;
    var params = new Object();
    params.comment = $('#commentaire_photo').val();
    options.params = params;
    
    $.mobile.showPageLoadingMsg();
    var ft = new FileTransfer();
    ft.upload(imageURI, urlToPost, uploadSuccess, uploadFail, options);
}