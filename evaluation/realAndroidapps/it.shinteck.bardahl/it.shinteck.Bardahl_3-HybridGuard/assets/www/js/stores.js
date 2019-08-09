/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var myMap;
//var lastPosition;
var nearStores;
var currentRange = 50;
var selectedStore;
var directionsDisplay;
var watchID = null;
var watchCount = 0;
var maxwatch = 10;

/**
 * Converts to radians
 * @param x
 * @return double
 */
function rad(x) { 
    return x * Math.PI / 180 
}

/**
 * Calculate the distance in kilometers between two points using the Haversine algo.
 * @param p1latitude
 * @param p1longitude
 * @param p2latitude
 * @param p2longitude
 * @return int the distance (in Km)
 */
function distanceCalc(p1latitude, p1longitude, p2latitude, p2longitude) {
    var R = 6371;
    var dLat  = this.rad(p2latitude - p1latitude);
    var dLong = this.rad(p2longitude - p1longitude);

    var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(rad(p1latitude)) * Math.cos(rad(p2latitude)) * Math.sin(dLong/2) * Math.sin(dLong/2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
    var d = R * c;

    return d;
}

/**
 * Round a number
 * @param num
 * * the number to round
 * @param dec
 * * number of decimal places you want rounded to
 * @return double
 */
function roundNumber(num, dec) {
    var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
    return result;
}

/**
 * STORES INITIALIZATION
 * inizialize the stores page
 */

function storesInit(){
//nothing to do
}

/**
 * Define action on shop button
 * @return void
 */
function storesButtonAction() {
    /*Vado ai negozi senza localizzazione
    nearStores = new Array();
    nearStores[0] = new Array();
    nearStores[0]['dscocp'] = "peppino";
    nearStores[0]['indica'] = "via fwefewfew";
    nearStores[0]['distanceKM'] = "tanti";
    nearStores[0]['locaca'] = "ddd";
    nearStores[0]['provca'] = "fr";
    nearStores[0]['ntelca'] = "33333";
    nearStores[1] = new Array();
    nearStores[1]['dscocp'] = "peppino2";
    nearStores[1]['indica'] = "via fewwfw2";
    nearStores[1]['distanceKM'] = "tanti2";
    nearStores[1]['locaca'] = "ddd2";
    nearStores[1]['provca'] = "fr2";
        storesDraw();
        return;
    
    */
    
    prepareHomepageChange();
    showLoading("Acquisizione delle coordinate gps");
    nearStores = null;
    if(!checkConnection()){
        errorAndReturnHome("Nessuna connessione");
        return;
    }
        
    navigator.geolocation.getCurrentPosition(myLocationSuccess, myLocationError, {
        maximumAge:600000,
        timeout: 600000
    });
    /*watchID = navigator.geolocation.watchPosition(myLocationSuccess, myLocationError, {
        maximumAge: 3000, 
        timeout: 5000, 
        enableHighAccuracy: true
    });*/
    watchCount = 0;
}

/**
 * Stop geolocation watch operations
 * @return void
 */
function clearWatch() {
    if (watchID != null) {
        navigator.geolocation.clearWatch(watchID);
        watchID = null;
    }
}
      
/**
 * Geolocation success
 * @return void
 */
function myLocationSuccess(position) {
    /*
    alert(
    'Latitude: '           + position.coords.latitude              + '<br />' +
    'Longitude: '          + position.coords.longitude             + '<br />' +
    'Altitude: '           + position.coords.altitude              + '<br />' +
    'Accuracy: '           + position.coords.accuracy              + '<br />' +
    'Altitude Accuracy: '  + position.coords.altitudeAccuracy      + '<br />' +
    'Heading: '            + position.coords.heading               + '<br />' +
    'Speed: '              + position.coords.speed                 + '<br />' +
    'Timestamp: '          + position.timestamp                    + '<br />');
    $.mobile.hidePageLoadingMsg();
    */
    //lastPosition.coords = position.coords;
    //clearWatch();
    updateLastPosition(position);
    showLoading("Cerco i rivenditori Bardahl");
    storesSoapRequest(position.coords.latitude, position.coords.longitude, currentRange);
/*GEOCODER
    geocoder = new google.maps.Geocoder();
    geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          $('#address').val(results[0].formatted_address);
          $('#latitude').val(marker.getPosition().lat());
          $('#longitude').val(marker.getPosition().lng());
        }
      }
    });
    */
}
  

/**
 * Geolocation error
 * @return void
 */
function myLocationError(error) {
    //watchCount = watchCount + 1;
    //if(watchCount > maxwatch) {
        //max attempts reached 
        //clearWatch();
        var message = "GPS: ";
        switch (error.code){
            case error.PERMISSION_DENIED:
                message += "Autorizzazione negata";
                break;
            case error.POSITION_UNAVAILABLE:
                message += "Posizione non disponibile";
                break;
            case error.TIMEOUT:
                message += "Impossibile ottenere la posizione";
                break;
            default:
                message += "Errore sconosciuto";
                break;
        }
        //TODO usa l'ultima posizione?
        if(lastPosition && lastPosition.coords && lastPosition.coords.latitude){
            message += "\nDesideri utilizzare l'ultima posizione rilevata?";
            navigator.notification.confirm(message, useLastPositionCallback, "Conferma", "No, Si");
        }
        else{
            errorAndReturnHome(message);
        }
    //}
}

/**
 * use last Position confirmed
 * @return void
 */
function useLastPositionCallback(button) {
    if(button == 2){
        showLoading("Cerco i rivenditori Bardahl");
        storesSoapRequest(lastPosition.coords.latitude, lastPosition.coords.longitude, currentRange);
        return;
    }
    errorAndReturnHome(null);
}

/**
 * Asynchronous request to soap web service action:getShopList 
 * @param latitude
 * @param longitude
 * @param radius
 * @return void
 */
function storesSoapRequest(latitude, longitude, radius) {
    if(latitude != null && longitude != null && radius != null){
        var wsUrl = "http://intranet.bardahl.it/MaroilWebServices/BardahlCatalog";
        var soapRequest = '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://services.maroil.it/"> ' +
        '<soapenv:Header/> ' +
        '<soapenv:Body> ' +
        '<ser:getShopList> ' +
        '<latitude>' + latitude + '</latitude> ' +
        '<longitude>' + longitude + '</longitude> ' +
        '<raggio>' + radius + '</raggio>' +
        //  '<prov> </prov> '+
        '</ser:getShopList> ' +
        '</soapenv:Body> ' +
        '</soapenv:Envelope>';
        
        $.ajax({
            type: "POST",
            url: wsUrl,
            contentType: "text/xml",
            dataType: "xml",
            data: soapRequest,
            success: storesSoapRequestSuccess,
            error: storesSoapRequestError
        });
    }
    else {
        errorAndReturnHome("Impossibile scaricare i rivenditori");
    }
}

/**
 * Eleborate data on success after soap request to getShopList action
 * @param data
 * @param status
 *  the status of the request
 * @param req
 *  the request contain the response XML data
 * @return void
 */
function storesSoapRequestSuccess(data, status, req) {
    var xml = $(req.responseXML);
    var stores = $(xml).find("rivenditore");

    if(stores == null || $(stores).length == 0){
        errorAndReturnHome("Nessun rivenditore a " + currentRange + " Km da qui");
        return;
    }
    try{
        nearStores = new Array();
        
        $("#storesTitle").text("Rivenditori a " + currentRange + " Km da qui (" + $(stores).length + ")");
        
        for(var i = 0; i < $(stores).length; i++){
            var store = $(stores[i]).children();
            nearStores[i] = new Array();
            for(var j = 0; j < $(store).length; j++){
                //alert(store[j].nodeName);
                nearStores[i][store[j].nodeName] = store[j].textContent;
            }
            //Aggiungo un campo 'distanza dalla posizione corrente (in Km)'
            nearStores[i]['distanceKM'] = roundNumber(distanceCalc(nearStores[i]['latitude'], nearStores[i]['longitude'], lastPosition.coords.latitude, lastPosition.coords.longitude), 1);
        }
        
        //Ordino l'array per distanza dalla posizione corrente
        nearStores.sort(function(a, b){
            return a['distanceKM'] - b['distanceKM'];
        });
        
        storesDraw();
        
        //Log
        shopListLogWithRadius(currentRange);
    }
    catch (e){
        errorAndReturnHome(e.toString());
    }
}

/**
 *Ajax rivenditoriSoapRequest Error
 */
function storesSoapRequestError(data, status, req) {
    errorAndReturnHome("Impossibile scaricare i rivenditori");//"Stato richiesta: " + status);
}

/**
 * move to page after stores are drawed
 * @return void
 */
function goToStores(){
    hideLoading();
    
    /* $("#background").removeClass('background-yellow');
    $("#background").removeClass('background-gray');
    $("#background").addClass('background-gray');*/
    // $('#stores').trigger('create');
   
    $.mobile.changePage('#stores',{
        transition: pageTransition,
        allowSamePageTransition: true
    });

}

/**
 * STORES INITIALIZATION
 * all datas are ready: draw the list
 */

function storesDraw(){
    var storesList = $("#storesList");
    storesList.empty();
    try{
        for (var i = 0; i < $(nearStores).length; i++){
            //list content
            var tag_li = $('<li>').attr({
                "class"           : "ui-li-has-arrow"
            });
            
            var tag_a = $('<a>').attr('data-transition', pageTransition).attr({
                onClick : "storeDetailDraw(" + i + "); return false;"
            });
            
            var tag_h3 = $('<h3>').attr("class", "ui-li-heading").html(nearStores[i]['dscocp']); //Ragione sociale
        
            var tag_p = $('<p>').attr("class", "ui-li-desc").html(nearStores[i]['indica'] + ' - ' + nearStores[i]['locaca'] + ' (' + nearStores[i]['provca'] + ')'); //Indirizzo + città + provincia
      
            var tag_km = $('<span>').attr("class", "ui-li-count").append(nearStores[i]['distanceKM'] + ' Km'); //Distanza dalla posizione corrente
            
            tag_a.append(tag_h3).append(tag_p).append(tag_km);
            tag_li.html(tag_a);
            
            /*
            var tag_li = $('<li>').attr({
                "data-corners"    : "false",
                "data-shadow"     : "false",
                "data-iconshadow" : "true",
                "data-wrapperels" : "true",
                "data-icon"       : "arrow-r",
                "data-iconpos"    : "right",
                "data-theme"      : "c",
                "class"           : "ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-btn-up-c"
            });
      
            var tag_div_1 = $('<div>').attr({
                "class" : "ui-btn-inner ui-li"
            });
      
            var tag_div_2 = $('<div>').attr({
                "class" : "ui-btn-text"
            });
      
            var tag_a = $('<a>').attr('data-transition', pageTransition).attr({
                // href: "#storeDetail?storePos=" + i ,
                onClick : "storeDetailDraw(" + i + "); return false;",
                "class"         : "ui-link-inherit"
            });
      
       
      
            var tag_h3 = $('<h3>').attr("class", "ui-li-heading").append(nearStores[i]['dscocp']); //Ragione sociale
        
            var tag_p = $('<p>').attr("class", "ui-li-desc").append(nearStores[i]['indica'] + ' - ' + nearStores[i]['locaca'] + ' (' + nearStores[i]['provca'] + ')'); //Indirizzo + città + provincia
      
            var tag_km = $('<span>').attr("class", "ui-li-count").append(nearStores[i]['distanceKM'] + ' Km'); //Distanza dalla posizione corrente
            //var tag_km = $('<p>').attr("class", "ui-li-aside").append(' (' + nearStores[i]['distanceKM'] + ' Km)'); //Distanza dalla posizione corrente
            
            var tag_arrow = $('<span>').attr("class", "ui-icon ui-icon-arrow-r ui-icon-shadow");
      
            //composition
            tag_a.append(tag_h3).append(tag_p).append(tag_km);
            tag_div_2.append(tag_a);
            tag_div_1.append(tag_div_2).append(tag_arrow);
            tag_li.append(tag_div_1);
            */
      
            storesList.append(tag_li);
        }//for statement end
        //refresh list view
        storesList.listview("refresh");
    }catch(e) {
        hideLoading()
        debugAlert(e.toString());
        myAlert("Impossibile visualizzare i rivenditori");
    }

    
    //Mostra la pagina generata
    goToStores();
}


/**
 * STORE DETAIL INITIALIZATION
 * inizialize the store detail page
 */
function storeDetailInit(){
//nothing to do
}

/**
 * STORE DETAIL CELL
 * @param image
 * @param title
 * @param description
 * @param linkUrl
 * @return string (or null on error)
 * * a formatted <li> tag
 */
function createStoreDetailLiTag(image, title, description, linkUrl){
    var tag_li = null;
    try{
        tag_li = $('<li>').attr({
            "data-corners"    : "false",
            "data-shadow"     : "false",
            "data-iconshadow" : "true",
            "data-wrapperels" : "true",
            "data-theme"      : "c",
            "class"           : "ui-btn ui-li ui-li-has-thumb ui-btn-up-c"
        });
      
        var tag_div_1 = $('<div>').attr({
            "class" : "ui-btn-inner ui-li"
        });
      
        var tag_div_2 = $('<div>').attr({
            "class" : "ui-btn-text"
        });
        
        var tag_a = $('<a>').attr({
            href: linkUrl,
            "target": "_blank",
            "class"         : "ui-link-inherit"
        });
      
        var tag_img = "";
        if(image){
            //Cerco di centrarlo, porco cane
            tag_img = $('<div>').attr({
                "class" : "rivenditori-li-thumb-wrapper"
            });
            var real_tag_img = $('<img>').attr({
                "src"   : "img/" + image,
                "alt"   : title,
                "class" : "rivenditori-li-thumb"
            //"class" : "ui-li-thumb"
            });
            tag_img.append(real_tag_img);
        }
        var tag_h3 = $('<h3>').attr("class", "ui-li-heading").append(title);
        
        var tag_p = $('<p>').attr("class", "ui-li-desc").append(description);
      
        //var tag_arrow = $('<span>').attr("class", "ui-icon ui-icon-arrow-r ui-icon-shadow");
      
        //composition
        tag_a.append(tag_img).append(tag_h3).append(tag_p);
        tag_div_2.append(tag_a);
        tag_div_1.append(tag_div_2);//.append(tag_arrow);
        tag_li.append(tag_div_1);
      
    }catch(e) {
        tag_li = null;
        debugAlert(e.toString());
        //myAlert("Impossibile visualizzare i rivenditori");
    }
    return tag_li;
}

/**
 * STORE DRAW
 * @param storeIndex
 */
function storeDetailDraw(storeIndex){
    showLoading("Caricamento dettagli");
    try{
        var store = nearStores[storeIndex];
        
        
        //Setto il titolo
        $("#storeDetailTitle").text(store['dscocp']);
        $("#storeTitle").text(store['dscocp']);
        
        var storeList = $("#storeDetailList");
        //Svuoto gli elementi
        storeList.empty();
        
        //Aggiungo i dettagli del punto vendita
        //Numero di telefono
        storeList.append(createStoreDetailLiTag("pencil32.png", "Indirizzo", store['indica'] + ' - ' + store['locaca'] + ' (' + store['provca'] + ')', null));
        //Telefono (se presente)
        if(store['ntelca'] != null && store['ntelca'].length !== 0){
            storeList.append(createStoreDetailLiTag("phone32.png", "Telefono", store['ntelca'], "tel:" + store['ntelca']));
        }
        //Fax (se presente)
        if(store['nfaxca'] != null && store['nfaxca'].length !== 0){
            storeList.append(createStoreDetailLiTag("printer32.png", "Fax", store['nfaxca'], "tel:" + store['nfaxca']));
        }
        //Email (se presente)
        if(store['inelca'] != null && store['inelca'].length !== 0){
            storeList.append(createStoreDetailLiTag("mail32.png", "Email", store['inelca'], "mailto:" + store['inelca']));
        }
        //Sito web (se presente) !il link deve cominciare con http://
        //store['swebca']="http://www.google.it";
        if(store['swebca'] != null && store['swebca'].length !== 0){
            storeList.append(createStoreDetailLiTag("paperstar32.png", "Sito web", store['swebca'], store['swebca']));
        }
        /*
        storeList.append(createStoreDetailLiTag("phone32.png", "Telefono", "339-334455", "tel:339-334455"));
        storeList.append(createStoreDetailLiTag("phone32.png", "Telefono senza link", "339-334455", null));
        storeList.append(createStoreDetailLiTag(null, "Telefono senza link ne immagine", "339-334455", null));
        storeList.append(createStoreDetailLiTag(null, "Telefono con link senza immagine", "339-334455", "tel:339-334455"));
        storeList.append(null);*/
        
        //Show generated page
        goToStoreDetail();
           
        selectedStore = storeIndex;
        
        //Log
        shopLogWithID(store['cdclc0']);
        
    }catch(e) {
        hideLoading();
        debugAlert(e.toString());
        myAlert("Impossibile visualizzare il rivenditore");
    }
//storeList.listview("refresh");
}

/**
 * move to page after store is drawed
 * @return void
 */
function goToStoreDetail(){
    hideLoading();
    $.mobile.changePage('#storeDetail',{
        transition: pageTransition
    });
}

/**
 * Opens a popup for change search range
 * @return void
 */
function openRangeDialog(){
    try{
        $("#rangePopup").popup('open');
    }
    catch(e) {
        debugAlert(e.toString());
        myAlert("Impossibile inizializzare la finestra");
    }
}

/**
 * Perform a new search with the new range
 * also current location is updated
 * @return void
 */
function changeRange(newRange){
    currentRange = newRange;
    $('#rangePopup').popup('close');
    storesButtonAction();
}

/**
 * Call button pressed
 * Prompt the user
 * @return void
 */
function storePhone(){
    navigator.notification.confirm("Vuoi chiamare?", storePhoneCallback, "Conferma", "No, Si");
}

/**
 * Call confirmed
 * @return void
 */
function storePhoneCallback(button) {
    if(button == 2){
        var store = nearStores[selectedStore];
        if(store['ntelca'] != null && store['ntelca'].length !== 0){
            document.location.href = 'tel:' + store['ntelca'];
        }
        else{
            myAlert("Nessun numero da chiamare");
        }
    }
}


/**
 * Directions button pressed
 * Prompt the user
 * @return void
 */
function askDirections(){
    navigator.notification.confirm("Desideri indicazioni?", directionsCallback, "Conferma", "No, Si");
}

/**
 * Directions confirmed
 * @return void
 */
function directionsCallback(button) {
    if(button == 2){
        drawDirectionsMap();
    }
}