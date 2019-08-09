/* 
 * @Author: Davide Pierotti 2012
 */

//Page transition style
var pageTransition = "none";

//The wifi mac address
var macAddress = null;

/*Last position 
 * .coords -> coordinates {coords.latitude, coords.longitude}
 * .address -> address
 * .formattedAddress -> formatted address
 * .components -> array -> array[type]['long'] = long_name array[type]['short'] = short_name
 * * types: street_number route locality administrative_area_level_1 administrative_area_level_2 country postal_code
 * * see https://developers.google.com/maps/documentation/geocoding/#GeocodingResponses
 */
var lastPosition = {};

function setLastPosition(position){
    try{
        if(!title){
            title = "Errore";
        }
        if(navigator && navigator.notification){
            navigator.notification.alert(message, null, title , 'Ok');
        }
        else{
            alert(title + ': ' + message);
        }
    }
    catch(e){
        title = "Errore";
    }
}

function getLastPosition(position){
    
}

/**
 * Center an element on current window
 * @return void
 */
function center(item) {
    debugAlert("center");
    item.css("position", "absolute");
    item.css("top", ($(window).height() - item.height()) / 2 + $(window).scrollTop() + "px");
    item.css("left", ($(window).width() - item.width()) / 2 + $(window).scrollLeft() + "px");
}

/**
 * Notify user with a message
 * @return void
 */
function myAlert(message, title){
    //navigator.notification.vibrate(200); Necessita dell'autorizzazione
      /*
    var title = "Errore";
  
    try{
        title = '@' + arguments.callee.caller.name;
    }
    catch(e){
        title = "Errore";
    }
    */
    try{
        if(!title){
            title = "Errore";
        }
        if(navigator && navigator.notification){
            navigator.notification.alert(message, null, title , 'Ok');
        }
        else{
            alert(title + ': ' + message);
        }
    }
    catch(e){
        title = "Errore";
    }
}

/**
 * Notify user with a message (verbose mode) - Commentare in Produzione
 * @return void
 */
function debugAlert(message){
    return;
    
    var title;
    try{
        title = '@' + arguments.callee.caller.name;
    }
    catch(e){
        title = "Debug";
    }
    if(navigator && navigator.notification){
        navigator.notification.alert(message, null, title , 'Ok');
    }
    else{
        alert(title + ': ' + message);
    }
}

/**
 * Display a loading animation
 * @param message
 * * a text to show under the spinner (can be null)
 * @return void
 */
function showLoading(message){
    $.mobile.activePage.addClass('ui-disabled');
    if(message){
        $.mobile.loading( 'show', {text: message, textVisible: true});
    }
    else{
        $.mobile.loading( 'show' );
    }
}

/**
 * Hide the loading animation
 * @return void
 */
function hideLoading(){
    $.mobile.activePage.removeClass('ui-disabled');
    $.mobile.loading( 'hide' );
}

/**
 * Disable user interaction on home buttons, show Loading message
 * @return void
 */
function prepareHomepageChange(){
    $("#homeContent").addClass('ui-disabled');
    showLoading();
}

/**
 * Print an error message, disable Loading message, re-enable home Buttons
 * @param message
 * * the message to show, can be NULL (no message displayed)
 * @return void
 */
function errorAndReturnHome(message){
    $('#homeContent').removeClass('ui-disabled');
    hideLoading();
    if(message != null){
        myAlert(message);
        //navigator.notification.alert(message, null, 'Errore', 'Ok')
    }
}

function onBackButtonPress(event){
    
    if($.mobile.activePage.is('#home')){
        debugAlert("Uscita dall'app");
        event.preventDefault();
        nvigator.app.exitApp();
    }
    else{
        navigator.app.backHistory();
    }
}


/**
 * Check if there is any connection active
 * @return bool 
 *  true if connection is active
 */
function checkConnection() {
    //return true;
    
    try{
        var networkState = navigator.network.connection.type;
    }catch(e){
        debugAlert(e.toString());
        return false;
    }
    /*
        var element = document.getElementById('networkState');
        var states = {};
        states[Connection.UNKNOWN]  = 'Unknown connection';
        states[Connection.ETHERNET] = 'Ethernet connection';
        states[Connection.WIFI]     = 'WiFi connection';
        states[Connection.CELL_2G]  = 'Cell 2G connection';
        states[Connection.CELL_3G]  = 'Cell 3G connection';
        states[Connection.CELL_4G]  = 'Cell 4G connection';
        states[Connection.NONE]     = 'No network connection';
        element.innerHTML           = 'Connection type: ' + states[networkState];
        alert ('Connection type: ' + states[networkState]);
          */
    return networkState != Connection.NONE;
}

/**
 * take parameter value from URL in GET mode
 * @param url
 *  the relative url, if not defined use window.location
 * @param name
 *  the name of variable into url
 * @return string 
 *  the value of variable, if not present return null
 */
function getURLParameter(name, url) {
    try{
        var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(url);
        return( results[1] || null);
    }catch(e){
        debugAlert(e.toString());
        return null;
    }
}

/**
 * Set the MacAddress global variable
 * From html5Storage(if available) or from plugin
 * @return void
 */
function setMacAddress(){
    macAddress = "00:00:00:00:00:00";
    try{
        if(localStorage && localStorage.macaddress){
            macAddress = localStorage.macaddress;
            debugAlert("Mac dal local storage" + macAddress);
        }
        else if(window.plugins && window.plugins.macaddress){
            window.plugins.macaddress.getMacAddress(macAddressRetrieve, macAddressFail);
            debugAlert("Richiesta mac al plugin");
        }
    }
    catch(e){
    //Do nothing
    }
//delete localStorage.name;
}

/**
 * Get the width of screen 
 * @param save (bool)
 * * if the value can be saved in local storage
 * @return width
 */
function getDisplayWidth(save){
    try{
        if(save && localStorage && !localStorage.displayWidth){
            localStorage.displayWidth =  $(window).width();
            debugAlert("Salvo larghezza display " + localStorage.displayWidth);
        }
        if(localStorage && localStorage.displayWidth ){
            debugAlert("Leggo larghezza display" + localStorage.displayWidth);
            return localStorage.displayWidth;
        }
        return $(window).width();
    }
    catch(e){
        //Ebbene si, me la invento
        return 400;
    }
}

/**
 * Transaction error callback
 * Default
 * @return void
 */
function errorCB(err) {
    var message;
    try{
        message = err.message + ' code: ' + err.code;
    }
    catch (e){
        message = "Errore db";
    }
    errorAndReturnHome(message);
}


/**
 * Transaction success callback
 * Default
 * @return void
 */
function successCB() {
    debugAlert("Success database op");
}

/**
 * Update last position var
 * @param position
 * @return void
 */
function updateLastPosition(position){
    lastPosition.coords = position.coords;
    debugAlert("Posizione acquisita");
    
    //GEOCODER
    try{
        var lat = parseFloat(position.coords.latitude);
        var lng = parseFloat(position.coords.longitude);
        var latlng = new google.maps.LatLng(lat, lng);
        var geocoder = new google.maps.Geocoder();
        debugAlert("Reverse geocoding: " + lat + " " + lng);
        geocoder.geocode({
            'latLng': latlng
        }, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    lastPosition.formattedAddress = results[0].formatted_address;
                    var compAddress = results[0].address_components;
                    // iterate through address_component array
                    lastPosition.components = new Array();
                    $.each(compAddress, function (i, address_component) {
                        //alert(address_component.types[0]+": "+ address_component.long_name + " - " + address_component.short_name);
                        lastPosition.components[address_component.types[0]] = new Array();
                        lastPosition.components[address_component.types[0]]['long'] = address_component.long_name;
                        lastPosition.components[address_component.types[0]]['short'] = address_component.short_name;
                    });
                    debugAlert("Reverse geocoding completo");
                }
            }
            else{
                debugAlert("Reverse geocoding error: " + status);
            }
        });
    }
    catch(e){
        debugAlert("Reverse geocoding exception: " + e);
    }
    if(localStorage){
          localStorage.lastlatitude = lastPosition.coords.latitude;
          localStorage.lastlongitude = lastPosition.coords.longitude;
      }
 }
 
 /**
 * Set the last position var to last know value
 * @return void
 */
function setDefaultPosition(){
    if(localStorage && localStorage.lastlatitude){
        lastPosition.coords = {};
        lastPosition.coords.latitude = localStorage.lastlatitude;
        lastPosition.coords.longitude = localStorage.lastlongitude;
        debugAlert("Reset alla posizione di Default");
    }
}

/**
 * MacAddressRetrieve
 * save the value
 * @param obj
 * @return void
 */
function macAddressRetrieve(obj){
    try{
        macAddress = ""+obj.mac;
        debugAlert("arrivato Mac dal plugin " + macAddress);
        if(localStorage){
            localStorage.macaddress = macAddress;
            debugAlert("Mac memorizzato " + localStorage.macaddress);
        }
    }
    catch(e){
        debugAlert("Eccezzione mac:"+ e);
    }
}

/**
 * MacAddressRetrieveFail
 * @pram error
 * @return void
 */
function macAddressFail(error){
    //Retry after 60 secs
    debugAlert("Mac dal plugin fallito");
    setInterval("setMacAddress()", 60000);
    
}

//-------------->

/**
 * The firt function called after Cordova library loading
 *  - database creation and flush
 *  - initialization of #home page role of index.html
 * @return void
 */
function globalInit(){
    debugAlert("Inizio init");
    /* //Funzioni per conoscere dati del device
     alert('Device Name: ' + device.name     + '\n' + 
                            'Device PhoneGap: ' + device.phonegap + '\n' + 
                            'Device Platform: ' + device.platform + '\n' + 
                            'Device UUID: '     + device.uuid     + '\n' + 
                            'Device Version: '  + device.version);
    */
   
   //Recupero subito il macAddress
   setMacAddress();

   //Memorizzo (se non è stato già fatto) la larghezza del display per gli avvii futuri
   //Adesso che è tutto inizializzato è più precisa
   getDisplayWidth(true);
   
   //E la posizione
   navigator.geolocation.getCurrentPosition(updateLastPosition, setDefaultPosition, {timeout: 20000});
    
    debugAlert("Variabili di sistema acquisite");
    
    //Mi metto in ascolto di cambi di orientamento del dispositivo
    $(window).bind('orientationchange', function(event){
        var myDelay = 10;
        if(device && device.platform == "Android"){
            //Su android devo rallentare il centramento o larghezza e altezza della window saranno ancora quelle precedenti alla rotazione
            myDelay = 300;
        }
        setTimeout(function(){
            //centro homecontent nella window
            /*var item = $("#homeContent");
            item.css("position", "absolute");
            item.css("top", ($(window).height() - item.height()) / 2 + $(window).scrollTop() + "px");
            item.css("left", ($(window).width() - item.width()) / 2 + $(window).scrollLeft() + "px");
            */
           
           //Se la pagina corrente è una mappa la ruoto
            if($.mobile.activePage.is('#storesMap')){
                storesMapRotate();
            }
            if($.mobile.activePage.is('#storesDirectionsMap')){
                directionsMapRotate();
            }
        }
        ,myDelay);
        
        
    /*
    if (event.orientation == "portrait") {
        alert("portrait");
    } else {
        alert("landscape");
    }*/
    });
    
    //Ascolto gli eventi del pulsante "indietro" del dispositivo (se c'è)
    document.addEventListener("backbutton", function(e){  
        if($.mobile.activePage.is('#home')){
            //Esci dall'applicazione
            e.preventDefault();
            navigator.app.exitApp();
        }
        else {       
            navigator.app.backHistory();
        }
    }, false);
    
    //--- homepage loading
    $(document).ready(function(){
        try{
            homeInit();
        }
        catch(e){
            debugAlert("index " + e.toString());
        }
    });
    
    //--- catalog init
    $(document).on('pageinit','#catalog', function(){
        try{
            catalogInit();
        }
        catch(e){
            debugAlert("catalog " + e.toString());
        }
    });
  
    //--- products init
    $(document).on('pageinit','#products', function(){
        try{
            productsInit();
        }
        catch(e){
            debugAlert("products " + e.toString());
        }
    });
  
    //--- productDetail init
    $(document).on('pageinit','#productDetail', function(){
        try{
            productDetailInit();
        }
        catch(e){
            debugAlert("productDetail " + e.toString());
        }
    });
  
    //--- stores init
    $(document).on('pageinit','#stores', function(){
        try{
            storesInit();
        }
        catch(e){
            debugAlert("stores " + e.toString());
        }
    });
  
    //--- storeDetail init
    $(document).on('pageinit','#storeDetail', function(){
        try{
            storeDetailInit();
        }
        catch(e){
            debugAlert("storeDetail " + e.toString());
        }
    });
    
    $(document).on('pageinit','#submitForm', function(){
        try{
            newsLetterInit();
        }
        catch(e){
            debugAlert("storeDetail " + e.toString());
        }
    });
  
    //Preload all the pages (only base html structure)
    $.mobile.loadPage('#stores');
    $.mobile.loadPage('#storeDetail');
    $.mobile.loadPage('#catalog');
    $.mobile.loadPage('#products');
    $.mobile.loadPage('#productDetail');
    $.mobile.loadPage('#info');
    $.mobile.loadPage('#submitForm');
    //Delle mappe non faccio preload
    
    if( navigator && navigator.splashscreen){
            navigator.splashscreen.hide();
    }
    debugAlert ("Inizializzazione completa");
}


/**
 * Database initialization
 *  - create or open the old one
 *  - drop al the content's tables
 * @return void
 */
function databaseInit(){
    try{
        var db = window.openDatabase("Bardahl", "1.0", "Bardahl stuff", 2000000);
        db.transaction(function(tx){
            //Transaction op
            tx.executeSql('DROP TABLE IF EXISTS settori;');
            tx.executeSql('DROP TABLE IF EXISTS gruppi;');
            tx.executeSql('DROP TABLE IF EXISTS subgruppi;');
            tx.executeSql('DROP TABLE IF EXISTS prodotti;');
            tx.executeSql('CREATE TABLE IF NOT EXISTS settori (aid TEXT, atitle TEXT);');
            tx.executeSql('CREATE TABLE IF NOT EXISTS gruppi (aid TEXT, asettoreId TEXT, atitle TEXT, aordine TEXT);');
            tx.executeSql('CREATE TABLE IF NOT EXISTS subgruppi (aid TEXT, asettoreId, agruppoId TEXT, atitle TEXT, aordine TEXT);');
            tx.executeSql('CREATE TABLE IF NOT EXISTS prodotti (aid TEXT, asettoreId, agruppoId TEXT, asubgruppoId TEXT, atitle TEXT, adesc TEXT, adescSint TEXT, aplus TEXT, acaratteristiche TEXT, ascheda TEXT, aBigImage TEXT, aSmallImage TEXT);');
        }
        , errorCB);
    }catch(e){
        debugAlert("@databaseInit: " + e);
    }
    debugAlert("DataBase Cancellato");
}


/**
 * Home page initialization
 * @return void
 */
function homeInit(){
    //center($("#homeContent"));
    //alert("DB Cancellato");
    databaseInit();
    
    //------ ON SHOW EVENTS
    $("#home").live('pageshow',function(event, ui){
        //Ogni volta che la homepage è caricata
        //mi assicuro che sia attiva
        errorAndReturnHome();
                  
        //Sfondo giallo
        $("#background").addClass('background-yellow');
        $("#background").removeClass('background-gray');   
        //centro
        //center($("#homeContent"));
    });
    
    
    $("#home").live('pagehide',function(event, ui){
        //Ogni volta che la homepage è caricata
        //mi assicuro che sia attiva e centrata
        errorAndReturnHome();
                   
        //Sfondo grigio
        $("#background").addClass('background-gray');
        $("#background").removeClass('background-yellow');
                    
        //Centro
        //center($("#homeContent"));
    });

    $("#storesMap").live('pageshow',function(event, ui){
        storesMapShow();
    });
    
    $("#storesDirectionsMap").live('pageshow',function(event, ui){
        directionsMapShow();
    });

    //ALERT IF THERE IS NO CONNECTION
    if(!checkConnection()){
        navigator.notification.alert("Nessuna connessione", null, 'Errore', 'Ok')
    }
    
    //myAlert("Homepage inizializzata");
    
    //-------- BUTTONS EVENTS
    /* no longer needed
    $("#btnAuto").click(function (event) {
        prepareHomepageChange();
        catalogButtonAction("AU");
    });
  
    $("#btnMoto").click(function (event) {
        prepareHomepageChange();
        catalogButtonAction("MO");
    });
  
    $("#btnShop").click(function (event) {
        prepareHomepageChange();
        storesButtonAction();
    });
    
    $("#btnInfo").click(function (event) {
        $.mobile.changePage('#info',{
            transition: pageTransition
        });
    });
    
    $("#btnNews").click(function (event) {
        $.mobile.changePage('#submitForm',{
            transition: pageTransition
        });
    });
    */
}
