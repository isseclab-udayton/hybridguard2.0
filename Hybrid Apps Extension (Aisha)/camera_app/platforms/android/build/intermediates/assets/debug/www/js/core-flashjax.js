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
      if (shadowStack.length<1) return ''; else
        return shadowStack[shadowStack.length-1];
    }

    // This protected function executes code f at the privileges of a
    // specified principal.
    //revised version supporting AS calls
    function execWith(principal,f) {
      if(f==undefined) return;
      shadowStack.push(principal);
      //ensure to call original apply function
      f.apply = builtins.Function.apply;
      try{
      var r = f.apply(this,$Array.prototype.slice.call(arguments,2));
      }catch(e){}
      shadowStack.pop();
      //flush_write(principal);
      if (typeof r !== "undefined") return r;
    }

function execScript(principal, dynamic_script_code){
    var dynamic_script = makeFunction(dynamic_script_code); // call our code for turning a string into a global-scoped function
    execWith(principal,dynamic_script);
}

/********************** Begin the IRM code ******************************/
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

    var geolocation_policy = function(args, proceed, object) {
          var principal = thisPrincipal();
          alert(principal);
          alert("principal \' " + principal + "\' invokes navigator.geolocation.getCurrentPosition");
          return proceed();//run the original method
        };
    monitorMethod(navigator.geolocation, 'getCurrentPosition', geolocation_policy);

    var alert_policy = function(args, proceed, object) {
      var principal = thisPrincipal();
      //var allow = check_policy(principal, undefined, 'alert', args);
      args[0] = '"'+principal+'" calls alert with message:\n' + args[0] ;
      return proceed();
    };

    var camera_policy = function(args, proceed, object) {
      alert("Inside camera policy");
      return proceed();//run the original method
    };

    monitorMethod(window, 'alert',alert_policy);
    // monitorMethod(navigator.camera, 'getPicture', camera_policy); // Doesn't work

function isJSURL(url){
  alert(url.split('.').pop().split(/\#|\?/)[0]);
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
    alert('Response from CORS request to ' + url + ': ' + text);
    if (isJSURL(url)) {
      alert('JS file');
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
    alert("load executev" + url + " under principal " + principal);
    getCORSContent(principal,url);
}
})();