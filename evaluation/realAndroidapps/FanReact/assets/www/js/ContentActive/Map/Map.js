window.ContentActive = window.ContentActive || {} ;

window.ContentActive.map = {};

window.ContentActive.map.var = {};
window.ContentActive.map.var.map = null ;
window.ContentActive.map.var.markers = [];
window.ContentActive.map.var.infoWindow = null;
window.ContentActive.map.var.locationSelect = null;
window.ContentActive.map.var.setting = {
    markerInfoTemplateName : '#map-markerTemplate' ,
    locationListTemplate : '#map-locationListTemplate' ,
    mapId : 'map',
    centerLat: 40,
    centerLng: -100,
    zoom: 4,
    mapTypeId: 'roadmap',
    mapTypeControlOptions: 'DROPDOWN_MENU',
    onFocusCenterNotPan: false,
    markerOnClickEvent : null ,
    markerSetting :{
			displayInfoWindow : true,
			displayNumber : true,
			markerUrlId : 'main',
			showNumber : true ,
			size : 25 ,
			color : 'white' ,
			//top : 30 ,
			//left : 0 ,
			fontStyle : 'Verdana', 
			paddingTop : 5,
			paddingLeft : 10,
		},
	markerUrl : null ,
	mapOption : {
		enableDragging : true ,
	},
	marketTemplateCreator : null , // function( data ) {};

};

window.ContentActive.map.searchLocation = function( address , onSuccess, onFailure ){
	var geocoder = new google.maps.Geocoder();
	geocoder.geocode({address: address}, function(results, status) {
        var run = function(){
            if (status == google.maps.GeocoderStatus.OK) {
                var location =  results[0].geometry.location ;
                onSuccess( location );
            } else {
                onFailure = onFailure == undefined ? console.log(address + ' not found') : onFailure(address) ;
            }
        }
		run();
  });
};
      
window.ContentActive.map.displayLocations = function( data ){
    var bounds = new google.maps.LatLngBounds();
    $.each( data, function(index,element){

        var latlng = new google.maps.LatLng(
            parseFloat(element.lat),
            parseFloat(element.lng));

        window.ContentActive.map.createMarker(latlng, element);
        bounds.extend(latlng);
    });
      
    window.ContentActive.map.var.map.fitBounds(bounds);  
}

window.ContentActive.map.customizeMarkerIcon = function( imageUrl , data , onSuccess  ){

	var index = window.ContentActive.map.var.setting.markerSetting.displayNumber == true ? data.index + 1 : '' ;
    var size = window.ContentActive.map.var.setting.markerSetting.size ;
    var color = window.ContentActive.map.var.setting.markerSetting.color ;
    var top =  window.ContentActive.map.var.setting.markerSetting.top ;
    var left =  window.ContentActive.map.var.setting.markerSetting.left ;
    var fontStyle =  window.ContentActive.map.var.setting.markerSetting.fontStyle  ;
    var paddingLeft = window.ContentActive.map.var.setting.markerSetting.paddingLeft ;
    var paddingTop = window.ContentActive.map.var.setting.markerSetting.paddingTop ;
    var showNumber =  window.ContentActive.map.var.setting.markerSetting.showNumber ;
    var markerUrlId = window.ContentActive.map.var.setting.markerSetting.markerUrlId ;  
	
    var process = function(main, rest) {
        
        var fitTextOnCanvas = function( canvas, ctx, size, fontStyle, text ){    
			
            // start with a large font size
            var fontsize = size == undefined ? 300 : size ;

            // lower the font size until the text fits the canvas
            do{
                fontsize--;
                ctx.font = fontsize + 'px ' + fontStyle;
                if( fontsize < 1 ){ break; }
            }while( ctx.measureText(text).width + paddingLeft > canvas.width)

            var desiredValue = {} ;
            desiredValue.left = ( canvas.width - ctx.measureText(text).width ) / 2 ;
			desiredValue.top = ( canvas.height - fontsize ) / 2 + fontsize / 2 + paddingTop;
			desiredValue.size = fontsize ;
        	return desiredValue ;
        }
        
        var canvas = document.createElement("canvas");
        canvas.width = main.width;
        canvas.height = main.height;

        var ctx = canvas.getContext("2d");
        ctx.drawImage(main, 0, 0);

        //for (var i = 0; i < rest.length; i++) {
        //var img = rest[i];
        //ctx.drawImage(img, img.getAttribute("data-posx"), img.getAttribute("data-posy"));
        //}

        if ( showNumber == true ) 
        {
            var best = fitTextOnCanvas( canvas, ctx, size, fontStyle , index );
            ctx.fillStyle = color;
            ctx.font = best.size + "px " + fontStyle;
            ctx.fillText( index , best.left , best.top );	
        }
        
      return canvas.toDataURL("image/png");
    }

    var img = document.createElement("img");
    img = process(document.getElementById(markerUrlId),  document.getElementsByClassName("small"));
	onSuccess( img ) ;
}
      
	
	
window.ContentActive.map.createMarker = function(latlng, data) {
    var markerInfoTemplateName = window.ContentActive.map.var.setting.markerInfoTemplateName ;
    var templateString = $(markerInfoTemplateName).html();
	try{
		var template = kendo.template(templateString, {useWithBlock:true});
		var html = template(data) ;
	} catch( err ){
		var html = window.ContentActive.map.var.setting.marketTemplateCreator( data ) ;
	};
	var url = 'images/marker.png';
	var icon = window.ContentActive.map.var.setting.markerUrl == null ? url : window.ContentActive.map.var.setting.markerUrl ;
    
    var createMarker = function( icon ){

        var marker = new google.maps.Marker({
            map: window.ContentActive.map.var.map,
            icon: icon,
            position: latlng
        });
        google.maps.event.addListener(marker, 'click', function() {

            var createInfoWindow = function(){
                var infoWindow = window.ContentActive.map.var.infoWindow ;
                infoWindow.setContent(html);
                infoWindow.open( window.ContentActive.map.var.map , marker);
            }
				
			if( window.ContentActive.map.var.setting.markerSetting.displayInfoWindow == true ){
				createInfoWindow();
			}

			if( window.ContentActive.map.var.setting.markerOnClickEvent != null ){
				window.ContentActive.map.var.setting.markerOnClickEvent( data );
			}
				
        });
        window.ContentActive.map.var.markers.push(marker);

    }
    
    window.ContentActive.map.customizeMarkerIcon( url , data , createMarker )
}

      
window.ContentActive.map.focusMarker = function(markerNum , zoomLevel) {
    var markers = window.ContentActive.map.var.markers ;
    //markers[markerNum].setAnimation(google.maps.Animation.BOUNCE);
    window.ContentActive.map.toggleAnimation(markerNum);
	
	if( zoomLevel != undefined ){
		window.ContentActive.map.var.map.setZoom(zoomLevel);
    }
    //google.maps.event.trigger(markers[markerNum], 'click');
}
   
window.ContentActive.map.centerMapToThis = function( element ) {

    var latlng = new google.maps.LatLng(
        parseFloat(element.lat),
        parseFloat(element.lng)
    );

	if( window.ContentActive.map.var.setting.onFocusCenterNotPan == false ){
		window.ContentActive.map.var.map.panTo(latlng) ;
	}
	else {    	
		window.ContentActive.map.var.map.setCenter(latlng);  
	}
}



window.ContentActive.map.clearLocations = function() {
    window.ContentActive.map.var.infoWindow.close();
    var markers = window.ContentActive.map.var.markers ;
    $.each( markers, function( index, element ){
        window.ContentActive.map.var.markers[index].setMap(null);
    });
    window.ContentActive.map.var.markers.length = 0;
}


window.ContentActive.map.load = function() {
    var mapId = window.ContentActive.map.var.setting.mapId ;
    var mapTypeControlOptions = window.ContentActive.map.var.mapTypeControlOptions ;
    var mapTypeId = window.ContentActive.map.var.mapTypeId ;
    var centerLat = window.ContentActive.map.var.centerLat;
    var centerLng = window.ContentActive.map.var.centerLng ;
    var zoom = window.ContentActive.map.var.zoom ;
    
    var option = {
        center: new google.maps.LatLng(centerLat, centerLng),
        zoom: zoom,
        draggable: window.ContentActive.map.var.setting.mapOption.enableDragging,
        mapTypeId: mapTypeId,
        mapTypeControlOptions: {style: google.maps.MapTypeControlStyle[mapTypeControlOptions] }
    };
    
    window.ContentActive.map.var.map = new google.maps.Map(document.getElementById( mapId ), option );
    window.ContentActive.map.var.infoWindow = new google.maps.InfoWindow();
}

//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::                                                                         :::
//:::  This routine calculates the distance between two points (given the     :::
//:::  latitude/longitude of those points). It is being used to calculate     :::
//:::  the distance between two locations using GeoDataSource (TM) prodducts  :::
//:::                                                                         :::
//:::  Definitions:                                                           :::
//:::    South latitudes are negative, east longitudes are positive           :::
//:::                                                                         :::
//:::  Passed to function:                                                    :::
//:::    lat1, lon1 = Latitude and Longitude of point 1 (in decimal degrees)  :::
//:::    lat2, lon2 = Latitude and Longitude of point 2 (in decimal degrees)  :::
//:::    unit = the unit you desire for results                               :::
//:::           where: 'M' is statute miles (default)                         :::
//:::                  'K' is kilometers                                      :::
//:::                  'N' is nautical miles                                  :::
//:::                                                                         :::
//:::  Worldwide cities and other features databases with latitude longitude  :::
//:::  are available at http://www.geodatasource.com                          :::
//:::                                                                         :::
//:::  For enquiries, please contact sales@geodatasource.com                  :::
//:::                                                                         :::
//:::  Official Web site: http://www.geodatasource.com                        :::
//:::                                                                         :::
//:::               GeoDataSource.com (C) All Rights Reserved 2015            :::
//:::                                                                         :::
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

window.ContentActive.map.distance = function(lat1, lon1, lat2, lon2, unit) {
	var radlat1 = Math.PI * parseFloat( lat1 ) /180
	var radlat2 = Math.PI * parseFloat( lat2 ) /180
	var radlon1 = Math.PI * parseFloat( lon1 ) /180
	var radlon2 = Math.PI * parseFloat( lon2 ) /180
	var theta = lon1-lon2
	var radtheta = Math.PI * theta/180
	var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
	dist = Math.acos(dist)
	dist = dist * 180/Math.PI
	dist = dist * 60 * 1.1515
    if (unit==undefined) { unit='N'; }
	if (unit=="K") { dist = dist * 1.609344 }
	if (unit=="N") { dist = dist * 0.8684 }
    dist = dist.toFixed(1)
	return dist
}                                                                           

window.ContentActive.map.sortLocationByDistance = function( locationList , searchGeometry ){
    var a = [];
    $.each( locationList , function(index, element){
        var distance = window.ContentActive.map.distance( element.lat , element.lng , searchGeometry.A , searchGeometry.F  ) ;
        a.push( { i : index , v : distance } )
    });
    
    //var a = [{ i : 0 , v : 34 } , { i : 1 , v : 203} , { i : 2 , v : 3} , { i : 3 , v : 746} ];

    var bubbleSort = function(a)
    {
        var swapped;
        do {
            swapped = false;
            for (var i=0; i < a.length-1; i++) {
                var c = parseFloat(a[i].v );
                var d = parseFloat(a[i+1].v );
                if (c > d) {
                    var temp = a[i];
                    a[i] = a[i+1];
                    a[i+1] = temp;
                    swapped = true;
                }
            }
        } while (swapped);
        return a ;
    }

    var sortedLocationByDistance = bubbleSort(a)  ;
    var sortedLocationList = [];
    $.each( sortedLocationByDistance , function( index , element ){
        var location = locationList[ element.i ] ;
        location.distanceAwayInMile = element.v ;
        location.detail.miles = element.v ;
        sortedLocationList.push( location )
    });
    return sortedLocationList ;
}



window.ContentActive.map.toggleAnimation = function( number, animation ) {
    var animate = animation == undefined ? google.maps.Animation.BOUNCE : google.maps.Animation[animation] ;   
    var markers = window.ContentActive.map.var.markers ;
	$.each( markers , function(index, element){
		markers[index].setAnimation(null);   
    });
    markers[number].setAnimation(animate);
	
	setTimeout(function() {
		markers[number].setAnimation(null);   
	}, 2000);
}

window.ContentActive.map.refresh = function() {
    
	var map = window.ContentActive.map.var.map ;
	google.maps.event.trigger(map, 'resize');
	console.log(map);
}