var GLOBAL = {};
GLOBAL.hsr_url = 'http://hsr.herokuapp.com/';
GLOBAL.hsr_url_public = 'http://hsr.herokuapp.com/public/report/';
GLOBAL.image_host = "https://s3.amazonaws.com/se.dynabyte.hsr.images.thumbs/";
GLOBAL.ajaxCall = null;
GLOBAL.db = null;

document.addEventListener("deviceready", onDeviceReadyGeneric, false);

$(document).bind("pagebeforechange", function (event, data) {
    if (GLOBAL.ajaxCall != null) {
        GLOBAL.ajaxCall.abort();
        GLOBAL.ajaxCall = null;
    }

    if (typeof data.toPage !== 'string') {
        if (data.toPage.attr('id') == 'menu' && !isAcceptedEULA()) {
            event.preventDefault();
            displayEULA();
        }
    }
});

function onDeviceReadyGeneric() {
    navigator.splashscreen.hide();
    onDeviceReadyInitDB();
}

function onDeviceReadyInitDB() {
    GLOBAL.db = window.openDatabase("HSR", "1.1", "HSR", 20000000);
    initHSRReportDB();
    initHSRSentReportDB();
    initProfile();
}

function getGoogleMapsAPIScript(callbackName) {
    var s = document.createElement('script');
    s.type = 'text/javascript';
    s.src = 'http://maps.googleapis.com/maps/api/js?v=3.9&language=sv&sensor=true&libraries=places&callback=' + callbackName;
    $('head').append(s);
}

function isAcceptedEULA() {
    return localStorage.hsrEULA;
}

function displayEULA() {
    $.mobile.changePage($("#eula"), {transition: 'none'});
    jQuery.get('eula/eula.html', function (data) {
        $('#eulaData').html(data);
    });
}

function acceptEULA() {
    localStorage.hsrEULA = new Date();
    $.mobile.changePage($("#encourageProfile"), {transition: 'none'});
}

function acceptEnterProfile() {
    $.mobile.changePage($("#profile"), {transition: 'none'});
}

function rejectEnterProfile() {
    $.mobile.changePage($("#menu"), {transition: 'none'});
}

function openFacebookPage() {
    window.open('http://www.facebook.com/hallsverigerent', '_blank');
}

function openTwitterPage() {
    window.open('http://twitter.com/HallSverigeRent', '_blank');
}