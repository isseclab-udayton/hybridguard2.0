cordova.define("hu.amarone.plugins.TabBarPlugin.TabBarPlugin.TabBarPlugin", function(require, exports, module) {
function TabBarPlugin() {
}

TabBarPlugin.prototype.showTabBar = function(successCallback, errorCallback, options) {
    
    var defaults = {
    titlesAsString: "first;sec",
    paramsAsString: "first;sec",
    callbackName: 'logDisplay',
    buttonSize: '50,6',
    buttonTextSize: '14,true',
    isFullScreen: true,
    backgroundColor: '255.255.255',
    selectionColor: '200.200.200',
    textColor: '0.0.0'
    };
    
    for (var key in defaults) {
        if (key in options) {
            defaults[key] = options[key];
        }
    }
    
	cordova.exec(successCallback, errorCallback, "TabBarPlugin", "showTabBar", [defaults]);
}

TabBarPlugin.prototype.hideTabBar = function(successCallback, errorCallback, options) {
    
	cordova.exec(successCallback, errorCallback, "TabBarPlugin", "hideTabBar", [false]);
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
                       
                       window.plugins.TabBarPlugin = new TabBarPlugin();
                       });
});
