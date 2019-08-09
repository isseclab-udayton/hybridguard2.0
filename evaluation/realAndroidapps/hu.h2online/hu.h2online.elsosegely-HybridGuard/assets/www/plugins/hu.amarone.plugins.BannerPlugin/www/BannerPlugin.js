cordova.define("hu.amarone.plugins.BannerPlugin.BannerPlugin", function(require, exports, module) {
function BannerPlugin() {
	this.resultCallback = null;
	this.actualHeight = 0;
	this.show = false;
}

BannerPlugin.prototype.loadUrl = function(url, clickEvent, isWebPage, size) {
	var defaults = {
		url: url,
		isWebPage: isWebPage,
		size: size
	}
	this.resultCallback = clickEvent;
	this.actualHeight = size;
	cordova.exec(clickEvent, null, "BannerPlugin", "loadUrl", [defaults]);
}

BannerPlugin.prototype.loadPromoBanner = function(adunitid, clickEvent) {
	var defaults = {
		adunitid: adunitid
	}
	this.resultCallback = clickEvent;
	cordova.exec(clickEvent, null, "BannerPlugin", "loadPromoBanner", [defaults]);
}
BannerPlugin.prototype.showPromoBanner = function(clickEvent) {
	this.resultCallback = clickEvent;
	cordova.exec(clickEvent, null, "BannerPlugin", "showPromoBanner", []);
}

BannerPlugin.prototype.hideWebView = function() {
	logDisplay("hideWebView");
	if (this.show == true) {
		this.show = false;
		/*logDisplay("really hideWebView");
		 logDisplay("Magasság: " + $(".window .window-content").height());
		 logDisplay(this.actualHeight);*/
		$(".window .window-content").height(parseInt($(".window .window-content").height()) + parseInt(this.actualHeight));
		cordova.exec(null, null, "BannerPlugin", "hideWebView", []);

	}
}

BannerPlugin.prototype.showWebView = function() {
	logDisplay("showWebView");
	if (this.show == false) {
		this.show = true;
		/*logDisplay("really showWebView");
		 logDisplay("Magasság: " + $(".window .window-content").height());
		 logDisplay(this.actualHeight);*/
		$(".window .window-content").height(parseInt($(".window .window-content").height()) - parseInt(this.actualHeight));
		cordova.exec(null, null, "BannerPlugin", "showWebView", []);
	}
}

BannerPlugin.prototype.createWebView = function(startx, starty, width, height) {
	var defaults = {
		height: height,
		width: width,
		startx: startx,
		starty: starty
	}

	cordova.exec(null, null, "BannerPlugin", "createWebView", [defaults]);
}

BannerPlugin.prototype.resize = function(startx, starty, width, height) {
	var defaults = {
		height: height,
		width: width,
		startx: startx,
		starty: starty
	}
	cordova.exec(null, null, "BannerPlugin", "resize", [defaults]);
}

BannerPlugin.prototype.doubleSize = function() {
	cordova.exec(null, null, "BannerPlugin", "doubleSize", []);
}

BannerPlugin.prototype.singleSize = function() {
	cordova.exec(null, null, "BannerPlugin", "singleSize", []);
}
BannerPlugin.prototype.onBannerClicked = function(url) {
	logDisplay("banner clicked");
	if (typeof (this.resultCallback) == 'function') {
		this.resultCallback(url);
	}
}

cordova.addConstructor(function() {
	if (!window.plugins)
	{
		window.plugins = {};
	}

	// shim to work in 1.5 and 1.6
	if (!window.Cordova) {
		window.Cordova = cordova;
	}
	;

	window.plugins.BannerPlugin = new BannerPlugin();
});
});
