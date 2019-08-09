/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */


// running mode DEV/PROD
var runningMode = "PROD";
var defib_photo = "";
var pictureSource;   // picture source
var destinationType;
var pushNotification;
var alert;
//NO MODIFICATION ALLOWED START (JUST MOFIFY runningMode!!!)
var logIt = 1;
var testflightlog = 0;
//NO MODIFICATION ALLOWED END
var media;
var testflight;
window.onerror = function(message, url, lineNumber) {
	if(runningMode == "DEV") {
		//alert("JS Error: " + message + " in " + url + " at line " + lineNumber);
	}
	logDisplay("JS Error: " + message + " in " + url + " at line " + lineNumber);
}

$("form").submit(function() {
	return false;
});
function logDisplay(str) {
	if (logIt == 1) {
		console.log(str);
	}

	if (device.platform == "iOS" && testflightlog == 1) {
		testflight.remoteLog(function() {
		}, function() {
		}, str);
	}

}

var viewstack;
var windowcontroller;
var gaPlugin;
var webViewPlugin;
var navBar = null;
var analytics = null;
var iabClose = null;
var ref = null;
var oldPlatform = false;
var pickerView;
var banner;
var dataBackupPlugin;
var screenDelay = 0;
var currentTab = null;
var heightOfScreen;
var tabBarPlugin;
var teszt_nev;
var telszam;
var app = {
	// Application Constructor
	initialize: function() {
		this.bindEvents();
	},
	// Bind Event Listeners
	//
	// Bind any events that are required on startup. Common events are:
	// 'load', 'deviceready', 'offline', and 'online'.
	bindEvents: function() {
		document.addEventListener('deviceready', this.onDeviceReady, false);
		document.addEventListener('resume', this.onResume, false);

	},
	//resume Event Handler
	//
	//The event fires when an application is retrieved from the background.
	onResume: function() {

		
	},
	// deviceready Event Handler
	//
	// The scope of 'this' is the event. In order to call the 'receivedEvent'
	// function, we must explicity call 'app.receivedEvent(...);'
	onDeviceReady: function() {
		if (runningMode == "PROD") {
			testflightlog = 0;
			logIt = 0;
		}
		var self = this;
		if (device.platform == "Android" || device.platform == "android" || (device.platform == "iOS" && parseFloat(device.version) < 8)) {
			Class.refactor(Moobile.ScrollView, {
				options: {
					scroller: 'Native'
				}
			});
		}
		
		
		

		if (db == null) {
			logDisplay("OPEN DB!!!!!!!!!!!!!!!!!!!!");
			if (device.platform == "iOS") {
				db = window.sqlitePlugin.openDatabase({name: "firstaid_db", bgType: 1});
			}
			else {
				db = window.openDatabase("firstaid_db", "1.0", "FirstAid DB", 1000000);
			}
		}
		//reScheduleInjectionNotifications();
		
		initLang(function() { 
			logDisplay("Initlang ok, start loading...");
                       //alert("intilang "+device.platform);
			registerPushNotification();
			banner = window.plugins.BannerPlugin;
			if (device.platform == "iOS") {
				heightOfScreen = window.innerHeight;
				banner.createWebView(0, heightOfScreen - 99, window.innerWidth, 50);
			}
			else {
				banner.createWebView(0, 0, screen.width, 50);
			}
			//windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.About(), new Moobile.ViewTransition.None);
			if (device.platform == "Android") {
				if (device.version.search('2.') == 0) {
					oldPlatform = true;
				}
				document.addEventListener("backbutton", function(e) {
                                    
					viewstack.popViewController();
				}, true);
				
			}
			initDBAndSetViewstack();

                        
		});
		/* Analytics */
		analytics = navigator.analytics;
		if(runningMode == "DEV") { //TESZT
			analytics.setTrackingId('UA-1802008-37');
		} else {
			analytics.setTrackingId('UA-1802008-33');
		}

	},
	// Update DOM on a Received Event
	receivedEvent: function(id) {
		console.log('Received Event: ' + id);
	}
};
function initDBAndSetViewstack() { 
	ActivityIndicator.show("Betöltés...");
	if (device.platform == "iOS") {
		if (storage.getItem("inditasok") == null) {
			storage.setItem("inditasok", 1);
		} else {
			storage.setItem("inditasok", parseInt(storage.getItem("inditasok"))+1);
		}
		if (device.platform == "iOS") {
			if (parseInt(storage.getItem("inditasok"))%15==0) {
			navigator.notification.confirm(
				    '', // message
				    function onConfirm(buttonIndex) {
				        if (buttonIndex == 3) {
				        	window.open('https://itunes.apple.com/hu/app/webbeteg/id768734559?mt=8', '_blank');
				        }
				    },            // callback to invoke with index of button pressed
				    'Töltse le legújabb alkalmazásunkat is!',           // title
				    ['Köszönöm, nem','Később', 'Megnézem']     // buttonLabels
				);
			}	
		}
	}
	viewstack = new Moobile.ViewControllerStack;
	windowcontroller = new Moobile.WindowController();
	var restSettings = {
		"url": Localization.trans("FIRSTAID_RES_REST_URL") + "/api",
		"error": function(req, status, ex)
		{
			logDisplay("REST error: " + JSON.stringify(req, null, 4) + " " + " ,status: " + JSON.stringify(status, null, 4));
		},
		"success": function() {
			logDisplay("TOKEN REST OK");
		},
		"synchronous": true,
		user: Localization.trans("FIRSTAID_RES_REST_USER"),
		password: Localization.trans("FIRSTAID_RES_REST_PWD"),
		timeout: 3000
	};
	var restClient = new RestClient(restSettings);
	logDisplay("nofirst: " + storage.getItem('nofirst'));
	if (storage.getItem('nofirst') == null) {
		
                            
					logDisplay("success creating DB tables");
					storage.setItem('nofirst', true);
					/* Verziószám beállít */
					var networkState = navigator.connection.type;
					logDisplay(networkState);
					if (networkState != Connection.NONE && networkState != Connection.UNKNOWN) {
						restClient.get({path: "es_settings", success: function(data) {
							
								storage.setItem("version_number", data[0].version);
							}, error: this.syncError});
						sync = new DBSync(restClient, db);
					} else {
						logDisplay("NO NETWORK CONNECTION!");
						storage.setItem("version_number", 0);
						var restSettingsLocal = {
							"url": "data",
							"error": function(req, status, ex)
							{
								logDisplay("REST error: " + JSON.stringify(req, null, 4) + " " + " ,status: " + JSON.stringify(status, null, 4));
							},
							"success": function() {
								logDisplay("REST LOCAL SUCCESS");
							},
							"synchronous": true,
							user: Localization.trans("FIRSTAID_RES_REST_USER"),
							password: Localization.trans("FIRSTAID_RES_REST_PWD"),
							timeout: 3000
						};
						var restClientLocal = new RestClient(restSettingsLocal);
						sync = new DBSync(restClientLocal, db, true);
					}

					sync.copyTable("es_diak", "", function() {
                                              
                                                sync.copyTable("es_diak_valaszok", "", function() {
                                                    sync.copyTable("es_korhazkereso", "", function() {
                                                        sync.copyTable("es_defibrillatorkereso", "", function() {
                                                            sync.copyTable("es_test_quest", "test=4", function() {
                                                                sync.copyTable("es_test_answer", "", function() {
                                                                    sync.copyTable("es_settings", "", function() {
                                                                        sync.copyTable("es_helyzetek", "", function() {
                                                                        	db.transaction(function(tx) {
                                                                                var sqlQuery = "SELECT tesztszoveg, telszam FROM es_settings limit 1";
                                                                                logDisplay(sqlQuery);
                                                                                tx.executeSql(sqlQuery, [],
                                                                                    function(tx, results) {                    
                                                                                        var len = results.rows.length; 
                                                                                            teszt_nev = results.rows.item(0).tesztszoveg;
                                                                                            telszam = results.rows.item(0).telszam;
                                                                                    }, errorSQL);
                                                                            }, errorSQL);
                                                                        	createAndShowTabBar();
                                                                        	
                                                                            viewstack = new Moobile.ViewControllerStack;
                                                                            windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
                                                                            
                                                                        });
                                                                    });
                                                                });
                                                            });
                                                        });
                                                    });
                                                });
						

					


				});

	}
	else {
		/* Nem első indítás, verzió elenőrzés */
		
		logDisplay("Localization.language: " + Localization.language);
		//alert(Localization.language);
		restClient.get({path: "es_settings", success: function(data) {
//				alert(storage.getItem("version_number")+"--"+data[0].value);
			logDisplay(storage.getItem("version_number")+"--"+data[0].version);
				if (parseInt(storage.getItem("version_number")) < parseInt(data[0].version) || storage.getItem("sync_lang") != Localization.language) {
					/* Server verzió nagyobb, sync */
					//alert(data[0].value);
					logDisplay("sync datas nofirst");
					var sync = new DBSync(restClient, db);
					sync.copyTable("es_diak", "", function() {
                                              createAndShowTabBar();
                                                sync.copyTable("es_diak_valaszok", "", function() {
                                                    sync.copyTable("es_korhazkereso", "", function() {
                                                        sync.copyTable("es_defibrillatorkereso", "", function() {
                                                            sync.copyTable("es_test_quest", "test=4", function() {
                                                                sync.copyTable("es_test_answer", "", function() {
                                                                    sync.copyTable("es_settings", "", function() {
                                                                        sync.copyTable("es_helyzetek", "", function() {
                                                                        	storage.setItem("version_number", data[0].version);
                                                                        	storage.setItem("sync_lang", Localization.language);
                                                                            viewstack = new Moobile.ViewControllerStack;
                                                                            windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
                                                                        });
                                                                    });
                                                                });
                                                            });
                                                        });
                                                    });
                                                });
						

					});


				}
				else {
					logDisplay("init root viewcontroller");
					createAndShowTabBar();
					viewstack = new Moobile.ViewControllerStack;
					windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
						
				}
				db.transaction(function(tx) {
                    var sqlQuery = "SELECT tesztszoveg, telszam FROM es_settings limit 1";
                    logDisplay(sqlQuery);
                    tx.executeSql(sqlQuery, [],
                        function(tx, results) {                    
                            var len = results.rows.length; 
                                teszt_nev = results.rows.item(0).tesztszoveg;
                                telszam = results.rows.item(0).telszam;
                        }, errorSQL);
                }, errorSQL);
			}, error: function(req, status, ex) {
				logDisplay("get db version failed");
				logDisplay("init root viewcontroller");
				viewstack = new Moobile.ViewControllerStack;
                                windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);					
			}});
	}
}




//COMMON FUNCTIONS



/* Tab change android */
function tabchange(tab) {
	switch (tab) {
		case "situations":
			viewstack = new Moobile.ViewControllerStack;
			windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
			break;
		case "revivification":
			viewstack = new Moobile.ViewControllerStack;
			windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Revivification(), new Moobile.ViewTransition.None);
			break;
		case "emergency":
			viewstack = new Moobile.ViewControllerStack;
			windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Emergency(), new Moobile.ViewTransition.None);
			break;
		case "more":
			viewstack = new Moobile.ViewControllerStack;
			windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.More(), new Moobile.ViewTransition.None);
			break;
		default:
			break;
	}

}

// PLUGIN METHODS
// TABBAR
var tabBar;
function createAndShowTabBar() {
	ActivityIndicator.hide();
	if (device.platform == 'android' || device.platform == 'Android') {

		logDisplay("TABBAR!!!!");
		tabBarPlugin = window.plugins.TabBarPlugin;
		var options = {
			titlesAsString: "null",
			paramsAsString: "situations;revivification;emergency;more",
			callbackName: 'tabchange',
			buttonSize: '59,6',
			buttonTextSize: '14,true',
			isFullScreen: true,
			backgroundColor: '194.27.23',
			selectionColor: '255.255.255',
			textColor: '0.0.0'
		}
		tabBarPlugin.showTabBar(null, null, options);/*
		viewstack = new Moobile.ViewControllerStack;
        windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
        */
	} else {
		$(".window .window-content-wrapper").height($(".window .window-content-wrapper").height() - 93);
		tabBar = window.plugins.tabBar;
		// Initializating TabBar

		/*
		 * tabBarTintColorRgba: tab háttér szín
		 */
		if (parseFloat(device.version) >= parseFloat("7")) {
			tabBar.create({selectedImageTintColorRgba: "4,153,221,255", tintColorRgba: "4,153,221,255", tabBarTintColorRgba: "247,247,247,255", textColorRgba: "4,153,221,255"});
		} else {
			tabBar.create({selectedImageTintColorRgba: "4,153,221,255", tintColorRgba: "242,242,242,255", textColorRgba: "4,153,221,255"});
		}
		tabBar.createItem(
				"situations",
				Localization.trans("FIRSTAID_RES_0005"),
				"m2.png",
				"m2_active.png",
				"4,153,221,255",
				{"onSelect": function() {
						if (parseInt(new Date().getTime() - screenDelay) > 300) {
							viewstack = new Moobile.ViewControllerStack;
							navBar.setTitle(Localization.trans("FIRSTAID_RES_0005"));
							windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Situations(), new Moobile.ViewTransition.None);
							//currentTab = "home";
							screenDelay = new Date().getTime();
						}
						navBar.hideLeftButton();
					}
				}

		);
		tabBar.createItem(
				"diagnostics",
				Localization.trans("FIRSTAID_RES_0007"),
				"m1.png",
				"m1_active.png",
				"145,145,145,255",
				{"onSelect": function() {
						if (parseInt(new Date().getTime() - screenDelay) > 300) {
							viewstack = new Moobile.ViewControllerStack;
							navBar.setTitle(Localization.trans("FIRSTAID_RES_0007"));
							windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Diagnostics(), new Moobile.ViewTransition.None);
							//currentTab = "diary";
							screenDelay = new Date().getTime();
						}
						navBar.hideLeftButton();
					}
				}
		);
		tabBar.createItem(
				"revivification",
				Localization.trans("FIRSTAID_RES_0009"),
				"m3.png",
				"m3_active.png",
				"145,145,145,255",
				{"onSelect": function() {
						if (parseInt(new Date().getTime() - screenDelay) > 300) {
							viewstack = new Moobile.ViewControllerStack;
							navBar.setTitle(Localization.trans("FIRSTAID_RES_0009"));
							windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Revivification(), new Moobile.ViewTransition.None);
							//currentTab = "catalog";
							screenDelay = new Date().getTime();
						}
						navBar.hideLeftButton();
					}
				}
		);
		tabBar.createItem(
				"emergency",
				Localization.trans("FIRSTAID_RES_0010"),
				"m4.png",
				"m4_active.png",
				"145,145,145,255",
				{"onSelect": function() {
						if (parseInt(new Date().getTime() - screenDelay) > 300) {
							viewstack = new Moobile.ViewControllerStack;
							navBar.setTitle(Localization.trans("FIRSTAID_RES_0010"));
							windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.Emergency(), new Moobile.ViewTransition.None);
							//currentTab = "more";
							screenDelay = new Date().getTime();
						}
						navBar.hideLeftButton();
					}
				}
		);
		tabBar.createItem(
				"more",
				Localization.trans("FIRSTAID_RES_0013"),
				"m5.png",
				"m5_active.png",
				"145,145,145,255",
				{"onSelect": function() {
						if (parseInt(new Date().getTime() - screenDelay) > 300) {
							viewstack = new Moobile.ViewControllerStack;
							navBar.setTitle(Localization.trans("FIRSTAID_RES_0013"));
							windowcontroller.setRootViewController(viewstack).getRootViewController().pushViewController(new ViewController.More(), new Moobile.ViewTransition.None);
							//currentTab = "more";
							screenDelay = new Date().getTime();
						}
						navBar.hideLeftButton();
					}
				}
		);
		// Compile the TabBar
		tabBar.show();
		tabBar.showItems("situations", "diagnostics", "revivification", "emergency", "more");
		//tabBar.selectItem("situations");

		createAndShowNavBar();
	}
}
function createAndShowNavBar() {

	navBar = window.plugins.NavigationBar;
	navBar.create();
	navBar.setTitle(Localization.trans("FIRSTAID_RES_0005"));
	navBar.setupLeftButton(Localization.trans("FIRSTAID_RES_0031"), null, function() {
		viewstack.popViewController();
	});
	
	navBar.setupRightButton(Localization.trans("FIRSTAID_RES_0076"), null, function() {
		viewstack.pushViewController(new ViewController.SendDefib(), new Moobile.ViewTransition.None);
	});
	navBar.setLeftButtonEnabled(true);
	navBar.setRightButtonEnabled(true);
	navBar.hideLeftButton();
	navBar.hideRightButton();
	navBar.show();
}


var show_map = 0;
function showMap(x, y, title_str, gps_X, gps_Y, height, offsetTop) {
    $(".view-layout-vertical:not(.hidden) ." + title_str).css("height",height);
	var myLocation = new google.maps.LatLng(gps_X, gps_Y);
	var targetLocation = new google.maps.LatLng(x, y);	
    map  = new google.maps.Map($(".view-layout-vertical:not(.hidden) ." + title_str)[0], {
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		center: myLocation,
		streetViewControl: false,
		mapTypeControl: false,
		zoom: 15,
		scaleControl: true,
		zoomControl: false
    }); 
    var bounds = new google.maps.LatLngBounds ();
	bounds.extend (myLocation);
	bounds.extend (targetLocation);
	map.fitBounds (bounds);
    var marker = new google.maps.Marker({
	    position: myLocation,
	    map: map,
	    title: 'Jelenlegi pozíció',
	    icon: getMarkerImage("green"),
  	});
    var marker = new google.maps.Marker({
	    position: targetLocation,
	    map: map,
	    title: 'Eredmény',
  	});  	
}
var icons = new Array();

function getMarkerImage(iconColor) {
   if ((typeof(iconColor)=="undefined") || (iconColor==null)) { 
      iconColor = "red"; 
   }
   if (!icons[iconColor]) {
      icons[iconColor] = {
        url: "http://labs.google.com/ridefinder/images/mm_20_"+ iconColor +".png",
        // This marker is 20 pixels wide by 32 pixels tall.
        size: new google.maps.Size(12, 20),
        // The origin for this image is 0,0.
        origin: new google.maps.Point(0,0),
        // The anchor for this image is the base of the flagpole at 0,32.
        anchor: new google.maps.Point(6, 20)};
   } 
   return icons[iconColor];
}

/*
 * Fotós cucc
 * */

function capturePhoto() {
	// Take picture using device camera and retrieve image as base64-encoded string
	
	navigator.camera.getPicture(onPhotoDataSuccess, onFail1, { quality: 70,
	    destinationType: Camera.DestinationType.DATA_URL
	});
	
	}

	function onFail1(message) {
		alert('Failed because: ' + message);
	}

	function onPhotoDataSuccess(imageData) {
	//logDisplay(imageData);
		
		defib_photo = imageData;
		$(".photo-button").html(Localization.trans("FIRSTAID_RES_0078"));
		
	}
	function onPhotoURISuccess(imageURI) {
		
		defib_photo = imageURI;
		$(".photo-button").html(Localization.trans("FIRSTAID_RES_0078"));
		
	    }

	    // A button will call this function
	    //
	    function getPhoto(source) {
	      // Retrieve image file location from specified source
	      navigator.camera.getPicture(onPhotoURISuccess, onFail1, { quality: 50, 
	        destinationType: Camera.DestinationType.DATA_URL,
	        sourceType: source });
	    }
function removeAccent(word) {
	var strAccents = word.split('');
	var strAccentsOut = new Array();
	var strAccentsLen = strAccents.length;
	var accents = 'öüóőúéáű';
	var accentsOut = "ouooueau";
	for (var y = 0; y < strAccentsLen; y++) {
		if (accents.indexOf(strAccents[y]) != -1) {
			strAccentsOut[y] = accentsOut.substr(accents.indexOf(strAccents[y]), 1);
		} else
			strAccentsOut[y] = strAccents[y];
	}
	strAccentsOut = strAccentsOut.join('');
	return strAccentsOut.toLowerCase();
}
function closeAlert() {
	alert.hideAnimated();
}