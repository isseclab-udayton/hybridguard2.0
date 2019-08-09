var qsLocation = "";
getResultsFromQueryStringValue();
function getResultsFromQueryStringValue() {
    var querystring = location.search.replace('?', '').split('&');
    // declare object
    var queryObj = {};
    // loop through each name-value pair and populate object
    for (var i = 0; i < querystring.length; i++) {
        // get name and value
        var name = querystring[i].split('=')[0];
        var value = querystring[i].split('=')[1];
        // populate object
        queryObj[name] = value;
    }
    if (getQueryStringVariable("loc") != "") {
         qsLocation = queryObj["loc"];
    }
}

function getQueryStringVariable(varName) {
    var querystring = location.search.replace('?', '').split('&');
    // declare object
    var queryObj = {};
    // loop through each name-value pair and populate object
    for (var i = 0; i < querystring.length; i++) {
        // get name and value
        var name = querystring[i].split('=')[0];
        var value = querystring[i].split('=')[1];
        // populate object
        queryObj[name] = value;
    }
    if (queryObj[varName] != null && queryObj[varName] != "") {
        return queryObj[varName];
    }
    else {
        return "";
    }
}

/* jQuery document.ready */

$(document).ready(function () {
    if (qsLocation != "")
        getLatLonViaGoogle(qsLocation);
    else {
        $("#txtAddressSplash").focus();
        $("#txtAddress").focus();
    }

    if (getQueryStringVariable("version") == "iphone") {
        showIPhoneFullScreenInstructions();
    }
    $("#btnSubmitSplash").click(function () { submitSplash(); });
    $("#btnGetLatLon").click(function () { getLatLonViaGoogle(); });
    if (!!navigator.geolocation) {
        $("#btnUsePhoneLatLon").toggle();
        $("#btnUsePhoneLatLon").click(function () {
            navigator.geolocation.getCurrentPosition(getSpaceStationPassInfoWithPhoneCoordinates, onGeolocationError, { enableHighAccuracy: false, timeout: 6000, maximumAge: 20000 });
        });
    }

    $("#setLocation").click(function () {
        toggleVisibility();
        getPreviousLocationsFromLocalStorage();
        $("#txtAddress").val("");
        $("#txtAddress").focus();
    });
    setLocalizedText(); //from localization.js
    $("#saturn").click(function () { $("#allResultsContainer").toggle("slow"); });
    $("#spaceStationStart").click(function () { $("#appearsHelp").toggle("slow"); });
    $("#spaceStationMax").click(function () { $("#maxHelp").toggle("slow"); });
    $("#spaceStationEnd").click(function () { $("#endsHelp").toggle("slow"); });
    //$("#suppressAppearsHelp").click(function () { $("#appearsHelp").toggle("slow"); });
    //$("#suppressMaxHelp").click(function () { $("#maxHelp").toggle("slow"); });
    //$("#suppressEndsHelp").click(function () { $("#endsHelp").toggle("slow"); });
    $("#lblClearLocations").click(function () { removeStoredLocations(); });

    getPreviousLocationsFromLocalStorage();
    //This repositions the 3 ISS images correctly; the background degrees grid sizing
    //is controlled via MediaQuery... this call syncs the ISS's to the grid.
    $(window).resize(setSetAllSpaceStationTopValues);
});

function submitSplash() {
    parent.location.href = "index.html?loc=" + $("#txtAddressSplash").val();
}

var SPACE_STATION_ID = "25544";
var PM_AM = "PM";

function getLatLonViaGoogle(desiredCity) {
    var address = desiredCity == null ? $("#txtAddress").val() : desiredCity;
    $("#locationText").text("Getting Location...");
    var geocoder = new google.maps.Geocoder();

    if (geocoder) {
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                $("#locationText").text(results[0].formatted_address);
                $("#lat").val(results[0].geometry.location.lat());
                $("#lng").val(results[0].geometry.location.lng());
                toggleVisibility();
                getSpaceStationPassInfo();
                addToPreviousLocations(address);
            }
            else {
                $("#locationText").text("Error: " + status);
                $("#friendlyMessage").text("Awww, SNAP! - " + friendlyGeocodeErrorMessage(status));
            }
        });
    }
}

//This is for when the user just clicks the use my current location button,
//we need to reverse geocode the lat and lon to get the display address for tweeting
//and emailing as well as display purposes.
function displayCityViaReverseGeocode() {
    var geocoder = new google.maps.Geocoder();
    var lat = parseFloat($("#lat").val());
    var lng = parseFloat($("#lng").val());
    var latlng = new google.maps.LatLng(lat, lng);

    if (!isNaN(lat) && !isNaN(lng)) {
        geocoder.geocode({ 'latLng': latlng }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[1]) {
                    $("#locationText").text(results[1].formatted_address);
                    $("#txtAddress").val(results[1].address_components[0].short_name + "+" + results[1].address_components[2].short_name)
                    setEmailLinkVisible(true);
                    setTweetLink(true);
                }
            }
        }
          )
    }
}

function toggleVisibility() {
    toggleBottomImage();
    $("#enterLocation").toggle();
    $("#setLocation").toggle("slow");
    $("#currentPass").toggle();
}

function toggleBottomImage() {
    var currentImagePath = $('#pageGrid').css("background-image");
    var earthString = "EarthWithGlow";
    var treeString = "treelineLeft";
    var newImagePath = currentImagePath;
    var imageSizeInfo = "360.png";
    if (currentImagePath.indexOf(earthString) > -1) {
        newImagePath = currentImagePath.replace(earthString, treeString);
    }
    else if (currentImagePath.indexOf(treeString) > -1) {
        newImagePath = currentImagePath.replace(treeString, earthString);
    }
    $('#pageGrid').css("background-image", newImagePath)
}

function getSpaceStationPassInfo() {
    clearPassData();
    var satId = SPACE_STATION_ID;
    var lat = $("#lat").val();
    var lng = $("#lng").val();

    $.jsonp(
    {
        url: "http://api.uhaapi.com/satellites/" + satId + "/passes?lat=" + lat + "&lng=" + lng,// + "&lm=0",
        //url: "http://api.uhaapi.com/passes?satid=" + satId + "&lat=" + lat + "&lng=" + lng,
        callbackParameter: "jsonp",
        success: processSpaceStationPassInfo,
        error: function (d, msg) {
            $("#friendlyMessage").text(friendlyUhaapiErrorMessage(msg))
        }

    });

}

function processSpaceStationPassInfo(data, status) {

    var passInfo = data;

    if (passInfo.results != null && passInfo.results.length > 0) {
        setEmailLinkVisible(true)
        setTweetLink(true);
        var passes = passInfo.results;
        for (var counter = 0; counter < passes.length; counter++) {
            var item = passes[counter];
            var startDate = formatDateTime(item.start.time * 1000);
            var endDate = formatDateTime(item.end.time * 1000);
            var itemHtml = "<h4>" + ((counter == 0) ? "Next Pass:" : "Pass #" + (counter + 1)) + "</h4>";
            itemHtml += "<div id='magnitude'>Brightness:" + item.magnitude + " " + convertToFriendlyMagnitude(item.magnitude) + "</div>";
            itemHtml += "<div id='startDate'>Starts: " + startDate + "</div>";
            itemHtml += "<div id='leftDirection'>Appears: " + getDirectionFromAzimuth(item.start.az);
            itemHtml += " Alt:" + item.start.alt + "&deg;</div>";
            itemHtml += "<div id='maxAlt'>Max Altitude: " + item.max.alt + "</div>";
            itemHtml += "<div id='endDate'>Ends: " + endDate + "</div>";
            $("#allResultsContainer").append("<div id='pass" + counter + "' class='pass'>" + itemHtml + "</div>");

            if (counter == 0) {//Display the graphical satellites for the first pass.
            	$("#directionBarStartDate").text(getDateString(item.start.time * 1000));
                $("#maxTime").html(formatTime(new Date(item.max.time * 1000)));
                $("#facingDirection").html(facingDirectionLocalizedText + " <div style='font-weight:bold;color:#fF0;font-size:1.6em;'>" + getDirectionFromAzimuth(item.max.az) + "</div>")
                setSpaceStationVisibility(true);

                $("#startTime").html(formatTime(new Date(item.start.time * 1000)));
                $("#endTime").html(formatTime(new Date(item.end.time * 1000)));
                $("#maxAlt").val(item.max.alt);
                $("#startAlt").val(item.start.alt);
                $("#endAlt").val(item.end.alt);
                setSetAllSpaceStationTopValues();

                if (goesClockwise(item.start.az, item.end.az)) {
                    displayDirectionalImage(item.end.az, $("#rightDirection"));
                    displayDirectionalImage(item.start.az, $("#leftDirection"));
                }
                else {
                    displayDirectionalImage(item.end.az, $("#leftDirection"))
                    displayDirectionalImage(item.start.az, $("#rightDirection"))
                    //reverse direction via float
                    $("#spaceStationStart").attr("class", "spaceStationStageCounterClockwise");
                    $("#spaceStationMax").attr("class", "spaceStationStageCounterClockwise");
                    $("#spaceStationEnd").attr("class", "spaceStationStageCounterClockwise");
                }
            }
        }
    }
    else {
        setEmailLinkVisible(false)
        setTweetLink(false);
        //message string variable from localization.js
        $("#friendlyMessage").text(noVisiblePasses);
    }
}

function setEmailLinkVisible(visible) {
    var loc = $("#txtAddress").val();

    if (visible && loc != "") {
        var mailtoString = "mailto:?subject=You have a great view of the Space Station tonight!&body=Here are viewing details of the view of the space station tonight in " + loc + ": http://spacestationfinder.com/results.html?loc=" + loc.replace(" ", "%2B") + " - Check it out!";
        var mailtoHtml = "<a id='mailtoLink' href='" + mailtoString + "'><img src='images/email.png' alt='email icon saying send viewing info' /></a>";
        $("#chicklets2").html(mailtoHtml);
    }
    else {
        $("#chicklets2").html("");
    }
}

function setTweetLink(visible) {
    var loc = $("#txtAddress").val();
    var tweetLink = "";
    if (loc != "")
        tweetLink = "<a id='b' class='btn' target='_blank' href='https://twitter.com/intent/tweet?original_referer=http%3A%2F%2Flocalhost%3A62712%2Findex.html&source=tweetbutton&text=A%20great%20Space%20Station%20viewing%20opportunity%20in%20" + loc + "%3A%20&url=http%3A%2F%2Fspacestationfinder.com%2Fresults.html%3Floc%3D" + $("#txtAddress").val().replace(' ', '%2B').replace('+', '%2B') + "&via=dshultz'>";
    if (visible && loc != "") {
        //var tweetLink = "<a id='b' class='btn' target='_blank' href='https://twitter.com/intent/tweet?original_referer=http%3A%2F%2Flocalhost%3A62712%2Findex.html&source=tweetbutton&text=A%20great%20Space%20Station%20viewing%20opportunity%20in%20" + $("#txtAddress").val() + "%3A%20&url=http%3A%2F%2Fspacestationfinder.com%2Fresults.html%3Floc%3D" + $("#txtAddress").val().replace(' ', '%2B').replace('+', '%2B') + "&via=dshultz'>";
        tweetLink += "<img src='images/tweet.png' alt='twitter icon saying tweet viewing info' /></a>";
        $("#tweetViewingInfo").html(tweetLink);
    }
    else {
        $("#tweetViewingInfo").html("");
    }
}

function setSetAllSpaceStationTopValues() {
    setSpaceStationTopValue($("#spaceStationMax"), $("#maxAlt").val());
    setSpaceStationTopValue($("#spaceStationStart"), $("#startAlt").val());
    setSpaceStationTopValue($("#spaceStationEnd"), $("#endAlt").val());
}

function setSpaceStationTopValue(station, degrees) {
    var pixelsPerDegree = getPixelsPerDegree();
    var degreesInPixels = degrees * pixelsPerDegree;
    //The 30 accounts for extra padding, lineheight in grid
    station.css("top", ($("#degreesGrid").height() - 33 - Math.round(degreesInPixels)).toString() + "px");
}

function getPixelsPerDegree() {
    //The 33 accounts for extra padding, lineheight in grid
    return ($("#degreesGrid").height() - 33) / 90; //18 pixels are below the grid
}

function clearPassData() {
    $("#allResultsContainer").html("");
    $("#friendlyMessage").text("");
    $("#facingDirection").html("");
    setSpaceStationVisibility(false);
}

function setSpaceStationVisibility(visible) {
    if (visible) {
        $("#spaceStationStart").show("slow");
        $("#spaceStationMax").show("slow");
        $("#spaceStationEnd").show("slow");
    } else {
        $("#spaceStationStart").hide();
        $("#spaceStationMax").hide();
        $("#spaceStationEnd").hide();
    }
}

function formatDateTime(millisecondsSince1970) {
    var actualDate = new Date(millisecondsSince1970);
    var dateMarkup = "<span class='date'>" + (actualDate.getMonth() + 1) + "-" + (actualDate.getDate()) + "-" + actualDate.getFullYear() + " - </span>";
    dateMarkup += formatTime(actualDate, "passTime");
    return dateMarkup;
}

function getDateString(millisecondsSince1970) {
    var actualDate = new Date(millisecondsSince1970);
    return (actualDate.getMonth() + 1) + "-" + (actualDate.getDate()) + "-" + actualDate.getFullYear();
}

function formatTime(time, cssClass) {
    if (!cssClass) { cssClass = "time"; }
    return "<span class='" + cssClass + "'>" + twelveHourConverter(time.getHours(), false) + ":" + zeroAppender(time.getMinutes()) + ":" + zeroAppender(time.getSeconds()) + (time.getHours() > 12 ? " PM" : " AM") + "</span>";
}

function twelveHourConverter(hour, appendZero) {
    if (hour > 12) {
        hour = hour - 12;
        PM_AM = "PM";
    }
    return !!appendZero ? zeroAppender(hour) : hour;
}

function zeroAppender(num) {
    if (num < 10) {
        num = "0" + num;
    }
    return num;
}

function displayDirectionalImage(az, directionDiv) {
    var direction = getDirectionFromAzimuth(az);
    if (direction.match(/\bN\b|\bE\b|\bS\b|\bW\b/)) {
        directionDiv.html("<img alt='" + direction + "' src='images/" + direction.toLowerCase() + ".png' /></div>");
    }
    else {
        directionDiv.html("<div>" + direction + "</div><img alt='" + direction + "' src='images/subDirectionPointer.gif' /></div>");
    }
}

function handleXhrError() {
    $("searchStatus").innerText = "An error occurred.";
    $("searchStatus").show();
}

function convertToWikipediaPath(pageTitle) {
    return pageTitle.replace(" ", "_").replace("'", "%27");
}

function exactMatch(twoDArray) {
    return twoDArray[0].toUpperCase() == twoDArray[1][0].toUpperCase();
}

function notConnected() {

    var template = $("#itemTemplate");
    var hiddenInputHTML = "<span >Not Connected</span><input type='hidden' value='notConnected.html'/>";

    $("#resultsContainer").html("Not Connected: " + hiddenInputHTML);
    $("#resultsContainer").show();
}

/****** lookup functions *********/

//Determines whether we display directions in clockwise
//or counter-clockwise order.
function goesClockwise(startAz, endAz) {
    //return false for all cases where the path goes counter clockwise
    //is shorter distance, otherwise return clockwise.
    if (endAz > 180) {//It could go past 360
        if (startAz > endAz) {//starting point is between 180 and 360, false.
            return false;
        }
        if (endAz - startAz > 180) {//Going clockwise "around the 360".
            return false;
        }
    }
    else {
        if (startAz < endAz) {//end < 180 and start < end go counter
            return false;
        }
        if (((360 - startAz) + endAz) > 180) {//start to 360 + end < 180, so counter.
            return false;
        }
    }
    return true;
}



function getDirectionFromAzimuth(az) {
    switch (az) {
        case 0:
            return "N";
            break;
        case 22.5:
            return "NNE";
            break;
        case 45:
            return "NE";
            break;
        case 67.5:
            return "ENE";
            break;
        case 90:
            return "E";
            break;
        case 112.5:
            return "ESE";
            break;
        case 135:
            return "SE";
            break;
        case 157.5:
            return "SSE";
            break;
        case 180:
            return "S";
            break;
        case 202.5:
            return "SSW";
            break;
        case 225:
            return "SW";
            break;
        case 247.5:
            return "WSW";
            break;
        case 270:
            return "W";
            break;
        case 292.5:
            return "WNW";
            break;
        case 315:
            return "NW";
            break;
        case 337.5:
            return "NNW";
            break;
        default:
            return "Unknown direction:" + az + " degrees clockwise from north."
            break;
    }
}

function convertToFriendlyMagnitude(mag) {
    switch (mag.toString().substring(0, 2)) {
        case "-0":
            return "(Very Dim)";
            break;
        case "-1":
            return "(Dim)";
            break;
        case "-2":
            return "(Fairly Bright)";
            break;
        case "-3":
            return "(Fairly Bright)";
            break;
        case "-4":
            return "(Bright)";
            break;
        case "-5":
            return "(Very bright)";
            break;
        case "6":
            return "(Super bright)";
            break;
        case "-7":
            return "(Super bright)";
            break;
        case "-8":
            return "(As bright as it gets)";
            break;
        default:
            return ""
            break;
    }
}

function friendlyGeocodeErrorMessage(errorCode) {
    switch (errorCode) {//message string variables are from localization.js
        case google.maps.GeocoderStatus.ZERO_RESULTS:
            return geocodeZeroResults;
            break;
        case google.maps.GeocoderStatus.OVER_QUERY_LIMIT:
            return geocodeOverQueryLimit;
            break;
        case google.maps.GeocoderStatus.REQUEST_DENIED:
            return geocodeRequestDenied;
            break;
        case google.maps.GeocoderStatus.INVALID_REQUEST:
            return geocodeInvalidRequest;
            break;
        default:
            return geocodeGeneric + errorCode;
    }
}


function friendlyUhaapiErrorMessage(errorCode) {
    switch (errorCode) {
        //TODO:Find out error codes.     
        //message string variables are from localization.js    
        case "NO_SATELLITE":
            //This error gets returned occasionally when less specific addresses are entered.
            //ie "walla walla", but there still may be pass info if you enter a specific zip, or
            //specific address in walla walla. It may be that the Google geocode coordinates are
            //problematic for some non-specific searches, or this error message is poorly named.
            return uhaapiNoSatellite;
            break;
        default:
            return uhaapiGeneric + errorCode;
    }
}


/*********************************PhoneGap code***********************************/
// Wait for PhoneGap to load
//
document.addEventListener("deviceready", onDeviceReady, false);
document.addEventListener("orientationChanged", setSetAllSpaceStationTopValues)

// PhoneGap is ready
//
function onDeviceReady() {
    showAdMobAds();//We're on a phone, so use AdMob instead of AdSense.
    navigator.geolocation.getCurrentPosition(onGeolocationSuccess, onGeolocationError);
}

// onSuccess Geolocation
//
function onGeolocationSuccess(position) {
    $("#lat").val(position.coords.latitude);
    $("#lng").val(position.coords.longitude);
    $("#btnUsePhoneLatLon").show();
}

function getSpaceStationPassInfoWithPhoneCoordinates(position) {
    $("#lat").val(position.coords.latitude);
    $("#lng").val(position.coords.longitude);
    getSpaceStationPassInfo();
    $("#locationText").text("Where you are now.").appendTo("#locationStatus");
    displayCityViaReverseGeocode();
    toggleVisibility();
}

// onError Callback receives a PositionError object
//
function onGeolocationError(error) {
    var message = "";   
    // Check for known errors
    switch (error.code) {
        case error.PERMISSION_DENIED:
            message = "This website does not have permission to use " + 
                      "the Geolocation API";
            break;
        case error.POSITION_UNAVAILABLE:
            message = "The current position could not be determined. " +
                    "Check your internet connection";
            break;
        case error.PERMISSION_DENIED_TIMEOUT:
            message = "The current position could not be determined " + 
                      "within the specified timeout period.";            
            break;
    }
    if (message!="") {
        toggleVisibility();
        $("#btnUsePhoneLatLon").hide();
        return;
    }
    alert('Error retrieving latitude and longitude information from this phone - but you can still enter a viewing address or ZIP code.\n ErrorCode: ' + error.code + '\n' + 'message: ' + error.message + '\n');
}

function showAdMobAds() { }

/*********************************End PhoneGap code***********************************/


/*********************************HTML5 Local Storage code***********************************/
function addToPreviousLocations(address) {
    if (Modernizr.localstorage) {
        var storedLocations = localStorage.getItem("storedLocations"); //returns triple pipe (|||) delimited string.
        if (storedLocations == null || !locationAlreadyExistsInLocalStorage(address, storedLocations)) {
            storedLocations = address.replace('|', '') + '|||' + storedLocations;
            localStorage.setItem("storedLocations", storedLocations);
        }
    }
}

function locationAlreadyExistsInLocalStorage(address, storageString) {
    return (storageString.indexOf(address) > -1);
}

function getPreviousLocationsFromLocalStorage() {
    if (Modernizr.localstorage) {
        $(".storedLocation").remove();
        var storedLocations = localStorage.getItem("storedLocations") != null ? localStorage.getItem("storedLocations").split('|||') : "";
        var upToMax = storedLocations.length > 5 ? 5 : storedLocations.length;
        for (var counter = 0; counter < upToMax; counter++) {
            $("#storedLocations").append("<div class='storedLocation'>" + storedLocations[counter] + "</div>");
        }
        $(".storedLocation").click(function () { $("#txtAddress").val($(this).text()); getLatLonViaGoogle(); });
    }
}

function removeStoredLocations() {
    if (Modernizr.localstorage) {
        if (confirm(doYouReallyWantToRemoveLocalizedText)) {//from localization.js
            localStorage.setItem("storedLocations", "");
            $(".storedLocation").remove();
        }
    }
}
/*********************************End HTML5 Local Storage code***********************************/

/*********************************iPhone Full Screen Instructions***********************************/

function showIPhoneFullScreenInstructions() {
    // Get a reference to the app mode note.
    var iPhoneFullScreenInstructions = $("#iPhoneFullScreenInstructions");

    // Get a reference to the body.
    var body = $(document.body);

    // Check to see if the window is running in app mode. If
    // it is not, then we want to show the app mode note and
    // bind some event listeners to the scroll.
    if (("standalone" in window.navigator) && !window.navigator.standalone) {

        // This user is running in a "full screen ready"
        // device, but is NOT using the full screen mode.
        // Show the note about full screen.
        iPhoneFullScreenInstructions.show();

        // Now that we have shown the note, we want to bind
        // some special events to get rid of the note when
        // the user tries to interact with the application.
        //
        // We are going to bind the touchStart and touchMove
        // events such that when the user triggers these
        // events, we will hide the app mode note.
        //
        // Notice that we are using nameSpaced events. This
        // is to ensure that when we unbind the events (after
        // the app mode note is removed), we don't remove any
        // other critical event bindints.
        body.bind("touchstart.iPhoneFullScreenInstructions touchmove.iPhoneFullScreenInstructions", function (event) {
            // Prevent the default events. We are doing
            // this both to bring the note to the users
            // attention... and because FIXED position
            // elements on the "view port" are not truly
            // fixed.
            event.preventDefault();

            // Unbind the current event handler such that
            // the user's next attempt to interact with
            // the screen is successful.
            body.unbind("touchstart.iPhoneFullScreenInstructions touchmove.iPhoneFullScreenInstructions");

            // Fade out the full screen note.
            iPhoneFullScreenInstructions.fadeOut(500);
        }
        );

    }
}