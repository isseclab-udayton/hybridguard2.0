/*
 * TESTING.js
 * A test suite for Cordova APIs that are executed locally.
 * last revised August 23, 2016
 */

/******************************************************************************/
// BEGIN GEOLOCATION TESTING: Working successfully
/******************************************************************************/

var geoOnSuccess = function(position) {
  alert('Latitude: '          + position.coords.latitude              + '\n' +
        'Longitude: '         + position.coords.longitude             + '\n' +
        'Altitude: '          + position.coords.altitude              + '\n' +
        'Accuracy: '          + position.coords.accuracy              + '\n' +
        'Altitude Accuracy: ' + position.coords.altitudeAccuracy      + '\n' +
        'Heading: '           + position.coords.heading               + '\n' +
        'Speed: '             + position.coords.speed                 + '\n' +
        'Timestamp: '         + position.timestamp                    + '\n' +
        'Source: '            + 'Remote JS file (testing.remote.js)'  + '\n' );
};

// onError Callback receives a PositionError object
function geoOnError(error) {
    alert('code: '    + error.code    + '\n' +
          'message: ' + error.message + '\n');
}

// FOR TESTING LOCAL JAVASCRIPT CALLS
navigator.geolocation.getCurrentPosition(geoOnSuccess, geoOnError);

/******************************************************************************/
// BEGIN CAMERA TESTING: Working successfully
/******************************************************************************/

function imgOnSuccess(imageURI) {
    alert('Success ' + imageURI);
    var image = document.getElementById('myImage');
    image.src = imageURI;
}

function imgOnFail(message) {
    alert('Failed because: ' + message);
}

function takePhoto() {
  navigator.camera.getPicture(imgOnSuccess, imgOnFail, { quality: 50,
    destinationType: Camera.DestinationType.FILE_URI });
}

/******************************************************************************/
// BEGIN CONTACTS TESTING: Not working properly at present
/******************************************************************************/

document.addEventListener("deviceready", onDeviceReady, false);

function contactsOnSuccess(contacts) {
    alert('Found ' + contacts.length + ' contacts.');
};

function contactsOnError(contactError) {
    alert('onError!');
};

function onDeviceReady() {
  // find all contacts
  // var options      = new ContactFindOptions();
  // options.filter   = "";
  // options.multiple = true;
  // options.desiredFields = [navigator.contacts.fieldType.id];
  // options.hasPhoneNumber = true;
  // var fields = [navigator.contacts.fieldType.displayName,
  //               navigator.contacts.fieldType.name];
  // navigator.contacts.find(fields, contactsOnSuccess,
  //                         contactsOnError, options);

  // alert(navigator.contacts);
}

/******************************************************************************/
// END testing.remote.js
/******************************************************************************/
