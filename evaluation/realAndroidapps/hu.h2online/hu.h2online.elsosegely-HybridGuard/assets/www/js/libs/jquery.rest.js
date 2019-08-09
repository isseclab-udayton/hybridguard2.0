
 
RestClient = function(goptions) {
    this.goptions = goptions;
 
    var constants = {
        dataType : 'json',
        contentType : 'application/json',
        processData : true,
        timeout : 5000,
        synchronous : false,
        errorRedirect : false,
        user: "agroassist",
        password: "Agro2014Assist"
    };
 
    var doAjax = function(method, gopts, opts) {
        var dt = opts.dataType ? opts.dataType : (gopts.dataType ? gopts.dataType : constants.dataType);
        // redirect on error if HTTP status code matches
        var errorRedirect = opts.errorRedirect ? opts.errorRedirect : (gopts.errorRedirect ? gopts.errorRedirect
            : constants.errorRedirect);
        var errorRedirectCodes = opts.errorRedirectCodes ? opts.errorRedirectCodes : gopts.errorRedirectCodes;
        var errorRedirectUrl = opts.errorRedirectUrl ? opts.errorRedirectUrl : gopts.errorRedirectUrl;
		
        var errorCallback = opts.error ? opts.error : (gopts.error ? gopts.error : function(req, status, ex) {
            });
 
        var errorFunction = errorCallback;
		var user = opts.user ? opts.user : (gopts.user ? gopts.user : constants.user);
		var password = opts.password ? opts.password : (gopts.password ? gopts.password : constants.password);
        if (errorRedirect) {
            errorFunction = function(req, status, ex) {
                if (jQuery.inArray(req.status, errorRedirectCodes)) {
                    window.location.href = errorRedirectUrl;
                } else {
                    errorCallback(req);
                }
            };
        }
		logDisplay("REST request: "+gopts.url.lastIndexOf('/') == gopts.url.length - 1 ? gopts.url + opts.path + (opts.path.indexOf('?')==-1?"?random=" + Math.round(Math.random() * 1000):"&random=" + Math.round(Math.random() * 1000)): gopts.url + '/'
            + opts.path + (opts.path.indexOf('?')==-1?"?random=" + Math.round(Math.random() * 1000):"&random=" + Math.round(Math.random() * 1000)));
        $.ajax({
            type : method,
            url : gopts.url.lastIndexOf('/') == gopts.url.length - 1 ? gopts.url + opts.path + (opts.path.indexOf('?')==-1?"?random=" + Math.round(Math.random() * 1000):"&random=" + Math.round(Math.random() * 1000)): gopts.url + '/'
            + opts.path + (opts.path.indexOf('?')==-1?"?random=" + Math.round(Math.random() * 1000):"&random=" + Math.round(Math.random() * 1000)),
            headers : opts.headers ? opts.headers : (gopts.headers ? gopts.headers : {}),
            data : opts.model ? /^json/i.test(dt) ? JSON.stringify(opts.model).replace(/"null"/g,'null') : JSON.parse(JSON.stringify(opts.model).replace(/"null"/g,'null')) : '',
            dataType : dt,
            contentType : opts.contentType ? opts.contentType : (gopts.contentType ? gopts.contentType
                : constants.contentType),
            processData : opts.processData ? opts.processData : (gopts.processData ? gopts.processData
                : constants.processData),
            timeout : opts.timeout ? opts.timeout : (gopts.timeout ? gopts.timeout : constants.timeout),
            success : opts.success ? opts.success : (gopts.success ? gopts.success : function(data) {
                }),
            error : errorFunction,
            complete : opts.complete ? opts.complete : (gopts.complete ? gopts.complete : function() {
                }),
            async : opts.synchronous ? !opts.synchronous : (gopts.synchronous ? !gopts.synchronous
                : !constants.synchronous),
			beforeSend: function (xhr) {
				xhr.setRequestHeader("Authorization", "Basic " + window.btoa(user + ":" + password));
				}
        });
    };
 
    this.post = function(opts) {
        doAjax('POST', this.goptions, opts);
    };
 
    this.put = function(opts) {
        doAjax('PUT', this.goptions, opts);
    };
 
    this.get = function(opts) {
        doAjax('GET', this.goptions, opts);
    };
 
    this.remove = function(opts) {
        doAjax('DELETE', this.goptions, opts);
    };
};