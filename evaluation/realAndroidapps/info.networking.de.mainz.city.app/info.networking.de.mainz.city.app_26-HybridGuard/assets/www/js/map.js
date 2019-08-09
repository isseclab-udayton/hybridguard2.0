//Zentrum
var  center = new google.maps.LatLng(50.024 , 8.27);
//Google Maps Optionen
var mapOptions = {
        zoom: 6,
        center: center,
        navigationControl: true,
        navigationControlOptions: {style: google.maps.NavigationControlStyle.ZOOM_PAN},
        streetViewControl: false,
        mapTypeControl: true,
        mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.SMALL},
        mapTypeId: google.maps.MapTypeId.ROADMAP
}
var mobileDemo = { 'center': '50.024,8.27', 'zoom': 10 };

//eine oder Mehre Position -> boolean
var onePos = false;
var morePos = false;
var oneParkingPos = false;

var town = '';
var street = '';
var zipCode = '';
var description = '';

var latCoordinate = 0;
var longCoordinate = 0;

var posArray;

//koordinaten über die Addresse
var geocoder = new google.maps.Geocoder();

/**
 * Darstellung dieser Position auf einer Karte
 * @param tow - Stadt -> String
 * @param str - Strasse -> String
 * @param zip - Postleitzahl -> String
 * @param des - Beschreibung für InfoDialog -> String
 * @param ad - Werbebanner -> String
 */
function showPosOnMap(tow,str,zip,des,ad){
    
    town = tow;
    street = str;
    zipCode = zip;
    description = des;
    
    setBoolean(true,false,false);
    
    //Auswahl der Werbung - Funktion stammt aus advertise.js
    advertise.setAdOnMap(ad);
    
    $.mobile.changePage("#mapPage");
}

/**
 * Darstellung meherer Positionen auf einer Karte
 * @param array - Feld mit den Daten -> Array
 */
function showPositionsOnMap(array, ad){
    
    posArray = array;
    
    setBoolean(false,true,false);
    
    //Auswahl der Werbung - Funktion stammt aus advertise.js
    advertise.setAdOnMap(ad);
    
    $.mobile.changePage("#mapPage");
}

/**
 * Darstellung der Position eines Parkhauses auf einer Karte
 * @param lat - Breitengrad -> float
 * @param lon - Längengrad -> float
 * @param name - Name des Parkhauses -> String
 * @param tow - Stadt in der das Parkhaus liegt -> String
 * @param places - Stellplätze normal -> String
 * @param handicapped - Stellplätze behindert -> String
 */
function showOneParkingStructureOnMap(lat,lon, name, tow, str ,places, handicapped ){
    
	latCoordinate = lat;
	
    longCoordinate = lon;
    
    description = createParkingDialogLayout(name, tow, str, places, handicapped);
    
    setBoolean(false,false,true);
    
    //Auswahl der Werbung - Funktion stammt aus advertise.js
    advertise.setAdOnMap('parkhausListe');
    
	
	$.mobile.changePage("#mapPage");
}



/**
 * Darstellung mehrer Positionen auf der Karte
 */
function showAllParkingStructureOnMap(){
    
    setBoolean(false,false,false);
    
    //Auswahl der Werbung - Funktion stammt aus advertise.js
    advertise.setAdOnMap('parkhaeuser');
    $.mobile.changePage("#mapPage");
}

/**
 * Setzt die Warheitswerte
 */
function setBoolean(one,more,parking){

    onePos = one;
    morePos = more;
    oneParkingPos = parking;
}

//ParkingGarageOnMap
$('#mapPage').live("pageshow", function() {
    
    $('#karte').gmap('refresh');
    
    //User Position
    navigator.geolocation.getCurrentPosition(geolocationSuccess,geolocationError);
    
    if(onePos){
        showOneAddressOnMap();
    }
    else if(morePos){
        showMoreAddressOnMap();
    }
    else if(oneParkingPos){
        oneParkingStructureOnMap();
    }
    else{
        printOnConsole("pageshow","allParkingStructureOnMap"); 
        allParkingStructureOnMap();
    }

                   
    printOnConsole("pageshow","pageshow");           
               
});

$('#mapPage').live("pageinit", function() {
        
        $('#karte').gmap(mapOptions);
});


$('#mapPage').live("pagebeforeshow", function() {
    
   if(conection.internet()){
      //mache nix
        
    }else{
                   
      ui.showDialog("Keine Netzwerkverbindung","Zur Anzeige benötigen Sie eine Netzwerkverbindung.",true);
      
    }
	
});


$('#mapPage').live('pagehide', function() {
        
    clean();
    
});



/**************** Position Benutzer *************************/
function geolocationSuccess(pos){

    var userPos = pos.coords.latitude + ' , ' + pos.coords.longitude;
    
    printOnConsole("geolocationSuccess","Pos: "+userPos);
    
    var $marker = $('#karte').gmap('addMarker', {'position': userPos,'icon':'bilder/marker/red-pin.png', 'bounds': true});
	
	
    
    $marker.click(function() {
        $('#karte').gmap('openInfoWindow', {'content': 'Hi Hallo User! das ist deine Position'}, this);
    });
    
}

function geolocationError(err){}
/*****************************************/
//navi
function backMap(){
   
    clean();
    history.back();

}

//navi
function homeMap(){
   
  clean();
  $.mobile.changePage("#main");
}

function clean(){
    $('#karte').gmap('clear', 'markers');
    $('#karte').gmap('closeInfoWindow');
    
    printOnConsole("showMoreAddressOnMap","llöschen!!!");
}

/*****************************************/
//Anzeige der Adresse von showOnePosOnMap
function showOneAddressOnMap(){
    
    geocoder.geocode( { 'address': zipCode + ' ' + town + ' , ' +  street + ' '}, function(results, status) {
                     
            if (status == google.maps.GeocoderStatus.OK) {
                     
                $('#karte').gmap('addMarker', { 'position': results[0].geometry.location,'bounds': true }).click(function() {
                    $('#karte').gmap('openInfoWindow', { 'content': description }, this);
                });
                    
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
    });

}

function showMoreAddressOnMap(){
    
    
    var len = posArray.length;
    
    printOnConsole("showMoreAddressOnMap","len: "+len);
    
    
    
    for(i = 0; i < len; i++){
        
        var arr = posArray[i];
        //printOnConsole("showMoreAddressOnMap","Adress: "+arr['lat'] + ' , ' + arr['long']);
        $('#karte').gmap('addMarker', { 'position': arr['lat'] + ' , ' + arr['long'] ,'id': i, 'bounds': true }).click(function()
        {
            openDetails(this);
                                                                                                                  
        });
    }

}

function openDetails(marker) {
    
    var arr = posArray[marker.id];
    
    if(arr['click']){
        
        //aufruf der Detials XMl -> Funktion stammt aus der XML.js
        searchDetail(arr['id']);
    }
    else{
      alert("Für diese Auswahl ist leider keine Detailansicht verfügbar.");
    }
    
    
}

/**************** Parkhäuser *************************/
function oneParkingStructureOnMap(){
	
    $('#karte').gmap('addMarker', { 'position': latCoordinate + ',' + longCoordinate,'icon':'bilder/marker/Parken_Button_klein.png','bounds': true }).click(function() {
            $('#karte').gmap('openInfoWindow', { 'content': description }, this);
    });
    
}

//erstellt den Inhalt des Dialog
function createParkingDialogLayout(name, tow, str, place, handicapped){
    
    var des = '<div class="dialogMapName">' + name + '</div><div>' + tow + ', ' + str + '</div><div class="dialogMapText">Anzahl Stellplätze: '+ place + '</div>';
    
    if(handicapped.length > 0){
        
        des = des + '<div class="dialogMapText">Anzahl Behindertenstellplätze: ' + handicapped + '</div>';
    }
    
    return des;
}

//Daten für die Darstellung der Parkhäuser
var google_maps_marker_data = [];

var marker_buffer = new Object();
marker_buffer['lat'] = 50.000435;
marker_buffer['lng'] = 8.276573;
marker_buffer['name'] = 'Parkhaus Rathaus';
marker_buffer['street'] = 'Rheinstr. 66';
marker_buffer['town'] = ' 55116 Mainz / Rheingoldhalle';
marker_buffer['places'] = '545';
marker_buffer['handicapped'] = '6';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =  50.00211;
marker_buffer['lng'] = 8.27417;
marker_buffer['name'] = 'Parkhaus Löhrstraße';
marker_buffer['street'] = 'Einfahrt Löhrstraße';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '145';
marker_buffer['handicapped'] = '';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =  49.999316;
marker_buffer['lng'] = 8.265646;
marker_buffer['name'] = 'Parkhaus Schillerplatz';
marker_buffer['street'] = 'Einfahrt Schillerstraße';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '480';
marker_buffer['handicapped'] = '';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =  50.003424;
marker_buffer['lng'] = 8.266912;
marker_buffer['name'] = 'Parkhaus Bleiche';
marker_buffer['street'] = 'Einfahrt Balthasar-Maler-Gasse';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '227';
marker_buffer['handicapped'] = '2 im Untergeschoss';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =  50.00455;
marker_buffer['lng'] = 8.2712;
marker_buffer['name'] = 'Parkhaus Deutschhausplatz';
marker_buffer['street'] = 'Große Bleiche';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '190';
marker_buffer['handicapped'] = '';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   50.006967;
marker_buffer['lng'] = 8.270554;
marker_buffer['name'] = 'Parkplatz Schloss';
marker_buffer['street'] = 'Ernst-Ludwig-Straße';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '122';
marker_buffer['handicapped'] = '5';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.9928617;
marker_buffer['lng'] = 8.2472526;
marker_buffer['name'] = 'Parkhaus Theater ';
marker_buffer['street'] = 'Am Kronberger Hof';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '207';
marker_buffer['handicapped'] = '';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.998203;
marker_buffer['lng'] = 8.257234;
marker_buffer['name'] = 'Parkhaus CityPort';
marker_buffer['street'] = 'Peter-Altmeier-Allee';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '497';
marker_buffer['handicapped'] = '8';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   50.006745;
marker_buffer['lng'] = 8.270710;
marker_buffer['name'] = 'Parkhaus Rheinufer';
marker_buffer['street'] = 'Linsenberg, Augustusstraße';
marker_buffer['town'] = '55131 Mainz';
marker_buffer['places'] = '1105';
marker_buffer['handicapped'] = '20';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   50.0020225;
marker_buffer['lng'] = 8.2660639;
marker_buffer['name'] = 'Parkhaus Römerpassage';
marker_buffer['street'] = 'Emmeransstraße';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '181';
marker_buffer['handicapped'] = '11';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   50.0004628;
marker_buffer['lng'] = 8.2687309;
marker_buffer['name'] = 'Parkhaus Kronberger Hof';
marker_buffer['street'] = 'Am Kronberger Hof';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '495';
marker_buffer['handicapped'] = '4';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.993695;
marker_buffer['lng'] = 8.278413;
marker_buffer['name'] = 'Parkhaus CineStar';
marker_buffer['street'] = 'Neutorstraße';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '459';
marker_buffer['handicapped'] = '8';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   50.0048703;
marker_buffer['lng'] = 8.2483513;
marker_buffer['name'] = 'Parkhaus Wallstrasse';
marker_buffer['street'] = 'Wallstraße';
marker_buffer['town'] = '55122 Mainz';
marker_buffer['places'] = '303';
marker_buffer['handicapped'] = '';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   50.0036575;
marker_buffer['lng'] = 8.2610027;
marker_buffer['name'] = 'Parkhaus Bonifazius Türme';
marker_buffer['street'] = 'Bonifaziusstraße';
marker_buffer['town'] = '55118 Mainz';
marker_buffer['places'] = '450';
marker_buffer['handicapped'] = '5';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.99807;
marker_buffer['lng'] =  8.25169;
marker_buffer['name'] = 'Parkhaus Taubertsberg';
marker_buffer['street'] = 'Binger Str., Wallstr.';
marker_buffer['town'] = '55122 Mainz';
marker_buffer['places'] = '767';
marker_buffer['handicapped'] = '21';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   50.00035;
marker_buffer['lng'] =  8.24754;
marker_buffer['name'] = 'Parkplatz Martin-Luther-King-Park';
marker_buffer['street'] = 'Dr. Martin-Luther-King-Weg';
marker_buffer['town'] = '55122 Mainz';
marker_buffer['places'] = '192';
marker_buffer['handicapped'] = '';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.9937155;
marker_buffer['lng'] =  8.261362;
marker_buffer['name'] = 'Parkplatz Unikliniken Kerngelände';
marker_buffer['street'] = 'Langenbeckstraße, Am Linsenberg';
marker_buffer['town'] = '55131 Mainz';
marker_buffer['places'] = '669';
marker_buffer['handicapped'] = '10';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.992868;
marker_buffer['lng'] =  8.260721;
marker_buffer['name'] = 'Parkhaus Unikliniken Urol./Ortho./Kons.';
marker_buffer['street'] = 'Langenbeckstraße, Am Linsenberg';
marker_buffer['town'] = '55131 Mainz';
marker_buffer['places'] = '617';
marker_buffer['handicapped'] = '';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.992868;
marker_buffer['lng'] =  8.260721;
marker_buffer['name'] = 'Parkplatz Unikliniken Zahnklinik';
marker_buffer['street'] = 'Am Römerlager';
marker_buffer['town'] = '55131 Mainz';
marker_buffer['places'] = '104';
marker_buffer['handicapped'] = '';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.9936896;
marker_buffer['lng'] =  8.2600588;
marker_buffer['name'] = 'Parkhaus Augustusplatz ';
marker_buffer['street'] = 'Am Römerlager';
marker_buffer['town'] = '55131 Mainz';
marker_buffer['places'] = '540';
marker_buffer['handicapped'] = '5 pro Ebene';
google_maps_marker_data.push(marker_buffer);

var marker_buffer = new Object();
marker_buffer['lat'] =   49.993465;
marker_buffer['lng'] =  8.277565;
marker_buffer['name'] = 'Parkhaus Römisches Theater';
marker_buffer['street'] = 'Holzhofstraße';
marker_buffer['town'] = '55116 Mainz';
marker_buffer['places'] = '436';
marker_buffer['handicapped'] = '10';
google_maps_marker_data.push(marker_buffer);

//Darstellung aller Parkäuser aus dem Feld google_maps_marker_data auf der Karte
function allParkingStructureOnMap(){
    
    var len = google_maps_marker_data.length;
    
    for(i = 0; i < len; i++){
        
        var arr = google_maps_marker_data[i];
        
        
        $('#karte').gmap('addMarker', { 'position': arr['lat'] + ',' + arr['lng'], 'icon':'bilder/marker/Parken_Button_klein.png','id': i ,'bounds': true }).click(function() {
            openDialog(this);
                                                                                                                                                          
        });
        
        
    }
    
     $('#karte').gmap('refresh');

}

//Dialog der Angzeigt wird wenn ein Parkhaus aus allParkingStructureOnMap angeklickt wird
function openDialog(marker) {
   
    var arr = google_maps_marker_data[marker.id];
    
    var des = createParkingDialogLayout(arr['name'], arr['town'], arr['street'], arr['places'], arr['handicapped']);
    
    $('#karte').gmap('openInfoWindow', { 'content': des }, marker);
}


/***************************** Position für Blitzermelden **************/
function geolocationBlitzerSuccess(lat,lon){
//    alert("aadas2");
    //pos.coords.latitude + ',' + pos.coords.longitude
    
    geocoder.geocode( { 'latlng': lat+','+lon }, function(results, status) {
                     
                     if (status == google.maps.GeocoderStatus.OK) {
                        alert(results);
                     //$('#karte').gmap('addMarker', { 'position': results[0].formatted_address,'bounds': true }).click(function() {
                     //$('#karte').gmap('openInfoWindow', { 'content': description }, this);
                     //});
                     
                     } else {
                        alert("Geocode was not successful for the following reason: " + status);
                     }
    });
    
    
}

