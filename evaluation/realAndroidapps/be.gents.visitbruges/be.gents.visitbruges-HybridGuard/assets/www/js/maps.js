function Map(){


	this.createMap = function(mapid, markers)
	{

		var map = "#" + mapid;
		
		$(map).gmap3("destroy").empty();
		
		$(map).gmap3({
			map:{
				options:{
					center:[51.21002905473201, 3.225259780883789],
					zoom:13,
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					mapTypeControl: false,
					navigationControl: false,
					scrollwheel: false,
					streetViewControl: false,
					styles: [
					  {
					    "featureType": "landscape",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "lightness": 53 },
					      { "saturation": -22 },
					      { "hue": "#ff8800" }
					    ]
					  },{
					    "featureType": "road.highway",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "hue": "#7f00ff" },
					      { "saturation": -20 },
					      { "lightness": 42 },
					      { "gamma": 0.66 }
					    ]
					  },{
					    "featureType": "road.highway",
					    "elementType": "geometry.stroke",
					    "stylers": [
					      { "hue": "#b300ff" },
					      { "gamma": 0.71 }
					    ]
					  },{
					    "featureType": "water",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "hue": "#00e5ff" },
					      { "gamma": 0.68 },
					      { "saturation": 46 },
					      { "lightness": 53 }
					    ]
					  },{
					    "featureType": "road.arterial",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "lightness": 68 },
					      { "hue": "#ff00ff" }
					    ]
					  },{
					    "featureType": "road.arterial",
					    "elementType": "geometry.stroke",
					    "stylers": [
					      { "hue": "#ee00ff" },
					      { "lightness": 42 }
					    ]
					  },{
					    "featureType": "road",
					    "elementType": "labels.text.fill",
					    "stylers": [
					      { "gamma": 2.54 }
					    ]
					  },{
					    "featureType": "road",
					    "elementType": "labels.text.stroke",
					    "stylers": [
					      { "lightness": 100 },
					      { "saturation": -100 }
					    ]
					  },{
					    "featureType": "road.highway",
					    "elementType": "labels.text.fill",
					    "stylers": [
					      { "hue": "#aa00ff" },
					      { "gamma": 0.96 },
					      { "lightness": -13 }
					    ]
					  },{
					    "featureType": "road.arterial",
					    "elementType": "labels.text.fill",
					    "stylers": [
					      { "lightness": 41 },
					      { "hue": "#8800ff" }
					    ]
					  },{
					    "featureType": "landscape",
					    "stylers": [
					      { "hue": "#ff7700" },
					      { "lightness": 20 }
					    ]
					  },{
					    "featureType": "poi.park",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "hue": "#ddff00" },
					      { "gamma": 0.52 },
					      { "lightness": 13 },
					      { "saturation": 27 }
					    ]
					  },{
					    "featureType": "road",
					    "elementType": "geometry.stroke",
					    "stylers": [
					      { "hue": "#ff00cc" },
					      { "lightness": 64 }
					    ]
					  },{
					    "featureType": "road.local",
					    "elementType": "labels.text",
					    "stylers": [
					      { "hue": "#ff9100" },
					      { "lightness": 3 },
					      { "gamma": 0.7 }
					    ]
					  },{
					    "featureType": "poi.school",
					    "stylers": [
					      { "hue": "#ff5e00" },
					      { "saturation": 51 },
					      { "gamma": 0.82 }
					    ]
					  },{
					    "featureType": "poi.government",
					    "stylers": [
					      { "lightness": 43 },
					      { "hue": "#1aff00" }
					    ]
					  },{
					    "featureType": "road.arterial",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "lightness": -25 },
					      { "hue": "#ff5e00" }
					    ]
					  },{
					    "featureType": "road.arterial",
					    "elementType": "labels.text.fill",
					    "stylers": [
					      { "hue": "#ff7700" },
					      { "gamma": 0.56 },
					      { "lightness": 25 }
					    ]
					  },{
					    "featureType": "water",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "hue": "#00e5ff" },
					      { "lightness": 31 }
					    ]
					  },{
					    "featureType": "poi.business",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "gamma": 1.13 },
					      { "saturation": 42 },
					      { "hue": "#ff4400" },
					      { "lightness": 57 }
					    ]
					  },{
					    "featureType": "transit.line",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "hue": "#0044ff" },
					      { "saturation": 32 },
					      { "lightness": 8 },
					      { "gamma": 0.57 }
					    ]
					  },{
					    "featureType": "poi.park",
					    "elementType": "geometry.fill",
					    "stylers": [
					      { "hue": "#00ffc4" },
					      { "gamma": 0.74 },
					      { "saturation": -31 },
					      { "lightness": 73 }
					    ]
					  },{
					    "featureType": "road",
					    "elementType": "labels.icon",
					    "stylers": [
					      { "hue": "#6600ff" },
					      { "lightness": 36 }
					    ]
					  },{
					    "featureType": "administrative.country",
					    "stylers": [
					      { "hue": "#00fff7" },
					      { "saturation": -8 },
					      { "lightness": 3 }
					    ]
					  }
					]
				}
			}
		})

		var destinationLat;
		var destinationLng;

		if(markers != null)
		{
			
			for(var i = 0; i<markers.length; i++)
			{
				if(i == 0)
				{
					
					var clear = {action:'clear', name:'marker'};
					$(map).gmap3(clear);
				}
				
				destinationLat = markers[i].lat;
				destinationLng = markers[i].lng;

				this.addMarker(map, markers[i].id, markers[i].title, markers[i].lat, markers[i].lng, markers[i].category, markers[i].openinghours);
			}
		}
		
		this.addMyLocation(map, destinationLat, destinationLng);
		
	}
	
	this.addMarker = function(map, id, title, lat, lng, category, openinghours)
	{
		
		//alert("marker: " + lat + " " + lng);
		
		var img = "";
		
		if(category != null)
		{
			category = parseInt(category);
		}
		
		var iconClass = "";
		var colorClass = "";
		
		switch(category)
		{
			
			case 1: // visit arts & heritage
				img = "img/pointer_heritage_2.png";
				colorClass = "cat_purple";
				iconClass = "icon_purple";
			break;
			case 2: // visit culture
				img = "img/pointer_culture_2.png";
				colorClass = "cat_blue";
				iconClass = "icon_blue";
			break;
			case 3: // visit hotels
				img = "img/pointer_hotels_2.png";
				colorClass = "cat_cyan";
				iconClass = "icon_cyan";
			break;
			case 4: // visit food
				img = "img/pointer_food_2.png";
				colorClass = "cat_orange";
				iconClass = "icon_orange";
			break;
			case 5: // visit outdoors
				img = "img/pointer_nature_2.png";
				colorClass = "cat_green";
				iconClass = "icon_green";
			break;
			case 20: // visit romance
				img = "img/pointer_romance_2.png";
				colorClass = "cat_pink";
				iconClass = "icon_pink";
			break;
			default:
				img = "img/pointer_personal_2.png";
			break;

		}
		
		
		$(map).gmap3({
			marker:{
				tag: id,
				name: "marker",
				latLng: [lat, lng],
				options:{
					icon: img
				},
				events:{
					click: function(e)
					{
						if(map == "#map")
						{
							
							var item = '<li topcat="' + category + '" class="item button" id="' + id + '"><div class="icon ' + iconClass +'"></div><span class="contents"><span class="itemtitle ' + colorClass + '">' + title + '</span><br /><span class="clock"></span><span class="closedinfo">' + openinghours + '</span></span><div class="dummy"></div></li>'
							$(".map_info").empty().append(item);
							$(".map_info").show();
							$(".page_sub .map_info .item").click(function(e)
							{
								var content = new Content();
								content.defineContent("page_location", id, function(results)
								{
									if(window.localStorage.getItem("currentpage") == "page_sub") updateHistory("page_sub");
									if(window.localStorage.getItem("currentpage") == "page_all") updateHistory("page_all");
									navigateTo("page_location", category, results);
								});
							});
						}
						else if(map = "#mylocationsmap")
						{
							$(".mymarkerinfo p").empty().append(title);
							$(".mymarkerinfo .deletelocationbutton").attr("id", id);
							$(".mymarkerinfo").removeClass("mymarkerinfo_down");
						}
					}
				}
			},
			map:{
		      options:{
		        zoom: 13,
		        preserveViewport: true
		      }
		    }
		});

		
	}
	
	this.dropMarker = function(id, description, lat, lng)
	{

		var map = "#mylocationsmap";
		
		$(map).gmap3({
			marker: { 
				latLng: [lat, lng],
				tag: id,
				options: { 
					icon: "img/pointer_personal_2.png",
					animation: google.maps.Animation.DROP
				},
				events: {
					click: function(e)
					{
						if(map == "#mylocationsmap")
						{
							$(".mymarkerinfo p").empty().append(description);
							$(".mymarkerinfo .deletelocationbutton").attr("id", id);
							$(".mymarkerinfo").removeClass("mymarkerinfo_down");
						}
					}
				}
			}
		}, "autofit")
	}
	
	this.addMyLocation = function(map, destinationLat, destinationLng)
	{
		
		navigator.geolocation.getCurrentPosition(function(position)
		{
			
			var image = new google.maps.MarkerImage(
				"img/location.png",
			  	new google.maps.Size(33,32),
			 	new google.maps.Point(0,0),
			  	new google.maps.Point(0,0),
			  	new google.maps.Size(18,17) // 50,69
			);
	
			$(map).gmap3({
				marker:{
					name: 'myPosition',
					latLng: [position.coords.latitude, position.coords.longitude],
					options: { 
						icon: image,
					}
				}
			})
			
			if(map == "#heritagewalkmap_online")
			{
				
				$(map).gmap3({
					getroute:{
						options:{
							origin: [position.coords.latitude, position.coords.longitude],
							destination: [destinationLat, destinationLng],
							travelMode: google.maps.DirectionsTravelMode.WALKING
						},
						callback: function(results){
							if (!results) return;
							$(this).gmap3({ 
								map:{
									options:{   
										zoom: 13,  
										preserveViewport: true
									}
								},
								directionsrenderer:{
									name: 'directions',
									options:{
										directions: results,
								        draggable: false,
								        suppressBicyclingLayer: true,
								        suppressInfoWindows: true,
								        suppressMarkers: true,
								        suppressPolylines: false
									}
								}
							});
						}
					}
				})
				
			}
			
		}, function(error)
		{
			navigator.notification.alert(
			    t.translate("geengeolocatie"),  	// message
			    alertDismissed,         			// callback
			    t.translate("geenverbinding"),      // title
			    t.translate("ok")                  	// buttonName
			);
		});
		
		//trackPosition(map);

		
	}
	
	function trackPosition(map)
	{
		navigator.geolocation.watchPosition(function(position)
		{
			
			console.log("logged new position: " + position.coords.latitude);
			
			var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
			
			var marker = $(map).gmap3({action:'get', name:'myPosition'})
    		marker.setPosition(latlng);
    		
		}, function(){/*alert("can't watch position")*/})
	}
	
	
	function alertDismissed()
	{
		
	}
}




