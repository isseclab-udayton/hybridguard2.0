(function(){
var debug = true;
function irm_log(s){
       if((!debug) || (!console.log)) return;
       console.log('IRM log:'+s);
}
 //store builtin functions to keep their original implementations
    var $Array = Array;
    var $Object = window.Object;
    //var lookupSetter = Object.prototype.__lookupSetter__;
    //var lookupGetter = Object.prototype.__lookupGetter__;
    //var defineSetter = Object.prototype.__defineSetter__;
    //var defineGetter = Object.prototype.__defineGetter__;
    var hasOwnProperty = Object.prototype.hasOwnProperty;
    var builtins = {}

    builtins.__proto__ = null;
    with (Function.prototype)
        builtins.Function = { apply: apply, call: call, /*toSource: toSource,*/toString: toString };

    // Create a function from a string.  Note that functions created with
    // the Function constructor DO NOT get a scope chain that includes the
    // current lexical scope; their scope chains include only the global
    // context.  To export local function declarations, we do some simple
    // parsing of the string form of the function and append commands that
    // explicitly export each definition.  Ads can obviously defeat this
    // process in a variety of ways, but doing so just harms themselves.

    function makeFunction(body) {
      if(body==undefined) throw new Error('makeFunction error: No code to make a function.');
      var locals = body.match(/function\s+\w+\(/g);
      if (locals) {
        body += ';';
        for (var i=0; i<locals.length; ++i) {
          var fname = locals[i].slice(8).match(/\w+/);
          body += 'if(typeof('+fname+')!="undefined")window.'+fname+'='+fname+';';
        }
      }
      //irm_log("makeFunction, body="+irm_log;)
      return new Function(body);
    }

    // Implement a shadow stack as a list.
    var shadowStack = [];

    // Other code may read (but not write) the current principal.
    thisPrincipal = function(){
      if (shadowStack.length <1)
          return '';
      else {
      	console.log("shadowStack.length = " + shadowStack.length + " shadowStack[shadowStack.length-1] = " + shadowStack[shadowStack.length-1]);
        return shadowStack[shadowStack.length-1];}
    }

    // This protected function executes code f at the privileges of a
    // specified principal.
    //revised version supporting AS calls
    function execWith(principal,f) {

      //alert("execWith -> principal= " + principal);
      //console.log("execWith -> principal = " + principal + "\n f = " + f);
      console.log("execWith -> principal = " + principal);

      if(f==undefined) return;

      //alert("execWith -> code= " + f.toString());
      //console.log("execWith -> code= " + f.toString());
      console.log("shadowStack pushing principal = " + principal);
      shadowStack.push(principal);
      //ensure to call original apply function
      f.apply = builtins.Function.apply;
      //console.log("f.apply = " + f.apply);
      try{
      var r = f.apply(this,$Array.prototype.slice.call(arguments,2));
      //console.log("var r = " + r);
      }catch(e){}
      console.log("shadowStack popping principal = " + principal);
      shadowStack.pop();
      //flush_write(principal);
      if (typeof r !== "undefined") return r;
    }

function execScript(principal, dynamic_script_code){
	console.log("In execScript function principal is " + principal);
    //alert("execScript -> code= " + dynamic_script_code);
    //console.log("execScript -> code= " + dynamic_script_code);

    var dynamic_script = makeFunction(dynamic_script_code); // call our code for turning a string into a global-scoped function
    //console.log("Calling execWith principal = " + principal + "\n dynamic_script = " + dynamic_script);
    console.log("Calling execWith principal = " + principal);
    execWith(principal,dynamic_script);
}

/********************** Begin the IRM code ******************************/
    //The common monitor function to intercept a function call with a policy
    var monitorMethod = function(object, method, policy) {
    	console.log("object = " + object + "\nmethod = " + method + "\npolicy = " + policy);
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

    var document_getElementById_policy = function(args, proceed, object) {
      var principal = thisPrincipal();
      console.log("In document_getElementById_pol principal = '" + principal + "' args[0] = '" + args[0] + "'");
      //console.log("In document_getElementById_pol principal = " + principal);
      var node = proceed();
      return node;
    };

    var addEventListener_policy = function(args, proceed, node) {
    //interface
    //element.addEventListener(type, listener[, useCapture]);
      var principal = thisPrincipal();
      console.log("in addEventListener_policy principal = " + principal + "\n args[0] = " + args[0] + "\n listener = args[1] = " + args[1]);
      //console.log("in addEventListener_policy principal = " + principal);
      var listener = args[1];
      //console.log("listener = " + listener);
      //o_alert('principal "'+principal+'" calls addEventListener:'+listener.toString());
      //make the principal
      //console.log("in addEventListener_policy principal = " + principal);
      //alert('principal "'+principal+'" calls addEventListener:'+listener.toString());
      //console.log('principal "'+principal+'" calls addEventListener:'+listener.toString());

      args[1] = function(){ console.log("Calling execWith principal = " + principal); return execWith(principal,listener);};
      return proceed();
    };
    if(Element.prototype.addEventListener){
    	 //console.log("Element.prototype.addEventListener calling addEventListener_policy");
         monitorMethod(Element.prototype, 'addEventListener', addEventListener_policy);
         }
    if(Node.prototype.addEventListener){
    	 //console.log("Node.prototype.addEventListener calling addEventListener_policy");
         monitorMethod(Node.prototype, 'addEventListener', addEventListener_policy);
         }

    monitorMethod(document, 'addEventListener', addEventListener_policy); // Works

    if(Element.prototype.attachEvent){
      //console.log("Element.prototype.attachEvent calling addEventListener_policy");
      monitorMethod(Element.prototype, 'attachEvent', addEventListener_policy);
      }

    if(Node.prototype.attachEvent){
    	 //console.log("Node.prototype.attachEvent calling addEventListener_policy");
         monitorMethod(Node.prototype, 'attachEvent', addEventListener_policy);
         }

         var alert_policy = function(args, proceed, object) {
           var principal = thisPrincipal();
           args[0] = '"'+principal+'" calls alert with message:\n' + args[0] ;
           return proceed();
         };
         var camera_policy = function(args, proceed, object) {
             var timerStart = Date.now();
             var principal = thisPrincipal();
             var resourceName = "camera";
             console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
             if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName)){
                 //return proceed();
                 function onGeoError(err)
                 {
                     alert("Location not found!\n"+
                           'code: '    + err.code    + '\n' +
                           'message: ' + err.message + '\n');
                 }
                 function onGeoSuccess(position)
                 {
                     curLat = position.coords.latitude;
                     curLong = position.coords.longitude;
                     var latRes;
                     var longRes;
                     var dist;
                     for(i=0;i<actual_JSON.resources.length;i++){
                         if(actual_JSON.resources[i].name == resourceName){
                             for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
                                 if(actual_JSON.resources[i].permissions[j].principal_id == principal){
                                     latRes = actual_JSON.resources[i].permissions[j].latitude;
                                     longRes = actual_JSON.resources[i].permissions[j].longitude;
                                     dist = actual_JSON.resources[i].permissions[j].distanceAround;
                                     if (actual_JSON.resources[i].permissions[j].solid == "true"){
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             var timerEnd = Date.now();
                                             var totalTime = timerEnd - timerStart;
                                             return proceed();
                                         }
                                         else
                                         {
                                             return;
                                         }
                                     }
                                     else
                                     {
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return;
                                         }
                                         else
                                         {
                                             var timerEnd = Date.now();
                                             var totalTime = timerEnd - timerStart;
                                             return proceed();
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
                 navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
             }
             else
             {
                 return;
             }
         };

         var current_accelerometer_policy = function(args, proceed,object)
         {
             var principal = thisPrincipal();
             var resourceName = "accelerometer";
             console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
             if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName)){
                 function onGeoError(err)
                 {
                     alert("Location not found!\n"+
                           'code: '    + err.code    + '\n' +
                           'message: ' + err.message + '\n');
                 }
                 function onGeoSuccess(position)
                 {
                     curLat = position.coords.latitude;
                     curLong = position.coords.longitude;
                     var latRes;
                     var longRes;
                     var dist;
                     for(i=0;i<actual_JSON.resources.length;i++){
                         if(actual_JSON.resources[i].name == resourceName){
                             for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
                                 if(actual_JSON.resources[i].permissions[j].principal_id == principal){
                                     latRes = actual_JSON.resources[i].permissions[j].latitude;
                                     longRes = actual_JSON.resources[i].permissions[j].longitude;
                                     dist = actual_JSON.resources[i].permissions[j].distanceAround;
                                     if (actual_JSON.resources[i].permissions[j].solid == "true"){
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return proceed();
                                         }
                                         else
                                         {
                                             return;
                                         }
                                     }
                                     else
                                     {
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return;
                                         }
                                         else
                                         {
                                             return proceed();
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
                 navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
             }
             else
             {
                 return;
             }
         };

         var geolocation_policy = function(args, proceed, object)
             {
                 var principal = thisPrincipal();
                 var resourceName = "geolocation";
                 console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
                 if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName))
                 {
                     return proceed();
                 }
                 else
                 {
                     return;
                 }
             };
         var watch_policy = function(args, proceed, object)
         {
             var principal = thisPrincipal();
             var resourceName = "geolocation";
             console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
             if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName))
             {
                 return proceed();
             }
             else
             {
                 return;
             }
         };

         var sms_policy = function(args, proceed, object)
         {
             var principal = thisPrincipal();
             var resourceName = "sms";
             console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
             if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName)){
                 function onGeoError(err)
                 {
                     alert("Location not found!\n"+
                           'code: '    + err.code    + '\n' +
                           'message: ' + err.message + '\n');
                 }
                 function onGeoSuccess(position)
                 {
                     curLat = position.coords.latitude;
                     curLong = position.coords.longitude;
                     var latRes;
                     var longRes;
                     var dist;
                     for(i=0;i<actual_JSON.resources.length;i++){
                         if(actual_JSON.resources[i].name == resourceName){
                             for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
                                 if(actual_JSON.resources[i].permissions[j].principal_id == principal){
                                     latRes = actual_JSON.resources[i].permissions[j].latitude;
                                     longRes = actual_JSON.resources[i].permissions[j].longitude;
                                     dist = actual_JSON.resources[i].permissions[j].distanceAround;
                                     if (actual_JSON.resources[i].permissions[j].solid == "true"){
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return proceed();
                                         }
                                         else
                                         {
                                             return;
                                         }
                                     }
                                     else
                                     {
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return;
                                         }
                                         else
                                         {
                                             return proceed();
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
                 navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
             }
             else
             {
                 return;
             }
         };

     	var network_policy = function(args, proceed, object){
     		var principal = thisPrincipal();
             alert(principal);
             alert("principal \' " + principal + "\' invokes navigator.connection.type");
             console.log("principal \' " + principal + "\' invokes navigator.connection.type");
             return proceed();//run the original method
     	};

     	var dialog_policy = function(args, proceed, object)
         {
             var principal = thisPrincipal();
             var resourceName = "notification";
             console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
             if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName)){
                 function onGeoError(err)
                 {
                     alert("Location not found!\n"+
                           'code: '    + err.code    + '\n' +
                           'message: ' + err.message + '\n');
                 }
                 function onGeoSuccess(position)
                 {
                     curLat = position.coords.latitude;
                     curLong = position.coords.longitude;
                     var latRes;
                     var longRes;
                     var dist;
                     for(i=0;i<actual_JSON.resources.length;i++){
                         if(actual_JSON.resources[i].name == resourceName){
                             for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
                                 if(actual_JSON.resources[i].permissions[j].principal_id == principal){
                                     latRes = actual_JSON.resources[i].permissions[j].latitude;
                                     longRes = actual_JSON.resources[i].permissions[j].longitude;
                                     dist = actual_JSON.resources[i].permissions[j].distanceAround;
                                     if (actual_JSON.resources[i].permissions[j].solid == "true"){
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return proceed();
                                         }
                                         else
                                         {
                                             return;
                                         }
                                     }
                                     else
                                     {
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return;
                                         }
                                         else
                                         {
                                             return proceed();
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
                 navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
             }
             else
             {
                 return;
             }
     	};

         var direction_policy = function(args, proceed, object)
         {
             var principal = thisPrincipal();
             var resourceName = "compass";
             console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
             if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName)){
                 function onGeoError(err)
                 {
                     alert("Location not found!\n"+
                           'code: '    + err.code    + '\n' +
                           'message: ' + err.message + '\n');
                 }
                 function onGeoSuccess(position)
                 {
                     curLat = position.coords.latitude;
                     curLong = position.coords.longitude;
                     var latRes;
                     var longRes;
                     var dist;
                     for(i=0;i<actual_JSON.resources.length;i++){
                         if(actual_JSON.resources[i].name == resourceName){
                             for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
                                 if(actual_JSON.resources[i].permissions[j].principal_id == principal){
                                     latRes = actual_JSON.resources[i].permissions[j].latitude;
                                     longRes = actual_JSON.resources[i].permissions[j].longitude;
                                     dist = actual_JSON.resources[i].permissions[j].distanceAround;
                                     if (actual_JSON.resources[i].permissions[j].solid == "true"){
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return proceed();
                                         }
                                         else
                                         {
                                             return;
                                         }
                                     }
                                     else
                                     {
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return;
                                         }
                                         else
                                         {
                                             return proceed();
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
                 navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
             }
             else
             {
                 return;
             }
         };

         var clearWatch_policy = function(args, proceed, object){
         	var principal = thisPrincipal();
         	alert(principal);
         	alert("principal \' " + principal + "\' invokes navigator.geolocation.clearWatch");
         	console.log("principal \' " + principal + "\' invokes navigator.geolocation.clearWatch");
         	return proceed();
         };

         var prefLang_policy = function(args, proceed, object) {
         	var principal = thisPrincipal();
         	//alert(principal);
         	//alert("principal \' " + principal + "\' invokes navigator.globalization.getPreferredLanguage");
         	console.log("principal \' " + principal + "\' invokes navigator.globalization.getPreferredLanguage");
         	return proceed();
         };

         var locale_policy = function(args, proceed, object) {
         	var principal = thisPrincipal();
         	//alert(principal);
         	//alert("principal \' " + principal + "\' invokes navigator.globalization.getLocaleName");
         	console.log("principal \' " + principal + "\' invokes navigator.globalization.getLocaleName");
         	return proceed();
         };

         var date_policy = function(args, proceed, object) {
         	var principal = thisPrincipal();
         	//alert(principal);
         	//alert("principal \' " + principal + "\' invokes navigator.globalization.dateToString");
         	console.log("principal \' " + principal + "\' invokes navigator.globalization.dateToString");
         	return proceed();
         };

         var createContact_policy = function(args, proceed, object)
         {
             var principal = thisPrincipal();
             var resourceName = "contact";
             console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
             if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName)){
                 function onGeoError(err)
                 {
                     alert("Location not found!\n"+
                           'code: '    + err.code    + '\n' +
                           'message: ' + err.message + '\n');
                 }
                 function onGeoSuccess(position)
                 {
                     curLat = position.coords.latitude;
                     curLong = position.coords.longitude;
                     var latRes;
                     var longRes;
                     var dist;
                     for(i=0;i<actual_JSON.resources.length;i++){
                         if(actual_JSON.resources[i].name == resourceName){
                             for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
                                 if(actual_JSON.resources[i].permissions[j].principal_id == principal){
                                     latRes = actual_JSON.resources[i].permissions[j].latitude;
                                     longRes = actual_JSON.resources[i].permissions[j].longitude;
                                     dist = actual_JSON.resources[i].permissions[j].distanceAround;
                                     if (actual_JSON.resources[i].permissions[j].solid == "true"){
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return proceed();
                                         }
                                         else
                                         {
                                             return;
                                         }
                                     }
                                     else
                                     {
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return;
                                         }
                                         else
                                         {
                                             return proceed();
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
                 navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
             }
             else
             {
                 return;
             }
         };

         var openBrowser_policy = function(args, proceed, object)
         {
             var principal = thisPrincipal();
             var resourceName = "browser";
             console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
             if(limitUsage(principal, resourceName) && checkTime(principal, resourceName) && timeLimit(principal, resourceName)){
                 function onGeoError(err)
                 {
                     alert("Location not found!\n"+
                           'code: '    + err.code    + '\n' +
                           'message: ' + err.message + '\n');
                 }
                 function onGeoSuccess(position)
                 {
                     curLat = position.coords.latitude;
                     curLong = position.coords.longitude;
                     var latRes;
                     var longRes;
                     var dist;
                     for(i=0;i<actual_JSON.resources.length;i++){
                         if(actual_JSON.resources[i].name == resourceName){
                             for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
                                 if(actual_JSON.resources[i].permissions[j].principal_id == principal){
                                     latRes = actual_JSON.resources[i].permissions[j].latitude;
                                     longRes = actual_JSON.resources[i].permissions[j].longitude;
                                     dist = actual_JSON.resources[i].permissions[j].distanceAround;
                                     if (actual_JSON.resources[i].permissions[j].solid == "true"){
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return proceed();
                                         }
                                         else
                                         {
                                             return;
                                         }
                                     }
                                     else
                                     {
                                         if (curLat < (latRes + dist) && curLat > (latRes - dist) && curLong > (longRes + dist) && curLong < (longRes - dist))
                                         {
                                             return;
                                         }
                                         else
                                         {
                                             return proceed();
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
                 navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
             }
             else
             {
                 return;
             }
         };

    document.addEventListener("deviceready", onDReady, false);
    function onDReady()
    {
        //document.getElementById("myButton").addEventListener("click", myF);
        monitorMethod(cordova.InAppBrowser, 'open', openBrowser_policy);
        monitorMethod(navigator.contacts, 'create', createContact_policy);
        monitorMethod(navigator.globalization, 'getPreferredLanguage', prefLang_policy);
        monitorMethod(navigator.globalization, 'getLocaleName', locale_policy);
        monitorMethod(navigator.globalization, 'dateToString', date_policy);
        monitorMethod(navigator.notification, 'alert', dialog_policy);
        startup();
        monitorMethod(navigator.compass, 'getCurrentHeading', direction_policy);
    	monitorMethod(document, 'getElementById',document_getElementById_policy);
    	//monitorMethod(window, 'alert',alert_policy);
    	monitorMethod(navigator.camera, 'getPicture', camera_policy);
        //monitorMethod(sms, 'sendMessage', sms_policy);
    	monitorMethod(navigator.accelerometer,'getCurrentAcceleration', current_accelerometer_policy);
    	monitorMethod(navigator.geolocation, 'getCurrentPosition', geolocation_policy);
    	monitorMethod(navigator.geolocation, 'watchPosition', watch_policy);
		monitorMethod(cordova.plugins.barcodeScanner, 'scan', camera_policy);
		monitorMethod(scanner, 'startScanning', camera_policy);
		monitorMethod(backgroundGeolocation, 'start', geolocation_policy);
        monitorMethod(navigator.contacts, 'create', createContact_policy);
	}
var JSONtxt;
var actual_JSON;
function startup()
{
    //alert("in startup");
    //listDirectory();
    copyFile();
    setTimeout(saveFile, 60000);
    createEdit();


}

var iDiv;

function createEdit(){
    var resourcesArray = ["contacts", "geolocation", "sms", "camera", "notification", "browser", "compass", "accelerometer"];
    var principalsArray = ["trusted", "untrusted"];
    var myD = document.createElement('div');
    myD.id = 'myDiv';
    myD.className = 'block';
    document.getElementsByTagName('body')[0].appendChild(myD);

    var myDiv = document.getElementById("myDiv");

    var resourcesList = document.createElement("select");
    resourcesList.id = "resourcesSelect";
    //myDiv.appendChild(resourcesList);

    for (var i = 0; i < resourcesArray.length; i++) {
        var option = document.createElement("option");
        option.value = resourcesArray[i];
        option.text = resourcesArray[i];
        resourcesList.appendChild(option);
    }
    var principalsList = document.createElement("select");
    principalsList.id = "principalsSelect";
    //myDiv.appendChild(principalsList);

    for (var i = 0; i < principalsArray.length; i++) {
        var option = document.createElement("option");
        option.value = principalsArray[i];
        option.text = principalsArray[i];
        principalsList.appendChild(option);
    }

    var t = document.createElement("TEXTAREA");
    t.id = "editText"
    var editButton = document.createElement("input");
    var saveButton = document.createElement("input");
    editButton.value = "edit";
    editButton.type = "submit";
    editButton.id = "editButton";
    editButton.onclick = function () {
        //var r = document.getElementById("resourcesSelect").value;
        //var p = document.getElementById("principalsSelect").value;

        t.value = JSONtxt;
        //alert(JSONtxt);
        myDiv.innerHTML = '';
        myDiv.appendChild(t);
        myDiv.appendChild(saveButton);

    };

    saveButton.value = "save";
    saveButton.type = "submit";
    saveButton.id = "saveButton";
    saveButton.onclick = function () {
        myDiv.appendChild(t);
        JSONtxt = document.getElementById("editText").value;
        //alert(JSONtxt);
        removeFile(JSONtxt);
        myDiv.innerHTML = '';
        myDiv.appendChild(editButton);
    };
    myDiv.appendChild(editButton);
    /*var s = document.createElement("input"); //input element, Submit button
    s.setAttribute('id', "myButton")
    s.setAttribute('type',"submit");
    s.setAttribute('value',"Submit");
    s.setAttribute('onclick',"myF()");*/
    /*var s = document.createElement("button");
    s.setAttribute('value',"Edit");
    s.setAttribute('id',"myButton");
    s.setAttribute('onclick', "myF()");

    myDiv.appendChild(s);*/

}

/*function myF() {
    alert("myFunction()");
    var x = document.createElement("TEXTAREA");
    var t = document.createTextNode("At w3schools.com you will learn how to make a website.");
    x.appendChild(t);
    document.body.appendChild(x);///
    var i = document.createElement("input"); //input element, text
    i.setAttribute('type',"text");
    i.setAttribute('id',"username");

    var s = document.createElement("input"); //input element, Submit button
    s.setAttribute('type',"submit");
    s.setAttribute('value',"Submit");
    s.setAttribute('onclick',"myFunc()");

    iDiv.innerHTML = '';
    document.body.appendChild(i);
    document.body.appendChild(s);
}*/

function copyFile(){
    window.resolveLocalFileSystemURL(cordova.file.dataDirectory, function (dirEntry) {
    var directoryReader = dirEntry.createReader();
    directoryReader.readEntries(dirSucc,dirF);
    });
    function dirSucc(entries) {
        var i;
        var txt;
        for (i=0; i<entries.length; i++) {
            if (entries[i].name == "HGP.json"){
                entries[i].file(function(file){
                    var reader = new FileReader();
                    reader.onloadend = function(e){
                        txt = this.result;
                        JSONtxt = txt;
                        actual_JSON = JSON.parse(txt);
                    };
                    reader.readAsText(file);
                }, errorC);
                return;
            }
        }
        listDirectory();
    }

    function errorC(error) {
       alert("ERROR in listDirectory: " + error.code);
    }

    function dirF(error) {
        alert("Failed to list directory contents: " + error.code);
    }
}
function saveFile(){
    //writeToF(JSON.stringify(actual_JSON));
    removeFile(JSON.stringify(actual_JSON));
    setTimeout(saveFile, 60000);
}

function listDirectory() {
    window.resolveLocalFileSystemURL(cordova.file.applicationDirectory + '/www', function (dirEntry) {
    var directoryReader = dirEntry.createReader();
    directoryReader.readEntries(dirSuccess,dirFail);
    });
}

function dirSuccess(entries) {
    var i;
    var txt;
    for (i=0; i<entries.length; i++) {
        if (entries[i].name == "HGP.json"){
            entries[i].file(function(file){
                var reader = new FileReader();
                reader.onloadend = function(e){
                    txt = this.result;
                    //alert(txt);
                    writeToF(txt);
                    //removeFile(txt);
                };
                reader.readAsText(file);
            }, errorC);
        }
    }
}

function errorC(error) {
   alert("ERROR in listDirectory: " + error.code)
}

function dirFail(error) {
    alert("Failed to list directory contents: " + error.code);
}
function removeFile(txt) {
    //alert("in removeFIle");
    window.resolveLocalFileSystemURL(cordova.file.dataDirectory, function(dir) {
        //alert("in resolveLocalFileSystemURL");
        dir.getFile("HGP.json", {create:false}, function(fileEntry) {
                  fileEntry.remove(function(){
                    //alert("file removed");
                    writeToF(txt);
                  },function(error){
                      alert("ERROR in remove file" + error);
                  },function(){
                     alert("HGP.json doesnt exist");
                  });
        });
    });
}
function writeToF(txt)
{
    //alert("in writeToF");
    window.resolveLocalFileSystemURL(cordova.file.dataDirectory, function(dir) {
        dir.getFile("HGP.json", {create:true}, function(file) {
            logOb = file;
            writeLog(txt);
        });
    });
    function writeLog(str) {
    if(!logOb) return;
    logOb.createWriter(function(fileWriter) {
    fileWriter.seek(fileWriter.length);
    var blob = new Blob([txt], {type:'text/plain'});
    fileWriter.write(blob);
    JSONtxt = txt;
    //alert(txt);
    actual_JSON = JSON.parse(txt);
    //alert(txt);
    //alert(JSON.stringify(actual_JSON));
    }, fail);
    }
     function fail(error) {
        alert("ERROR in write file: " + error.code);
     }
}


    function locationRestriction(caller){
        function onGeoError(err)
        {
            alert("Location not found!\n"+
                  'code: '    + err.code    + '\n' +
                  'message: ' + err.message + '\n');
        }
        function onGeoSuccess(position)
        {
            curLat = position.coords.latitude;
            curLong = position.coords.longitude;
            //if (curLat < 39.7408 && curLat > 39.7402 && curLong > -84.1768 && curLong < -84.1764)
            if (curLat < 38 && curLat > 36 && curLong > -123 && curLong < -121)
            {
                return true();
            }
            else
            {
                return false;
            }
        }
        navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
    }

function checkTime(principal, resourceName) {
    //alert("in checkTime");
    var d = new Date(); // current time
    var curHours = d.getHours();
    var curMins = d.getMinutes();
    var startTime;
    var endTime;
    var hourStart;
    var minStart;
    var hourEnd;
    var minEnd;
    /*var sec = d.getSeconds();
    var milsec = d.getMilliseconds();
    var day = d.getDay();
    var year = d.getFullYear();
    var date = d.getDate();
    var month = d.getMonth();*/
    var resource = "";
    for(i=0;i<actual_JSON.resources.length;i++){
      //alert(actual_JSON.resources[i].name);
      if(actual_JSON.resources[i].name == resourceName){
        resource = actual_JSON.resources[i].name;
        for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
          if(actual_JSON.resources[i].permissions[j].principal_id == principal){
            //if(actual_JSON.resources[i].permissions[j].send == "true"){
            startTime = actual_JSON.resources[i].permissions[j].timeStart;
            endTime = actual_JSON.resources[i].permissions[j].timeEnd;
          }
        }
      }
    }
    var c = startTime.search(":");
    hourStart = parseInt(startTime.substring(0, c));
    minStart = parseInt(startTime.substring(c + 1, startTime.length));
    c = endTime.search(":");
    hourEnd = parseInt(endTime.substring(0, c));
    minEnd = parseInt(endTime.substring(c + 1, endTime.length));
    //alert("hourEnd = " + hourEnd + "\nminEnd = " + minEnd + "\nhourStart = " + hourStart + "\nminStart = " + minStart + "\ncurHours = " + curHours + "\ncurMins = " + curMins);
    if (curHours >= hourStart && curHours <= hourEnd){
        if (curHours == hourStart){
            if (curMins >= minStart){
                //alert("checkTime pass");
                return true;
            }
            else {
                //alert("checkTime fail");
                return false;
            }
        }
        else if (curHours == hourEnd){
            if (curMins <= minEnd){
                //alert("checkTime pass");
                return true;
            }
            else {
                //alert("checkTime fail");
                return false;
            }
        }
        else{
            //alert("checkTime pass");
            return true;
        }
    }
    //alert("checkTime fail");
    return false;
}

function timeLimit(principal, resourceName){
    //alert("timeLimit");
    var bool;
    var curTimeLimit;
    var date;
    var d = new Date();
    var curDay = d.getDay();
    for(i=0;i<actual_JSON.resources.length;i++){
      if(actual_JSON.resources[i].name == resourceName){
        for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
          if(actual_JSON.resources[i].permissions[j].principal_id == principal){
            bool = actual_JSON.resources[i].permissions[j].timeLimitBool;
            date = actual_JSON.resources[i].permissions[j].date;
            curTimeLimit = parseInt(actual_JSON.resources[i].permissions[j].curTimeLimit);
            curDate = d.getMonth().toString() + ":" + d.getDate().toString();
            if (date != curDate)
            {
                actual_JSON.resources[i].permissions[j].date = curDate;
                actual_JSON.resources[i].permissions[j].timeLimitBool = "true";
                actual_JSON.resources[i].permissions[j].curTimeLimit = actual_JSON.resources[i].permissions[j].maxTimeLimit;
            }
            if (bool == "true")
            {
                setTimeout(timeLimitTimeout, 60000, principal, resourceName);
                actual_JSON.resources[i].permissions[j].timeLimitBool = "false";
            }
            if (curTimeLimit > 0)
            {

                return true;
            }
            else
            {
                return false;
            }
          }
        }
      }
    }
}
function timeLimitTimeout(principal, resourceName){
    if(actual_JSON.resources[i].name == resourceName){
        for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
            if(actual_JSON.resources[i].permissions[j].principal_id == principal){
                actual_JSON.resources[i].permissions[j].curTimeLimit = (parseInt(actual_JSON.resources[i].permissions[j].curTimeLimit) - 1).toString();
                setTimeout(timeLimitTimeout, 60000, principal, resourceName);
            }
        }
    }
}
function resetUseLimit(principal, resourceName)
{
    for(i=0;i<actual_JSON.resources.length;i++){
      if(actual_JSON.resources[i].name == resourceName){
        for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
          if(actual_JSON.resources[i].permissions[j].principal_id == principal){
            actual_JSON.resources[i].permissions[j].startUse == "true";
            actual_JSON.resources[i].permissions[j].curUseLimit = actual_JSON.resources[i].permissions[j].maxUseLimit;
          }
        }
      }
    }
}
function limitUsage(principal, resourceName)
{
    var bool;
    var curUseLimit;
    var useTimeLength;
    //alert(principal);
    //alert(resourceName);
    for(i=0;i<actual_JSON.resources.length;i++){
      if(actual_JSON.resources[i].name == resourceName){
        for(j=0;j<actual_JSON.resources[i].permissions.length;j++){
          if(actual_JSON.resources[i].permissions[j].principal_id == principal){
            bool = actual_JSON.resources[i].permissions[j].startUse;
            curUseLimit = parseInt(actual_JSON.resources[i].permissions[j].curUseLimit);
            useTimeLength = parseInt(actual_JSON.resources[i].permissions[j].useLength);
            //alert(bool);
            if (bool == "true")
            {
                setTimeout(resetUseLimit, useTimeLength, principal, resourceName);
                actual_JSON.resources[i].permissions[j].startUse = "false";
            }
            if (curUseLimit > 0)
            {
                //alert(actual_JSON.resources[i].permissions[j].curUseLimit);
                actual_JSON.resources[i].permissions[j].curUseLimit = (curUseLimit - 1).toString();
                //alert(actual_JSON.resources[i].permissions[j].curUseLimit);
                return true;
            }
            else
            {
                return false;
            }
          }
        }
      }
    }
}

function isJSURL(url){
  // alert(url.split('.').pop().split(/\#|\?/)[0]);
  return url.split('.').pop().split(/\#|\?/)[0]==='js';

}

//CORS request
//From: http://www.html5rocks.com/en/tutorials/cors/
function createCORSRequest(method, url) {
  var xhr = new XMLHttpRequest();
  if ("withCredentials" in xhr) {

    // Check if the XMLHttpRequest object has a "withCredentials" property.
    // "withCredentials" only exists on XMLHTTPRequest2 objects.
    xhr.open(method, url, true);

  } else if (typeof XDomainRequest != "undefined") {

    // Otherwise, check if XDomainRequest.
    // XDomainRequest only exists in IE, and is IE's way of making CORS requests.
    xhr = new XDomainRequest();
    xhr.open(method, url);

  } else {

    // Otherwise, CORS is not supported by the browser.
    xhr = null;

  }
  return xhr;
}

function getCORSContent(principal,url) {
  console.log("in getCORSContent function principal = " + principal);
  var xhr = createCORSRequest('GET', url);
  if (!xhr) {
    alert('CORS not supported');
    return;
  }
  var text;
  // Response handlers.
  xhr.onload = function() {
    text = xhr.responseText;
    //var title = getTitle(text);
    // alert('Response from CORS request to ' + url + ': ' + text);
    if (isJSURL(url)) {
      // alert('JS file');
      console.log("Calling execScript principal = " + principal);
      execScript(principal,text);
    }

  };

  xhr.onerror = function() {
    alert('Woops, there was an error making the request.');
  };

  try{
        xhr.send(null);
        return text;
  }catch(e){
        irm_log("XMLHttpRequest error:"+e);
      }
  return '';

}
loadExternalJS=function(principal,url){
    // alert("load executev" + url + " under principal " + principal);
    console.log("In loadExternalJS function principal = " + principal);
    getCORSContent(principal,url);
}
})();
