ViewController.SearchHospital = new Class({
    Extends: ViewController.MainViewController,
    loadView: function() {
        this.view = Moobile.View.at('templates/search_hospital.html');
        this.screenName = "korhazkereso";
        this.parent();
    },
    viewDidLoad: function() {
    	this.parent();
    },
    viewDidBecomeReady: function() {
    	
    	this.parent();
    },
    viewWillEnter: function() {
        
        
        if (device.platform == "iOS") {
            navBar.showLeftButton();
        }
		
        navigator.geolocation.getCurrentPosition(this.onSuccessLocationDefib, this.onErrorLocation, {
            maximumAge: 15000, 
            timeout: 15000, 
            enableHighAccuracy: true
        });
        this.parent();
    },
    onSuccessLocationDefib: function(position) {
		var self = this;
        var controller = this;
        var gps_X = position.coords.latitude;
        var gps_Y = position.coords.longitude;
        logDisplay(gps_X + " " + gps_Y);
        
        db.transaction(function(tx) {
            var sqlQuery = "SELECT * FROM es_korhazkereso";
            logDisplay(sqlQuery);
            tx.executeSql(sqlQuery, [],
                function(tx, results) {                      
                    var len = results.rows.length;
                    var Radius = 6371;
                    var tav = 0;
                    var kozelebbi_cim = "";
                    var kozelebbi_nev = "";
                    var kozelebbi_x = 0;
                    var kozelebbi_y = 0;
                    logDisplay("OK!");
				
                    for (var i = 0; i < len; i++) {
                        var lat2 = results.rows.item(i).x;
                        var lon2 = results.rows.item(i).y;
                        var tav_uj = Math.acos(Math.sin(gps_X) * Math.sin(lat2) + Math.cos(gps_X) * Math.cos(lat2) * Math.cos(lon2 - gps_Y)) * Radius;
                        if (tav_uj < tav || i == 0) {
                            tav = tav_uj;
                            kozelebbi_cim = results.rows.item(i).megye + " " + results.rows.item(i).telepules + ", " + results.rows.item(i).cim + "<br>" + results.rows.item(i).telefon;
                            kozelebbi_nev = results.rows.item(i).nev;
                            kozelebbi_x = results.rows.item(i).x;
                            kozelebbi_y = results.rows.item(i).y;
                        }
                    }
                    $(".search-hospital-view #t_nev").html('<strong>'+kozelebbi_nev+"</strong>");
                    $(".search-hospital-view #t_cimek").html(kozelebbi_cim);
                    
                    showMap(kozelebbi_x, kozelebbi_y, "hospital-map", gps_X, gps_Y, 200, $(".window .window-content-wrapper").height()-250);
                }, self.errorCB);
        }, self.errorCB);
		
		
    },
    onErrorLocation: function() {
        var controller = this;
        if (device.platform == "android" || device.platform == "Android") {
								
            navigator.notification.alert(
                Localization.trans("FIRSTAID_RES_0032"), // message
                function() {
                    viewstack.popViewController();
                }, // callback
                Localization.trans("FIRSTAID_RES_0001"), // title
                Localization.trans("FIRSTAID_RES_0002")
                // buttonName
                );
        } else {
            navigator.notification.alert(
                Localization.trans("FIRSTAID_RES_0032"), // message
                function() {
                    viewstack.popViewController();
                }, // callback
                Localization.trans("FIRSTAID_RES_0001"), // title
                Localization.trans("FIRSTAID_RES_0002")
                // buttonName
                );		
        }				


    },
    destroy: function() {
        plugin.mapKit.hideMap();
        this.news = {};
        this.news = null;
        this.parent();
    }

});
