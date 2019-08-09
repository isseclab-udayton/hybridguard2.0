var map;
var zoomLevelCoordinates = 13;
var zoomLevelCountry = 5;
var positionMarker;
var initLocation = null;
var googleMapsInitialized = false;

$(document).delegate("#map", "pageinit", function () {
    if (typeof google != 'undefined') {
        initMap();
    } else {
        getGoogleMapsAPIScript('initMap');
    }
});

$('#map').live("pageshow", function () {
    showMap();
});

function showMap() {
    if (typeof google != 'undefined') {
        if (!googleMapsInitialized) {
            initMap();
        }
        google.maps.event.trigger(map, 'resize');
        var myLat = $('#latitude').val();
        var myLng = $('#longitude').val();
        if (typeof myLat != 'undefined' &&
            typeof myLng != 'undefined' &&
            myLat.length > 0 &&
            myLng.length > 0
            ) {
            initLocation = new google.maps.LatLng(myLat, myLng);
            map.setZoom(zoomLevelCoordinates);
        } else {
            map.setZoom(zoomLevelCountry);
        }
        map.setCenter(initLocation);
        updateMarker();
    } else {
        getGoogleMapsAPIScript('showMap');
    }
}

function initMap() {
    initLocation = new google.maps.LatLng(62.42525, 16.35849);
    var mapOptions = {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
        zoomControl: true
    };
    map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

    var input = document.getElementById('addressAutocomplete');
    var autocomplete = new google.maps.places.Autocomplete(input);

    autocomplete.bindTo('bounds', map);

    google.maps.event.addListener(autocomplete, 'place_changed', function () {
        input.className = '';
        var place = autocomplete.getPlace();
        map.setCenter(place.geometry.location);
        map.setZoom(zoomLevelCoordinates);  // Why 17? Because it looks good.
        positionMarker.setPosition(place.geometry.location);
        setCoordinateData(place.geometry.location.lat(), place.geometry.location.lng());
    });
    googleMapsInitialized = true;
    createMarker();
}

function createMarker() {
    positionMarker = new google.maps.Marker({
        position: map.getCenter(),
        draggable: true,
        map: map,
        icon: createGoogleMapsMarkerImage(),
        raiseOnDrag: false
    });
    google.maps.event.addListener(positionMarker, 'dragend', function (evt) {
        setCoordinateData(evt.latLng.lat(), evt.latLng.lng())
    });
}

function createGoogleMapsMarkerImage() {
    var symbolMarker = {
        path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW,
        fillColor: 'red',
        fillOpacity: 0.3,
        scale: 15,
        strokeColor: 'black',
        strokeWeight: 1
    };
    return symbolMarker;
}

function setCoordinateData(lat, lng) {
    $('#latitude').val(lat);
    $('#longitude').val(lng);
    $('#accuracy').val(0);
    getAddress(lat, lng, setFormAddress, formAddressError);
}

function updateMarker() {
    positionMarker.setPosition(map.getCenter());
}

function getCurrentGeoLocation() {
    $.mobile.showPageLoadingMsg();
    geoLocationLookup(currentGeoLocationSuccess, currentGeoLocationError);
}

function currentGeoLocationSuccess(position) {
    $.mobile.hidePageLoadingMsg();
    setCoordinateData(position.coords.latitude, position.coords.longitude)
    $('#accuracy').val(position.coords.accuracy);
    var myLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    map.setCenter(myLocation);
    map.setZoom(zoomLevelCoordinates);
    updateMarker();
}

function currentGeoLocationError(error) {
    $.mobile.hidePageLoadingMsg();
    console.log('code: ' + error.code + " message: " + error.message);
}