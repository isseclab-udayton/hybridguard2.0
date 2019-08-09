function HeritageWalk()
{

	var lang = window.localStorage.getItem("lang");
	var db = window.openDatabase("VisitBruges", "1.0", "Visit Bruges", 1000000);
	var t = new Translation();
	var locations = [];
	var destinations = [];
	var firstlocation = undefined;
	var currentlocation = undefined;
	var locationspassed = 0;
	
	this.getLocations = function(callback)
	{
		
		locations = [];
		destinations = [];
		locationspassed = 0;

		db.transaction(function(tx)
		{
			var selector = '"%' + 381 + '%"'; // 381
			
			tx.executeSql('SELECT * FROM LOCATIONS WHERE subcat_id = 381', [], function(tx, results)
			{
				
				var _locations = new Object();
				
				for(var i = 0; i < results.rows.length; i++)
				{
					var location = new Object();
					location["id"] = parseInt(results.rows.item(i).id);
					location["lat"] = results.rows.item(i).location_lat;
					location["lng"] = results.rows.item(i).location_lng;
					location["fotos"] = results.rows.item(i).images;
					location["video"] = "";
					
					if(location["id"] == 1401)
					{
						location["video"] = "video1.mp4";
					}
					if(location["id"] == 1400)
					{
						location["video"] = "video2.mp4";
					}
					if(location["id"] == 1404)
					{
						location["video"] = "video3.mp4";
					}
					if(location["id"] == 1468)
					{
						location["video"] = "video4.mp4";
					}
					if(location["id"] == 1469)
					{
						location["video"] = "video5.mp4";
					}
					
					switch(lang)
					{
						case "nl":
							location.title = results.rows.item(i).title_nl;
							location.description = convert(results.rows.item(i).description_nl);
						break;
						case "en":
							location.title = results.rows.item(i).title_en;
							location.description = convert(results.rows.item(i).description_en);
						break;
						case "fr":
							location.title = results.rows.item(i).title_fr;
							location.description = convert(results.rows.item(i).description_fr);
					 	break;
					 	case "de":
					 		location.title = results.rows.item(i).title_de;
							location.description = convert(results.rows.item(i).description_de);
					 	break;
					 	case "es":
					 		location.title = results.rows.item(i).title_es;
							location.description = convert(results.rows.item(i).description_es);
					 	break;
					}

					_locations[location["id"]] = location;
					
				}
				

				sortLocationsById(_locations);
				

				try
				{
					callback(results);
				}
				catch(e)
				{
					console.log(e);
				}
				
				
			}, errorCB);
			
		}, errorCB);
	}

	
	function sortLocationsById(locationobj)
	{
		
		for(var i = 0; i < 3000; i++)
		{
			if(locationobj[i])
			{
				locations.push(locationobj[i]);
				if(window.localStorage.getItem("heritagewalk") == "googlemaps") 
				{
					destinations.push(new google.maps.LatLng(locationobj[i]["lat"],locationobj[i]["lng"]));
				}
			}
		}
	}
	
	this.next = function(firstItem, callback)
	{

		locationspassed++;

		if(firstItem)
		{
			firstlocation = firstItem;
			currentlocation = firstItem;
		}
		
		findNextLocation(function(id, location)
		{
			currentlocation = id;
			
			if(locationspassed > locations.length)
			{
				callback(location, "last");
			}
			else
			{
				callback(location, null);
			}
			
		})
	}
	
	function findNextLocation(callback)
	{
		
		
		var beforeArray = [];
		var walk = [];
		
		for(var i = 0; i<locations.length; i++)
		{
			if(locations[i]["id"] < currentlocation)
			{
				beforeArray.push(locations[i]);
			}
			else
			{
				walk.push(locations[i]);
			}
		}
		
		$.merge(walk, beforeArray);
		
		if(currentlocation == firstlocation)
		{
			firstlocation = undefined;
			callback(walk[0]["id"], walk[0]);
		}
		else
		{
			callback(walk[1]["id"], walk[1]);
		}
		
	}
	
	this.findNearestLocation = function(callback)
	{
		
		var position = getMyPosition(function(result, pos)
		{
			
			// alert(destinations.length);
	
			if(result == true)
			{
				var distanceService = new google.maps.DistanceMatrixService();
				distanceService.getDistanceMatrix({
					origins: [pos],
		    		destinations: destinations,
		    		travelMode: google.maps.TravelMode.WALKING,
		    		unitSystem: google.maps.UnitSystem.METRIC
		  		}, function(response, status)
		  		{
		  			switch(status)
		  			{
		  				case google.maps.DistanceMatrixStatus.INVALID_REQUEST:
		  				case google.maps.DistanceMatrixStatus.MAX_ELEMENTS_EXCEEDED:
		  				case google.maps.DistanceMatrixStatus.MAX_DIMENSIONS_EXCEEDED:
		  				case google.maps.DistanceMatrixStatus.OVER_QUERY_LIMIT:
		  				case google.maps.DistanceMatrixStatus.REQUEST_DENIED:
		  				case google.maps.DistanceMatrixStatus.UNKNOWN_ERROR: 
		  				
			  				navigator.notification.alert(
							    t.translate("noservice"),  				// message
							    alertDismissed,         			// callback
							    '',             					// title
							    t.translate("ok")                  	// buttonName
							);
		  				
		  				break;
		  				case google.maps.DistanceMatrixStatus.OK:

							var or = response.originAddresses;
				    		var des = response.destinationAddresses;
				    		var results = response.rows[0].elements;
				    		
				    		var locationsByProximity = [];
				    		
				    		for (var i = 0; i < results.length; i++) 
				      		{
				      			var distance = results[i].distance.value;
				      			locationsByProximity[distance] = locations[i];	
				      		}
				      		
				      		var sortedLocations = [];
					
							for(var i = 0; i<locationsByProximity.length; i++)
							{	
								if(locationsByProximity[i] != undefined)
								{
									sortedLocations.push(locationsByProximity[i]);
								}
							}
							
							// alert(sortedLocations[0]["id"]);
							
				      		callback(sortedLocations[0]["id"], sortedLocations[0]);
				      		
		  				break;
		  			}
					
		  		});
			}
			
		});
	
	}
	
	function getMyPosition(callback)
	{
		navigator.geolocation.getCurrentPosition(function(position)
		{
			var pos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
			callback(true, pos);
			
		}, function(error)
		{
			callback(false, null);
		});
	}
	
	this.showLocations = function(cat_id, items, single, callback)
	{

		for(var i = 0; i < items.rows.length; i++)
		{
			
			var colorClass = "cat_purple";
			var iconClass = "icon_purple";
			var title = "";
			
			switch(lang)
			{
				case 'nl': title = items.rows.item(i).title_nl; break;
				case 'en': title = items.rows.item(i).title_en; break;
				case 'fr': title = items.rows.item(i).title_fr; break;
				case 'de': title = items.rows.item(i).title_de; break;
				case 'es': title = items.rows.item(i).title_es; break;
			}

			var item = '<li topcat="' + cat_id + '" class="h_item" id="' + items.rows.item(i).id + '"><span class="h_itemtitle">' + title + '</span></li>'
			
			if(single)
			{
				if(items.rows.item(i).id == single)
				{
					callback(items.rows.item(i).id, title, colorClass, iconClass, item, items.rows.item(i).location_lat, items.rows.item(i).location_lng, items.rows.item(i).cat_id);
				}
			}
			else
			{
				callback(items.rows.item(i).id, title, colorClass, iconClass, item, items.rows.item(i).location_lat, items.rows.item(i).location_lng, items.rows.item(i).cat_id);
			}
		}
		
	}
	
	function errorCB(error)
	{
		console.log("heritagewalk.js - " + error);
	}
	
	function getTime()
	{
		var now = new Date();
		now = now.format("s");
		return now;
	}
	
	function secondstotime(secs)
	{
		
		var leftover = secs;
		var hours = Math.floor(leftover/3600);
		leftover = leftover - (hours * 3600);
		var minutes = leftover / 60;
		
		if(minutes == 0)
		{
			return hours + t.translate("u");
		}
		else
		{
			return hours + t.translate("u") + minutes;
		}
	   
	}
	
	function convert(convert)
	{
		return $("<span />", { html: convert }).text();
	}
	
	function alertDismissed()
	{
		
	}
	
	function getConnection()
	{
		var networkState = navigator.network.connection.type;
	    var states = {};
	    
	    states[Connection.UNKNOWN]  = 'bad';
	    states[Connection.ETHERNET] = 'wifi';
	    states[Connection.WIFI]     = 'wifi';
	    states[Connection.CELL_2G]  = 'cell';
	    states[Connection.CELL_3G]  = 'cell';
	    states[Connection.CELL_4G]  = 'cell';
	    states[Connection.NONE]     = 'bad';
	    
	    return states[networkState];
	}

}



