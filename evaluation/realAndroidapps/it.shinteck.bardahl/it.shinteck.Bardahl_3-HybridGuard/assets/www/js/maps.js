

/**
 * prepare page for draw current stores in a map
 * * draw on show
 * @return void
 */
function drawStoresMap(){
    showLoading("Preparazione mappa");
    try{
        var mapContent = $("#map_canvas");
        //Svuoto gli elementi
        mapContent.empty();
    
        //Opzioni, centro nell'ultima posizione acquisita
        /*
        var mapOptions = {
            zoom: 15,
            center: new google.maps.LatLng(lastPosition.coords.latitude, lastPosition.coords.longitude),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
    
        var myMap = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        */
        //mapContent.trigger('create');
        //Show created page

        mapContent.css("height", $(window).height() - 70);
        mapContent.css("width", $(window).width() - 30);

        goToStoresMap();
    
    }catch(e) {
        hideLoading();
        debugAlert(e.toString());
    }
}

/**
 * move to stores map page - draw on show
 * @return void
 */
function goToStoresMap(){
    hideLoading();
    $.mobile.changePage('#storesMap',{
        transition: pageTransition
    });
}


function makeInfoWindowEvent(map, infowindow, title, subtitle, storeId, marker) {
    google.maps.event.addListener(marker, 'click', function() {
        var img = storeId != null ? " <img style=\"vertical-align:middle; height:35px; width:35px;\" src=\"img/info_icon.png\" onclick=\"storeDetailDraw('" + storeId + "');\">" : "";
        var contentString = "<h3>" + title + img + " </h3> <p>" + subtitle + "</p>";

        infowindow.setContent(contentString);
        infowindow.open(map, marker);
    });
}

/**
 * stores map is showed
 * * draw the map
 * @return void
 */
function storesMapShow(){
    //$("#map_canvas").trigger('create');
    try{
        var mapOptions = {
            zoom: 15,
            center: new google.maps.LatLng(lastPosition.coords.latitude, lastPosition.coords.longitude),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoomControl: true
        }
        
        myMap = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    
    
        var mapBounds = new google.maps.LatLngBounds();
    
        var infowindow = new google.maps.InfoWindow();
        //Add markers
        for(var i = 0; i < $(nearStores).length; i++){
            var latitudeAndLongitude;
            var marker;
            if(nearStores[i]['latitude'] != null &&  nearStores[i]['longitude'] != null){
                latitudeAndLongitude = new google.maps.LatLng (nearStores[i]['latitude'], nearStores[i]['longitude']);
                marker = new google.maps.Marker({ 
                    position: latitudeAndLongitude,
                    map: myMap,
                    title: nearStores[i]['dscocp'],
                    clickable: true
                });
                makeInfoWindowEvent(myMap, infowindow, nearStores[i]['dscocp'],nearStores[i]['indica'] + ' - ' + nearStores[i]['locaca'] + ' (' + nearStores[i]['provca'] + ')', i, marker);
            }
            mapBounds.extend(latitudeAndLongitude);
        }
        //Aggiungo la mia posizionee
        latitudeAndLongitude = new google.maps.LatLng (lastPosition.coords.latitude, lastPosition.coords.longitude);
        var newIcon = new google.maps.MarkerImage(
            'img/blue_dot_circle.png',
            new google.maps.Size(71, 71),
            new google.maps.Point(0, 0),
            new google.maps.Point(17, 34),
            new google.maps.Size(35, 35));
    
        marker = new google.maps.Marker({ 
            position: latitudeAndLongitude,
            map: myMap,
            icon: newIcon,
            title: "La tua posizione",
            clickable: false
        });
        mapBounds.extend(latitudeAndLongitude);
    
        myMap.fitBounds(mapBounds);
        hideLoading();
    /*
    google.maps.event.addListener(myMap, "idle", function(){
        marker.setMap(myMap);
    });
    */
    }catch(e) {
        hideLoading();
        debugAlert(e.toString());
    }
}

/**
 * map is rotated
 * map needs refresh to adapt to new size
 * @return void
 */
function storesMapRotate(){
    var mapContent = $("#map_canvas");
    mapContent.css("height", $(window).height() - 70);
    mapContent.css("width", $(window).width() - 30);
    google.maps.event.trigger(myMap, "resize");
}

/**
 * prepare page for draw direction to current store
 * * will draw on show
 * @return void
 */
function drawDirectionsMap(){
    showLoading("Preparazione mappa");
    try{

        var mapContent = $("#map_directions_canvas");
        //Svuoto gli elementi
        mapContent.empty();
        $("#directionsPanel").empty();

        mapContent.css("height", $(window).height() / 2);
        mapContent.css("width", $(window).width() - 30);

        goToDirectionsMap();
    
    }catch(e) {
        hideLoading();
        debugAlert(e.toString());
    }
}

/**
 * move to page - draw on show
 * @return void
 */
function goToDirectionsMap(){
    hideLoading();
    $.mobile.changePage('#storesDirectionsMap',{
        transition: pageTransition
    });
}

/**
 * map is rotated
 * map needs refresh to adapt to new size
 * @return void
 */
function directionsMapRotate(){
    var mapContent = $("#map_directions_canvas");
    mapContent.css("height", $(window).height() / 2);
    mapContent.css("width", $(window).width() - 30);
    google.maps.event.trigger(myMap, "resize");
}

/**
 * directions map is showed
 * * draw map & directions
 * @return void
 */
function directionsMapShow(){
    //$("#map_canvas").trigger('create');
    try{
        var mapOptions = {
            zoom: 15,
            center: new google.maps.LatLng(lastPosition.coords.latitude, lastPosition.coords.longitude),
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            zoomControl: true,
            mapTypeControl: false
        }
        
        myMap = new google.maps.Map(document.getElementById("map_directions_canvas"), mapOptions);
    
    
        var mapBounds = new google.maps.LatLngBounds();
    
        var infowindow = new google.maps.InfoWindow();
        //Aggiungo il marker della destinazione
        var latitudeAndLongitude;
        var marker;
        if(nearStores[selectedStore]['latitude'] != null &&  nearStores[selectedStore]['longitude'] != null){
            latitudeAndLongitude = new google.maps.LatLng (nearStores[selectedStore]['latitude'], nearStores[selectedStore]['longitude']);
            marker = new google.maps.Marker({ 
                position: latitudeAndLongitude,
                map: myMap,
                title: nearStores[selectedStore]['dscocp'],
                clickable: true
            });
            makeInfoWindowEvent(myMap, infowindow, nearStores[selectedStore]['dscocp'],nearStores[selectedStore]['indica'] + ' - ' + nearStores[selectedStore]['locaca'] + ' (' + nearStores[selectedStore]['provca'] + ')', selectedStore, marker);
        }
        mapBounds.extend(latitudeAndLongitude);

        //Aggiungo la mia posizionee
        latitudeAndLongitude = new google.maps.LatLng (lastPosition.coords.latitude, lastPosition.coords.longitude);
        var newIcon = new google.maps.MarkerImage(
            'img/blue_dot_circle.png',
            new google.maps.Size(71, 71),
            new google.maps.Point(0, 0),
            new google.maps.Point(17, 34),
            new google.maps.Size(35, 35));
    
        marker = new google.maps.Marker({ 
            position: latitudeAndLongitude,
            map: myMap,
            icon: newIcon,
            title: "La tua posizione",
            clickable: false
        });
        makeInfoWindowEvent(myMap, infowindow, "La tua posizione", "", null, marker);
        mapBounds.extend(latitudeAndLongitude);
    
        myMap.fitBounds(mapBounds);
        
        //Preparo i servizi per l'itinerario'
        var directionsService = new google.maps.DirectionsService();
        directionsDisplay = new google.maps.DirectionsRenderer();
        directionsDisplay.setMap(myMap);
        directionsDisplay.setPanel(document.getElementById("directionsPanel"));
        
        var request = {
            origin:lastPosition.coords.latitude + ',' + lastPosition.coords.longitude,
            destination:nearStores[selectedStore]['latitude'] + ',' + nearStores[selectedStore]['longitude'],
            travelMode: google.maps.DirectionsTravelMode.DRIVING
        };
        
        directionsService.route(request, function(response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
            else{
                $("#directionsPanel").text("Impossibile calcolare l'itinerario");
                debugAlert("Impossibile calcolare l'itinerario: " + status);
            }
        });
        hideLoading();
        
    }catch(e) {
        hideLoading();
        debugAlert(e.toString());
    }
}