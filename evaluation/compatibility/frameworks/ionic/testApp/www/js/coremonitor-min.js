/*
Self-Protecting JavaScript Code
By Phu Phung
*/
(function(){
    /*** DO NOT CHANGE FROM HERE*/
    //store builtin functions to keep their original implementations
    var $Array = Array;
    var $Object = window.Object;
    var hasOwnProperty = Object.prototype.hasOwnProperty;
    var builtins = {}
    builtins.__proto__ = null;
    with (Function.prototype)
        builtins.Function = { apply: apply, call: call, /*toSource: toSource,*/toString: toString };


    /********************** Begin the code IRM code ******************************/
    //The common monitor function to intercept a function call with a policy
    var monitorMethod = function(object, method, policy) {
        // Find function corresponding to alias
        while (!hasOwnProperty.call(object, method) && object.__proto__)
            object = object.__proto__;
        if (object === null)
            throw new Error('Failed to find function for alias ' + method);
        var original = object[method];
        if ((original === null) || (original === undefined))
            throw new Error('No method ' + method +'found for '+object);
        //make sure to call the original apply function
        original.apply = builtins.Function.apply;
        object[method] = function wrapper() {
            var object = this;
            var orgArgs = arguments;
            var proceed = function() {
                return original.apply(object, orgArgs);
            }
            return policy(orgArgs, proceed,object);
        }
    }

    /* DO NOT CHANGE FROM ABOVE */
    /* BEGIN POLICIES */

    // A basic demo
    var alert_policy = function(args, proceed, object) {
      args[0] = 'Alert policy enforced: ' + args[0];
      return proceed();//run the original method
    };

    // Cordova geolocation API
    var location_policy = function(args, proceed, object) {
      alert("Inside geolocation policy");
      return proceed();//run the original method
    };

    // Cordova camera API
    var camera_policy = function(args, proceed, object) {
      alert("Inside camera policy");
      return proceed();//run the original method
    };

    /* BEGIN MONITORING CALLS */

    // monitorMethod(navigator.geolocation, 'getCurrentPosition', location_policy);

    /* Having issues */
    // monitorMethod(navigator.camera, 'getPicture', camera_policy); // Doesn't work
    // monitorMethod(null, 'takePhoto', camera_policy);
})();
