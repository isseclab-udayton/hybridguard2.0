function geoLocationLookup(onSuccess, onError) {
    navigator.geolocation.getCurrentPosition(onSuccess, onError,
        {
            maximumAge: 5000,
            timeout: 60000,
            enableHighAccuracy: true
        }
    );
}