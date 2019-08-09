cordova.define("com.webratio.apptools.apptools", function(require, exports, module) {
var appTools = {

    restart: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AppTools', 'restart', []);
    }
	
};

module.exports = appTools;
});
