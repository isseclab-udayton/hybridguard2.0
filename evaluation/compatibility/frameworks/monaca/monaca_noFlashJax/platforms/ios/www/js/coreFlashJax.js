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
      alert(principal);
      alert("principal \' " + principal + "\' invokes navigator.camera.getPicture");
      console.log("principal \' " + principal + "\' invokes navigator.camera.getPicture");
      return proceed();//run the original method
    };

    var current_accelerometer_policy = function(args, proceed,object)
    {
        var principal = thisPrincipal();
        alert(principal);
        alert("principal \' " + principal + "\' invokes navigator.accelerometer.getCurrentAcceleration");
        return proceed();
    };

    var geolocation_policy = function(args, proceed, object) {
    	  console.log("In geolocation_policy");
    	  //console.log(args[0]);
    	  //console.log(proceed);
    	  //console.log(object);
          var principal = thisPrincipal();
          alert(principal);
          alert("principal \' " + principal + "\' invokes navigator.geolocation.getCurrentPosition");
          console.log("principal \' " + principal + "\' invokes navigator.geolocation.getCurrentPosition");
          return proceed();//run the original method
        };
    var watch_policy = function(args, proceed, object) {
    	console.log("in watch_policy");
    	var principal = thisPrincipal();
        alert(principal);
        alert("principal \' " + principal + "\' invokes navigator.geolocation.watchPosition");
        console.log("principal \' " + principal + "\' invokes navigator.geolocation.watchPosition");
        return proceed();//run the original method
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
        alert(principal);
        alert("principal \' " + principal + "\' invokes navigator.notification.alert");
        console.log("principal \' " + principal + "\' invokes navigator.notification.alert");
        return proceed();//run the original method
	};

    var direction_policy = function(args, proceed, object){
    	var principal = thisPrincipal();
        alert(principal);
        alert("principal \' " + principal + "\' invokes navigator.compass.getCurrentHeading");
        console.log("principal \' " + principal + "\' invokes navigator.compass.getCurrentHeading");
        return proceed();//run the original method
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
    	alert(principal);
    	alert("principal \' " + principal + "\' invokes navigator.globalization.getPreferredLanguage");
    	console.log("principal \' " + principal + "\' invokes navigator.globalization.getPreferredLanguage");
    	return proceed();
    };

    var locale_policy = function(args, proceed, object) {
    	var principal = thisPrincipal();
    	alert(principal);
    	alert("principal \' " + principal + "\' invokes navigator.globalization.getLocaleName");
    	console.log("principal \' " + principal + "\' invokes navigator.globalization.getLocaleName");
    	return proceed();
    };

    var date_policy = function(args, proceed, object) {
    	var principal = thisPrincipal();
    	alert(principal);
    	alert("principal \' " + principal + "\' invokes navigator.globalization.dateToString");
    	console.log("principal \' " + principal + "\' invokes navigator.globalization.dateToString");
    	return proceed();
    };

    var createContact_policy = function(args, proceed, object) {
    	var principal = thisPrincipal();
    	alert(principal);
    	alert("principal \' " + principal + "\' invokes navigator.contacts.create");
    	console.log("principal \' " + principal + "\' invokes navigator.contacts.create");
    	return proceed();
    };

    var openBrowser_policy = function(args, proceed, object) {
    	var principal = thisPrincipal();
    	alert(principal);
    	alert("principal \' " + principal + "\' invokes cordova.InAppBrowser.open");
    	console.log("principal \' " + principal + "\' invokes cordova.InAppBrowser.open");
    	return proceed();
    };

    document.addEventListener("deviceready", onDReady, false);
    function onDReady()
    {
    	//alert("device ready coreFlashJax");
    	monitorMethod(document, 'getElementById',document_getElementById_policy); // Works
    	monitorMethod(window, 'alert',alert_policy); // Works
    	monitorMethod(navigator.camera, 'getPicture', camera_policy); // Works
    	monitorMethod(navigator.accelerometer,'getCurrentAcceleration', current_accelerometer_policy); // Works
    	monitorMethod(navigator.geolocation, 'getCurrentPosition', geolocation_policy); // Works
    	monitorMethod(navigator.geolocation, 'watchPosition', watch_policy); // Works
    	monitorMethod(navigator.connection, 'type', network_policy); // Doesn't Work
    	monitorMethod(navigator.notification, 'alert', dialog_policy); // Doesn't Work
		monitorMethod(navigator.compass, 'getCurrentHeading', direction_policy); // Works
		monitorMethod(navigator.geolocation, 'clearWatch', clearWatch_policy); // Works
		monitorMethod(navigator.globalization, 'getPreferredLanguage', prefLang_policy); // Works
		monitorMethod(navigator.globalization, 'getLocaleName', locale_policy);
		monitorMethod(navigator.globalization, 'dateToString', date_policy);
		monitorMethod(navigator.contacts, 'create', createContact_policy);
		monitorMethod(cordova.InAppBrowser, 'open', openBrowser_policy);
		monitorMethod(cordova.plugins.barcodeScanner, 'scan', camera_policy);
		monitorMethod(scanner, 'startScanning', camera_policy);
		monitorMethod(backgroundGeolocation, 'start', geolocation_policy);
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
