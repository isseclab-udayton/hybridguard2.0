

var storage = window.localStorage;
var controllerClass;
var listController;
var infoController;
var ViewController = {
	Component: {},
	Event: {}
};
var eventTime = 0;
var switcherName = "";
var db = null;
var currentBanner;
var eventTime = 0;
var switcherName = "";
ViewController.MainViewController = new Class({
	Extends: Moobile.ViewController,
	sync: null,
	iosBackButton: false,
	navBarTitle: '',
	restClient: null,
	activityIndicator: null,
	screenName: null,
	alertBox: null,
	banerZone: null,
	loadView: function() {
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
			password: Localization.trans("FIRSTAID_RES_REST_PWD")

		};

		this.restClient = new RestClient(restSettings);

		this.sync = new DBSync(this.restClient, db);
		//this.sync.initFileSystem();
		this.activityIndicator = new Moobile.ActivityIndicator();
		this.view.addChildComponent(this.activityIndicator);
		this.activityIndicator.hide();

		if (this.screenName != null) {
			this.logScreen(this.screenName);
		}
		
		
	},
	viewDidBecomeReady: function() {
                Localization.apply_to_current_html();
		this.parent();		
	},
	viewWillEnter: function() {
		var self = this;
		var networkState = navigator.connection.type;

		if (this.screenName != null && networkState != Connection.NONE && networkState != Connection.UNKNOWN) {
			if (this.screenName.search("helyzetek") != -1) {
				this.getBannerByZone("helyzetek");
			} else {
				this.getBannerByZone(this.screenName);
			}
			
		} else {
			banner.hideWebView();
		}
		

		this.parent();
	},
	showBannerPage: function(url) {
		var self = this;
		logDisplay(url);
		if (url != "about:blank") {
			window.open(url, '_blank', 'location=yes');
			self.logEvent("banner", "click", '{"url":"' + url + '"}', 1);
		}

	},
	getBannerByZone: function(zone_name) {
		var self = this;
		logDisplay("BANNER GET"); 
		self.restClient.get({
			path: "banners?zone=" + zone_name,
			success: function(data) {
				logDisplay("get banner OK");
				logDisplay(JSON.encode(data));
				for (var k = 0; k < data.length; k++) {
					currentBanner = data[k].text;
					banner.hideWebView();

                                        banner.loadUrl('/18657929/Elsősegély_footer', self.bound("showBannerPage"), "false", "50");
				
//                                      banner.loadUrl(data[k].text, self.bound("showBannerPage"), "false", data[k].height);
//					self.logEvent("banner", "view", '{"banner_id":"' + data[k].id + '"}', 1);

					banner.showWebView();
				}
			},
			error: function(error) {
				logDisplay(error);
				logDisplay("REST error code: " + error.status);
				if (error.status == 404) {
					banner.hideWebView();
				}
			}
		});
	},
	logScreen: function(screenName) {
		//alert(device.platform + "/" +screenName);
		
		if (typeof analytics != "undefined") {
			analytics.sendAppView(device.platform + "/" + screenName, function() {
				logDisplay("Analytics SCREEN DONE");
			}, function() {
				logDisplay("Analytics SCREEN ERROR");
			});
		}
	},
	logEvent: function(category, action, label, value) {/*
		if (typeof analytics != "undefined") {
			analytics.sendEvent(category, action, label, value,
					function() {
						logDisplay("Analytics EVENT DONE");
					}, function() {
				logDisplay("Analytics EVENT ERROR");
			});
		}*/
	},
	destroy: function() {
		logDisplay("view destroy");
		this.parent();
	},
	viewWillLeave: function() {
		logDisplay("viewWillLeave");
		this.parent();
	},
	backToPrevView: function() {
		viewstack.popViewController();
	},
	showMessage: function(message, title, buttonname) {
		if (typeof buttonname == "undefined") {
			buttonname = Localization.trans("FIRSTAID_RES_0002");
		}
		navigator.notification.alert(
				message, // message
				function() {
				}, // callback
				title, // title
				buttonname                  // buttonName
				);
	},
	showError: function(message) {
		navigator.notification.alert(
				message, // message
				function() {
				}, // callback
				Localization.trans("FIRSTAID_RES_0001"), // title
				Localization.trans("FIRSTAID_RES_0002")                 // buttonName
				);
	},
	errorCB: function(err) {
		logDisplay("SQL ERROR " + err.code + " : " + err.message);
	},
	getTime: function() {
		var self = this;
		return Math.round((new Date()).getTime() / 1000);
	},
	numberFormat: function(number, decimals, dec_point, thousands_sep) {

		number = (number + '')
				.replace(/[^0-9+\-Ee.]/g, '');
		var n = !isFinite(+number) ? 0 : +number,
				prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
				sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
				dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
				s = '',
				toFixedFix = function(n, prec) {
					var k = Math.pow(10, prec);
					return '' + (Math.round(n * k) / k)
							.toFixed(prec);
				};
		// Fix for IE parseFloat(0.55).toFixed(0) = 0;
		s = (prec ? toFixedFix(n, prec) : '' + Math.round(n))
				.split('.');
		if (s[0].length > 3) {
			s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		}
		if ((s[1] || '')
				.length < prec) {
			s[1] = s[1] || '';
			s[1] += new Array(prec - s[1].length + 1)
					.join('0');
		}
		return s.join(dec);
	}
});


