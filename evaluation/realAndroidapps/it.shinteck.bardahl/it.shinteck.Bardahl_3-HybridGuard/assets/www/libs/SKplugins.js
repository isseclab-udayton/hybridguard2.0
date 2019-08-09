/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * get the hardware Mac address
 * usage window.plugins.macaddress.getMacAddress();
 * 
 * successCallBack(object) -> object.mac contains mac string
 * errorCallBack(error) -> error is the error string
 */
var MacAddress = function() { };

MacAddress.prototype.getMacAddress = function(success, fail) { //MacAddress.prototype.getMacAddress = function(params, success, fail) {
    success = success ? success : function() {};
    fail = fail ? fail : function() {};
    //var parametro = params.mioparametro; window.plugins.startapp.start({mioparametro: 'unparametro'},successCallback, failureCallback);
    cordova.exec(success, fail, 'MacAddress', 'getMacAddress', []);
};

/*
 *ADD PLUGINS to window object
 *
*/

if(!window.plugins) {
    window.plugins = {};
}
if (!window.plugins.macaddress) {
    window.plugins.macaddress = new MacAddress();
}
