/*
setmap jquery plugin for google maps
setmap intro:  http://codecanyon.net/item/setmap-jquery-plugin-for-google-maps/743337
google maps javascritp api:  https://developers.google.com/maps/documentation/javascript/
jquery-ui-map - google map v3 plugin for jquery and jquery mobile:  http://code.google.com/p/jquery-ui-map/wiki/Examples
*/
////from wade
//$(function () {
//    $('#map_canvas').setmap({
//        drop: function (latitude, longitude, fullAddress) {
//            $('#lat').val(latitude);
//            $('#lng').val(longitude);
//            $('#location').val(fullAddress);
//        },
//        marker: {
//            position: {
//                latitude: 30.3284570,
//                longitude: -81.660151
//            },
//            title: 'Jacksonville, Florida'
//        }
//    });
//    $.getJSON('http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_eventsJson.aspx?callback=?', function (data) {
//        var items = [];
//        $.each(data.events.items, function (val, key) {
//            console.log(data);
//            $('#map_canvas').setmap().setmap('setAddress', 'Jacksonville, FL', function (EventStreetAddress) {
//                var map = $('#map_canvas');
//                map.after('<p>Latitude: ' + lat + '</p>');
//                map.after('<p>Longitude ' + lng + '</p>');
//                map.after('<p>Address ' + val.EventStreetAddress + '</p>');
//            });
//        });
//    });
//    $('#location').bind('keyup', function (e) {
//        if (e.keyCode === 13) {
//            $('#searchLoc').trigger('click');
//        }
//    });
//});


////ssm: showEventMapSSM
//$(function showEventMapSSM(eventID) {
//    console.log("showEventMapSSM eventID = " + eventID);
//    var eventAddressFromJSON = "1410 Gator Bowl Boulevard Jacksonville, FL 32202";
//    console.log("eventAddressFromJSON = " + eventAddressFromJSON);
//    $('#form-map').setmap().setmap('setAddress', eventAddressFromJSON, function (lat, lng, address) {
//        var map = $('#form-map');
//        map.after('<p>Latitude: ' + lat + '</p>');
//        map.after('<p>Longitude ' + lng + '</p>');
//        map.after('<p>Address ' + address + '</p>');
//    });

//    $('#searchLoc').bind('click', function () {
//        $('#form-map').setmap('setAddress', $('#location').val(), function (latitude, longitude, fullAddress) {
//            $('#lat').val(latitude);
//            $('#lng').val(longitude);
//            $('#location').val(fullAddress);
//        });
//    });

//    $('#location').bind('keyup', function (e) {
//        var eventAddressFromJSON = "1410 Gator Bowl Boulevard Jacksonville, FL 32202";
//        if (e.keyCode === 13) {
//            //            $('#searchLoc').trigger('click');
//            console.log("eventAddressFromJSON = " + eventAddressFromJSON);
//            $('#form-map').setmap('setAddress', eventAddressFromJSON, function (latitude, longitude, fullAddress) {
//                $('#lat').val(latitude);
//                $('#lng').val(longitude);
//                $('#location').val(fullAddress);
//            });
//        }
//    });

//});



//ssm:  setmap - current - works on page refresh
//$(function () {

//    var eventAddressFromJSON = "1410 Gator Bowl Boulevard Jacksonville, FL 32202";
//    console.log("eventAddressFromJSON = " + eventAddressFromJSON);
//    $('#map_canvas').setmap().setmap('setAddress', eventAddressFromJSON, function (lat, lng, address) {
//        var map = $('#map_canvas');
//    });

//});


//ssm:  jquery-ui-map + refresh
//$(function () {

//    console.log("hello from jquery-ui-map");
//    var yourStartLatLng = new google.maps.LatLng(59.3426606750, 18.0736160278);
//    $('#map_canvas').gmap({'center': yourStartLatLng});

//});
//$('#gmap').live("pageshow", function () {
//    console.log("hello from pageshow");
//    $('#map_canvas').gmap('refresh');
//});
//$('#gmap').live("pageinit", function () {
//    console.log("hello from pageinit");
//    $('#map_canvas').gmap({ 'center': '59.3426606750, 18.0736160278' });
//});




//ssm:  modified from demo
//$(function () {

//    var eventAddressFromJSON = "1410 Gator Bowl Boulevard Jacksonville, FL 32202";
//    console.log("eventAddressFromJSON = " + eventAddressFromJSON);
//    $('#form-map').setmap().setmap('setAddress', eventAddressFromJSON, function (lat, lng, address) {
//        var map = $('#form-map');
//        map.after('<p>Latitude: ' + lat + '</p>');
//        map.after('<p>Longitude ' + lng + '</p>');
//        map.after('<p>Address ' + address + '</p>');
//    });

//    $('#searchLoc').bind('click', function () {
//        $('#form-map').setmap('setAddress', $('#location').val(), function (latitude, longitude, fullAddress) {
//            $('#lat').val(latitude);
//            $('#lng').val(longitude);
//            $('#location').val(fullAddress);
//        });
//    });

//    $('#location').bind('keyup', function (e) {
//        var eventAddressFromJSON = "1410 Gator Bowl Boulevard Jacksonville, FL 32202";
//        if (e.keyCode === 13) {
//            //            $('#searchLoc').trigger('click');
//            console.log("eventAddressFromJSON = " + eventAddressFromJSON);
//            $('#form-map').setmap('setAddress', eventAddressFromJSON, function (latitude, longitude, fullAddress) {
//                $('#lat').val(latitude);
//                $('#lng').val(longitude);
//                $('#location').val(fullAddress);
//            });
//        }
//    });

//});


//ssm:  from demo
//$(function () {
//    $('#form-map').setmap({
//        drop: function (latitude, longitude, fullAddress) {
//            $('#lat').val(latitude);
//            $('#lng').val(longitude);
//            $('#location').val(fullAddress);
//        },
//        marker: {
//            position: {
//                latitude: 40.733,
//                longitude: -74.007
//            },
//            title: 'New York! New Yoooork!'
//        }
//    });

//    $('#searchLoc').bind('click', function () {
//        $('#form-map').setmap('setAddress', $('#location').val(), function (latitude, longitude, fullAddress) {
//            $('#lat').val(latitude);
//            $('#lng').val(longitude);
//            $('#location').val(fullAddress);
//        });
//    });

//    $('#location').bind('keyup', function (e) {
//        if (e.keyCode === 13) {
//            $('#searchLoc').trigger('click');
//        }
//    });

//});


// Stage One, add a map       ----------------------------------------------------------------------------------------------------------------	
//$(function() {
//                 var yourStartLatLng = '30.328457, -81.660151';
//			  // var yourStartLatLng = new google.maps.LatLng(30.328457, -81.660151);
//                $('#map_canvas').gmap({'center': yourStartLatLng});
//        });	
// Stage Two, Refresh the map       ----------------------------------------------------------------------------------------------------------------	
/*		$('#gmap').live("pageshow", function() {
                $('#map_canvas').gmap('refresh');
        });
        $('#gmap').live("pageinit", function() {
                $('#map_canvas').gmap({'center': '30.328457, -81.660151'});
        });
*/
// Stage Three, show the map in a pageshow event       ---------------------------------------------------------------------------------------------------------------
// $('#gmap').live("pageshow", function() {
//                $('#map_canvas').gmap({'center': '30.328457, -81.660151'});
//        });
// Basic       ---------------------------------------------------------------------------------------------------------------
/* $(function() {
	 
		$('#gmap').live("pageshow", function() {
                $('#map_canvas').gmap('refresh');
        });	 
	 
                // Also works with: var yourStartLatLng = '59.3426606750, 18.0736160278';
                var yourStartLatLng = new google.maps.LatLng(59.3426606750, 18.0736160278);
                $('#map_canvas').gmap({'center': yourStartLatLng});
        });	
*/
//   JSON   backup   ----------------------------------------------------------------------------------------------
/*			$(function () {
				$('#map_canvas').setmap({
					drop: function ( latitude, longitude, fullAddress ) {
						$('#lat').val(latitude);
						$('#lng').val(longitude);
						$('#location').val(fullAddress);
					},
					marker: {
						position: {
							latitude: 30.3284570,
							longitude: -81.660151
						},
						title: 'Jacksonville, Florida'
					}
				});
				
				$('#searchLoc').bind('click', function () {
					$('#map_canvas').setmap('setAddress', $('#location').val(), function ( latitude, longitude, fullAddress ) {
						$('#lat').val(latitude);
						$('#lng').val(longitude);
						$('#location').val(fullAddress);
					});
				});
	
				$('#location').bind('keyup', function ( e ) {
					if( e.keyCode === 13 ) {
						$('#searchLoc').trigger('click');
					}
				});
				
			});
*/
//   JSON   work in progress   ----------------------------------------------------------------------------------------------
//			$(function () {
//				
//				$('#map_canvas').setmap({
//					drop: function ( latitude, longitude, fullAddress ) {
//						$('#lat').val(latitude);
//						$('#lng').val(longitude);
//						$('#location').val(fullAddress);
//					},
//					marker: {
//						position: {
//							latitude: 30.3284570,
//							longitude: -81.660151
//						},
//						title: 'Jacksonville, Florida'
//					}
//				});
//				
//				
//			$.getJSON( 'http://www.makeascenedowntown.com/CMSPages/jaxHappenings/jh_eventsJson.aspx?callback=?', function(data) { 
//			var items = [];
//			
//					$.each( data.events.items, function(val,key) {		
//					   console.log(data);
//							
//						 $('#map_canvas').setmap().setmap('setAddress', 'Jacksonville, FL', function (EventStreetAddress) {
//								var map = $('#map_canvas');
//								map.after('<p>Latitude: ' + lat + '</p>');
//								map.after('<p>Longitude ' + lng + '</p>');
//								map.after('<p>Address ' + val.EventStreetAddress + '</p>');
//						});
//					});
//				});
//				
//				
//				$('#location').bind('keyup', function ( e ) {
//					if( e.keyCode === 13 ) {
//						$('#searchLoc').trigger('click');
//					}
//				});
//				
//				
//			});
//			
			
			
			
			
