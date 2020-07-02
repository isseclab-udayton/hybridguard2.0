  /** global declaration for Opera //BEGIN
   */
  var thisPrincipal;
  var fromAS;
  //var safe_google_ad = function(){};
  //var safe_yahoo_ad = function(){}; 
  /** global declaration for Opera //END
   */   
  var deployed_domain = "securemashups.net";
  var publisher_principal = "top";
  var debug = true;
  var isIE = (navigator.appName.indexOf("Microsoft") != -1);
  function irm_log(s){
	     if(!debug) return;
	     log('IRM log:'+s);
	}  
  // Here is a pretend API method that we wish to protect.
  
  function myEvent(){
    irm_log('principal "'+thisPrincipal()+'" is permitted to exhibit myEvent');
  }
  function new_XMLHttpRequest(){
    var xmlhttp;
    try {
      xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
      try {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (E) {
        xmlhttp = false;
      }
    }
    if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
      xmlhttp = new XMLHttpRequest();
    }
    return xmlhttp;
  }

  function get_URL(url){
      var xhr = new_XMLHttpRequest();
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
  function get_remoteURL(url){
    var proxy_URL = 'proxy.php?url='+encodeURIComponent(url);
    irm_log('get_remoteURL.url='+proxy_URL);
    return get_URL(proxy_URL);
  }
  
//source:http://www.quirksmode.org/js/detect.html
/**
 *Usage:
 * Browser name: BrowserDetect.browser
 * Browser version: BrowserDetect.version
 * OS name: BrowserDetect.OS
 */   
var BrowserDetect = {
  init: function () {
    this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
    this.version = this.searchVersion(navigator.userAgent)
      || this.searchVersion(navigator.appVersion)
      || "an unknown version";
    this.OS = this.searchString(this.dataOS) || "an unknown OS";
  },
  searchString: function (data) {
    for (var i=0;i<data.length;i++) {
      var dataString = data[i].string;
      var dataProp = data[i].prop;
      this.versionSearchString = data[i].versionSearch || data[i].identity;
      if (dataString) {
        if (dataString.indexOf(data[i].subString) != -1)
          return data[i].identity;
      }
      else if (dataProp)
        return data[i].identity;
    }
  },
  searchVersion: function (dataString) {
    var index = dataString.indexOf(this.versionSearchString);
    if (index == -1) return;
    return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
  },
  dataBrowser: [
    {
      string: navigator.userAgent,
      subString: "Chrome",
      identity: "Chrome"
    },
    {   string: navigator.userAgent,
      subString: "OmniWeb",
      versionSearch: "OmniWeb/",
      identity: "OmniWeb"
    },
    {
      string: navigator.vendor,
      subString: "Apple",
      identity: "Safari",
      versionSearch: "Version"
    },
    {
      prop: window.opera,
      identity: "Opera",
      versionSearch: "Version"
    },
    {
      string: navigator.vendor,
      subString: "iCab",
      identity: "iCab"
    },
    {
      string: navigator.vendor,
      subString: "KDE",
      identity: "Konqueror"
    },
    {
      string: navigator.userAgent,
      subString: "Firefox",
      identity: "Firefox"
    },
    {
      string: navigator.vendor,
      subString: "Camino",
      identity: "Camino"
    },
    {   // for newer Netscapes (6+)
      string: navigator.userAgent,
      subString: "Netscape",
      identity: "Netscape"
    },
    {
      string: navigator.userAgent,
      subString: "MSIE",
      identity: "Explorer",
      versionSearch: "MSIE"
    },
    {
      string: navigator.userAgent,
      subString: "Gecko",
      identity: "Mozilla",
      versionSearch: "rv"
    },
    {     // for older Netscapes (4-)
      string: navigator.userAgent,
      subString: "Mozilla",
      identity: "Netscape",
      versionSearch: "Mozilla"
    }
  ],
  dataOS : [
    {
      string: navigator.platform,
      subString: "Win",
      identity: "Windows"
    },
    {
      string: navigator.platform,
      subString: "Mac",
      identity: "Mac"
    },
    {
         string: navigator.userAgent,
         subString: "iPhone",
         identity: "iPhone/iPod"
      },
    {
      string: navigator.platform,
      subString: "Linux",
      identity: "Linux"
    }
  ]

};
BrowserDetect.init();

// Tell IE9 to use its built-in console
if (Function.prototype.bind && console && typeof console.log == "object") {
  ["log","info","warn","error","assert","dir","clear","profile","profileEnd"]
    .forEach(function (method) {
      console[method] = this.call(console[method], console);
    }, Function.prototype.bind);
}

// log() -- The complete, cross-browser (we don't judge!) console.log wrapper for his or her logging pleasure
if (!window.log) {
  window.log = function () {
    log.history = log.history || [];  // store logs to an array for reference
    log.history.push(arguments);
    // Modern browsers
    if (typeof console != 'undefined' && typeof console.log == 'function') {
      
      // Opera 11
      if (window.opera) {
        var i = 0;
        while (i < arguments.length) {
          console.log("Item " + (i+1) + ": " + arguments[i]);
          i++;
        }
      }
      
      // All other modern browsers
      else if ((Array.prototype.slice.call(arguments)).length === 1 && typeof Array.prototype.slice.call(arguments)[0] === 'string') {
        console.log( (Array.prototype.slice.call(arguments)).toString() );
      }
      else {
        console.log( Array.prototype.slice.call(arguments) );
      }
      
    }
    
    // IE8
    else if (!Function.prototype.bind && typeof console != 'undefined' && typeof console.log == 'object') {
      Function.prototype.call.call(console.log, console, Array.prototype.slice.call(arguments));
    }
    
    // IE7 and lower, and other old browsers
    else {
      // Inject Firebug lite
      if (!document.getElementById('firebug-lite')) {
        // Include the script
        var script = document.createElement('script');
        script.type = "text/javascript";
        script.id = 'firebug-lite';
        // If you run the script locally, point to /path/to/firebug-lite/build/firebug-lite.js
        script.src = '//getfirebug.com/firebug-lite.js';
        // If you want to expand the console window by default, uncomment this line
        //document.getElementsByTagName('HTML')[0].setAttribute('debug','true');
        document.getElementsByTagName('HEAD')[0].appendChild(script);
        setTimeout(function () { log( Array.prototype.slice.call(arguments) ); }, 2000);
      }
      else {
        // FBL was included but it hasn't finished loading yet, so try again momentarily
        setTimeout(function () { log( Array.prototype.slice.call(arguments) ); }, 500);
      }
    }
  }
}

// Begin a local anonymous scope.

(function(){


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
    //var o_cookie = [];
    //o_cookie['top'] = document.cookie;    
    
    //store original window methods and properties
    var o_alert = alert; 


    //load the policy engine
	var policy_engine = get_URL("policy-engine/engine.js");
	eval(policy_engine);
	//interface to invoke the policy engine:
	//get_fsm_status = function(principal, objectID, event, event_args)

    
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
      flush_write(principal);
      if (typeof r !== "undefined") return r; 
    }
    fromAS = function(id,nonce,func_expr) {
	    o_window.alert('fromAS is called from a flash with principal "'+id+'";func_expr='+func_expr);
      var e = isIE ? window[id] : document[id];
      //var e = document.getElementById(id);
	  //alert("e "+e);
	  //alert("id "+id);
	  //alert("nonce "+nonce);
      if (!e) { alert('failed to find '+id); return; }
      //irm_log('typeof e.attest_callback='+typeof e.attest_callback);
      if (typeof e.attest_callback != "function") { alert(id+' has no attest_callback'); return; }
      //alert('nonce='+nonce+'; e.attest_callback='+e.attest_callback); 
      if (!e.attest_callback(nonce)) { alert('attestation failed for id '+id); return; }
      var f = new Function('var x=('+func_expr+').apply(this,arguments); if (typeof x !== "undefined") return x;');

		return execWith.apply(null,[id,f].concat($Array.prototype.slice.call(arguments,3)));
    } 

    // Code may voluntarily downgrade (but not upgrade) its privilege level.
    downgrade = function(f){ return execWith('',f); };
    // To guard an event, cache a local copy of the guarded method;
    // then replace it with a guarded implementation that consults the
    // shadow stack to determine the current principal.

    var unguardedEvent = myEvent;

    myEvent = function(){
      var p = thisPrincipal();
      if (p != 'google')
        irm_log('principal "'+p+'" may not exhibit myEvent');
      else
        unguardedEvent();
    }

    // Principals can perform runtime code generation without privilege loss
    // by using the following function to create a closure over the current
    // principal.

    safeRCG = function(f){
      var p = thisPrincipal();
      return function(){ return execWith(p,f); };
    }

    // This provides an easy mechanism for tracking principals across event
    // handlers.  Here's an example for the window.onload event:
    /*window._onload = window.onload;
    window.onload = function(){ return this._onload; };
    window.__defineSetter__('onload', function(x){ this._onload=safeRCG(x); });
    */
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
    
    
	
    var alert_policy = function(args, proceed, object) {
      var principal = thisPrincipal();
      if(principal==='top') return proceed();
      var allow = get_fsm_status(principal, undefined, 'alert', args);
      args[0] = '"'+principal+'" calls alert. FSM returns="'+allow+'" with message:\n' + args[0] ;
      if (allow){
        return proceed();
      }
      o_alert('Principal "'+principal+
        '" calls alert. Policy violated: principal is not allowed or '+
        'more than 3 popups of thirdparty code');
    };

    var write_cache = {};
    function write_to_cache(principal,value){
      var v= write_cache[principal];
      if (v!==null && v!==undefined) write_cache[principal] = v + value;
      else write_cache[principal] = value;
    }

    var document_write_pol = function(args, proceed) {
      var p = thisPrincipal();
      irm_log('"'+p+'" calls document.write');
      if (p=='top'){//hosting page
         return proceed();
      }else{//third-party content
        for(var i=0;i<args.length;i++){
          write_to_cache(p,args[i]);
        }
      }
    };
    var document_getElementById_pol = function(args, proceed, object) {
      var principal = thisPrincipal();
      var id = args[0];//TODO:assert string      
      var allow = get_fsm_status(principal, id, 'getElementById');
      irm_log('"'+principal+'" calls document.getElementById("'+id+'"). FSMs returns='+allow);
      var node = proceed();
      if (node instanceof HTMLIFrameElement){
			  //wrap_iframe(node);
      }
      return node;
    };
    var document_getElementsByTagName_pol = function(args, proceed, object) {
      var principal = thisPrincipal();
      var id = args[0];
      
      var allow = get_fsm_status(principal, object, 'getElementsByTagName', args);
      irm_log('"'+principal+'" calls document.getElementsByTagName("'+id+'"). FSMs returns='+allow);
      //TODO: returns a node list. what should we do with this list? /Phu       
      return proceed();
    };
    var document_getElementsByTagNameNS_pol = function(args, proceed, object) {
      var principal = thisPrincipal();
      //http://www.w3schools.com/dom/met_element_getelementsbytagnamens.asp
      
      var allow = get_fsm_status(principal, object, 'getElementsByTagNameNS', args);
      irm_log('"'+principal+'" calls document.getElementsByTagNameNS("'+$Array.prototype.slice.call(args).join(',')+'"). FSMs returns='+allow);
      return proceed();
    };
    
    var document_getElementsByClassName_pol = function(args, proceed, object) {
      var principal = thisPrincipal();
      var allow = get_fsm_status(principal, object, 'getElementsByClassName', args);
      irm_log('"'+principal+'" calls document.getElementsByClassName("'+$Array.prototype.slice.call(args).join(',')+'"). FSMs returns='+allow);
      return proceed();
    };
    var document_createElement_pol = function(args, proceed, object) {
      var principal = thisPrincipal();
      var element = proceed();
      irm_log('principal "'+principal+'" create an element "'+args[0]+'"-instance='+element);
      return element;
    };    
    var setTimeout_policy = function(args, proceed) {
      var p = thisPrincipal();
      var f = args[0]; //the function to be set
      //o_alert('principal "'+p+'" calls setTimeout:'+f.toString());
      //make the principal 
      args[0] = function(){ return execWith(p,f)};      
      return proceed();

    };
    
    var appendChild_policy = function(args, proceed, node) {
      var principal = thisPrincipal();            
      var objectID = get_objectID(node);      
      var child = args[0];
      var allow = get_fsm_status(principal, objectID, 'appendChild');
      irm_log(node+'.appendChild is called by principal "'+principal+'" node.id='+objectID+'\nchild='+child+'\nfsm='+allow);
      if(child instanceof HTMLScriptElement){
        //TODO:get and run the script at the same principal
        //o_alert('script is appended. src='+child.src);
        irm_log('script is appended. src='+child.src+'\nrun the script with principal "'+principal+'"');
        execScript(principal, child);
        return;
      } 
           
      return proceed();
    };
    
    var hasAttribute_policy = function(args, proceed, node) {
      var principal = thisPrincipal();
      var objectID = get_objectID(node);
      var allow = get_fsm_status(principal, objectID, 'hasAttribute');
      var attribute = args[0];
      irm_log(node+'.hasAttribute is called by principal "'+principal+'" node.id='+objectID+'\nattribute='+attribute+'\nfsm='+allow);      
      return proceed();
    };
    
    var getAttribute_policy = function(args, proceed, node) {
      var principal = thisPrincipal();
      var objectID = get_objectID(node);
      var allow = get_fsm_status(principal, objectID, 'getAttribute');
      var attribute = args[0];
      irm_log(node+'.getAttribute is called by principal "'+principal+'" node.id='+objectID+'\nattribute='+attribute+'\nfsm='+allow);      
      return proceed();
    };
    
    var setAttribute_policy = function(args, proceed, node) {
      var principal = thisPrincipal();
      var objectID = get_objectID(node);
      var allow = get_fsm_status(principal, objectID, 'setAttribute');
      var attribute = args[0];
      irm_log(node+'.setAttribute is called by principal "'+principal+'" node.id='+objectID+'\nattribute='+attribute+'\nfsm='+allow);      
      return proceed();
    };
    
    var removeChild_policy = function(args, proceed, node) {
      var principal = thisPrincipal();
	  var objectID = get_objectID(node);
      var allow = get_fsm_status(principal, objectID, 'removeChild');
      var child = args[0];
      irm_log(node+'.removeChild is called by principal "'+principal+'" node.id='+objectID+'\nchild='+child+'\nfsm='+allow);
      /*if(child instanceof HTMLScriptElement){
        //TODO:get and run the script at the same principal
        //o_alert('script is appended. src='+child.src);
        //irm_log('script is appended. src='+child.src);
      }*/ 
      return proceed();
    };
    var replaceChild_policy = function(args, proceed, node) {
    //interface elementNode.replaceChild(new_node,old_node)
      var principal = thisPrincipal();
      var objectID = get_objectID(node);
      var old_child = args[1];
	    var child = args[0];
      var allow = get_fsm_status(principal, objectID, 'replaceChild');      
      irm_log(node+'.replaceChild is called by principal "'+principal+'" node.id='+objectID+'\nchild='+child+'\nfsm='+allow);
      if(child instanceof HTMLScriptElement){
        //TODO:get and run the script at the same principal
        //o_alert('script is appended. src='+child.src);
        irm_log('script is appended (replaced). src='+child.src+'\nrun the script with principal "'+principal+'"');
        execScript(principal, child);
        return;
      } 
    return proceed();
    };
    var insertBefore_policy = function(args, proceed, node) {
    //interface
    //parentElement.insertBefore(newElement, referenceElement);
      var principal = thisPrincipal();
      var objectID = get_objectID(node);
      var referenceElement = args[1];
	    var child = args[0];
      var allow = get_fsm_status(principal, objectID, 'insertBefore');      
      irm_log(node+'.insertBefore is called by principal "'+principal+'" node.id='+objectID+'\nchild='+child+'\nfsm='+allow);
      if(child instanceof HTMLScriptElement){
        //TODO:get and run the script at the same principal
        //o_alert('script is appended. src='+child.src);
        irm_log('script is appended (insertBefore). src='+child.src+'\nrun the script with principal "'+principal+'"');
        execScript(principal, child);
        return;
      } 
      return proceed();
    };
    
    var insertAfter_policy = function(args, proceed, node) {
    //interface
    //parentElement.insertAfter(newElement, referenceElement);
      var principal = thisPrincipal();
      var objectID = get_objectID(node);
      var referenceElement = args[1];
	    var child = args[0];
      var allow = get_fsm_status(principal, objectID, 'insertBefore');      
      irm_log(node+'.insertAfter is called by principal "'+principal+'" node.id='+objectID+'\nchild='+child+'\nfsm='+allow);
      if(child instanceof HTMLScriptElement){
        //TODO:get and run the script at the same principal
        //o_alert('script is appended. src='+child.src);
        irm_log('script is appended (insertAfter). src='+child.src+'\nrun the script with principal "'+principal+'"');
        execScript(principal, child);
        return;
      } 
      return proceed();
    };
    var addEventListener_policy = function(args, proceed, node) {
    //interface
    //element.addEventListener(type, listener[, useCapture]);
      var principal = thisPrincipal();      
      var listener = args[1];
      //o_alert('principal "'+principal+'" calls addEventListener:'+listener.toString());
      //make the principal 
	  irm_log('principal "'+principal+'" calls addEventListener:'+listener.toString());
      args[1] = function(){ return execWith(principal,listener)};
      return proceed();
    }; 

    function wrap_the_global_obj(window){
      monitorMethod(window, 'setTimeout',setTimeout_policy);
      monitorMethod(window, 'alert',alert_policy);
    }
    function wrap_the_document_obj(document){
      monitorMethod(document, 'write',document_write_pol);
      monitorMethod(document, 'writeln',document_write_pol);
      monitorMethod(document, 'getElementById',document_getElementById_pol);
      monitorMethod(document, 'getElementsByTagName',document_getElementsByTagName_pol);
      monitorMethod(document, 'getElementsByTagNameNS',document_getElementsByTagNameNS_pol);
      monitorMethod(document, 'getElementsByClassName',document_getElementsByClassName_pol);
    }
    function wrap_iframe(iframe){
      o_alert('wrapping iframe='+iframe.contentWindow);
      if(!iframe.contentWindow) return;      
      wrap_the_global_obj(iframe.contentWindow);
      wrap_the_document_obj(iframe.contentWindow.document);
    }


    function enable_IRM(){
    //reference: http://www.w3.org/TR/DOM-Level-2-Core/core.html
    //http://www.w3.org/TR/2004/REC-DOM-Level-3-Core-20040407/core.html#ID-745549614
    //http://zvon.org/xxl/DOM2reference/Output/index.html
      //window object
      wrap_the_global_obj(window);
      
      //document object
      wrap_the_document_obj(document);
      
      //Element prototype 
      if(Element.prototype.setAttribute)
         monitorMethod(Element.prototype, 'setAttribute', setAttribute_policy);
      
      if(Element.prototype.setAttributeNS)
         monitorMethod(Element.prototype, 'setAttributeNS', setAttribute_policy);   
      if(Element.prototype.setAttributeNode)
         monitorMethod(Element.prototype, 'setAttributeNode', setAttribute_policy);   
      
      if(Element.prototype.setAttributeNodeNS)
         monitorMethod(Element.prototype, 'setAttributeNodeNS', setAttribute_policy);
      
      if(Element.prototype.hasAttribute)
        monitorMethod(Element.prototype, 'hasAttribute', hasAttribute_policy);
      if(Node.prototype.hasAttribute)
         monitorMethod(Node.prototype, 'hasAttribute', hasAttribute_policy);
         
      if(Element.prototype.hasAttributes)
        monitorMethod(Element.prototype, 'hasAttributes', hasAttribute_policy);
      if(Node.prototype.hasAttributes)
         monitorMethod(Node.prototype, 'hasAttributes', hasAttribute_policy);   
      
      if(Element.prototype.hasAttributeNS)
        monitorMethod(Element.prototype, 'hasAttributeNS', hasAttribute_policy);
      if(Node.prototype.hasAttribute)
         monitorMethod(Node.prototype, 'hasAttributeNS', hasAttribute_policy);
      
      if(Element.prototype.getAttribute)
        monitorMethod(Element.prototype, 'getAttribute', getAttribute_policy);
      if(Node.prototype.getAttribute)
         monitorMethod(Node.prototype, 'getAttribute', getAttribute_policy);
         
                
      monitorMethod(Element.prototype, 'appendChild', appendChild_policy);
      if(Node.prototype.appendChild)
         monitorMethod(Node.prototype, 'appendChild', appendChild_policy);
      
      monitorMethod(Element.prototype, 'removeChild', removeChild_policy);
      if(Node.prototype.removeChild)
         monitorMethod(Node.prototype, 'removeChild', removeChild_policy);
            
      monitorMethod(Element.prototype, 'replaceChild', replaceChild_policy);
      if(Node.prototype.replaceChild)
         monitorMethod(Node.prototype, 'replaceChild', replaceChild_policy);
      
      if(Element.prototype.insertBefore)
        monitorMethod(Element.prototype, 'insertBefore', insertBefore_policy);
      if(Node.prototype.insertBefore)
         monitorMethod(Node.prototype, 'insertBefore', insertBefore_policy);
         
      if(Element.prototype.insertAfter)
         monitorMethod(Element.prototype, 'insertAfter', insertAfter_policy);
      if(Node.prototype.insertAfter)
         monitorMethod(Node.prototype, 'insertAfter', insertAfter_policy);
      
         
      //Element.prototype.addEventListener
      if(Element.prototype.addEventListener)
         monitorMethod(Element.prototype, 'addEventListener', addEventListener_policy);
      if(Node.prototype.addEventListener)
         monitorMethod(Node.prototype, 'addEventListener', addEventListener_policy);
		
		if(Element.prototype.attachEvent)
			monitorMethod(Element.prototype, 'attachEvent', addEventListener_policy);
      if(Node.prototype.attachEvent)
         monitorMethod(Node.prototype, 'attachEvent', addEventListener_policy);		
      
      //Node.prototype.insertBefore
      
      /**
       *monitoring property access
       */
      //ref for IE: http://msdn.microsoft.com/en-us/library/dd548687(v=vs.94).aspx              
      //monitorProperty(HTMLIFrameElement,'contentWindow',contentWindow_policy);
      //monitorProperty(document,'cookie',cookie_policy);

    }
    enable_IRM(); //uncomment to enable the IRM enforcement 
    
    /********************** End the IRM code *****************************/

  function flush_write(principal){
		if(!document.body) return;
//		for(var principal in write_cache){		
			//irm_log('commit_write principal "'+principal+'":'+write_cache[principal]);    
  		if ((write_cache[principal]!=undefined)&&(write_cache[principal]!=null)&&(write_cache[principal]!='')){
  			var i = document.createElement('ins');	
  			i.innerHTML = write_cache[principal] ;
  			i.owner = principal;
  			//o_alert('pricipal "'+principal+'" flush write content='+write_cache[principal]+'\ndocument.body='+document.body);
        write_cache[principal]=''; 
  			i.onclick=function(){ alert('ins is clicked'); }//just for testing
			  guardHandlers(principal,i);
        execWith('top',function(){
          var principal_element = document.getElementById(principal);
          if(!principal_element) return;
          return principal_element.appendChild(i);}
        );
         
	  	}
	}
	function guardHandlers(principal,node) {
	  
    node._onload = node.onload;
		if (node._onload == undefined ) node._onload = function() {};
		node.onload = function () { 
  			irm_log(node+ ' onload event is executed with principal "'+principal+'"');
        var r=execWith(principal,node._onload); if (typeof r !== "undefined") return r; 
    }
    node._onclick = node.onclick;
			if (node._onclick == undefined ) node._onclick = function() {};
			node.onclick = function () { 
  			irm_log(node+ ' onclick event is executed with principal "'+principal+'"');   
  			
  			var r=execWith(principal,node._onclick); if (typeof r !== "undefined") return r; 
    }
		var children = node.childNodes;
		for(var i=0; i<children.length; i++) {
			var childNode = children[i];
			//o_alert('guardHandlers(principal:"'+principal+'",childNode='+childNode);
			irm_log('principal "'+principal+'" wrapping childNode='+childNode);
			for (var attribute in childNode){
				if (typeof childNode[attribute] == "function"){
					//irm_log('wrapping function childNode[attribute]='+childNode[attribute]);
					var f = childNode[attribute];
					childNode[attribute] = function() { var r=execWith(principal,f); if (typeof r !== "undefined") return r; };
				}
			}
			var f_onload = childNode.onload;
			if (f_onload == undefined ) f_onload = function() {};
			childNode.onload = function () { 
  			irm_log(childNode+ ' onload event is executed with principal "'+principal+'"');
  			var r=execWith(principal,f_onload); if (typeof r !== "undefined") return r; 
      }
      var f_onclick = childNode.onclick;
			if (f_onclick == undefined ) f_onclick = function() {};
			childNode.onclick = function () { 
  			irm_log(childNode+ ' onclick event is executed with principal "'+principal+'"');   
  			//execWith(principal,f_onload);
  			var r=execWith(principal,f_onclick); if (typeof r !== "undefined") return r; 
      }
              			
			if (childNode instanceof HTMLScriptElement){
        execScript(principal, childNode);	
			}
			
		  //if (!(childNode instanceof HTMLObjectElement))
        guardHandlers(principal,childNode);
    }		
  }
  function execScript(principal, scriptElement){
    var dynamic_script_code = scriptElement.textContent;				
				if ((dynamic_script_code!=undefined)&&(dynamic_script_code!=null)&&(dynamic_script_code!='')){
          irm_log('script node, scriptElement.textContent='+dynamic_script_code);
          scriptElement.textContent = "";
 				}else{ //textContext = null -> get URL script content
 				     irm_log('script node, scriptElement.src='+scriptElement.src+"-scriptElement.src.indexOf('"+deployed_domain+"')="+scriptElement.src.indexOf(deployed_domain));
 				     
 				     if(scriptElement.src.indexOf(deployed_domain)<0){//remote URL
 				       //alert('remote URL');
 				       dynamic_script_code = get_remoteURL(scriptElement.src);              
             }else{//local URL
               dynamic_script_code = get_URL(scriptElement.src);             
             }
             //alert('script URL node ='+dynamic_script_code);
             scriptElement.src ="";
             
        } 
		var dynamic_script = makeFunction(dynamic_script_code); // call our code for turning a string into a global-scoped function
        execWith(principal,dynamic_script);
  }

  	//load the cookie mediation script
	var cookie_mediation_script = get_URL("cookie_mediation.js");
	eval(cookie_mediation_script);

    //loading publisher's scripts
  var publisher_script_URL = "publisher.js";
  var publisher_script=get_URL(publisher_script_URL);
  var unsafe_publisher = makeFunction(publisher_script);
  safe_publisher = function(){ return execWith(publisher_principal,unsafe_publisher); };
  
  /**
   * loading third-party scripts
   */  
  //include the load 3rdparty script defined in 3rdscripts.js
  //The hosting web developer only need to customize 3rd party script loading in 3rdscripts.js

  var load3rdscripts = get_URL("loadscripts.js");
  eval(load3rdscripts);
  
  })(); // End local scope.

safe_publisher();
