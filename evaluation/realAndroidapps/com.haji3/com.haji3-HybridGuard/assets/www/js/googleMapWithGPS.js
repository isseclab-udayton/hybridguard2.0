	var mobileDemo = { 'center': '57.7973333,12.0502107', 'zoom': 10 };
	
	
			$('#directions_map').live('pageinit', function() {
				demo.add('directions_map', function() {
					$('#map_canvas_1').gmap({'center': mobileDemo.center, 'zoom': mobileDemo.zoom, 'disableDefaultUI':true, 'callback': function() {
						var self = this;
						self.set('getCurrentPosition', function() {
							self.refresh();
							self.getCurrentPosition( function(position, status) {
								if ( status === 'OK' ) {
									var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
									self.get('map').panTo(latlng);
									//////////////////////get current lati longi///////////////////////////////////
									curLati  = position.coords.latitude;
									curLongi = position.coords.longitude;
									//////////////////////////////////////////////////////////
									self.search({ 'location': latlng }, function(results, status) {
										if ( status === 'OK' ) {
											//$('#from').val(results[0].formatted_address);
											cAddr= results[0].formatted_address;
										}
									});
								} else {
									//alert('Unable to get current position');
								}
							});
						});
						
						$('#submit').click(function() {
							/*self.displayDirections({ 'origin': $('#from').val(), 'destination': $('#to').val(), 'travelMode': google.maps.DirectionsTravelMode.DRIVING }, { 'panel': document.getElementById('directions')}, function(response, status) {
								( status === 'OK' ) ? $('#results').show() : $('#results').hide();
							});
							return false;*/
							self.displayDirections({ 'origin': cAddr, 'destination': dAddr, 'travelMode': google.maps.DirectionsTravelMode.DRIVING }, { 'panel': document.getElementById('directions')}, function(response, status) {
								( status === 'OK' ) ? $('#results').show() : $('#results').hide();
							});
							return false;
						});
					}});
				}).load('directions_map');
			});
			
			$('#directions_map').live('pageshow', function() {
				demo.add('directions_map', $('#map_canvas_1').gmap('get', 'getCurrentPosition')).load('directions_map');
			});



/*
function setmarker(cAddr ){
	alert("cAddr"+cAddr +', dAddr' + dAddr);
	self.displayDirections({ 'origin': cAddr, 'destination': dAddr, 'travelMode': google.maps.DirectionsTravelMode.DRIVING }, { 'panel': document.getElementById('directions')}, function(response, status) {
								( status === 'OK' ) ? $('#results').show() : $('#results').hide();
							});
							return false;
};
*/





/////////////////////////////////////////////////////////////////jquery maps yahan katam he iske bad ka sab bekar he //////////////////////
function GoogleMap(){
    
    this.initialize = function(){
        var map = showMap();
        addMarkersToMap(map);
    }    
    
    var addMarkersToMap = function(map){
        var mapBounds = new google.maps.LatLngBounds();
    
      //  var latitudeAndLongitudeOne = new google.maps.LatLng('-33.890542','151.274856');
        var latitudeAndLongitudeOne = new google.maps.LatLng(CLati,CLongi);
        var markerOne = new google.maps.Marker({
                    position: latitudeAndLongitudeOne,
                    map: map
                });
                
        var latitudeAndLongitudeTwo = new google.maps.LatLng(lati,longi);

        var markerOne = new google.maps.Marker({
                    position: latitudeAndLongitudeTwo,
                    map: map
                });
                
        mapBounds.extend(latitudeAndLongitudeOne);
        mapBounds.extend(latitudeAndLongitudeTwo);
        
       
        map.fitBounds(mapBounds);
        
        var flightPlanCoordinates = [   latitudeAndLongitudeOne,
                                        latitudeAndLongitudeTwo
                                    ]; 
        var flightPath = new google.maps.Polyline({path: flightPlanCoordinates,strokeColor: "#FF0000",strokeOpacity: 1.,strokeWeight: 10});
        flightPath.setMap(map);
    }
    
    
    
    var showMap = function(){
        var mapOptions = {
                 zoom: 4,
                 center: new google.maps.LatLng(-33, 151),
                 mapTypeId: google.maps.MapTypeId.ROADMAP
             }
             
        var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        
        return map;
    }
}