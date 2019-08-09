//http://maps.googleapis.com/maps/api/geocode/json?latlng=59.40370,17.94129&language=sv&sensor=true
var getLocationTimer;
var getLocationTimedOut = false;

function getAddress(lat, lng, onSuccess, onError) {
    getLocationTimedOut = false;
    if (lat > 0 && lng > 0) {
        if (typeof google != 'undefined') {
            var latlng = new google.maps.LatLng(lat, lng);
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                if (!getLocationTimedOut) {
                    clearTimeout(getLocationTimer);
                    if (status == google.maps.GeocoderStatus.OK) {

                        var addressData = {
                            addressStreetNbr: "",
                            addressStreet: "",
                            addressZipCode: "",
                            addressCity: "",
                            addressMunicipality: "",
                            addressCountry: "",
                            formattedAddress: ""
                        };

                        addressData.formattedAddress = results[0].formatted_address;
                        for (var i = 0; i < results.length; i++) {
                            var result = results[i];
                            getComponents(result.address_components, addressData);
                        }
                        if (onSuccess && typeof(onSuccess) === "function") {
                            onSuccess(addressData);
                        }
                    }
                }
            });

            getLocationTimer = setTimeout(function () {
                getLocationTimedOut = true;
                if (onError && typeof(onError) === "function") {
                    onError();
                }
            }, 10000);
        }
    } else {
        $('#address').text();
    }

    function getComponents(addressComponentsArray, locationData) {
        var componentTypes = ['street_number', 'route', 'postal_code', 'postal_town', 'administrative_area_level_2', 'country'];
        for (var i in componentTypes) {
            for (var j = 0; j < addressComponentsArray.length; j++) {
                var addressComponent = addressComponentsArray[j];
                if (addressComponent.types.indexOf(componentTypes[i]) != -1) {
                    switch (componentTypes[i]) {
                        case 'street_number':
                            locationData.addressStreetNbr = addressComponent.long_name;
                            break;
                        case 'route':
                            locationData.addressStreet = addressComponent.long_name;
                            break;
                        case 'postal_code':
                            locationData.addressZipCode = addressComponent.long_name;
                            break;
                        case 'postal_town':
                            locationData.addressCity = addressComponent.long_name;
                            break;
                        case 'administrative_area_level_2':
                            locationData.addressMunicipality = addressComponent.long_name;
                            break;
                        case 'country':
                            locationData.addressCountry = addressComponent.long_name;
                            break;
                    }
                    break;
                }
            }
        }
        return locationData;
    }
}

function resetFormAddress() {
    $('#street').val("");
    $('#streetNbr').val("");
    $('#zipCode').val("");
    $('#city').val("");
    $('#municipality').val("");
    $('#country').val("");
}

function setFormAddress(addressData) {
    $('#street').val(addressData.addressStreet);
    $('#streetNbr').val(addressData.addressStreetNbr);
    $('#zipCode').val(addressData.addressZipCode);
    $('#city').val(addressData.addressCity);
    $('#municipality').val(addressData.addressMunicipality);
    $('#country').val(addressData.addressCountry);
    $('#address').text(addressData.formattedAddress);
    $('#addressAutocomplete').val(addressData.addressStreet + ' ' + addressData.addressStreetNbr + ', ' + addressData.addressCity + ', ' + addressData.addressCountry);
}

function formAddressError() {
    $('#address').text("Adressuppslagning misslyckades. Försöker igen när rapporten skickas.");
}