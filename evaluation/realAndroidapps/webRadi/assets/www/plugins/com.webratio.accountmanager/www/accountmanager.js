cordova.define("com.webratio.accountmanager.accountmanager", function(require, exports, module) {
var accountManger = {

    clear: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'clear', []);
    },

    setToken: function(token, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'setToken', [ token ]);
    },

    getToken: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'getToken', []);
    },

    setPassword: function(password, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'setPassword', [ password ]);
    },

    getPassword: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'getPassword', []);
    },

    setUsername: function(username, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'setUsername', [ username, ]);
    },

    getUsername: function(successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'getUsername', []);
    },

    enableSharing: function(group, teamId, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'enableSharing', [ group, teamId ]);
    },

    setPackage: function(packageId, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, 'AM', 'setPackage', [ packageId ]);
    },

    getDeviceId: function(successCallback, errorCallback) {
        if (device.platform == "iOS" || device.platform == "Win32NT") {
            return cordova.exec(successCallback, errorCallback, 'AM', 'getDeviceId', []);
        }
        return device.uuid;
    },

    loginPrompt: function(message, successCallback, options) {
        var _title = options.title || "Login";
        var _buttonLabels = (options.buttonLabels || [ "OK", "Reset", "Exit" ]);
        var _usernameDefault = options.usernameDefault;
        var _usernameReadOnly = options.usernameReadOnly || false;

        cordova.exec(successCallback, null, 'AM', 'loginPrompt',
                [ message, _title, _buttonLabels, _usernameDefault, _usernameReadOnly ]);
    }
};

module.exports = accountManger;
});
