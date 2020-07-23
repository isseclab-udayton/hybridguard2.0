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
      //var allow = check_policy(principal, undefined, 'alert', args);
      args[0] = '"'+principal+'" calls alert with message:\n' + args[0] ;
      return proceed();
    };

    var camera_policy = function(args, proceed, object) {
        var principal = thisPrincipal();
        //alert(principal);
        //alert("principal \' " + principal + "\' invokes navigator.camera.getPicture");
        console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
        if(limitUsage(1) && checkTime(cameraTimeStartHour, cameraTimeStartMin, cameraTimeEndHour, cameraTimeEndMin)){
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
                if (cameraSolid == "true"){
                    if (curLat < (cameraLatitude + cameraDistance) && curLat > (cameraLatitude - cameraDistance) && curLong > (cameraLongitude + cameraDistance) && curLong < (cameraLongitude - cameraDistance))
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
                    if (curLat < (cameraLatitude + cameraDistance) && curLat > (cameraLatitude - distance) && curLong > (cameraLongitude  + cameraDistance) && curLong < (cameraLongitude  - cameraDistance))
                    {
                        return;
                    }
                    else
                    {
                        return proceed();
                    }
                }
            }
            navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
        }
        else {
            return;
        }
    };

    var current_accelerometer_policy = function(args, proceed,object)
    {
        var principal = thisPrincipal();
        //alert(principal);
        //alert("principal \' " + principal + "\' invokes navigator.accelerometer.getCurrentAcceleration");
        if(limitUsage(7) && checkTime(acceleratorTimeStartHour, acceleratorTimeStartMin, acceleratorTimeEndHour, acceleratorTimeEndMin)){
            alert("accel");
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
                if (cameraSolid == "true"){
                    if (curLat < (acceleratorLatitude + acceleratorDistance) && curLat > (acceleratorLatitude - acceleratorDistance) && curLong > (acceleratorLongitude + acceleratorDistance) && curLong < (acceleratorLongitude - acceleratorDistance))
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
                    if (curLat < (acceleratorLatitude + acceleratorDistance) && curLat > (acceleratorLatitude - distance) && curLong > (acceleratorLongitude  + acceleratorDistance) && curLong < (acceleratorLongitude  - acceleratorDistance))
                    {
                        return;
                    }
                    else
                    {
                        return proceed();
                    }
                }
            }
            navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
        }
        else {
            alert("fail");
            return;
        }
    };

    var geolocation_policy = function(args, proceed, object) {
    	  //alert("In geolocation_policy");
          var principal = thisPrincipal();
          return proceed();
          //alert(principal);
          //alert("principal \' " + principal + "\' invokes navigator.geolocation.getCurrentPosition");
          console.log("principal \' " + principal + "\' invokes navigator.geolocation.getCurrentPosition");
          /*if (confirm("Script with principal '" + principal + "' is trying to get your location. \nPress OK to allow or Cancel to stop it.") == true) {
              return proceed();//run the original method
          } else {
              return;
          }*/
          if(limitUsage(2) && checkTime(geoTimeStartHour, geoTimeStartMin, geoTimeEndHour, geoTimeEndMin)){
              return proceed();
          }
          else {
              return;
          }
        };
    var watch_policy = function(args, proceed, object) {
    	console.log("in watch_policy");
    	var principal = thisPrincipal();
        //alert(principal);
        //alert("principal \' " + principal + "\' invokes navigator.geolocation.watchPosition");
        console.log("principal \' " + principal + "\' invokes navigator.geolocation.watchPosition");
        if(limitUsage(2) && checkTime(geoTimeStartHour, geoTimeStartMin, geoTimeEndHour, geoTimeEndMin)){
            return proceed();
        }
        else {
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

	var dialog_policy = function(args, proceed, object){
		var principal = thisPrincipal();
        //alert(principal);
        //alert("principal \' " + principal + "\' invokes navigator.notification.alert");
        console.log("principal \' " + principal + "\' invokes navigator.notification.alert");
        if(limitUsage(3) && checkTime(notificationTimeStartHour, notificationTimeStartMin, notificationTimeEndHour, notificationTimeEndMin)){
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
                if (cameraSolid == "true"){
                    if (curLat < (notificationLatitude + notificationDistance) && curLat > (notificationLatitude - notificationDistance) && curLong > (notificationLongitude + notificationDistance) && curLong < (notificationLongitude - notificationDistance))
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
                    if (curLat < (notificationLatitude + notificationDistance) && curLat > (notificationLatitude - distance) && curLong > (notificationLongitude  + browserDistance) && curLong < (notificationLongitude  - notificationDistance))
                    {
                        return;
                    }
                    else
                    {
                        return proceed();
                    }
                }
            }
            navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
        }
        else {
            return;
        }
	};

    var direction_policy = function(args, proceed, object){
    	var principal = thisPrincipal();
        //alert(principal);
        //alert("principal \' " + principal + "\' invokes navigator.compass.getCurrentHeading");
        console.log("principal \' " + principal + "\' invokes navigator.compass.getCurrentHeading");
        if(limitUsage(4) && checkTime(compassTimeStartHour, compassTimeStartMin, compassTimeEndHour, compassTimeEndMin)){
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
                if (cameraSolid == "true"){
                    if (curLat < (compassLatitude + compassDistance) && curLat > (compassLatitude - compassDistance) && curLong > (compassLongitude + compassDistance) && curLong < (compassLongitude - compassDistance))
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
                    if (curLat < (compassLatitude + compassDistance) && curLat > (compassLatitude - distance) && curLong > (compassLongitude  + compassDistance) && curLong < (compassLongitude  - compassDistance))
                    {
                        return;
                    }
                    else
                    {
                        return proceed();
                    }
                }
            }
            navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
        }
        else {
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

    var createContact_policy = function(args, proceed, object) {
    	var principal = thisPrincipal();
    	//alert(principal);
    	//alert("principal \' " + principal + "\' invokes navigator.contacts.create");
    	console.log("principal \' " + principal + "\' invokes navigator.contacts.create");
        if(limitUsage(5) && checkTime(contactTimeStartHour, contactTimeStartMin, contactTimeEndHour, contactTimeEndMin)){
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
                if (cameraSolid == "true"){
                    if (curLat < (contactLatitude + contactDistance) && curLat > (contactLatitude - contactDistance) && curLong > (contactLongitude + contactDistance) && curLong < (contactLongitude - contactDistance))
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
                    if (curLat < (contactLatitude + contactDistance) && curLat > (contactLatitude - distance) && curLong > (contactLongitude  + contactDistance) && curLong < (contactLongitude  - contactDistance))
                    {
                        return;
                    }
                    else
                    {
                        return proceed();
                    }
                }
            }
            navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
        }
        else {
            return;
        }
    };

    var openBrowser_policy = function(args, proceed, object) {
    	var principal = thisPrincipal();
    	//alert(principal);
    	//alert("principal \' " + principal + "\' invokes cordova.InAppBrowser.open");
    	console.log("principal \' " + principal + "\' invokes cordova.InAppBrowser.open");
        if(limitUsage(6) && checkTime(browserTimeStartHour, browserTimeStartMin, browserTimeEndHour, browserTimeEndMin)){
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
                if (cameraSolid == "true"){
                    if (curLat < (browserLatitude + browserDistance) && curLat > (browserLatitude - browserDistance) && curLong > (browserLongitude + browserDistance) && curLong < (browserLongitude - browserDistance))
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
                    if (curLat < (browserLatitude + browserDistance) && curLat > (browserLatitude - distance) && curLong > (browserLongitude  + browserDistance) && curLong < (browserLongitude  - browserDistance))
                    {
                        return;
                    }
                    else
                    {
                        return proceed();
                    }
                }
            }
            navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
        }
        else {
            return;
        }
    };

    document.addEventListener("deviceready", onDReady, false);
    function onDReady()
    {
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
    	monitorMethod(navigator.accelerometer,'getCurrentAcceleration', current_accelerometer_policy);
    	monitorMethod(navigator.geolocation, 'getCurrentPosition', geolocation_policy);
    	monitorMethod(navigator.geolocation, 'watchPosition', watch_policy);
		monitorMethod(cordova.plugins.barcodeScanner, 'scan', camera_policy);
		monitorMethod(scanner, 'startScanning', camera_policy);
		monitorMethod(backgroundGeolocation, 'start', geolocation_policy);
        monitorMethod(navigator.contacts, 'create', createContact_policy);
	}

function startup()
{
    var txt;
    window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, function(fileSystem){
        fileSystem.root.getFile('HGP.txt', { create: false }, fileExists, fileDoesNotExist);
    }, getFSFail); //of requestFileSystem
    function fileExists(fileEntry){
        //alert("File " + fileEntry.fullPath + " exists!");
        fileEntry.file(function(file) {
           var reader = new FileReader();
           reader.onloadend = function(e) {
              txt = this.result;
              listDirectory();
           };
           reader.readAsText(file);
        }, errCallback);
    }
    function fileDoesNotExist(){
        //alert("file does not exist");
        listDirectory();
    }
    function getFSFail(evt) {
        alert(evt.target.error.code);
    }
    function errCallback(error) {
       alert("ERR: " + error.code)
    }
}

function geolocationRestriction(longitude, latitude, distance, solid)
{
    alert("in geo restriction")
    var bool;
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
        if (solid == "true"){
            if (curLat < (latitude + distance) && curLat > (latitude - distance) && curLong > (longitude + distance) && curLong < (longitude - distance))
            {
                alert("geo true");
                bool = true;
            }
            else
            {
                //alert("camera not allowed outside of work office");
                alert("geo false");
                bool = false;
            }
        }
        else
        {
            if (curLat < (latitude + distance) && curLat > (latitude - distance) && curLong > (longitude + distance) && curLong < (longitude - distance))
            {
                alert("geo false solid false");
                bool = false;
            }
            else
            {
                //alert("camera not allowed outside of work office");
                alert("geo true solid false");
                bool = true;
            }
        }
    }
    navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError,{ maximumAge: 3000, timeout: 5000, enableHighAccuracy: true });
    return bool;
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
        if (entries[i].name == "HGP.txt"){
            entries[i].file(function(file){
                var reader = new FileReader();
                reader.onloadend = function(e){
                    txt = this.result;
                    //alert(txt);
                    writeToF(txt);
                };
                reader.readAsText(file);
            }, errorC);
        }
    }
}

function errorC(error) {
   alert("ERROR: " + error.code)
}

function dirFail(error) {
    alert("Failed to list directory contents: " + error.code);
}

function writeToF(txt)
{
    window.resolveLocalFileSystemURL(cordova.file.dataDirectory, function(dir) {
    dir.getFile("HGP.txt", {create:true}, function(file) {
    logOb = file;
    //alert(txt);
    writeLog(txt);
    });
    });
    function writeLog(str) {
    if(!logOb) return;
    //alert("going to log "+log);
    logOb.createWriter(function(fileWriter) {
    fileWriter.seek(fileWriter.length);
    var blob = new Blob([txt], {type:'text/plain'});
    fileWriter.write(blob);
    updatePolicy(txt);
    }, fail);
    }
     function fail(error) {
        alert("ERROR: " + error.code)
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

function checkTime(startHour, startMin, endHour, endMin) {
    var d = new Date(); // current time
    var hours = d.getHours();
    var mins = d.getMinutes();
    /*var sec = d.getSeconds();
    var milsec = d.getMilliseconds();
    var day = d.getDay();
    var year = d.getFullYear();
    var date = d.getDate();
    var month = d.getMonth();*/
    if (hours >= startHour && hours <= endHour){
        if (hours == startHour ){
            if (mins >= startMin){
                //alert("checkTime pass");
                return true;
            }
            else {
                //alert("checkTime fail");
                return false;
            }
        }
        else if (hours == endHour){
            if (mins <= endMin){
                alert("checkTime pass");
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
var useLimit = 5;
var first = true;
function resetUseLimit(policyNum)
{
    if (policyNum == 1){
        cameraCurrentUse = cameraUseLimit;
        cameraUseBoolean = true;
    }
    else if (policyNum == 2){
        geoCurrentUse = geoUseLimit;
        geoUseBoolean = true;
    }
    else if (policyNum == 3){
        notificationCurrentUse = notificationUseLimit;
        notificationUseBoolean = true;
    }
    else if (policyNum == 4){
        compassCurrentUse = compassUseLimit;
        compassUseBoolean = true;
    }
    else if (policyNum == 5){
        contactCurrentUse = contactUseLimit;
        contactUseBoolean = true;
    }
    else if (policyNum == 6){
        browserCurrentUse = browserUseLimit;
        browserUseBoolean = true;
    }
    else if (policyNum == 7){
        acceleratorCurrentUse = acceleratorUseLimit;
        acceleratorUseBoolean = true;
    }
}
function limitUsage(policyNum)
{
    if (policyNum == 1){
        if (cameraUseBoolean)
        {
            setTimeout(resetUseLimit, cameraUseLength, policyNum);
            cameraUseBoolean = false;
        }
        if (cameraCurrentUse > 0)
        {
            cameraCurrentUse = cameraCurrentUse - 1;
            //alert("limitUsage pass");
            return true;
        }
        else
        {
            //alert("limitUsage fail");
            return false;
        }
    }
    else if (policyNum == 2){
        if (geoUseBoolean)
        {
            setTimeout(resetUseLimit, geoUseLength, policyNum);
            geoUseBoolean = false;
        }
        if (geoCurrentUse > 0)
        {
            geoCurrentUse = geoCurrentUse - 1;
            //alert("limitUsage pass");
            return true;
        }
        else
        {
            //alert("limitUsage fail");
            return false;
        }
    }
    else if (policyNum == 3){
        if (notificationUseBoolean)
        {
            setTimeout(resetUseLimit, notificationUseLength, policyNum);
            notificationUseBoolean = false;
        }
        if (notificationCurrentUse > 0)
        {
            notificationCurrentUse = notificationCurrentUse - 1;
            //alert("limitUsage pass");
            return true;
        }
        else
        {
            //alert("limitUsage fail");
            return false;
        }
    }
    else if (policyNum == 4){
        if (compassUseBoolean)
        {
            setTimeout(resetUseLimit, compassUseLength, policyNum);
            compassUseBoolean = false;
        }
        if (geoCurrentUse > 0)
        {
            compassCurrentUse = compassCurrentUse - 1;
            //alert("limitUsage pass");
            return true;
        }
        else
        {
            //alert("limitUsage fail");
            return false;
        }
    }
    else if (policyNum == 5){
        if (contactUseBoolean)
        {
            setTimeout(resetUseLimit, contactUseLength, policyNum);
            contactUseBoolean = false;
        }
        if (contactCurrentUse > 0)
        {
            contactCurrentUse = contactCurrentUse - 1;
            //alert("limitUsage pass");
            return true;
        }
        else
        {
            //alert("limitUsage fail");
            return false;
        }
    }
    else if (policyNum == 6){
        if (browserUseBoolean)
        {
            setTimeout(resetUseLimit, browserUseLength, policyNum);
            browserUseBoolean = false;
        }
        if (browserCurrentUse > 0)
        {
            browserCurrentUse = browserCurrentUse - 1;
            //alert("limitUsage pass");
            return true;
        }
        else
        {
            //alert("limitUsage fail");
            return false;
        }
    }
    else if (policyNum == 7){
        if (acceleratorUseBoolean)
        {
            setTimeout(resetUseLimit, acceleratorUseLength, policyNum);
            acceleratorUseBoolean = false;
        }
        //alert(acceleratorCurrentUse);
        if (acceleratorCurrentUse > 0)
        {
            acceleratorCurrentUse = acceleratorCurrentUse - 1;
            //alert("limitUsage pass");
            return true;
        }
        else
        {
            alert("limitUsage fail");
            return false;
        }
    }
}
var cameraLongitude;
var cameraLatitude;
var cameraDistance;
var cameraSolid;
var cameraNotUseDay;
var cameraTimeEnd;
var cameraTimeStart;
var cameraUseLimit;
var cameraUseLength;
var cameraTimeStartHour;
var cameraTimeStartMin;
var cameraTimeEndHour;
var cameraTimeEndMin;
var cameraUseBoolean = true;
var cameraCurrentUse;
var geoNotUseDay;
var geoTimeEnd;
var geoTimeStart;
var geoUseLimit;
var geoUseLength;
var geoTimeStartHour;
var geoTimeStartMin;
var geoTimeEndHour;
var geoTimeEndMin;
var geoUseBoolean = true;
var geoCurrentUse;
var notificationLongitude;
var notificationLatitude;
var notificationDistance;
var notificationSolid;
var notificationNotUseDay;
var notificationTimeEnd;
var notificationTimeStart;
var notificationUseLimit;
var notificationUseLength;
var notificationTimeStartHour;
var notificationTimeStartMin;
var notificationTimeEndHour;
var notificationTimeEndMin;
var notificationUseBoolean = true;
var notificationCurrentUse;
var compassLongitude;
var compassLatitude;
var compassDistance;
var compassSolid;
var compassNotUseDay;
var compassTimeEnd;
var compassTimeStart;
var compassUseLimit;
var compassUseLength;
var compassTimeStartHour;
var compassTimeStartMin;
var compassTimeEndHour;
var compassTimeEndMin;
var compassUseBoolean = true;
var compassCurrentUse;
var contactLongitude;
var contactLatitude;
var contactDistance;
var contactSolid;
var contactNotUseDay;
var contactTimeEnd;
var contactTimeStart;
var contactUseLimit;
var contactUseLength;
var contactTimeStartHour;
var contactTimeStartMin;
var contactTimeEndHour;
var contactTimeEndMin;
var contactUseBoolean = true;
var contactCurrentUse;
var browserLongitude;
var browserLatitude;
var browserDistance;
var browserSolid;
var browserNotUseDay;
var browserTimeEnd;
var browserTimeStart;
var browserUseLimit;
var browserUseLength;
var browserTimeStartHour;
var browserTimeStartMin;
var browserTimeEndHour;
var browserTimeEndMin;
var browserUseBoolean = true;
var browserCurrentUse;
var acceleratorLongitude;
var acceleratorLatitude;
var acceleratorDistance;
var acceleratorSolid;
var acceleratorNotUseDay;
var acceleratorTimeEnd;
var acceleratorTimeStart;
var acceleratorUseLimit;
var acceleratorUseLength;
var acceleratorTimeStartHour;
var acceleratorTimeStartMin;
var acceleratorTimeEndHour;
var acceleratorTimeEndMin;
var acceleratorUseBoolean = true;
var acceleratorCurrentUse;
function updatePolicy(txt)
{
    var long = txt.search("cameraLocationLongitude = ");
    var lat = txt.search("cameraLocationLatitude = ");
    var dist = txt.search("cameraDistanceAround = ");
    var solid = txt.search("cameraSolid = ");
    var dayNotUsed = txt.search("cameraNotUseDay = ");
    var timeStart = txt.search("cameraTimeStart = ");
    var timeEnd = txt.search("cameraTimeEnd = ");
    var useLimit = txt.search("cameraUseLimit = ");
    var useLength = txt.search("cameraUseLength = ");

    var templength = "cameraLocationLongitude = ".length;
    var rem = txt.substring(long + templength - 1, txt.length - 1);
    var nl = rem.search("\n");
    cameraLongitude = parseFloat(txt.substring(long + templength - 1, long + templength - 1 + nl));

    templength = "cameraLocationLatitude = ".length;
    rem = txt.substring(lat + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    cameraLatitude = parseFloat(txt.substring(lat + templength - 1, lat + templength - 1 + nl));

    templength = "cameraDistanceAround = ".length;
    rem = txt.substring(dist + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    cameraDistance = parseFloat(txt.substring(dist + templength - 1, dist + templength - 1 + nl));

    templength = "cameraSolid = ".length;
    rem = txt.substring(solid + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    cameraSolid = txt.substring(solid + templength - 1, solid + templength - 1 + nl);

    templength = "cameraNotUseDay = ".length;
    rem = txt.substring(dayNotUsed + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    cameraNotUseDay = txt.substring(dayNotUsed + templength - 1, dayNotUsed + templength - 1 + nl);

    templength = "cameraTimeStart = ".length;
    rem = txt.substring(timeStart + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    cameraTimeStart = txt.substring(timeStart + templength - 1, timeStart + templength - 1 + nl);
    var c = cameraTimeStart.search(":");
    cameraTimeStartHour = parseInt(cameraTimeStart.substring(0, c));
    cameraTimeStartMin = parseInt(cameraTimeStart.substring(c + 1, cameraTimeStart.length));

    templength = "cameraTimeEnd = ".length;
    rem = txt.substring(timeEnd + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    cameraTimeEnd = txt.substring(timeEnd + templength - 1, timeEnd + templength - 1 + nl);
    c = cameraTimeEnd.search(":");
    cameraTimeEndHour = parseInt(cameraTimeEnd.substring(0, c));
    cameraTimeEndMin = parseInt(cameraTimeEnd.substring(c + 1, cameraTimeEnd.length));

    templength = "cameraUseLimit = ".length;
    rem = txt.substring(useLimit + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    cameraUseLimit = txt.substring(useLimit + templength - 1, useLimit + templength - 1 + nl);
    cameraCurrentUse = cameraUseLimit;

    templength = "cameraUseLength = ".length;
    rem = txt.substring(useLength + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    cameraUseLength = parseInt(txt.substring(useLength + templength - 1, useLength + templength - 1 + nl));
    /*-----------------------------------------------------------------------------------------------------*/
    dayNotUsed = txt.search("geoNotUseDay = ");
    timeStart = txt.search("geoTimeStart = ");
    timeEnd = txt.search("geoTimeEnd = ");
    useLimit = txt.search("geoUseLimit = ");
    useLength = txt.search("geoUseLength = ");

    templength = "geoNotUseDay = ".length;
    rem = txt.substring(dayNotUsed + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    geoNotUseDay = txt.substring(dayNotUsed + templength - 1, dayNotUsed + templength - 1 + nl);

    templength = "geoTimeStart = ".length;
    rem = txt.substring(timeStart + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    geoTimeStart = txt.substring(timeStart + templength - 1, timeStart + templength - 1 + nl);
    c = geoTimeStart.search(":");
    geoTimeStartHour = parseInt(geoTimeStart.substring(0, c));
    geoTimeStartMin = parseInt(geoTimeStart.substring(c + 1, geoTimeStart.length));

    templength = "geoTimeEnd = ".length;
    rem = txt.substring(timeEnd + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    geoTimeEnd = txt.substring(timeEnd + templength - 1, timeEnd + templength - 1 + nl);
    c = geoTimeEnd.search(":");
    geoTimeEndHour = parseInt(geoTimeEnd.substring(0, c));
    geoTimeEndMin = parseInt(geoTimeEnd.substring(c + 1, geoTimeEnd.length));

    templength = "geoUseLimit = ".length;
    rem = txt.substring(useLimit + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    geoUseLimit = txt.substring(useLimit + templength - 1, useLimit + templength - 1 + nl);
    geoCurrentUse = geoUseLimit;

    templength = "geoUseLength = ".length;
    rem = txt.substring(useLength + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    geoUseLength = parseInt(txt.substring(useLength + templength - 1, useLength + templength - 1 + nl));
    /*-------------------------------------------------------------------------------------------------*/
    long = txt.search("notificationLocationLongitude = ");
    lat = txt.search("notificationLocationLatitude = ");
    dist = txt.search("notificationDistanceAround = ");
    solid = txt.search("notificationSolid = ");
    dayNotUsed = txt.search("notificationNotUseDay = ");
    timeStart = txt.search("notificationTimeStart = ");
    timeEnd = txt.search("notificationTimeEnd = ");
    useLimit = txt.search("notificationUseLimit = ");
    useLength = txt.search("notificationUseLength = ");

    templength = "notificationLocationLongitude = ".length;
    rem = txt.substring(long + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationLongitude = parseFloat(txt.substring(long + templength - 1, long + templength - 1 + nl));

    templength = "notificationLocationLatitude = ".length;
    rem = txt.substring(lat + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationLatitude = parseFloat(txt.substring(lat + templength - 1, lat + templength - 1 + nl));

    templength = "notificationDistanceAround = ".length;
    rem = txt.substring(dist + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationDistance = parseFloat(txt.substring(dist + templength - 1, dist + templength - 1 + nl));

    templength = "notificationSolid = ".length;
    rem = txt.substring(solid + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationSolid = txt.substring(solid + templength - 1, solid + templength - 1 + nl);

    templength = "notificationNotUseDay = ".length;
    rem = txt.substring(dayNotUsed + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationNotUseDay = txt.substring(dayNotUsed + templength - 1, dayNotUsed + templength - 1 + nl);

    templength = "notificationTimeStart = ".length;
    rem = txt.substring(timeStart + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationTimeStart = txt.substring(timeStart + templength - 1, timeStart + templength - 1 + nl);
    c = notificationTimeStart.search(":");
    notificationTimeStartHour = parseInt(notificationTimeStart.substring(0, c));
    notificationTimeStartMin = parseInt(notificationTimeStart.substring(c + 1, notificationTimeStart.length));

    templength = "notificationTimeEnd = ".length;
    rem = txt.substring(timeEnd + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationTimeEnd = txt.substring(timeEnd + templength - 1, timeEnd + templength - 1 + nl);
    c = notificationTimeEnd.search(":");
    notificationTimeEndHour = parseInt(notificationTimeEnd.substring(0, c));
    notificationTimeEndMin = parseInt(notificationTimeEnd.substring(c + 1, notificationTimeEnd.length));

    templength = "notificationUseLimit = ".length;
    rem = txt.substring(useLimit + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationUseLimit = txt.substring(useLimit + templength - 1, useLimit + templength - 1 + nl);
    notificationCurrentUse = notificationUseLimit;

    templength = "notificationUseLength = ".length;
    rem = txt.substring(useLength + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    notificationUseLength = parseInt(txt.substring(useLength + templength - 1, useLength + templength - 1 + nl));
    /*-----------------------------------------------------------------------------------------------------------*/
    long = txt.search("compassLocationLongitude = ");
    lat = txt.search("compassLocationLatitude = ");
    dist = txt.search("compassDistanceAround = ");
    solid = txt.search("compassSolid = ");
    dayNotUsed = txt.search("compassNotUseDay = ");
    timeStart = txt.search("compassTimeStart = ");
    timeEnd = txt.search("compassTimeEnd = ");
    useLimit = txt.search("compassUseLimit = ");
    useLength = txt.search("compassUseLength = ");

    templength = "compassLocationLongitude = ".length;
    rem = txt.substring(long + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassLongitude = parseFloat(txt.substring(long + templength - 1, long + templength - 1 + nl));

    templength = "compassLocationLatitude = ".length;
    rem = txt.substring(lat + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassLatitude = parseFloat(txt.substring(lat + templength - 1, lat + templength - 1 + nl));

    templength = "compassDistanceAround = ".length;
    rem = txt.substring(dist + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassDistance = parseFloat(txt.substring(dist + templength - 1, dist + templength - 1 + nl));

    templength = "compassSolid = ".length;
    rem = txt.substring(solid + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassSolid = txt.substring(solid + templength - 1, solid + templength - 1 + nl);

    templength = "compassNotUseDay = ".length;
    rem = txt.substring(dayNotUsed + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassNotUseDay = txt.substring(dayNotUsed + templength - 1, dayNotUsed + templength - 1 + nl);

    templength = "compassTimeStart = ".length;
    rem = txt.substring(timeStart + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassTimeStart = txt.substring(timeStart + templength - 1, timeStart + templength - 1 + nl);
    c = compassTimeStart.search(":");
    compassTimeStartHour = parseInt(compassTimeStart.substring(0, c));
    compassTimeStartMin = parseInt(compassTimeStart.substring(c + 1, compassTimeStart.length));

    templength = "compassTimeEnd = ".length;
    rem = txt.substring(timeEnd + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassTimeEnd = txt.substring(timeEnd + templength - 1, timeEnd + templength - 1 + nl);
    c = compassTimeEnd.search(":");
    compassTimeEndHour = parseInt(compassTimeEnd.substring(0, c));
    compassTimeEndMin = parseInt(compassTimeEnd.substring(c + 1, compassTimeEnd.length));

    templength = "compassUseLimit = ".length;
    rem = txt.substring(useLimit + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassUseLimit = txt.substring(useLimit + templength - 1, useLimit + templength - 1 + nl);
    compassCurrentUse = compassUseLimit;

    templength = "compassUseLength = ".length;
    rem = txt.substring(useLength + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    compassUseLength = parseInt(txt.substring(useLength + templength - 1, useLength + templength - 1 + nl));
    /*-----------------------------------------------------------------------------------------------------------*/
    long = txt.search("contactLocationLongitude = ");
    lat = txt.search("contactLocationLatitude = ");
    dist = txt.search("contactDistanceAround = ");
    solid = txt.search("contactSolid = ");
    dayNotUsed = txt.search("contactNotUseDay = ");
    timeStart = txt.search("contactTimeStart = ");
    timeEnd = txt.search("contactTimeEnd = ");
    useLimit = txt.search("contactUseLimit = ");
    useLength = txt.search("contactUseLength = ");

    templength = "contactLocationLongitude = ".length;
    rem = txt.substring(long + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactLongitude = parseFloat(txt.substring(long + templength - 1, long + templength - 1 + nl));

    templength = "contactLocationLatitude = ".length;
    rem = txt.substring(lat + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactLatitude = parseFloat(txt.substring(lat + templength - 1, lat + templength - 1 + nl));

    templength = "contactDistanceAround = ".length;
    rem = txt.substring(dist + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactDistance = parseFloat(txt.substring(dist + templength - 1, dist + templength - 1 + nl));

    templength = "contactSolid = ".length;
    rem = txt.substring(solid + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactSolid = txt.substring(solid + templength - 1, solid + templength - 1 + nl);

    templength = "contactNotUseDay = ".length;
    rem = txt.substring(dayNotUsed + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactNotUseDay = txt.substring(dayNotUsed + templength - 1, dayNotUsed + templength - 1 + nl);

    templength = "contactTimeStart = ".length;
    rem = txt.substring(timeStart + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactTimeStart = txt.substring(timeStart + templength - 1, timeStart + templength - 1 + nl);
    c = contactTimeStart.search(":");
    contactTimeStartHour = parseInt(contactTimeStart.substring(0, c));
    contactTimeStartMin = parseInt(contactTimeStart.substring(c + 1, contactTimeStart.length));

    templength = "contactTimeEnd = ".length;
    rem = txt.substring(timeEnd + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactTimeEnd = txt.substring(timeEnd + templength - 1, timeEnd + templength - 1 + nl);
    c = contactTimeEnd.search(":");
    contactTimeEndHour = parseInt(contactTimeEnd.substring(0, c));
    contactTimeEndMin = parseInt(contactTimeEnd.substring(c + 1, contactTimeEnd.length));

    templength = "contactUseLimit = ".length;
    rem = txt.substring(useLimit + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactUseLimit = txt.substring(useLimit + templength - 1, useLimit + templength - 1 + nl);
    contactCurrentUse = contactUseLimit;

    templength = "contactUseLength = ".length;
    rem = txt.substring(useLength + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    contactUseLength = parseInt(txt.substring(useLength + templength - 1, useLength + templength - 1 + nl));
    /*-----------------------------------------------------------------------------------------------------------*/
    long = txt.search("browserLocationLongitude = ");
    lat = txt.search("browserLocationLatitude = ");
    dist = txt.search("browserDistanceAround = ");
    solid = txt.search("browserSolid = ");
    dayNotUsed = txt.search("browserNotUseDay = ");
    timeStart = txt.search("browserTimeStart = ");
    timeEnd = txt.search("browserTimeEnd = ");
    useLimit = txt.search("browserUseLimit = ");
    useLength = txt.search("browserUseLength = ");

    templength = "browserLocationLongitude = ".length;
    rem = txt.substring(long + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserLongitude = parseFloat(txt.substring(long + templength - 1, long + templength - 1 + nl));

    templength = "browserLocationLatitude = ".length;
    rem = txt.substring(lat + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserLatitude = parseFloat(txt.substring(lat + templength - 1, lat + templength - 1 + nl));

    templength = "browserDistanceAround = ".length;
    rem = txt.substring(dist + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserDistance = parseFloat(txt.substring(dist + templength - 1, dist + templength - 1 + nl));

    templength = "browserSolid = ".length;
    rem = txt.substring(solid + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserSolid = txt.substring(solid + templength - 1, solid + templength - 1 + nl);

    templength = "browserNotUseDay = ".length;
    rem = txt.substring(dayNotUsed + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserNotUseDay = txt.substring(dayNotUsed + templength - 1, dayNotUsed + templength - 1 + nl);

    templength = "browserTimeStart = ".length;
    rem = txt.substring(timeStart + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserTimeStart = txt.substring(timeStart + templength - 1, timeStart + templength - 1 + nl);
    c = browserTimeStart.search(":");
    browserTimeStartHour = parseInt(browserTimeStart.substring(0, c));
    browserTimeStartMin = parseInt(browserTimeStart.substring(c + 1, browserTimeStart.length));

    templength = "browserTimeEnd = ".length;
    rem = txt.substring(timeEnd + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserTimeEnd = txt.substring(timeEnd + templength - 1, timeEnd + templength - 1 + nl);
    c = browserTimeEnd.search(":");
    browserTimeEndHour = parseInt(browserTimeEnd.substring(0, c));
    browserTimeEndMin = parseInt(browserTimeEnd.substring(c + 1, browserTimeEnd.length));

    templength = "browserUseLimit = ".length;
    rem = txt.substring(useLimit + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserUseLimit = txt.substring(useLimit + templength - 1, useLimit + templength - 1 + nl);
    browserCurrentUse = browserUseLimit;

    templength = "browserUseLength = ".length;
    rem = txt.substring(useLength + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    browserUseLength = parseInt(txt.substring(useLength + templength - 1, useLength + templength - 1 + nl));
    /*-----------------------------------------------------------------------------------------------------------*/
    long = txt.search("acceleratorLocationLongitude = ");
    lat = txt.search("acceleratorLocationLatitude = ");
    dist = txt.search("acceleratorDistanceAround = ");
    solid = txt.search("acceleratorSolid = ");
    dayNotUsed = txt.search("acceleratorNotUseDay = ");
    timeStart = txt.search("acceleratorTimeStart = ");
    timeEnd = txt.search("acceleratorTimeEnd = ");
    useLimit = txt.search("acceleratorUseLimit = ");
    useLength = txt.search("acceleratorUseLength = ");

    templength = "acceleratorLocationLongitude = ".length;
    rem = txt.substring(long + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorLongitude = parseFloat(txt.substring(long + templength - 1, long + templength - 1 + nl));

    templength = "acceleratorLocationLatitude = ".length;
    rem = txt.substring(lat + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorLatitude = parseFloat(txt.substring(lat + templength - 1, lat + templength - 1 + nl));

    templength = "acceleratorDistanceAround = ".length;
    rem = txt.substring(dist + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorDistance = parseFloat(txt.substring(dist + templength - 1, dist + templength - 1 + nl));

    templength = "acceleratorSolid = ".length;
    rem = txt.substring(solid + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorSolid = txt.substring(solid + templength - 1, solid + templength - 1 + nl);

    templength = "acceleratorNotUseDay = ".length;
    rem = txt.substring(dayNotUsed + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorNotUseDay = txt.substring(dayNotUsed + templength - 1, dayNotUsed + templength - 1 + nl);

    templength = "acceleratorTimeStart = ".length;
    rem = txt.substring(timeStart + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorTimeStart = txt.substring(timeStart + templength - 1, timeStart + templength - 1 + nl);
    c = acceleratorTimeStart.search(":");
    acceleratorTimeStartHour = parseInt(acceleratorTimeStart.substring(0, c));
    acceleratorTimeStartMin = parseInt(acceleratorTimeStart.substring(c + 1, acceleratorTimeStart.length));

    templength = "acceleratorTimeEnd = ".length;
    rem = txt.substring(timeEnd + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorTimeEnd = txt.substring(timeEnd + templength - 1, timeEnd + templength - 1 + nl);
    c = acceleratorTimeEnd.search(":");
    acceleratorTimeEndHour = parseInt(acceleratorTimeEnd.substring(0, c));
    acceleratorTimeEndMin = parseInt(acceleratorTimeEnd.substring(c + 1, acceleratorTimeEnd.length));

    templength = "acceleratorUseLimit = ".length;
    rem = txt.substring(useLimit + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorUseLimit = txt.substring(useLimit + templength - 1, useLimit + templength - 1 + nl);
    acceleratorCurrentUse = acceleratorUseLimit;

    templength = "acceleratorUseLength = ".length;
    rem = txt.substring(useLength + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    acceleratorUseLength = parseInt(txt.substring(useLength + templength - 1, useLength + templength - 1 + nl));
/*--------------------------------------------------------------------------------------------------------------*/
    var tl = txt.search("timeLimit = ");
    var ctl = txt.search("currentTimeLimit = ");
    var d = txt.search("date = ");

    templength = "timeLimit = ".length;
    rem = txt.substring(tl + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    timeLimit = parseInt(txt.substring(tl + templength - 1, tl + templength - 1 + nl));

    templength = "currentTimeLimit = ".length;
    rem = txt.substring(ctl + templength - 1, txt.length - );
    nl = rem.search("\n");
    currentTimeLimit = parseInt(txt.substring(ctl + templength - 1, ctl + templength - 1 + nl));

    templength = "date = ".length;
    rem = txt.substring(d + templength - 1, txt.length - 1);
    nl = rem.search("\n");
    date = parseInt(txt.substring(d + templength - 1, d + templength -1 + nl));
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
