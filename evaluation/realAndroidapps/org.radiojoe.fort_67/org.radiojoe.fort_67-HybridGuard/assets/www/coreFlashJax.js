(function(){
    var debug = true;
    var sms_count=0;
    var location_read = false;
    var contact_read = false;
    //constant will not allow the policy to get modified by the attacker while the script is executing.
    const policy = JSON.parse(get_URL('policy_config.json'))

    //var actual_JSON;
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
    var builtins = {};

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
        if(body===undefined) throw new Error('makeFunction error: No code to make a function.');
        var locals = body.match(/function\s+\w+\(/g);
        var fnames = "";
        if (locals) {
            body += ';';
            for (var i=0; i<locals.length; ++i) {
                var fname = locals[i].slice(8).match(/\w+/);
                fnames += 'if(typeof('+fname+')!="undefined")window.'+fname+'='+fname+';\n';
            }
        }
        body = fnames+"\n"+body;
        return new Function(body);
    }

    // Implement a shadow stack as a list.
    var shadowStack = [];

    // Other code may read (but not write) the current principal.
    thisPrincipal = function(){
        if (shadowStack.length<1) return ''; else
        return shadowStack[shadowStack.length-1];
    };

    // This protected function executes code f at the privileges of a
    // specified principal.
    //revised version supporting AS calls
    function execWith(principal,f) {

        //alert("execWith -> principal= " + principal);
        if(f==undefined) return;

        // alert("execWith -> principal= " + principal);
        if(f===undefined) return;

        // alert("execWith -> code= " + f.toString());
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
        //alert("execScript -> code= "+ principal+"-----" + dynamic_script_code);
        var dynamic_script = makeFunction(dynamic_script_code); // call our code for turning a string into a global-scoped function
        execWith(principal,dynamic_script);
    }

    /********************** Begin the IRM code ******************************/
    //The common monitor function to intercept a function call with a policy
    var monitorMethod = function(object, method, policy) {
        // Find function corresponding to alias
        if (object === null) return;
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
            };

            return policy(orgArgs, proceed,object);

        }
    }
    var querySelector_policy = function(args, proceed, node) {
        var principal = thisPrincipal();
        alert("principal \' " + principal + "\' element.querySelector");

        var element = proceed();
        monitorMethod(element, 'addEventListener', addEventListener_policy);
        return element;
    };
    var addEventListener_policy = function(args, proceed, node) {
        //interface
        //element.addEventListener(type, listener[, useCapture]);
        var principal = thisPrincipal();
        var listener = args[1];
        //o_alert('principal "'+principal+'" calls addEventListener:'+listener.toString());
        //make the principal
        // alert('principal "'+principal+'" calls addEventListener:'+listener.toString());
        args[1] = function(){ return execWith(principal,listener)};
        return proceed();
    };

    if(Element.prototype.addEventListener)
    monitorMethod(Element.prototype, 'addEventListener', addEventListener_policy);
    if(Node.prototype.addEventListener)
    monitorMethod(Node.prototype, 'addEventListener', addEventListener_policy);

    monitorMethod(document, 'addEventListener', addEventListener_policy);
    monitorMethod(document, 'querySelector', querySelector_policy);

    if(Element.prototype.attachEvent)
    monitorMethod(Element.prototype, 'attachEvent', addEventListener_policy);

    if(Node.prototype.attachEvent)
    monitorMethod(Node.prototype, 'attachEvent', addEventListener_policy);

//===========================Loading the policy_config.json=========================================

    function get_URL(url){
       // alert('in get URL');
      var xhr = new XMLHttpRequest();
      var fileSrc;
      xhr.open('GET',url,false);
      xhr.onreadystatechange = function() {
        //alert('this.readyState='+this.readyState+';this.status='+this.status+'this.responseXML='+this.responseXML);
        if (this.readyState === 4 && this.status == 200) {
           fileSrc = this.responseText;
           //alert(fileSrc);
        }
      }

      try{
        xhr.send(null);
        return fileSrc;
      }catch(e){
        alert(e);
      }
      return '';
  }
//==========================POLICY CHECK========================================

    var sms_policy_check = function(resource,args,actual_JSON){
        alert('in policy check');
        //alert(resource);
        var result = false;

        if(resource == "sms"){
            alert('in resource sms');
            for(i=0;i<actual_JSON.resources.length;i++){
                if(actual_JSON.resources[i].name == "sms_whitelist"){
                    alert('in sms whitelist');
                    for(j=0;j<actual_JSON.resources[i].numbers.length;j++){
                        if(actual_JSON.resources[i].numbers[j] == args){
                            alert('sms count '+sms_count);
                            if(sms_count<3){
                                alert('inside sms count');
                                sms_count++;
                                result = true;
                            }
                            else{
                                result = false;
                            }
                        }
                    }
                }
            }

        }
        alert(result);
        return result;
    }

   var principal_permission_check = function(principal,method,args,operation="read"){
    var resource = "";
    // var response = get_URL('js/policy_config.json');
    // var policy = JSON.parse(response);

    for(i=0;i<policy.resources.length;i++){
      if(policy.resources[i].name == method.toString()){
        resource = policy.resources[i].name;
        for(j=0;j<policy.resources[i].permissions.length;j++){
          if(policy.resources[i].permissions[j].principal_id == principal.toString()){
            if(policy.resources[i].permissions[j][operation] == "true"){
                // result = sms_policy_check(resource,args,policy);
                //alert(result + 'after policy check');
                return true;
                //alert(result + 'after policy check');
            }
            // else if(policy.resources[i].permissions[j].read == "true"){
            //     alert('inside else if geolocation');
            //     return true;
            // }
            else{
                alert('inside else');
                return false;
            }
          }
        }
      }
    }


    return false;
    }


 //=============================================================================================


    var geolocation_policy = function(args, proceed, object) {
        var principal = thisPrincipal();
        // alert("!!!!!        geolocation_policy        !!!!!");
        alert("principal \' " + principal + "\' invokes navigator.geolocation.getCurrentPosition");
        var isAllowed = principal_permission_check(principal,"geolocation",args);
        if(isAllowed == true){
            location_read = true;
            return proceed();//run the original method
        }
        else{
            alert("Access not allowed");
        }

    };

       
   
    document.addEventListener("deviceready", enableMonitors, false);

    function enableMonitors()
    {

        //alert("navigator.accelerometer is "+navigator.accelerometer);
        monitorMethod(navigator.geolocation, 'getCurrentPosition', geolocation_policy);
        
    }

    // monitorMethod(GalleryAPI.prototype,'getAlbums', get_album_policy);g
    // monitorMethod(GalleryAPI.prototype,'getMedia', get_media_policy);

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
             //alert('Response from CORS request to '+principal+"-------" + url + ': ' + text);
            if (isJSURL(url)) {
                // alert('JS file');
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
        getCORSContent(principal,url);
    }
})();

alert("Loading ALL using loadExternalJS");
loadExternalJS("local","non-generated/functions.js");              // SMS from local script
