    function loadKanaka() {
        document.addEventListener("deviceready", onDeviceReadyKanaka, false);
        $.get('kanaka/splash.html', function(data) {
            $('div#main_content').html(data);
        });
    }

    var locations = [
        { "name": "Village Cross Roads", "lat": "45.62245", "lon": "-122.666933", "seen": false },
        { "name": "Fenceline along path, by House 2", "lat": "45.622533", "lon": "-122.667717", "seen": false },
        { "name": "Third Spot", "lat": "45.622617", "lon": "-122.66845", "seen": false },
        { "name": "Kanaka Billies", "lat": "45.6227114", "lon": "-122.6683808", "seen": false },
        { "name": "Tayenta&#146;s House", "lat": "45.6222711", "lon": "-122.6686914", "seen": false },
        { "name": "House 1", "lat": "45.622717", "lon": "-122.668133", "seen": false },
        { "name": "House 5", "lat": "45.6234631", "lon": "-122.6669011", "seen": false },
        { "name": "House 2 Doorway", "lat": "45.6226637", "lon": "-122.6678091", "seen": false },
        { "name": "Village Gate", "lat": "45.6216364", "lon": "-122.6670403", "seen": false },
        { "name": "House 1 Path", "lat": "45.622583", "lon": "-122.668183", "seen": false },
        { "name": "Newspaper Quiz 1", "lat": "45.62275", "lon": "-122.6678", "seen": false },
        { "name": "Node 29", "lat": "45.622667", "lon": "-122.668183", "seen": false },
        { "name": "Node 30", "lat": "45.6227", "lon": "-122.668117", "seen": false },
        { "name": "Node 28", "lat": "45.622567", "lon": "-122.66805", "seen": false },
        { "name": "Lincoln Quiz", "lat": "45.622667", "lon": "-122.66775" , "seen": false}, 
        { "name": "Kane 1", "lat": "45.622452", "lon": "-122.667035", "seen": false },
        { "name": "Kane 2", "lat": "45.622542", "lon": "-122.666896", "seen": false },
        { "name": "Kane 3", "lat": "45.622586", "lon": "-122.666872", "seen": false },
        { "name": "Kane 4", "lat": "45.622577", "lon": "-122.666842", "seen": false }
    ];

    var watchID = null;
    var NodeHistory = [];

    // PhoneGap is ready
    function onDeviceKanakaReady() {
        // Update every 3 seconds
        var options = { maximumAge: 2000, enableHighAccuracy: true  };
        watchID = navigator.geolocation.watchPosition(onSuccessKanaka, onErrorKanaka, options);
    }

    // onSuccess Geolocation
    function onSuccessKanaka(position) {
        var p1 = new LatLon(Geo.parseDMS(position.coords.latitude), Geo.parseDMS(position.coords.longitude));


        for (var i = 0; i < locations.length; i++) {
            loc_data = locations[i];
            var p2 = new LatLon(Geo.parseDMS(loc_data.lat), Geo.parseDMS(loc_data.lon));
            //alert((p1.distanceTo(p2) * 1000));
            if ((p1.distanceTo(p2) * 1000) < 5) {

                // Vibrate the phone for 2 seconds.

                if (loc_data.name == "Village Cross Roads" && !loc_data.seen) {
                    alert('You discovered something here.');
                    navigator.notification.vibrate(2000);
                    locations[i].seen = true;

                    $.mobile.changePage('video.html?video=shine_intro_final_edit.mp4');
                }
                else if (loc_data.name == "Fenceline along path, by House 2" && !loc_data.seen) {
                    alert('You discovered something here.');
                    navigator.notification.vibrate(2000);
                    locations[i].seen = true;

                    $.mobile.changePage('video.html?video=wilson_in_pit_final_edit.mp4');
                }
            }
        }

        /*
        var element = document.getElementById('geolocation');
        element.innerHTML = 'Latitude: '  + position.coords.latitude      + '<br />' +
                            'Longitude: ' + position.coords.longitude     + '<br />' +
                            '<hr />'      + element.innerHTML;
                            */
    }

    // onError Callback receives a PositionError object
    function onErrorKanaka(error) {
        alert('code: '    + error.code    + '\n' +
              'message: ' + error.message + '\n');
    }


