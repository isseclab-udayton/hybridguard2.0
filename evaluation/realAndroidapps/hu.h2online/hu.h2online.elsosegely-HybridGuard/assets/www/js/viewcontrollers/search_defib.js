ViewController.SearchDefib = new Class({
    Extends: ViewController.MainViewController,
    send_defib_button: null,
    loadView: function() {
        this.view = Moobile.View.at('templates/search_defib.html');
        this.screenName = "defibrillatorkereso";
        this.parent();
        this.send_defib_button = this.view.getChildComponent('send-defib-button');
    	this.send_defib_button.addEvent('tap', this.bound('sendDefib'));
        this.send_defib_button.setLabel(Localization.trans("FIRSTAID_RES_0076"));
    },
    viewDidLoad: function() {
    	this.parent();
    },
    viewDidBecomeReady: function() {
    	$("body").off("click", ".show-image");
        $("body").on("click", ".show-image", function() {
        	if (parseInt(new Date().getTime() - screenDelay) > 300) {
        		$(".defib-map").css("display", "none");
                $(".defib-keresok-kep").css("display", "block");
                $(".show-on-map").css("display", "block");
                $(this).css("display", "none");
				screenDelay = new Date().getTime();
			}
            
        });
        $("body").off("click", ".show-on-map");
        $("body").on("click", ".show-on-map", function() {
        	if (parseInt(new Date().getTime() - screenDelay) > 300) {
        		$(".defib-map").css("display", "block");
                $(".defib-keresok-kep").css("display", "none");
                $(".show-image").css("display", "block");
                $(this).css("display", "none");
                screenDelay = new Date().getTime();
        	}
        	
        });
    	this.parent();
    },
    viewWillEnter: function() {
    	$(".show-image").hide();
        
        if (device.platform == "iOS") {
            navBar.showLeftButton();
        	navBar.showRightButton();
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
            var sqlQuery = "SELECT * FROM es_defibrillatorkereso";
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
                    var kozelebbi_kep = "";
                    logDisplay("OK!");
				
                    for (var i = 0; i < len; i++) {
                        var lat2 = results.rows.item(i).x;
                        var lon2 = results.rows.item(i).y;
                        var tav_uj = Math.acos(Math.sin(gps_X) * Math.sin(lat2) + Math.cos(gps_X) * Math.cos(lat2) * Math.cos(lon2 - gps_Y)) * Radius;
                        if (tav_uj < tav || i == 0) {
                            tav = tav_uj;
                            kozelebbi_cim = results.rows.item(i).iranyitoszam + " " + results.rows.item(i).telepules + ", " + results.rows.item(i).cim + "<br>" + results.rows.item(i).telefon;
                            kozelebbi_nev = results.rows.item(i).hely + " " + results.rows.item(i).elerhetoseg;
                            kozelebbi_x = results.rows.item(i).x;
                            kozelebbi_y = results.rows.item(i).y;
                            kozelebbi_kep = results.rows.item(i).kep_url;
                        }
                    }
                    $(".search-defib-view #t_nev").html('<strong>'+kozelebbi_nev+"</strong>");
                    $(".search-defib-view #t_cimek").html(kozelebbi_cim);
                    if (kozelebbi_kep) {
                    	$(".show-image").show();
                    } else {
                    	$(".show-image").hide();
                    }
                    $(".defib-keresok-kep").attr("src", Localization.trans("FIRSTAID_RES_REST_URL")+"/"+kozelebbi_kep);
                    //alert(Localization.trans("FIRSTAID_RES_REST_URL")+"/"+kozelebbi_kep);

                    showMap(kozelebbi_x, kozelebbi_y, "defib-map", gps_X, gps_Y, 200, $(".window .window-content-wrapper").height()-250);
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
    sendDefib: function() {
    	viewstack.pushViewController(new ViewController.SendDefib(), new Moobile.ViewTransition.None);
    },
    destroy: function() {
        plugin.mapKit.hideMap();
        this.news = {};
        this.news = null;
        this.parent();
    }

});
