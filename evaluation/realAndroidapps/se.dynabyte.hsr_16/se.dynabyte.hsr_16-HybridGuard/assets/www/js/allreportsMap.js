var reportsMap;
var zoomLevelReportsCoordinates = 13;
var zoomLevelReportsCountry = 8;
var neighbourMarkers;
var allreportsMapInitialized = false;

$(document).delegate("#reports_map", "pageinit", function () {
    if (typeof google != 'undefined') {
        initReportsMap();
    } else {
        getGoogleMapsAPIScript('initReportsMap');
    }
});

$('#reports_map').live("pageshow", function () {
    showReportsMap();
});

function showReportsMap() {
    if (typeof google != 'undefined') {
        if (!allreportsMapInitialized) {
            initReportsMap();
        }
        google.maps.event.trigger(reportsMap, 'resize');
    } else {
        getGoogleMapsAPIScript('showReportsMap');
    }
}

function initReportsMap() {
    var initReportsLocation = new google.maps.LatLng(62.42525, 16.35849);
    var mapOptions = {
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        disableDefaultUI: true,
        zoomControl: true
    };
    reportsMap = new google.maps.Map(document.getElementById('reports_map_canvas'), mapOptions);
    var myLat = $('#latitude').val();
    var myLng = $('#longitude').val();
    if (typeof myLat != 'undefined' &&
        typeof myLng != 'undefined' &&
        myLat.length > 0 &&
        myLng.length > 0
        ) {
        initReportsLocation = new google.maps.LatLng(myLat, myLng);
        reportsMap.setZoom(zoomLevelReportsCoordinates);
    } else {
        reportsMap.setZoom(zoomLevelReportsCountry);
    }
    reportsMap.setCenter(initReportsLocation);
    allreportsMapInitialized = true;
    getCloseByReports();
}

function getCloseByReports() {
    google.maps.event.addListener(reportsMap, 'idle', function (ev) {
        $.mobile.showPageLoadingMsg();
        clearAllNeigbouringMarkers();
        var bounds = reportsMap.getBounds();
        var ne = bounds.getNorthEast();
        var sw = bounds.getSouthWest();
        var coords = $.post(
            GLOBAL.hsr_url + 'getReportsCloseBy',
            {
                long0: sw.lng(),
                lat0: sw.lat(),
                long1: ne.lng(),
                lat1: ne.lat()
            },
            function (data) {
                $.mobile.hidePageLoadingMsg();
                var jsonMarkers = jQuery.parseJSON(data);
                for (var key in jsonMarkers) {
                    var position = new google.maps.LatLng(jsonMarkers[key].lat, jsonMarkers[key].lng);
                    var neighbourMarker = new google.maps.Marker(
                        {
                            position: position,
                            map: reportsMap,
                            title: key.toString(),
                            icon: createMarkerImage(jsonMarkers[key].colorCode)
                        }
                    );
                    neighbourMarkers.push(neighbourMarker);
                    google.maps.event.addListener(neighbourMarker, 'click', (function (neighbourMarker) {
                        return function () {
                            getReportAndChangePage(parseInt(neighbourMarker.title));
                        }
                    })(neighbourMarker));
                }
            }
        );
    });
}

function createMarkerImage(markerColor) {
    var symbolMarker = {
        path: google.maps.SymbolPath.BACKWARD_CLOSED_ARROW,
        fillColor: markerColor,
        fillOpacity: 0.8,
        scale: 5,
        strokeColor: 'black',
        strokeWeight: 1
    };
    return symbolMarker;
}

function clearAllNeigbouringMarkers() {
    if (neighbourMarkers) {
        if (neighbourMarkers.length > 0) {
            for (var key in neighbourMarkers) {
                var marker = neighbourMarkers[key];
                marker.setMap(null);
            }
        }
    }
    neighbourMarkers = new Array();
}

function getCurrentLocationForReportsMap() {
    $.mobile.showPageLoadingMsg();
    geoLocationLookup(getCurrentLocationForReportsMapSuccess, getCurrentLocationForReportsMapError);
}

function getCurrentLocationForReportsMapSuccess(position) {
    $.mobile.hidePageLoadingMsg();
    var myLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    reportsMap.setCenter(myLocation);
    reportsMap.setZoom(zoomLevelReportsCoordinates);
}

function getCurrentLocationForReportsMapError(error) {
    $.mobile.hidePageLoadingMsg();
    console.log('code: ' + error.code + " message: " + error.message);
}