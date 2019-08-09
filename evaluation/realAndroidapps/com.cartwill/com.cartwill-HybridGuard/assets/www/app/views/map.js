marina.googleMap = function(options) {
	var map = {},
	googleMap, infoWindow, markers = {};
	var util = marina.util;

	map.positionChanged = function(position) {
		var coords = position.coords;
		var latlng = new google.maps.LatLng(coords.latitude, coords.longitude);
		map.currentLocation.setPosition(latlng);
	};

	map.addLocationMarkerTo = function(opts) {
		map.currentLocation = new google.maps.Marker({
			position: opts.latlng,
			map: googleMap,
			icon: 'images/sailboat.png',
			title: "Your location"
		});
		navigator.geolocation.watchPosition(map.positionChanged);
	};

	function addMarinaMarker(marinaInfo) {
		var marker;
		console.log('adding marker for ' + marinaInfo.name);
		marker = new google.maps.Marker({
			icon: 'images/red-anchor.png',
			map: googleMap,
			position: new google.maps.LatLng(marinaInfo.position.latitude, marinaInfo.position.longitude)
		});
		google.maps.event.addListener(marker, 'click', function(event) {
			createInfoBox({
				content: marina.template.build('#marina-info-template', { marinaInfo: marinaInfo }, true),
				marker: marker
			});
		});
    marinaInfo.mapMarker = marker;
	}

	map.addMarinaLayer = function() {
		var cnt, marinaInfo, marker, content;
		for (cnt = 0; cnt < marina.marinas.length; cnt++) {
			addMarinaMarker(marina.marinas[cnt]);
		}
		marina.util.stopSpinner();
	};

	function displayDetailOnClickFor(place, marker) {
		google.maps.event.addListener(marker, 'click', function() {
			var request = {
				reference: place.reference
			};
			var service = new google.maps.places.PlacesService(googleMap);
			service.getDetails(request, function(place, status) {
				console.log('recieved details for: ' + place.name);
				displayInfoWindowFor(place, marker);
			});
		});
	}

	function createInfoBox(options) {
		var defaults = {
			content: options.content,
			disableAutoPan: false,
			maxWidth: 0,
			pixelOffset: options.pixelOffset || new google.maps.Size( - 100, 0),
			zIndex: null,
			boxStyle: options.boxStyle || {
				background: "url('images/tipbox-200.png') no-repeat",
				opacity: 0.75,
				width: "200px"
			},
			closeBoxMargin: "10px 2px 2px 2px",
			closeBoxURL: "images/close.png",
			infoBoxClearance: new google.maps.Size(45, 20),
			isHidden: false,
			pane: "floatPane",
			enableEventPropagation: false
		};
		var ib = new InfoBox(defaults);
		ib.open(googleMap, options.marker);
	}

	function displayInfoWindowFor(place, marker) {
		createInfoBox({
			marker: marker,
			content: marina.template.build('#place-detail-template', { place: place }, true),
			pixelOffset: new google.maps.Size( - 80, 0),
			boxStyle: {
				background: "url('images/tipbox-160.png') no-repeat",
				opacity: 0.75,
				width: "180px"
			}
		});
	}

	function createMarker(place, options) {
		var marker = new google.maps.Marker({
			icon: 'images/' + options.image + '.png',
			map: googleMap,
			position: place.geometry.location
		});
		displayDetailOnClickFor(place, marker);
		return marker;
	}

	function searchFor(options) {
		markers[options.type] = [];
		try {
			var request = {
				bounds: googleMap.getBounds()
			};
      if (options.type && options.type.indexOf('keyword') === -1) {
        request.types = [options.type];
      }
      if (options.keyword) {
        console.log('keyword: ' + options.keyword);
        request.keyword = options.keyword;
      }
			var service = new google.maps.places.PlacesService(googleMap);
			service.search(request, function(results, status) {
				var marker;
				console.log('search complete: ' + status + ' found: ' + results.length);
				for (var i = 0; i < results.length; i++) {
					marker = createMarker(results[i], options);
					markers[options.type].push(marker);
				}
				marina.util.stopSpinner();
			});
		} catch(err) {
			console.log('error doing places search: ' + err);
			marina.util.stopSpinner();
		}
	}

	function removeMarkersFor(type) {
		for (var i = 0; i < markers[type].length; i++) {
			markers[type][i].setMap(null);
		}
		markers[type] = {};
		marina.util.stopSpinner();
	}

	map.addOptionsHandler = function() {
		$('#map-options').bind('multiselectclick', function(event, ui) {
			marina.util.startSpinner();
			$(this).multiselect('close');
			var searchType = ui.value;
      var option = $(this).find('option[value="' + searchType + '"]');
      var keyword = option.data('keyword');
			var image = option.data('image');
			console.log('image for search: ' + image);
			console.log('mulit select click: ' + searchType);
			if (ui.checked) {
				searchFor({
					type: searchType,
          keyword: keyword,
					image: image
				});
			} else {
				removeMarkersFor(searchType);
			}
		});
	};

	function updateOptionMarkers() {
		console.log('map bounds changed');
		$('#map-options').find('option:selected').each(function(index, element) {
			marina.util.startSpinner();
			var searchType = $(element).attr('value');
			var image = $(element).data('image');
			console.log('option: ' + searchType);
			removeMarkersFor(searchType);
			marina.util.startSpinner();
			searchFor({
				type: searchType,
				image: image
			});
		});
	}

	map.addViewChangeHandler = function() {
		google.maps.event.addListener(googleMap, 'dragend', updateOptionMarkers);
		google.maps.event.addListener(googleMap, 'zoom_changed', updateOptionMarkers);
	};

  map.center = function(options, callback) {
		var latlng = new google.maps.LatLng(options.coords.latitude, options.coords.longitude);
    if (callback) {
      google.maps.event.addListenerOnce(googleMap, 'center_changed', callback);
    }
    googleMap.setCenter(latlng);
    updateOptionMarkers();
  };

	var createMap = function() {
		var latlng = new google.maps.LatLng(options.coords.latitude, options.coords.longitude);
		var noPOIStyles = [{
			featureType: "poi",
			stylers: [{
				visibility: "off"
			}]
		}];
		var mapOptions = {
			zoom: 12,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.TERRAIN,
			mapTypeControl: false,
			streetViewControl: false,
			styles: noPOIStyles
		};
		googleMap = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
		infoWindow = new google.maps.InfoWindow();
		map.addMarinaLayer();
		map.addLocationMarkerTo({
			latlng: latlng
		});
		map.addOptionsHandler();
		map.addViewChangeHandler();
		return map;
	};

	return createMap();
};

